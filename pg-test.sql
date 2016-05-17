set search_path to tempdb;

-- tblorgname
create function name_level(sort_key text)
  returns integer
  as $$
    select ((length($1)-1)/5);
  $$ language sql;
-- org_names

create type new_org as (id integer, cic_id text);
create function insert_org(name_id integer, cic_id text, service_level text)
  returns new_org
  as $$
    insert into org(org_name_id, cic_id, service_level) values($1, $2, $3) returning id, cic_id;
  $$ language sql;
