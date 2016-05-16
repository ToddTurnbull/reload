drop schema if exists testing cascade;
create schema if not exists testing;
set search_path to testing;

create table org (
  id serial primary key,
  org_name_id integer not null,
  update_note text null,
  cic_id varchar(7) not null unique,
  updated timestamp null default CURRENT_TIMESTAMP,
  service_level varchar(60) not null,
  created timestamp not null default CURRENT_TIMESTAMP,
  isactive boolean not null default true,
  iscomplete boolean not null default false,
  modified timestamp null,
  established varchar(4) null check(established ~* '[1-2][0-9][0-9][0-9]'),
  bn varchar(15) null check(bn ~* '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]RR[0-9][0-9][0-9][0-9]'),
  deleted timestamp null
);

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
