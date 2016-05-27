set search_path to tempdb;


-- activeDate (org.isactive)
drop function if exists active_or_deleted() cascade;
create function active_or_deleted()
  returns trigger
  as $$
    begin
      update org
      set deleted = (case isactive when true then null else now() end)
      where org.id = NEW.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_is_active on org;
create trigger org_is_active
  after update of isactive
  on org
  for each row
  execute procedure active_or_deleted();


-- update_org_name (org.org_name_id)
drop function if exists org_name_updated() cascade;
create function org_name_updated()
  returns trigger
  as $$
    org_id = TD["new"]["id"]
    name_id = TD["new"]["org_name_id"]

    with plpy.subtransaction():
      delete_names = (
        "delete from org_names "
        "where org_id = $1 "
        "and org_name_id = any(select id from tblorgname where orgnametypeid = 1)"
      )
      plan = plpy.prepare(delete_names, ["int"])
      results = plpy.execute(plan, [org_id])

      select_level = (
        "select level from tblorgname "
        "where id = $1"
      )
      plan = plpy.prepare(select_level, ["int"])
      results = plpy.execute(plan, [name_id])
      result = results[0]
      levels = range(result["level"])

      current_id = name_id
      for level in levels:
        if current_id:
          insert_name = (
            "insert into org_names(org_id, org_name_id) "
            "values($1, $2)"
          )
          plan = plpy.prepare(insert_name, ["int", "int"])
          results = plpy.execute(plan, [org_id, current_id])

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

drop trigger if exists org_name_updated on org;
create trigger org_name_updated
  after update of org_name_id
  on org
  for each row
  execute procedure org_name_updated();


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


-- org_insert (org)
drop function if exists org_inserted() cascade;
create function org_inserted()
  returns trigger
  as $$
    org_id = TD["new"]["id"]
    name_id = TD["new"]["org_name_id"]

    with plpy.subtransaction():
      select_level = (
        "select level from tblorgname "
        "where id = $1"
      )
      plan = plpy.prepare(select_level, ["int"])
      results = plpy.execute(plan, [name_id])
      result = results[0]
      levels = range(result["level"])

      current_id = name_id
      for level in levels:
        insert_name = (
          "insert into org_names(org_id, org_name_id) "
          "values($1, $2)"
        )
        plan = plpy.prepare(insert_name, ["int", "int"])
        results = plpy.execute(plan, [org_id, current_id])

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

drop trigger if exists org_inserted on org;
create trigger org_inserted
  after insert
  on org
  for each row
  execute procedure org_inserted();


-- insert_uf (org_thes)
drop function if exists org_thes_inserted() cascade;
create function org_thes_inserted()
  returns trigger
  as $$
    begin
      insert into org_thes(org_id, thes_id, official_id)
      select NEW.org_id, rel_id, NEW.thes_id
      from thes_rel
      where rel_type = 'uf'
      and thes_id = NEW.thes_id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_thes_inserted on org_thes;
create trigger org_thes_inserted
  after insert
  on org_thes
  for each row
  when(NEW.thes_id = NEW.official_id)
  execute procedure org_thes_inserted();


-- delete_uf (org_thes)
drop function if exists org_thes_deleted() cascade;
create function org_thes_deleted()
  returns trigger
  as $$
    begin
      delete from org_thes
      where official_id = OLD.official_id
      and org_id = OLD.org_id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_thes_deleted on org_thes;
create trigger org_thes_deleted
  after delete
  on org_thes
  for each row
  when(OLD.thes_id = OLD.official_id)
  execute procedure org_thes_deleted();


-- orgUpdated (org)
drop function if exists org_updated() cascade;
create function org_updated()
  returns trigger
  as $$
    begin
      insert into orgupdated(orgid, updated)
      values(NEW.id, NEW.updated);
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_updated on org;
create trigger org_updated
  after update of updated
  on org
  for each row
  execute procedure org_updated();


-- deleteIncomplete (org.iscomplete)
drop function if exists org_is_complete_updated() cascade;
create function org_is_complete_updated()
  returns trigger
  as $$
    begin
      update org set deleted = now() where id = NEW.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_is_complete_updated on org;
create trigger org_is_complete_updated
  after update of iscomplete
  on org
  for each row
  when (OLD.iscomplete = true and NEW.iscomplete = false)
  execute procedure org_is_complete_updated();


-- mod (taxgroups)
drop function if exists tax_groups_updated() cascade;
create function tax_groups_updated()
  returns trigger
  as $$
    begin
      update taxgroups
      set modified = now()
      where id = NEW.id;
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists tax_groups_updated on taxgroups;
create trigger tax_groups_updated
  after update of taxgroup, taxid, isactive, haschildren, islocal
  on taxgroups
  for each row
  execute procedure tax_groups_updated();


-- org_del (org)
drop function if exists org_deleted() cascade;
create function org_deleted()
  returns trigger
  as $$
    begin
      insert into org_del(id, org_name_id, update_note, cic_id, updated, service_level)
      values(OLD.id, OLD.org_name_id, OLD.update_note, OLD.cic_id, now(), OLD.service_level);
      return null;
    end;
  $$ language plpgsql;

drop trigger if exists org_deleted on org;
create trigger org_deleted
  before delete
  on org
  for each row
  execute procedure org_deleted();


-- skipping WebChangeTemplate
-- skipping WebAddTemplate
-- skipping WebDataChange
-- skipping DeleteIndex
-- skipping meta_insert_orgname
-- skipping InsertIndex
-- skipping org_meta_delete_names
-- skipping meta_insert_service
-- skipping meta_delete_orgname
-- skipping meta_update_orgname
-- skipping meta_update_service
-- skipping meta_delete_service
-- skipping meta_update_cicid
-- skipping org_meta_insert_names
-- skipping org_meta_insert_thes
-- skipping org_meta_delete_thes
-- skipping deleteDeletedPubs
-- skipping pub_org_del
-- skipping MetaIndex
-- skipping meta_update_thes_o
-- skipping org_meta_insert_res
-- skipping org_meta_delete_res
-- skipping meta_delete_resource
-- skipping meta_insert_resource
-- skipping meta_update_res after
-- skipping meta_insert_address
-- skipping org_meta_insert_address
-- skipping org_meta_delete_address
-- skipping meta_update_address (tbladdress)
-- skipping meta_delete_address
-- skipping org_meta_insert_site
-- skipping org_meta_delete_site
