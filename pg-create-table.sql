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

-- skipping Level integer null COMPUTE ((length(sort_key)-1)/5): no COMPUTE
-- skipping Name varchar(100) not null check(length(name) > 0): bad data
create table tblOrgName (
  ID serial primary key,
  OrgNameTypeID integer not null,
  Name varchar(100) not null,
  ParentID integer null,
  Level integer null,
  Sort varchar(100) null,
  sort_key varchar(100) null,
  added timestamp null default CURRENT_TIMESTAMP
);

create table tlkpOrgNameType (
  ID serial primary key,
  Type varchar(20) not null
);

create table meta_word (
  id serial primary key,
  word varchar(30) not null unique
);

create table meta_column (
  id serial primary key,
  column_name varchar(50) null
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

create table org_names (
  id serial primary key,
  org_id integer not null,
  org_name_id integer not null,
  added timestamp null default CURRENT_TIMESTAMP,
  unique(org_id, org_name_id)
);

create table meta_index_thes (
  id serial primary key,
  row_id integer not null,
  column_id integer not null,
  word_id integer not null,
  position integer not null
);

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

-- skipping mod_date **datetime** not null default current timestamp
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

-- skipping settle_thes
-- skipping settle_org

create table org_comm_rel (
  id serial primary key,
  org_id integer not null,
  comm_id integer not null,
  added timestamp not null default CURRENT_TIMESTAMP,
  note text null
);

create table org_address_rel (
  id serial primary key,
  org_id integer not null,
  address_id integer not null,
  added timestamp not null default CURRENT_TIMESTAMP,
  note varchar(100) null,
  label varchar(50) null
);

create table org_contact_rel (
  id serial primary key,
  org_id integer not null,
  contact_id integer not null,
  added timestamp not null default CURRENT_TIMESTAMP,
  note text null
);

create table org_rel_del (
  id serial primary key,
  org_id integer not null,
  rel_id integer not null,
  added timestamp not null,
  note text null,
  deleted timestamp not null,
  table_id integer not null
);

create table org_service_rel (
  id serial primary key,
  org_id integer not null,
  service_id integer not null,
  added timestamp not null default CURRENT_TIMESTAMP,
  note text null
);

create table org_del (
  id serial primary key,
  org_name_id integer not null,
  update_note text null,
  cic_id varchar(7) not null unique,
  updated timestamp null,
  service_level varchar(60) null
);

create table pub_org (
  id serial primary key,
  pub_id integer not null,
  org_id integer not null,
  added timestamp not null default CURRENT_TIMESTAMP,
  org_contact_id integer null,
  deleted timestamp null,
  isActive boolean not null default true,
  xml text null,
  unique(pub_id, org_id)
);

create table thes_original (
  id serial primary key,
  de varchar(100) not null,
  use varchar(100) null,
  woo varchar(1) null,
  eq varchar(100) null,
  uf text null,
  sn text null,
  bt varchar(100) null,
  nt text null,
  rt varchar(150) null,
  ca varchar(50) null,
  input varchar(50) null,
  act varchar(10) not null,
  msg varchar(50) null,
  cr varchar(50) null,
  up varchar(50) null,
  sort varchar(100) null,
  comments text null
);

-- skipping res_type
-- skipping res_loc
-- skipping res
-- skipping res_order
-- skipping org_res_rel
-- skipping pub_list
-- skipping temp_name_1
-- skipping temp_name_2
-- skipping temp_name_3

create table thes_rel (
  id serial primary key,
  thes_id integer not null,
  rel_id integer null,
  rel_type varchar(2) not null,
  ca integer null,
  sort_key varchar(100) null,
  comments text null
);

-- skipping temp_insert
-- skipping temp_insert_rel

create table org_thes (
  id serial primary key,
  org_id integer not null,
  thes_id integer not null,
  official_id integer not null,
  unique(org_id, thes_id, official_id)
);

-- skipping temp_thes

create table pub_entry (
  id serial primary key,
  pub_org_id integer not null,
  entry integer not null,
  pub_year integer not null check(pub_year between 2000 and 2050),
  unique(pub_org_id, pub_year)
);

create table area (
  id serial primary key,
  name varchar(255) not null,
  locatedIn integer null,
  alt varchar(255) null
);

-- skipping org_parent_child
-- skipping parent_child_hours

create table taxonomy_original (
  recordType varchar(2) not null,
  termCode varchar(13) not null,
  value text not null
);

create table taxonomy (
  id serial primary key,
  name varchar(100) not null,
  code varchar(19) null,
  isPreferred boolean not null,
  definition text null,
  created date null,
  modified date null,
  parentId integer null,
  cicModified timestamp null
);

create table taxTree (
  id serial primary key,
  taxID integer not null,
  level1 varchar(1) not null,
  level2 varchar(1) null,
  level3 integer null,
  level4 integer null,
  level5 integer null,
  parentID integer null
);

create table taxRel (
  id serial primary key,
  taxID integer not null,
  relID integer not null,
  relType varchar(2) not null
);

create table org_tax (
  id serial primary key,
  orgID integer not null,
  taxID integer not null,
  unique(orgID, taxID)
);

-- skipping tempSuffix
-- skipping addressSuffix
-- skipping addressUnit
-- skipping cura
-- skipping curaTarget
-- skipping curaTargets
-- skipping curaCategory
-- skipping curaCategories
-- skipping curaCatchment
-- skipping curaAvailability
-- skipping tblProject
-- skipping trelBroadcastProject
-- skipping tlkpBroadcastType
-- skipping tblBroadcast
-- skipping trelBroadcastRec
-- skipping tlkpBroadcastStatus

create table locations (
  id serial primary key,
  officialName varchar(100) not null,
  locatedIn integer null,
  sortAs varchar(100) null,
  displayAs varchar(100) null
);

-- skipping log_level
-- skipping log_source
-- skipping log_contact
-- skipping log_age
-- skipping log_enq
-- skipping log_area_call
-- skipping log_area_need
-- skipping log_enq_mode
-- skipping staff
-- skipping DocInfo
-- skipping NAMESDATA
-- skipping PAGESDATA
-- skipping SortHeadings
-- skipping SUBJECTDATA
-- skipping subjects
-- skipping TESTXML
-- skipping XMLContent
-- skipping log_result
-- skipping log_need
-- skipping log_resource
-- skipping tempCIT

create table pubGroupName (
  id serial primary key,
  groupName varchar(50) not null
);

create table pubGroup (
  id serial primary key,
  pubId integer not null,
  groupId integer not null,
  unique(pubId, groupId)
);

-- skipping tempGeo

create table orgNotes (
  id serial primary key,
  orgId integer not null,
  noteType integer not null,
  note text not null,
  added timestamp not null default CURRENT_TIMESTAMP,
  modified timestamp null,
  isactive boolean not null default true,
  ispublic boolean not null default true,
  alertDate date null
);

create table orgNoteTypes (
  id serial primary key,
  value varchar(30) not null
);

create table pubThes (
  id serial primary key,
  pubId integer not null,
  thesId integer not null,
  isactive boolean not null default true
);

-- skipping tempUTM

create table orgMod (
  id serial primary key,
  columnId integer not null,
  oldValue text null,
  newValue text null,
  modified timestamp not null
);

create table orgModColumns (
  id serial primary key,
  columnName varchar(50) not null
);

-- skipping og

create table taxGroups (
  id serial primary key,
  taxGroup integer not null,
  taxID integer not null,
  isActive boolean not null,
  hasChildren boolean not null,
  added timestamp null default CURRENT_TIMESTAMP,
  isLocal boolean not null default false,
  modified timestamp null
);

create table temptaxgroup (
  groupid integer not null,
  taxcode varchar(13) not null
);

create table taxChanges (
  changeType integer not null,
  oldCode varchar(13) not null,
  newCode varchar(13) not null,
  oldName varchar(60) not null,
  newName varchar(60) not null,
  dateUS varchar(10) not null
);

-- skipping tempContactComm

create table taxGroup (
  id serial primary key,
  name varchar(50) not null,
  notes text null
);

create table orgUpdated (
  id serial primary key,
  orgid integer not null,
  updated timestamp not null,
  unique(orgid, updated)
);

-- skipping temp211
-- skipping postalCodes
-- skipping sqlXml

create table taxLink (
  id serial primary key,
  linkId integer not null,
  taxId integer not null,
  unique(linkId, taxId)
);

create table orgTaxLink (
  id serial primary key,
  orgId integer not null,
  linkId integer not null,
  added timestamp null default CURRENT_TIMESTAMP,
  unique(orgId, linkId)
);

create table taxLinkNote (
  id serial primary key,
  note text not null
);

-- skipping taxStartTemp

create table taxTemp (
  name varchar(100) not null,
  code varchar(19) null,
  isPreferred boolean not null,
  definition text null,
  created date null,
  modified date null,
  parentCode varchar(19) null
);

create table cioc (
  id serial primary key,
  pid integer not null,
  ptype integer not null,
  xid integer not null
);

create table ciocExport (
  id serial primary key,
  updated timestamp null,
  notes text not null
);

-- skipping tempNO

create table taxRelTemp (
  id serial primary key,
  taxCode varchar(19) not null,
  relCode varchar(19) not null,
  relType varchar(2) not null
);

create table taxTempOldCode (
  code varchar(19) not null,
  oldCode varchar(19) not null
);

-- skipping taxonomy_copy

create table funding (
  id serial primary key,
  name varchar(100) not null,
  notes text null
);

create table orgFunding (
  id serial primary key,
  orgId integer not null,
  fundingId integer not null
);

create table tempTaxNames (
  code varchar(19) not null,
  name varchar(100) not null,
  isPreferred boolean not null,
  release text null
);

create table tempTaxAlso (
  code varchar(19) not null,
  see varchar(19) not null,
  release text null
);

create table tempTaxOld (
  code varchar(19) not null,
  old varchar(19) not null,
  release text null
);

create table tempTaxDetails (
  code varchar(19) not null,
  definition text not null,
  created date not null,
  modified date not null,
  release text null
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

create table pubTax (
  id serial primary key,
  pubId integer not null,
  taxId integer not null,
  added timestamp not null default CURRENT_TIMESTAMP
);

create table ic_agencies (
  id serial primary key,
  orgid integer not null unique,
  CND varchar(8) null,
  name_1 varchar(100) null,
  name_level_1 integer null,
  name_2 varchar(100) null,
  name_level_2 integer null
);

create table ic_agency_sites (
  id serial primary key,
  agencyid integer not null,
  siteid integer not null,
  CND varchar(8) null,
  site_name varchar(200) null,
  site_name_level integer null,
  site_name_other varchar(3) null
);

create table ic_site_services (
  id serial primary key,
  siteid integer not null,
  serviceid integer not null,
  service_name_1 varchar(200) null,
  service_name_2 varchar(200) null
);

create table pub_tree (
  id integer not null,
  parent integer not null,
  pub integer not null,
  note text null,
  depth integer not null,
  primary key (id, parent)
);

create table site (
  id serial primary key,
  org_address_id integer not null unique,
  context_id integer not null default 1,
  code varchar(20) null
);

create table org_tree (
  id serial primary key,
  org_id integer not null,
  super_id integer not null
);

create table org_site (
  id serial primary key,
  org_id integer not null,
  site_id integer not null,
  name varchar(100) null,
  note text null,
  label varchar(100) null,
  type integer not null default 3
);

create table org_site_name (
  id serial primary key,
  org_site_id integer not null,
  org_names_id integer not null
);

create table org_thes_pub (
  id serial primary key,
  org_thes_id integer not null,
  pub_id integer not null,
  is_active boolean not null default true
);

create table tempTaxActive (
  code varchar(25) not null
);

create table tempCCAC (
  ext varchar(10) not null,
  id varchar(10) not null,
  name varchar(200) not null
);

create table contact_comm (
  id serial primary key,
  contact_id integer not null,
  comm_id integer not null,
  type integer null,
  note varchar(50) null,
  added timestamp not null default CURRENT_TIMESTAMP
);

create table external (
  id serial primary key,
  name varchar(50) not null,
  field varchar(50) not null,
  cic varchar(50) not null,
  note text not null
);

create table external_data (
  id serial primary key,
  external_type integer not null,
  cic_id integer not null,
  data text not null,
  external_id varchar(50) not null
);
