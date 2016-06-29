drop function if exists search_org_name(search_string text);
create function search_org_name(search_string text)
  returns table(full_name text, name text, org_id text)
  as $$
    select
      org_name_full(org.id) as full_name,
      tblorgname.name as name,
      org.cic_id as org_id
    from
      tblorgname
        join org_names on tblorgname.id = org_names.org_name_id
        join org on org_names.org_id = org.id
    where
      to_tsvector('english', tblorgname.name) @@ plainto_tsquery('english', search_string)
    order by
      tblorgname.sort_key, org.cic_id;
  $$ language sql;

