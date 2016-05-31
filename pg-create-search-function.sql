drop function if exists search_org_name(search_string text);
create function search_org_name(search_string text)
  returns table(name text)
  as $$
    search = (
      "select name "
      "from tblorgname "
      "where to_tsvector('english', tblorgname.name) @@ plainto_tsquery('english', $1) "
      "order by coalesce(sort, name)"
    )
    plan = plpy.prepare(search, ["text"])
    results = plpy.execute(plan, [search_string])
    return (r["name"] for r in results)
  $$ language plpythonu;
