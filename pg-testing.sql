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


