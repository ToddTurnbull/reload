-- make_org_name_sort_key()
-- update_name_sort_parent (tblorgname)
-- create_org_name_sort_key (tblorgname)
drop function if exists name_inserted_updated() cascade;
create function name_inserted_updated()
  returns trigger
  as $$
    new_parent = TD["new"]["parentid"]
    if new_parent:
      select_parent = (
        "select tblorgname.id as name_id, parent.sort_key as parent_key"
        "from tblorgname join tblorgname as parent on tblorgname.parentid = parent.id "
        "where tblorgname.parentid = $1 "
        "and tblorgname.orgnametypeid = 1 "
        "order by coalesce(tblorgname.sort, tblorgname.name) asc;"
      )
      select_plan = plpy.prepare(select_parent, ["int"])
      select_results = plpy.execute(plan, [new_parent])
    else:
      select_parent = (
        "select tblorgname.id as name_id, parent.sort_key as parent_key"
        "from tblorgname join tblorgname as parent on tblorgname.parentid = parent.id "
        "where tblorgname.parentid is null "
        "and tblorgname.orgnametypeid = 1 "
        "order by coalesce(tblorgname.sort, tblorgname.name) asc;"
      )
      select_plan = plpy.prepare(select_parent)
      select_results = plpy.execute(plan)
    for i, result in enumerate(select_results):
      name_key = str(i).zfill(4)
      update_query = (
        "update tblorgname "
        "set sort_key = concat($1, '.', $2) "
        "where id = $3" 
      )
      update_args = [
        result["parent_key"],
        name_key,
        result["name_id"]
      ]
      update_plan = plpy.prepare(update_query, ["text", "text", "int"])
      update_results = plpy.execute(update_plan, update_args)
  $$ language plpythonu;

drop trigger if exists name_inserted_updated on tblorgname;
create trigger name_inserted_updated
  after insert or update of name, sort, parentid
  on tblorgname
  for each row
  execute procedure name_inserted_updated();


-- update_name_parent (tblorgname.ParentID)
drop function if exists name_parent_updated() cascade;
create function name_parent_updated()
  returns trigger
  as $$
    old = TD["old"]
    name_id = old["id"]
    old_level = old["level"]
    old_parent = old["parentid"]
    new_parent = TD["new"]["parentid"]

    with plpy.subtransaction():
      if old_parent:
        delete_names = (
          "delete from org_names "
          "where org_id = any(select org_id from org_names where org_name_id = $1) "
          "and org_name_id = any(select id from tblorgname where level between 1 and ($2-1) and orgnametypeid = 1)"
        )
        plan = plpy.prepare(delete_names, ["int", "int"])
        results = plpy.execute(plan, [name_id, old_level])

      if new_parent:
        select_level = (
          "select level from tblorgname "
          "where id = $1"
        )
        plan = plpy.prepare(select_level, ["int"])
        results = plpy.execute(plan, [new_parent])
        result = results[0]
        levels = range(result["level"])

        current_id = new_parent
        for level in levels:
          insert_name = (
            "insert into org_names(org_id, org_name_id) "
            "select distinct org_id, $1 "
            "from org_names "
            "where org_id = any(select org_id from org_names where org_name_id = $2)"
          )
          plan = plpy.prepare(insert_name, ["int", "int"])
          results = plpy.execute(plan, [current_id, name_id])

          select_parent = (
            "select parentid "
            "from tblorgname "
            "where id = $1"
          )
          plan = plpy.prepare(select_parent, ["int"])
          results = plpy.execute(plan, [current_id])
          result = results[0]
          current_id = result["parentid"]
  $$ language plpythonu;

drop trigger if exists name_parent_updated on tblorgname;
create trigger name_parent_updated
  after update of parentid
  on tblorgname
  for each row
  execute procedure name_parent_updated();


-- update_child_sort_key (tblorgname)
-- tblOrgName.Level integer null COMPUTE ((length(sort_key)-1)/5)
drop function if exists name_sort_key_updated() cascade;
create function name_sort_key_updated()
  returns trigger
  as $$
    begin
      update tblorgname
        set level = ((length(NEW.sort_key)-1)/5)
        where id = NEW.id;
      update tblorgname
        set sort_key = concat(NEW.sort_key, substring(tblorgname.sort_key, length(tblorgname.sort_key)-4))
        where parentid = NEW.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists name_sort_key_updated on tblorgname;
create trigger name_sort_key_updated
  after update of sort_key
  on tblorgname
  for each row
  execute procedure name_sort_key_updated();


