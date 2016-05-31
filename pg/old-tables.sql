create table thes_data (
  id serial primary key,
  thes_id integer not null,
  data_id integer not null,
  unique (thes_id, data_id)
);

create table blue_entry (
  entry integer not null unique,
  data_id integer primary key
);
create table thes_blue_entry (
  thes_id integer not null,
  entry integer not null,
  primary key (thes_id, entry)
);

create table thes_blue (
  thes_id integer primary key
);

create table old_blue_entry (
  entry integer primary key,
  data_id integer not null
);
create table thes_blue_related (
  thes_blue_id integer not null,
  related_id integer not null,
  type varchar(1) not null,
  primary key (thes_blue_id, related_id)
);

create table xref (
  data_id integer not null,
  xref varchar(100) not null,
  sort varchar(100) null,
  id serial not null unique,
  entry integer null,
  primary key (data_id, xref)
);

create table meta_word (
  id serial primary key,
  word varchar(30) not null unique
);

create table org_notes (
  id serial primary key,
  org varchar(300) not null,
  note varchar(100) not null,
  details text null,
  org_id integer null,
  note_date date not null default CURRENT_DATE
);

create table meta_index (
  id serial primary key,
  row_id integer not null,
  column_id integer not null,
  word_id integer not null,
  position integer not null,
  unique(row_id, column_id, position)
);

create table meta_group (
  id serial primary key,
  "group" varchar(20) not null
);

create table meta_column_group (
  id serial primary key,
  column_id integer not null,
  group_id integer not null,
  unique(column_id, group_id)
);
create table meta_index_thes (
  id serial primary key,
  row_id integer not null,
  column_id integer not null,
  word_id integer not null,
  position integer not null
);
create table org_mod (
  id serial primary key,
  org_id integer not null,
  mod text not null,
  mod_date timestamp not null default CURRENT_TIMESTAMP
);

create table org_meta (
  org_id integer not null,
  word_id integer not null,
  column_id integer not null,
  row_id integer not null,
  position integer null
);
create table taxonomy_original (
  recordType varchar(2) not null,
  termCode varchar(13) not null,
  value text not null
);
create table taxTree (
  id serial primary key,
  taxID integer not null,
  level1 varchar(1) not null,
  level2 varchar(1) null,
  level3 integer null,
  level4 integer null,
  level5 integer null,
  parentID integer null,
  unique(level1, level2, level3, level4, level5)
);

create table org_tax (
  id serial primary key,
  orgID integer not null,
  taxID integer not null,
  unique(orgID, taxID)
);

create table orgMod (
  id serial primary key,
  columnId integer not null,
  oldValue text null,
  newValue text null,
  modified timestamp not null
);
create table taxGroup (
  id serial primary key,
  name varchar(50) not null,
  notes text null
);

create table orgFunding (
  id serial primary key,
  orgId integer not null,
  fundingId integer not null
);

create table org_location (
  id serial primary key,
  org_id integer not null,
  name varchar(100) not null
);

create table org_locations (
  id serial primary key,
  location_id integer not null,
  address_id integer not null
);

create table orgModColumns (
  id serial primary key,
  columnName varchar(50) not null
);

create table funding (
  id serial primary key,
  name varchar(100) not null,
  notes text null
);

create table isql (
  id serial primary key,
  name varchar(100) not null,
  note text null,
  query text not null,
  parameters varchar(100) null,
  linkID integer null,
  created timestamp not null default CURRENT_TIMESTAMP
);
