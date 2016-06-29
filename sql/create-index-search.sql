drop index if exists search_org_name;
create index search_org_name
  on tblorgname
  using gin(to_tsvector('english', name));

drop index if exists search_taxonomy;
create index search_taxonomy
  on taxonomy
  using gin(to_tsvector('english', name));

