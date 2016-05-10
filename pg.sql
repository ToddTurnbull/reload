create schema if not exists tempdb;
set search_path to tempdb;

drop domain if exists tempdb.multiocc cascade;
create domain tempdb.multiocc as text;

drop table if exists
  Data,
  thes,
  thes_cat,
  thes_tree,
  thes_data,
  city,
  pub,
  thes_related,
  blue_entry,
  thes_reject,
  thes_blue_entry,
  thes_blue,
  old_blue_entry,
  thes_blue_related,
  xref,
  tlkpAddressType,
  tblAddress,
  tlkpAccessibility,
  trelAddressAccessibility,
  tlkpCommType,
  tblComm,
  tblContact,
  tblService,
  tlkpLanguage,
  trelServiceLanguage,
  tlkpArea,
  trelServiceArea
cascade;

create table Data (
  RecordNumber varchar(5) not null unique,
  InternalMemo multiocc null,
  Comments text null,
  RecNum varchar(7) not null check(left(RecNum, 3) = 'WRN') unique,
  Org1 varchar(100) null,
  Org2 varchar(70) null,
  Org3 varchar(70) null,
  Org4 varchar(70) null,
  Org5 varchar(70) null,
  AltOrg multiocc null,
  FormerOrg multiocc null,
  XRef multiocc null,
  StreetBuilding varchar(90) null,
  StreetAddress varchar(90) null,
  StreetCity varchar(40) null,
  MailCareOf varchar(60) null,
  Building varchar(90) null,
  Address  varchar(90) null,
  City varchar(40) null,
  Province varchar(25) null,
  PostalCode varchar(7) null,
  Accessibility multiocc null,
  Location varchar(60) null,
  Intersection varchar(60) null,
  OfficePhone multiocc null,
  Fax multiocc null,
  EMail multiocc null,
  WWW varchar(255) null,
  AfterHoursPhone multiocc null,
  CrisisPhone multiocc null,
  TDDPhone multiocc null,
  Data varchar(30) null,
  Description multiocc null,
  PubDescription text null,
  GeneralInfo text null,
  BND multiocc null,
  OtherResource text null,
  Fees text null,
  Hours text null,
  Dates text null,
  AreaServed multiocc null,
  Eligibility text null,
  Application multiocc null,
  Languages multiocc null,
  Contact1 varchar(60) null,
  Contact1Title varchar(120) null,
  Contact1Org varchar(90) null,
  Contact1Phone multiocc null,
  Contact2 varchar(60) null,
  Contact2Title varchar(120) null,
  PrintedMaterial multiocc null,
  Contact2Org varchar(90) null,
  Contact2Phone multiocc null,
  Contact3 varchar(60) null,
  Contact3Title varchar(120) null,
  Contact3Org varchar(90) null,
  Contact3Phone multiocc null,
  Contact4 varchar(60) null,
  Contact4Title varchar(120) null,
  Contact4Org varchar(90) null,
  Contact4Phone multiocc null,
  DateEstablished varchar(60) null,
  Elections varchar(120) null,
  Funding multiocc null,
  DDCode varchar(10) null,
  LevelOfService varchar(60) null,
  Subject multiocc null,
  UsedFor multiocc null,
  Blue multiocc null,
  SeeAlso multiocc null,
  LocalSubjects multiocc null,
  TypeOfRecord varchar(2) null,
  QualityLevel varchar(20) null,
  ToBeDeleted varchar(20) null,
  Distribution multiocc null,
  Pub multiocc null,
  SourceOfInfo varchar(60) null,
  SourceTitle varchar(60) null,
  SourceOrg varchar(60) null,
  SourceBuilding varchar(30) null,
  SourceAddress varchar(60) null,
  SourceCity varchar(30) null,
  SourceProvince varchar(2) null,
  SourcePostalCode varchar(7) null,
  SourcePhone multiocc null,
  CollectedBy varchar(40) null,
  DateCollected varchar(10) null,
  CreatedBy varchar(40) null,
  UpdatedBy varchar(40) null,
  UpdateDate varchar(10) null,
  UpdateSchedule varchar(10) null,
  HistoryOfUpdate varchar(10) null,
  LastModified multiocc null,
  org1_sort varchar(100) null,
  id serial primary key,
  org_name_id integer not null
);

-- skipping WebConnection
-- skipping WebDocumentType
-- skipping WebSynchronize
-- skipping WebTemplate
-- skipping WebData
-- skipping WebVersion

create table thes (
  id serial primary key,
  term varchar(60) not null,
  note text not null,
  action varchar(6) null,
  cat_id integer null,
  sort varchar(6) null
);

create table thes_cat (
  id serial primary key,
  category varchar(30) not null
);

create table thes_tree (
  id serial primary key,
  term text not null,
  parent_id integer null,
  cat_id integer not null
);

create table thes_data (
  id serial primary key,
  thes_id integer not null,
  data_id integer not null,
  unique (thes_id, data_id)
);

-- skipping StaffBook
-- skipping staff_calendar
-- skipping staff_group
-- skipping staff_hours

create table city (
  id serial primary key,
  city varchar(20) not null
);

create table pub (
  id serial primary key,
  code varchar(20) not null unique,
  title varchar(50) not null,
  isdefault boolean not null default false,
  lastUpdated timestamp null,
  note text null
);

create table thes_related (
  thes_id integer not null,
  related_id integer not null,
  primary key (thes_id, related_id)
);

create table blue_entry (
  entry integer not null unique,
  data_id integer primary key
);

create table thes_reject (
  thes_id integer not null,
  accept_id integer not null
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

-- skipping defunct

create table tlkpAddressType (
  ID serial primary key,
  Name varchar(50) not null
);

create table tblAddress (
  ID serial primary key,
  AddressTypeID integer not null,
  InCareOf varchar(60) null,
  Building varchar(50) null,
  Address varchar(50) null,
  City varchar(50) not null,
  Province varchar(2) null default 'ON',
  PostalCode varchar(7) null check(postalcode ~* '[a-z][0-9][a-z] [0-9][a-z][0-9]'),
  Intersection varchar(255) null,
  unit varchar(10) null,
  unitValue varchar(10) null,
  streetNumber varchar(10) null,
  streetSuffix varchar(10) null,
  streetDirection varchar(2) null,
  unitExtra varchar(25) null,
  deliveryNumber varchar(10) null,
  deliveryStation varchar(30) null,
  deliveryMode varchar(20) null,
  busRoute varchar(50) null,
  utm_x integer null,
  utm_y integer null,
  ismappable boolean null,
  latitude decimal(11,9) null,
  longitude decimal(11,9) null,
  check(
    (utm_x is null and utm_y is null)
    or
    (utm_x is not null and utm_y is not null)
    or
    (latitude is null and longitude is null)
    or
    (latitude is not null and longitude is not null)
  )
);

create table tlkpAccessibility (
  ID serial primary key,
  Name varchar(100) not null
);

create table trelAddressAccessibility (
  AddressID serial primary key,
  AccessibilityID integer not null
);

create table tlkpCommType (
  ID serial primary key,
  Name varchar(50) not null unique
);

create table tblComm (
  ID serial primary key,
  CommTypeID integer not null,
  Value varchar(255) not null,
  Comment text null,
  check(
    (commtypeid in (1, 2, 3, 5, 6) and value ~* '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
    or
    (commtypeid = 2 and value = '911')
    or
    (commtypeid = 4 and value like '_%@%.%')
    or
    (commtypeid = 7 and value like '%.__%')
    or
    commtypeid > 7
  )
);

create table tblContact (
  ID serial primary key,
  Name varchar(60) null,
  Title varchar(120) null,
  Org varchar(90) null,
  Comm text null,
  ContactType integer null default 0
);

create table tblService (
  ID serial primary key,
  Description text null,
  Eligibility text null,
  Info text null,
  Fees text null,
  Hours text null,
  Dates text null,
  Application text null,
  updated timestamp null,
  ciocDescription text null,
  ciocEligibility text null,
  ciocApplication text null
);

create table tlkpLanguage (
  ID serial primary key,
  Name text not null
);

create table trelServiceLanguage (
  ServiceID integer not null,
  LanguageID integer not null,
  primary key (ServiceID, LanguageID)
);

create table tlkpArea (
  ID serial primary key,
  Name text not null
);

create table trelServiceArea (
  ServiceID integer not null,
  AreaID integer not null,
  primary key (ServiceID, AreaID)
);


\copy data from 'unload/172.dat' csv quote '''' encoding 'WIN1252';
\copy thes from 'unload/179.dat' csv quote '''' encoding 'WIN1252';
\copy thes_cat from 'unload/180.dat' csv quote '''' encoding 'WIN1252';
\copy thes_tree from 'unload/181.dat' csv quote '''' encoding 'WIN1252';
\copy thes_data from 'unload/182.dat' csv quote '''' encoding 'WIN1252';
\copy city from 'unload/187.dat' csv quote '''' encoding 'WIN1252';
\copy pub from 'unload/188.dat' csv quote '''' encoding 'WIN1252';
\copy thes_related from 'unload/189.dat' csv quote '''' encoding 'WIN1252';
\copy blue_entry from 'unload/190.dat' csv quote '''' encoding 'WIN1252';
\copy thes_reject from 'unload/191.dat' csv quote '''' encoding 'WIN1252';
\copy thes_blue_entry from 'unload/192.dat' csv quote '''' encoding 'WIN1252';
\copy thes_blue from 'unload/193.dat' csv quote '''' encoding 'WIN1252';
\copy old_blue_entry from 'unload/194.dat' csv quote '''' encoding 'WIN1252';
\copy thes_blue_related from 'unload/195.dat' csv quote '''' encoding 'WIN1252';
\copy xref from 'unload/196.dat' csv quote '''' encoding 'WIN1252';
\copy tlkpAddressType from 'unload/198.dat' csv quote '''' encoding 'WIN1252';
\copy tblAddress from 'unload/199.dat' csv quote '''' encoding 'WIN1252';
\copy tlkpAccessibility from 'unload/200.dat' csv quote '''' encoding 'WIN1252';
\copy trelAddressAccessibility from 'unload/201.dat' csv quote '''' encoding 'WIN1252';
\copy tlkpCommType from 'unload/202.dat' csv quote '''' encoding 'WIN1252';
\copy tblComm from 'unload/203.dat' csv quote '''' encoding 'WIN1252';
\copy tblContact from 'unload/204.dat' csv quote '''' encoding 'WIN1252';
\copy tblService from 'unload/205.dat' csv quote '''' encoding 'WIN1252';
\copy tlkpLanguage from 'unload/206.dat' csv quote '''' encoding 'WIN1252';
\copy trelServiceLanguage from 'unload/207.dat' csv quote '''' encoding 'WIN1252';
\copy tlkpArea from 'unload/208.dat' csv quote '''' encoding 'WIN1252';
\copy trelServiceArea from 'unload/209.dat' csv quote '''' encoding 'WIN1252';
