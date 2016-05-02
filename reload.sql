--
-- This command file reloads a database that was unloaded using "dbunload".
--
-- (version:  6.0.3.2747)
--

SET OPTION Statistics          = 3
go
SET OPTION Date_order          = 'YMD'
go
SET OPTION describe_java_format= 'binary'
go


-------------------------------------------------
--   Create userids and grant user permissions
-------------------------------------------------

GRANT CONNECT TO "DBA" IDENTIFIED BY "SQL"
go
GRANT RESOURCE, DBA, SCHEDULE TO "DBA"
go
GRANT CONNECT TO "dbo"
go
GRANT GROUP TO "dbo"
go
GRANT RESOURCE, DBA TO "dbo"
go
GRANT CONNECT TO "SA_DEBUG"
go
GRANT GROUP TO "SA_DEBUG"
go
GRANT CONNECT TO "ever" IDENTIFIED BY ENCRYPTED '\x19\x08\x44\x40\x93\x25\x1C\x3B\x67\xC2\xD9\x11\xB9\xA8\xFD\x5E\x0E\x1F\xAD\x36\x6B\xE5\x0B\x7E\xF3\xF2\x95\x14\x9F\x1D\xF8\x2D\xE1\x1E\xCA\x3C'
go
GRANT REMOTE DBA TO "ever"
go
GRANT CONNECT TO "csg" IDENTIFIED BY ENCRYPTED '\xE5\x50\xC7\x67\x16\x46\x6C\x18\xFC\x27\x67\x57\x51\x3C\x51\xE6\x05\x50\x11\xE0\x19\xB2\x1F\xA5\x7D\xE3\x08\x50\x40\x1F\xAD\xA0\xDF\x09\x1F\x39'
go
GRANT REMOTE DBA TO "csg"
go
GRANT CONNECT TO "tds" IDENTIFIED BY ENCRYPTED '\x24\x1F\x57\xAB\x72\x4D\xD5\xAC\x27\x80\xE4\x69\xBD\x00\x46\xEE\xF6\x9B\x53\xEA\xC6\x2D\x6E\x9F\x40\x60\xF6\x38\xF8\x7E\x9A\x93\x59\x3B\x3F\x97'
go
GRANT DBA, REMOTE DBA TO "tds"
go
commit work
go


-------------------------------------------------
--   Create user-defined types
-------------------------------------------------

setuser "DBA" 
go
CREATE DOMAIN multiocc long varchar
go

commit work
go


-------------------------------------------------
--   Install user-defined classes
-------------------------------------------------

create variable @byte_code long binary
go
drop variable @byte_code
go
commit work
go


-------------------------------------------------
--   Grant user memberships
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Create external servers
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Create tables
-------------------------------------------------

CREATE TABLE "DBA"."Data"
(
	"RecordNumber"  		char(5) NOT NULL,
	"InternalMemo"  		multiocc NULL,
	"Comments"      		long varchar NULL,
	"RecNum"        		char(7) NOT NULL check("LEFT"(@col,3) = 'WRN'),
	"Org1"  			char(100) NULL,
	"Org2"  			char(70) NULL,
	"Org3"  			char(70) NULL,
	"Org4"  			char(70) NULL,
	"Org5"  			char(70) NULL,
	"AltOrg"        		multiocc NULL,
	"FormerOrg"     		multiocc NULL,
	"XRef"  			multiocc NULL,
	"StreetBuilding"        	char(90) NULL,
	"StreetAddress" 		char(90) NULL,
	"StreetCity"    		char(40) NULL,
	"MailCareOf"    		char(60) NULL,
	"Building"      		char(90) NULL,
	"Address"       		char(90) NULL,
	"City"  			char(40) NULL,
	"Province"      		char(25) NULL,
	"PostalCode"    		char(7) NULL,
	"Accessibility" 		multiocc NULL,
	"Location"      		char(60) NULL,
	"Intersection"  		char(60) NULL,
	"OfficePhone"   		multiocc NULL,
	"Fax"   			multiocc NULL,
	"EMail" 			multiocc NULL,
	"WWW"   			char(255) NULL,
	"AfterHoursPhone"       	multiocc NULL,
	"CrisisPhone"   		multiocc NULL,
	"TDDPhone"      		multiocc NULL,
	"Data"  			char(30) NULL,
	"Description"   		multiocc NULL,
	"PubDescription"        	long varchar NULL,
	"GeneralInfo"   		long varchar NULL,
	"BND"   			multiocc NULL,
	"OtherResource" 		long varchar NULL,
	"Fees"  			long varchar NULL,
	"Hours" 			long varchar NULL,
	"Dates" 			long varchar NULL,
	"AreaServed"    		multiocc NULL,
	"Eligibility"   		long varchar NULL,
	"Application"   		multiocc NULL,
	"Languages"     		multiocc NULL,
	"Contact1"      		char(60) NULL,
	"Contact1Title" 		char(120) NULL,
	"Contact1Org"   		char(90) NULL,
	"Contact1Phone" 		multiocc NULL,
	"Contact2"      		char(60) NULL,
	"Contact2Title" 		char(120) NULL,
	"PrintedMaterial"       	multiocc NULL,
	"Contact2Org"   		char(90) NULL,
	"Contact2Phone" 		multiocc NULL,
	"Contact3"      		char(60) NULL,
	"Contact3Title" 		char(120) NULL,
	"Contact3Org"   		char(90) NULL,
	"Contact3Phone" 		multiocc NULL,
	"Contact4"      		char(60) NULL,
	"Contact4Title" 		char(120) NULL,
	"Contact4Org"   		char(90) NULL,
	"Contact4Phone" 		multiocc NULL,
	"DateEstablished"       	char(60) NULL,
	"Elections"     		char(120) NULL,
	"Funding"       		multiocc NULL,
	"DDCode"        		char(10) NULL,
	"LevelOfService"        	char(60) NULL,
	"Subject"       		multiocc NULL,
	"UsedFor"       		multiocc NULL,
	"Blue"  			multiocc NULL,
	"SeeAlso"       		multiocc NULL,
	"LocalSubjects" 		multiocc NULL,
	"TypeOfRecord"  		char(2) NULL,
	"QualityLevel"  		char(20) NULL,
	"ToBeDeleted"   		char(20) NULL,
	"Distribution"  		multiocc NULL,
	"Pub"   			multiocc NULL,
	"SourceOfInfo"  		char(60) NULL,
	"SourceTitle"   		char(60) NULL,
	"SourceOrg"     		char(60) NULL,
	"SourceBuilding"        	char(30) NULL,
	"SourceAddress" 		char(60) NULL,
	"SourceCity"    		char(30) NULL,
	"SourceProvince"        	char(2) NULL,
	"SourcePostalCode"      	char(7) NULL,
	"SourcePhone"   		multiocc NULL,
	"CollectedBy"   		char(40) NULL,
	"DateCollected" 		char(10) NULL,
	"CreatedBy"     		char(40) NULL,
	"UpdatedBy"     		char(40) NULL,
	"UpdateDate"    		char(10) NULL,
	"UpdateSchedule"        	char(10) NULL,
	"HistoryOfUpdate"       	char(10) NULL,
	"LastModified"  		multiocc NULL,
	"org1_sort"     		char(100) NULL,
	"id"    			integer NOT NULL,
	"org_name_id"   		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
COMMENT ON COLUMN "DBA"."Data"."InternalMemo" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."AltOrg" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."FormerOrg" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."XRef" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Accessibility" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."OfficePhone" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Fax" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."EMail" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."AfterHoursPhone" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."CrisisPhone" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."TDDPhone" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Description" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."BND" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."AreaServed" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Application" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Languages" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Contact1Phone" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."PrintedMaterial" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Contact2Phone" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Contact3Phone" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Contact4Phone" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Funding" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Subject" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."UsedFor" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Blue" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."SeeAlso" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."LocalSubjects" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Distribution" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."Pub" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."SourcePhone" IS
	'multiocc'
go

COMMENT ON COLUMN "DBA"."Data"."LastModified" IS
	'multiocc'
go


ALTER TABLE "DBA"."Data" ADD UNIQUE ( "RecordNumber"
)
go

ALTER TABLE "DBA"."Data" ADD UNIQUE ( "RecNum"
)
go
CREATE TABLE "DBA"."WebConnection"
(
	"Id"    			integer NOT NULL DEFAULT autoincrement,
	"Name"  			char(20) NOT NULL,
	"Datasource"    		char(128) NULL,
	"Userid"        		char(128) NULL,
	"Password"      		char(128) NULL,
	"ConnectParameters"     	varchar(255) NULL,
	"Description"   		varchar(255) NULL,
	PRIMARY KEY ("Id")
)
go

ALTER TABLE "DBA"."WebConnection" ADD UNIQUE ( "Name"
)
go
CREATE TABLE "DBA"."WebDocumentType"
(
	"Id"    			integer NOT NULL DEFAULT autoincrement,
	"Extension"     		varchar(255) NULL,
	"Type"  			varchar(255) NOT NULL,
	PRIMARY KEY ("Id")
)
go
CREATE TABLE "DBA"."WebSynchronize"
(
	"TableName"     		char(20) NOT NULL,
	"Revision"      		integer NOT NULL,
	PRIMARY KEY ("TableName")
)
go
CREATE TABLE "DBA"."WebTemplate"
(
	"Id"    			integer NOT NULL DEFAULT autoincrement,
	"ConnectionId"  		integer NOT NULL,
	"DocType"       		integer NOT NULL,
	"ParentId"      		integer NULL,
	"Name"  			varchar(250) NOT NULL check(Name not like '%/%'),
	"Size"  			integer NOT NULL DEFAULT 0,
	"LastModified"  		smalldatetime NOT NULL DEFAULT getdate(*),
	"Description"   		varchar(255) NULL,
	"Location"      		varchar(255) NOT NULL DEFAULT '',
	"DiskDirectory" 		varchar(255) NULL,
	PRIMARY KEY ("Id")
)
go
CREATE TABLE "DBA"."WebData"
(
	"Id"    			integer NOT NULL,
	"Sequence"      		integer NOT NULL,
	"Data"  			binary(255) NOT NULL,
	PRIMARY KEY ("Id", "Sequence")
)
go
CREATE TABLE "DBA"."WebVersion"
(
	"NIDVersion"    		integer NOT NULL,
	PRIMARY KEY ("NIDVersion")
)
go
CREATE TABLE "DBA"."thes"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"term"  			varchar(60) NOT NULL,
	"note"  			long varchar NOT NULL,
	"action"        		char(6) NULL,
	"cat_id"        		integer NULL,
	"sort"  			char(6) NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."thes_cat"
(
	"id"    			integer NOT NULL,
	"category"      		char(30) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."thes_tree"
(
	"id"    			integer NOT NULL,
	"term"  			long varchar NOT NULL,
	"parent_id"     		integer NULL,
	"cat_id"        		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."thes_data"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"thes_id"       		integer NOT NULL,
	"data_id"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."thes_data" ADD UNIQUE ( "thes_id", "data_id"
)
go
CREATE TABLE "DBA"."StaffBook"
(
	"ID"    			integer NOT NULL DEFAULT autoincrement,
	"EntryDate"     		datetime NOT NULL DEFAULT current timestamp,
	"Staff" 			char(30) NOT NULL,
	"Title" 			char(100) NOT NULL,
	"Data"  			long varchar NOT NULL,
	PRIMARY KEY ("ID")
)
go

ALTER TABLE "DBA"."StaffBook" ADD UNIQUE ( "ID"
)
go
CREATE TABLE "DBA"."staff_calendar"
(
	"dates" 			date NOT NULL,
	"when"  			char(2) NOT NULL,
	"staff_id"      		integer NOT NULL,
	PRIMARY KEY ("dates", "when", "staff_id")
)
go
CREATE TABLE "DBA"."staff_group"
(
	"id"    			integer NOT NULL,
	"group" 			long varchar NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."staff_hours"
(
	"staff_id"      		integer NOT NULL,
	"dow"   			integer NOT NULL,
	"when"  			char(2) NOT NULL,
	"note"  			long varchar NULL,
	PRIMARY KEY ("staff_id", "dow", "when")
)
go
CREATE TABLE "DBA"."city"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"city"  			char(20) NOT NULL,
	PRIMARY KEY ("id")
)
go
setuser "DBA" 
go
GRANT SELECT, INSERT, DELETE, UPDATE, ALTER, REFERENCES ON "DBA"."city" TO "ever"
go
CREATE TABLE "DBA"."pub"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"code"  			char(20) NOT NULL,
	"title" 			char(50) NOT NULL,
	"isdefault"     		bit NOT NULL DEFAULT 0,
	"lastUpdated"   		timestamp NULL,
	"note"  			long varchar NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."pub" ADD UNIQUE ( "code"
)
go
CREATE TABLE "DBA"."thes_related"
(
	"thes_id"       		integer NOT NULL,
	"related_id"    		integer NOT NULL,
	PRIMARY KEY ("thes_id", "related_id")
)
go
CREATE TABLE "DBA"."blue_entry"
(
	"entry" 			integer NOT NULL,
	"data_id"       		integer NOT NULL,
	PRIMARY KEY ("data_id")
)
go

ALTER TABLE "DBA"."blue_entry" ADD UNIQUE ( "entry"
)
go
CREATE TABLE "DBA"."thes_reject"
(
	"thes_id"       		integer NOT NULL,
	"accept_id"     		integer NOT NULL
)
go
CREATE TABLE "DBA"."thes_blue_entry"
(
	"thes_id"       		integer NOT NULL,
	"entry" 			integer NOT NULL,
	PRIMARY KEY ("thes_id", "entry")
)
go
CREATE TABLE "DBA"."thes_blue"
(
	"thes_id"       		integer NOT NULL,
	PRIMARY KEY ("thes_id")
)
go
CREATE TABLE "DBA"."old_blue_entry"
(
	"entry" 			integer NOT NULL,
	"data_id"       		integer NOT NULL,
	PRIMARY KEY ("entry")
)
go

ALTER TABLE "DBA"."old_blue_entry" ADD UNIQUE ( "entry"
)
go
CREATE TABLE "DBA"."thes_blue_related"
(
	"thes_blue_id"  		integer NOT NULL,
	"related_id"    		integer NOT NULL,
	"type"  			char(1) NOT NULL,
	PRIMARY KEY ("thes_blue_id", "related_id")
)
go
CREATE TABLE "DBA"."xref"
(
	"data_id"       		integer NOT NULL,
	"xref"  			char(100) NOT NULL,
	"sort"  			char(100) NULL,
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"entry" 			integer NULL,
	PRIMARY KEY ("data_id", "xref")
)
go

ALTER TABLE "DBA"."xref" ADD UNIQUE ( "id"
)
go
CREATE TABLE "DBA"."defunct"
(
	"RecordNumber_copy"     	char(5) NOT NULL,
	"InternalMemo_copy"     	multiocc NULL,
	"Comments_copy" 		long varchar NULL,
	"RecNum_copy"   		char(7) NOT NULL check("LEFT"(@col,3) = 'WRN'),
	"Org1_copy"     		char(100) NULL,
	"Org2_copy"     		char(70) NULL,
	"Org3_copy"     		char(70) NULL,
	"Org4_copy"     		char(70) NULL,
	"Org5_copy"     		char(70) NULL,
	"AltOrg_copy"   		multiocc NULL,
	"FormerOrg_copy"        	multiocc NULL,
	"XRef_copy"     		multiocc NULL,
	"StreetBuilding_copy"   	char(90) NULL,
	"StreetAddress_copy"    	char(90) NULL,
	"StreetCity_copy"       	char(40) NULL,
	"MailCareOf_copy"       	char(60) NULL,
	"Building_copy" 		char(90) NULL,
	"Address_copy"  		char(90) NULL,
	"City_copy"     		char(40) NULL,
	"Province_copy" 		char(25) NULL,
	"PostalCode_copy"       	char(7) NULL,
	"Accessibility_copy"    	multiocc NULL,
	"Location_copy" 		char(60) NULL,
	"Intersection_copy"     	char(60) NULL,
	"OfficePhone_copy"      	multiocc NULL,
	"Fax_copy"      		multiocc NULL,
	"EMail_copy"    		multiocc NULL,
	"WWW_copy"      		char(255) NULL,
	"AfterHoursPhone_copy"  	multiocc NULL,
	"CrisisPhone_copy"      	multiocc NULL,
	"TDDPhone_copy" 		multiocc NULL,
	"Data_copy"     		char(30) NULL,
	"Description_copy"      	multiocc NULL,
	"PubDescription_copy"   	long varchar NULL,
	"GeneralInfo_copy"      	long varchar NULL,
	"BND_copy"      		multiocc NULL,
	"OtherResource_copy"    	long varchar NULL,
	"Fees_copy"     		long varchar NULL,
	"Hours_copy"    		long varchar NULL,
	"Dates_copy"    		long varchar NULL,
	"AreaServed_copy"       	multiocc NULL,
	"Eligibility_copy"      	long varchar NULL,
	"Application_copy"      	multiocc NULL,
	"Languages_copy"        	multiocc NULL,
	"Contact1_copy" 		char(60) NULL,
	"Contact1Title_copy"    	char(120) NULL,
	"Contact1Org_copy"      	char(90) NULL,
	"Contact1Phone_copy"    	multiocc NULL,
	"Contact2_copy" 		char(60) NULL,
	"Contact2Title_copy"    	char(120) NULL,
	"PrintedMaterial_copy"  	multiocc NULL,
	"Contact2Org_copy"      	char(90) NULL,
	"Contact2Phone_copy"    	multiocc NULL,
	"Contact3_copy" 		char(60) NULL,
	"Contact3Title_copy"    	char(120) NULL,
	"Contact3Org_copy"      	char(90) NULL,
	"Contact3Phone_copy"    	multiocc NULL,
	"Contact4_copy" 		char(60) NULL,
	"Contact4Title_copy"    	char(120) NULL,
	"Contact4Org_copy"      	char(90) NULL,
	"Contact4Phone_copy"    	multiocc NULL,
	"DateEstablished_copy"  	char(60) NULL,
	"Elections_copy"        	char(120) NULL,
	"Funding_copy"  		multiocc NULL,
	"DDCode_copy"   		char(10) NULL,
	"LevelOfService_copy"   	char(60) NULL,
	"Subject_copy"  		multiocc NULL,
	"UsedFor_copy"  		multiocc NULL,
	"Blue_copy"     		multiocc NULL,
	"SeeAlso_copy"  		multiocc NULL,
	"LocalSubjects_copy"    	multiocc NULL,
	"TypeOfRecord_copy"     	char(2) NULL,
	"QualityLevel_copy"     	char(20) NULL,
	"ToBeDeleted_copy"      	char(20) NULL,
	"Distribution_copy"     	multiocc NULL,
	"Pub_copy"      		multiocc NULL,
	"SourceOfInfo_copy"     	char(60) NULL,
	"SourceTitle_copy"      	char(60) NULL,
	"SourceOrg_copy"        	char(60) NULL,
	"SourceBuilding_copy"   	char(30) NULL,
	"SourceAddress_copy"    	char(60) NULL,
	"SourceCity_copy"       	char(30) NULL,
	"SourceProvince_copy"   	char(2) NULL,
	"SourcePostalCode_copy" 	char(7) NULL,
	"SourcePhone_copy"      	multiocc NULL,
	"CollectedBy_copy"      	char(40) NULL,
	"DateCollected_copy"    	char(10) NULL,
	"CreatedBy_copy"        	char(40) NULL,
	"UpdatedBy_copy"        	char(40) NULL,
	"UpdateDate_copy"       	char(10) NULL,
	"UpdateSchedule_copy"   	char(10) NULL,
	"HistoryOfUpdate_copy"  	char(10) NULL,
	"LastModified_copy"     	multiocc NULL,
	"org1_sort_copy"        	char(100) NULL,
	"id_copy"       		integer NOT NULL
)
go

ALTER TABLE "DBA"."defunct" ADD UNIQUE ( "RecordNumber_copy"
)
go

ALTER TABLE "DBA"."defunct" ADD UNIQUE ( "RecNum_copy"
)
go
CREATE TABLE "DBA"."tlkpAddressType"
(
	"ID"    			integer NOT NULL,
	"Name"  			char(50) NOT NULL,
	PRIMARY KEY ("ID")
)
go
CREATE TABLE "DBA"."tblAddress"
(
	"ID"    			integer NOT NULL DEFAULT autoincrement,
	"AddressTypeID" 		integer NOT NULL,
	"InCareOf"      		char(60) NULL,
	"Building"      		char(50) NULL,
	"Address"       		char(50) NULL,
	"City"  			char(50) NOT NULL,
	"Province"      		char(2) NULL DEFAULT 'ON',
	"PostalCode"    		char(7) NULL check(postalcode like '[a-z][0-9][a-z] [0-9][a-z][0-9]'),
	"Intersection"  		char(255) NULL,
	"unit"  			char(10) NULL,
	"unitValue"     		char(10) NULL,
	"streetNumber"  		char(10) NULL,
	"streetSuffix"  		char(10) NULL,
	"streetDirection"       	char(2) NULL,
	"unitExtra"     		char(25) NULL,
	"deliveryNumber"        	char(10) NULL,
	"deliveryStation"       	char(30) NULL,
	"deliveryMode"  		char(20) NULL,
	"busRoute"      		char(50) NULL,
	"utm_x" 			integer NULL,
	"utm_y" 			integer NULL,
	"ismappable"    		bit NULL,
	"latitude"      		decimal(11,9) NULL,
	"longitude"     		decimal(11,9) NULL,
	PRIMARY KEY ("ID"),
	check((utm_x is null and utm_y is null) or(utm_x is not null and utm_y is not null) or(latitude is null and longitude is null) or(latitude is not null and longitude is not null))
)
go
CREATE TABLE "DBA"."tlkpAccessibility"
(
	"ID"    			integer NOT NULL,
	"Name"  			char(100) NOT NULL,
	PRIMARY KEY ("ID")
)
go
CREATE TABLE "DBA"."trelAddressAccessibility"
(
	"AddressID"     		integer NOT NULL,
	"AccessibilityID"       	integer NOT NULL,
	PRIMARY KEY ("AddressID")
)
go
CREATE TABLE "DBA"."tlkpCommType"
(
	"ID"    			integer NOT NULL DEFAULT autoincrement,
	"Name"  			char(50) NOT NULL,
	PRIMARY KEY ("ID")
)
go

ALTER TABLE "DBA"."tlkpCommType" ADD UNIQUE ( "ID"
)
go

ALTER TABLE "DBA"."tlkpCommType" ADD UNIQUE ( "Name"
)
go
CREATE TABLE "DBA"."tblComm"
(
	"ID"    			integer NOT NULL DEFAULT autoincrement,
	"CommTypeID"    		integer NOT NULL,
	"Value" 			char(255) NOT NULL,
	"Comment"       		long varchar NULL,
	PRIMARY KEY ("ID"),
	CHECK((commtypeid in(1,2,3,5,6) and value like '%[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]%') or
(commtypeid = 2 and value = '911') or
(commtypeid = 4 and value like '_%@%.%') or
(commtypeid = 7 and value like '%.__%') or commtypeid > 7)
)
go
CREATE TABLE "DBA"."tblContact"
(
	"ID"    			integer NOT NULL DEFAULT autoincrement,
	"Name"  			char(60) NULL,
	"Title" 			char(120) NULL,
	"Org"   			char(90) NULL,
	"Comm"  			long varchar NULL,
	"ContactType"   		integer NULL DEFAULT 0,
	PRIMARY KEY ("ID")
)
go
CREATE TABLE "DBA"."tblService"
(
	"ID"    			integer NOT NULL,
	"Description"   		long varchar NULL,
	"Eligibility"   		long varchar NULL,
	"Info"  			long varchar NULL,
	"Fees"  			long varchar NULL,
	"Hours" 			long varchar NULL,
	"Dates" 			long varchar NULL,
	"Application"   		long varchar NULL,
	"updated"       		timestamp NULL,
	"ciocDescription"       	long varchar NULL,
	"ciocEligibility"       	long varchar NULL,
	"ciocApplication"       	long varchar NULL,
	PRIMARY KEY ("ID")
)
go
CREATE TABLE "DBA"."tlkpLanguage"
(
	"ID"    			integer NOT NULL,
	"Name"  			long varchar NOT NULL,
	PRIMARY KEY ("ID")
)
go
CREATE TABLE "DBA"."trelServiceLanguage"
(
	"ServiceID"     		integer NOT NULL,
	"LanguageID"    		integer NOT NULL,
	PRIMARY KEY ("ServiceID", "LanguageID")
)
go
CREATE TABLE "DBA"."tlkpArea"
(
	"ID"    			integer NOT NULL,
	"Name"  			long varchar NOT NULL,
	PRIMARY KEY ("ID")
)
go
CREATE TABLE "DBA"."trelServiceArea"
(
	"ServiceID"     		integer NOT NULL,
	"AreaID"        		integer NOT NULL,
	PRIMARY KEY ("ServiceID", "AreaID")
)
go
CREATE TABLE "DBA"."tblOrgName"
(
	"ID"    			integer NOT NULL DEFAULT autoincrement,
	"OrgNameTypeID" 		integer NOT NULL,
	"Name"  			char(100) NOT NULL check(length(name) > 0),
	"ParentID"      		integer NULL,
	"Level" 			integer NULL COMPUTE ((length(sort_key)-1)/5),
	"Sort"  			char(100) NULL,
	"sort_key"      		char(100) NULL,
	"added" 			timestamp NULL DEFAULT current timestamp,
	PRIMARY KEY ("ID")
)
go
CREATE TABLE "DBA"."tlkpOrgNameType"
(
	"ID"    			integer NOT NULL,
	"Type"  			char(20) NOT NULL,
	PRIMARY KEY ("ID")
)
go
CREATE TABLE "DBA"."meta_word"
(
	"id"    			integer NOT NULL,
	"word"  			char(30) NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."meta_word" ADD UNIQUE ( "word"
)
go
CREATE TABLE "DBA"."meta_column"
(
	"id"    			integer NOT NULL,
	"column_name"   		char(50) NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_notes"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org"   			char(300) NOT NULL,
	"note"  			char(100) NOT NULL,
	"details"       		long varchar NULL,
	"org_id"        		integer NULL,
	"note_date"     		date NOT NULL DEFAULT current date,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."meta_index"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"row_id"        		integer NOT NULL,
	"column_id"     		integer NOT NULL,
	"word_id"       		integer NOT NULL,
	"position"      		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."meta_index" ADD UNIQUE ( "row_id", "column_id", "position"
)
go
CREATE TABLE "DBA"."meta_group"
(
	"id"    			integer NOT NULL,
	"group" 			char(20) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."meta_column_group"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"column_id"     		integer NOT NULL,
	"group_id"      		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."meta_column_group" ADD UNIQUE ( "column_id", "group_id"
)
go
CREATE TABLE "DBA"."org_names"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"org_name_id"   		integer NOT NULL,
	"added" 			timestamp NULL DEFAULT current timestamp,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."org_names" ADD UNIQUE ( "org_id", "org_name_id"
)
go
CREATE TABLE "DBA"."meta_index_thes"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"row_id"        		integer NOT NULL,
	"column_id"     		integer NOT NULL,
	"word_id"       		integer NOT NULL,
	"position"      		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_name_id"   		integer NOT NULL,
	"update_note"   		long varchar NULL,
	"cic_id"        		char(7) NOT NULL,
	"updated"       		timestamp NULL DEFAULT current timestamp,
	"service_level" 		char(60) NOT NULL,
	"created"       		timestamp NOT NULL DEFAULT current timestamp,
	"isactive"      		bit NOT NULL DEFAULT 1,
	"iscomplete"    		bit NOT NULL DEFAULT 0,
	"modified"      		timestamp NULL,
	"established"   		char(4) NULL check(established like '[1-2][0-9][0-9][0-9]'),
	"bn"    			char(15) NULL check(bn like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]RR[0-9][0-9][0-9][0-9]'),
	"deleted"       		timestamp NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."org" ADD UNIQUE ( "cic_id"
)
go
CREATE TABLE "DBA"."org_mod"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"mod"   			long varchar NOT NULL,
	"mod_date"      		datetime NOT NULL DEFAULT current timestamp,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_meta"
(
	"org_id"        		integer NOT NULL,
	"word_id"       		integer NOT NULL,
	"column_id"     		integer NOT NULL,
	"row_id"        		integer NOT NULL,
	"position"      		integer NULL
)
go
CREATE TABLE "DBA"."settle_thes"
(
	"id"    			integer NOT NULL,
	"thes_id"       		integer NOT NULL,
	"theme" 			char(50) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."settle_org"
(
	"org_id"        		integer NOT NULL,
	"id"    			integer NOT NULL,
	"type"  			char(10) NOT NULL
)
go

ALTER TABLE "DBA"."settle_org" ADD UNIQUE ( "org_id"
)
go
CREATE TABLE "DBA"."org_comm_rel"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"comm_id"       		integer NOT NULL,
	"added" 			timestamp NOT NULL DEFAULT current timestamp,
	"note"  			long varchar NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_address_rel"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"address_id"    		integer NOT NULL,
	"added" 			timestamp NOT NULL DEFAULT current timestamp,
	"note"  			varchar(100) NULL,
	"label" 			varchar(50) NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_contact_rel"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"contact_id"    		integer NOT NULL,
	"added" 			timestamp NOT NULL DEFAULT current timestamp,
	"note"  			long varchar NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_rel_del"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"rel_id"        		integer NOT NULL,
	"added" 			timestamp NOT NULL,
	"note"  			long varchar NULL,
	"deleted"       		timestamp NOT NULL,
	"table_id"      		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_service_rel"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"service_id"    		integer NOT NULL,
	"added" 			timestamp NOT NULL DEFAULT current timestamp,
	"note"  			long varchar NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_del"
(
	"id"    			integer NOT NULL,
	"org_name_id"   		integer NOT NULL,
	"update_note"   		long varchar NULL,
	"cic_id"        		char(7) NOT NULL,
	"updated"       		timestamp NULL,
	"service_level" 		char(60) NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."org_del" ADD UNIQUE ( "cic_id"
)
go
CREATE TABLE "DBA"."pub_org"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"pub_id"        		integer NOT NULL,
	"org_id"        		integer NOT NULL,
	"added" 			timestamp NOT NULL DEFAULT current timestamp,
	"org_contact_id"        	integer NULL,
	"deleted"       		timestamp NULL,
	"isActive"      		bit NOT NULL DEFAULT 1,
	"xml"   			long varchar NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."pub_org" ADD UNIQUE ( "pub_id", "org_id"
)
go
CREATE TABLE "DBA"."thes_original"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"de"    			varchar(100) NOT NULL,
	"use"   			varchar(100) NULL,
	"woo"   			varchar(1) NULL,
	"eq"    			varchar(100) NULL,
	"uf"    			long varchar NULL,
	"sn"    			long varchar NULL,
	"bt"    			varchar(100) NULL,
	"nt"    			long varchar NULL,
	"rt"    			varchar(150) NULL,
	"ca"    			varchar(50) NULL,
	"input" 			varchar(50) NULL,
	"act"   			varchar(10) NOT NULL,
	"msg"   			varchar(50) NULL,
	"cr"    			varchar(50) NULL,
	"up"    			varchar(50) NULL,
	"sort"  			varchar(100) NULL,
	"comments"      		long varchar NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."res_type"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"type"  			char(20) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."res_loc"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"location"      		char(20) NOT NULL,
	"topic" 			char(100) NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."res"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"type_id"       		integer NOT NULL,
	"loc_id"        		integer NOT NULL,
	"release_date"  		char(20) NULL,
	"name"  			char(255) NOT NULL,
	"note"  			char(50) NULL,
	"note_date"     		char(10) NULL,
	"added" 			timestamp NULL DEFAULT current timestamp,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."res_order"
(
	"id"    			integer NOT NULL,
	"res_id"        		integer NOT NULL,
	"order_date"    		date NULL,
	"order_number"  		integer NULL,
	"received_date" 		date NULL,
	"received_number"       	integer NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_res_rel"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"res_id"        		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."pub_list"
(
	"id"    			integer NOT NULL,
	"pub_type"      		char(4) NOT NULL,
	"title" 			char(255) NOT NULL,
	"price" 			money NOT NULL,
	"ph"    			money NOT NULL,
	"notes" 			long varchar NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."temp_name_1"
(
	"org_id"        		integer NOT NULL,
	"name"  			char(100) NOT NULL
)
go
CREATE TABLE "DBA"."temp_name_2"
(
	"org_id"        		integer NOT NULL,
	"name"  			char(100) NOT NULL,
	"type"  			integer NOT NULL
)
go
CREATE TABLE "DBA"."temp_name_3"
(
	"id"    			integer NOT NULL,
	"name"  			char(100) NOT NULL,
	"type"  			integer NOT NULL,
	"org1_id"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."thes_rel"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"thes_id"       		integer NOT NULL,
	"rel_id"        		integer NULL,
	"rel_type"      		char(2) NOT NULL,
	"ca"    			integer NULL,
	"sort_key"      		char(100) NULL,
	"comments"      		long varchar NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."temp_insert"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"str"   			char(10) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."temp_insert_rel"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"str_id"        		integer NOT NULL,
	"other_id"      		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_thes"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"thes_id"       		integer NOT NULL,
	"official_id"   		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."org_thes" ADD UNIQUE ( "org_id", "thes_id", "official_id"
)
go
CREATE TABLE "DBA"."temp_thes"
(
	"thes_id"       		integer NOT NULL,
	"de"    			char(100) NOT NULL,
	"sort"  			char(100) NOT NULL
)
go
CREATE TABLE "DBA"."pub_entry"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"pub_org_id"    		integer NOT NULL,
	"entry" 			integer NOT NULL,
	"pub_year"      		integer NOT NULL check(pub_year between 2000 and 2050),
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."pub_entry" ADD UNIQUE ( "pub_org_id", "pub_year"
)
go
CREATE TABLE "DBA"."area"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"name"  			char(255) NOT NULL,
	"locatedIn"     		integer NULL,
	"alt"   			char(255) NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_parent_child"
(
	"org_id"        		integer NOT NULL,
	"updated"       		timestamp NOT NULL DEFAULT current timestamp,
	"focus" 			integer NOT NULL DEFAULT 0 check(focus between 0 and 2),
	"eligibility"   		integer NOT NULL DEFAULT 0 check(eligibility between 0 and 3),
	"application"   		integer NOT NULL DEFAULT 0 check(application between 0 and 2),
	"programming"   		integer NOT NULL DEFAULT 0 check(programming between 0 and 1),
	PRIMARY KEY ("org_id")
)
go
CREATE TABLE "DBA"."parent_child_hours"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"day_int"       		integer NOT NULL check(day_int between 1 and 7),
	"time_range"    		char(25) NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."parent_child_hours" ADD UNIQUE ( "org_id", "day_int", "time_range"
)
go
CREATE TABLE "DBA"."taxonomy_original"
(
	"recordType"    		char(2) NOT NULL,
	"termCode"      		char(13) NOT NULL,
	"value" 			long varchar NOT NULL
)
go
CREATE TABLE "DBA"."taxonomy"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"name"  			char(100) NOT NULL,
	"code"  			char(19) NULL,
	"isPreferred"   		bit NOT NULL,
	"definition"    		long varchar NULL,
	"created"       		date NULL,
	"modified"      		date NULL,
	"parentId"      		integer NULL,
	"cicModified"   		timestamp NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."taxTree"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"taxID" 			integer NOT NULL,
	"level1"        		char(1) NOT NULL,
	"level2"        		char(1) NULL,
	"level3"        		integer NULL,
	"level4"        		integer NULL,
	"level5"        		integer NULL,
	"parentID"      		integer NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."taxRel"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"taxID" 			integer NOT NULL,
	"relID" 			integer NOT NULL,
	"relType"       		char(2) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_tax"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"orgID" 			integer NOT NULL,
	"taxID" 			integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."org_tax" ADD UNIQUE ( "orgID", "taxID"
)
go
CREATE TABLE "DBA"."tempSuffix"
(
	"suffix"        		char(255) NOT NULL,
	"suffix1"       		char(255) NOT NULL,
	"suffix2"       		char(255) NOT NULL
)
go
CREATE TABLE "DBA"."addressSuffix"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"suffix"        		char(20) NOT NULL,
	"sCP"   			char(10) NOT NULL,
	"sBell" 			char(2) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."addressUnit"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"unit"  			char(20) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."cura"
(
	"id"    			integer NOT NULL,
	"availability"  		integer NOT NULL,
	"catchment"     		integer NOT NULL,
	"Blu2001"       		integer NULL,
	"addressId"     		integer NOT NULL,
	"orgId" 			integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."curaTarget"
(
	"id"    			integer NOT NULL,
	"value" 			char(50) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."curaTargets"
(
	"id"    			integer NOT NULL,
	"curaId"        		integer NOT NULL,
	"targetId"      		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."curaCategory"
(
	"id"    			integer NOT NULL,
	"value" 			char(50) NOT NULL,
	"parentId"      		integer NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."curaCategories"
(
	"id"    			integer NOT NULL,
	"curaId"        		integer NOT NULL,
	"categoryId"    		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."curaCatchment"
(
	"id"    			integer NOT NULL,
	"value" 			char(50) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."curaAvailability"
(
	"id"    			integer NOT NULL,
	"value" 			char(50) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."tblProject"
(
	"project_id"    		integer NOT NULL DEFAULT autoincrement,
	"project_name"  		char(255) NOT NULL,
	"created"       		timestamp NOT NULL DEFAULT timestamp,
	"modified"      		timestamp NOT NULL DEFAULT current timestamp,
	"description"   		long varchar NULL,
	PRIMARY KEY ("project_id")
)
go

ALTER TABLE "DBA"."tblProject" ADD UNIQUE ( "project_id"
)
go

ALTER TABLE "DBA"."tblProject" ADD UNIQUE ( "project_name"
)
go
CREATE TABLE "DBA"."trelBroadcastProject"
(
	"project_id"    		integer NOT NULL,
	"org_id"        		integer NOT NULL,
	"broadcast_type_id"     	integer NOT NULL,
	"created"       		timestamp NOT NULL DEFAULT timestamp,
	"modified"      		timestamp NOT NULL DEFAULT current timestamp,
	PRIMARY KEY ("project_id", "org_id", "broadcast_type_id")
)
go
CREATE TABLE "DBA"."tlkpBroadcastType"
(
	"broadcast_type_id"     	integer NOT NULL DEFAULT autoincrement,
	"broadcast_type_name"   	char(255) NOT NULL,
	PRIMARY KEY ("broadcast_type_id")
)
go

ALTER TABLE "DBA"."tlkpBroadcastType" ADD UNIQUE ( "broadcast_type_name"
)
go
CREATE TABLE "DBA"."tblBroadcast"
(
	"broadcast_id"  		integer NOT NULL DEFAULT autoincrement,
	"broadcast_name"        	char(255) NOT NULL,
	"created"       		timestamp NOT NULL DEFAULT timestamp,
	"modified"      		timestamp NOT NULL DEFAULT current timestamp,
	"project_id"    		integer NOT NULL,
	"form_data"     		char(255) NULL,
	"form_confirm"  		char(255) NULL,
	"form_getemail" 		char(255) NULL,
	"form_header"   		char(255) NULL,
	"form_footer"   		char(255) NULL,
	"form_recdata"  		char(255) NULL,
	PRIMARY KEY ("broadcast_id")
)
go

ALTER TABLE "DBA"."tblBroadcast" ADD UNIQUE ( "broadcast_id"
)
go

ALTER TABLE "DBA"."tblBroadcast" ADD UNIQUE ( "broadcast_name", "project_id"
)
go
CREATE TABLE "DBA"."trelBroadcastRec"
(
	"broadcast_id"  		integer NOT NULL,
	"rec_id"        		integer NOT NULL,
	"status_id"     		integer NOT NULL,
	"created"       		timestamp NOT NULL DEFAULT timestamp,
	"modified"      		timestamp NOT NULL DEFAULT current timestamp,
	"email_to"      		long varchar NULL,
	"note"  			long varchar NULL,
	PRIMARY KEY ("broadcast_id", "rec_id")
)
go
CREATE TABLE "DBA"."tlkpBroadcastStatus"
(
	"status_id"     		integer NOT NULL DEFAULT autoincrement,
	"status_name"   		char(255) NOT NULL,
	PRIMARY KEY ("status_id")
)
go

ALTER TABLE "DBA"."tlkpBroadcastStatus" ADD UNIQUE ( "status_id"
)
go
CREATE TABLE "DBA"."locations"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"officialName"  		char(100) NOT NULL,
	"locatedIn"     		integer NULL,
	"sortAs"        		char(100) NULL,
	"displayAs"     		char(100) NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."log_level"
(
	"id"    			integer NOT NULL,
	"name"  			char(40) NOT NULL,
	"sort_id"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."log_level" ADD UNIQUE ( "id"
)
go

ALTER TABLE "DBA"."log_level" ADD UNIQUE ( "sort_id"
)
go
CREATE TABLE "DBA"."log_source"
(
	"id"    			integer NOT NULL,
	"name"  			char(25) NOT NULL,
	"sort_id"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."log_source" ADD UNIQUE ( "id"
)
go

ALTER TABLE "DBA"."log_source" ADD UNIQUE ( "sort_id"
)
go
CREATE TABLE "DBA"."log_contact"
(
	"id"    			integer NOT NULL,
	"name"  			char(40) NOT NULL,
	"sort_id"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."log_contact" ADD UNIQUE ( "id"
)
go

ALTER TABLE "DBA"."log_contact" ADD UNIQUE ( "sort_id"
)
go
CREATE TABLE "DBA"."log_age"
(
	"id"    			integer NOT NULL,
	"name"  			char(20) NOT NULL,
	"sort_id"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."log_age" ADD UNIQUE ( "sort_id"
)
go

ALTER TABLE "DBA"."log_age" ADD UNIQUE ( "id"
)
go
CREATE TABLE "DBA"."log_enq"
(
	"id"    			integer NOT NULL,
	"staff_id"      		integer NOT NULL,
	"enq_mode"      		integer NULL,
	"source"        		integer NULL,
	"areac" 			integer NULL,
	"age"   			integer NULL,
	"arean" 			integer NULL,
	"level" 			integer NULL,
	"contact"       		integer NULL,
	"need"  			integer NULL DEFAULT 12,
	"result"        		integer NULL,
	"enq_comment"   		long varchar NULL,
	"ts"    			timestamp NOT NULL DEFAULT current timestamp,
	"enq_resource"  		integer NULL,
	"enq_pc"        		char(7) NULL check(enq_pc like '[a-z][0-9][a-z]' or enq_pc like '[a-z][0-9][a-z] [0-9][a-z][0-9]'),
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."log_area_call"
(
	"id"    			integer NOT NULL,
	"name"  			char(15) NOT NULL,
	"sort_id"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."log_area_call" ADD UNIQUE ( "sort_id"
)
go

ALTER TABLE "DBA"."log_area_call" ADD UNIQUE ( "id"
)
go
CREATE TABLE "DBA"."log_area_need"
(
	"id"    			integer NOT NULL,
	"name"  			char(15) NOT NULL,
	"sort_id"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."log_area_need" ADD UNIQUE ( "sort_id"
)
go
CREATE TABLE "DBA"."log_enq_mode"
(
	"id"    			integer NOT NULL,
	"name"  			char(15) NOT NULL,
	"sort_id"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."log_enq_mode" ADD UNIQUE ( "id"
)
go

ALTER TABLE "DBA"."log_enq_mode" ADD UNIQUE ( "sort_id"
)
go
CREATE TABLE "DBA"."staff"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"first_name"    		char(15) NOT NULL,
	"last_name"     		char(20) NOT NULL,
	"status"        		integer NOT NULL DEFAULT '1',
	"password"      		char(8) NULL,
	"auth_db"       		integer NOT NULL,
	"auth_od"       		integer NOT NULL,
	"auth_in"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."staff" ADD UNIQUE ( "id"
)
go
CREATE TABLE "DBA"."DocInfo"
(
	"UNID"  			integer NOT NULL,
	"type"  			char(50) NULL,
	"LastEdit"      		timestamp NULL,
	"Status"        		char(10) NULL,
	"PublishedDate" 		timestamp NULL,
	"Notes" 			char(50) NULL,
	"XMLContent"    		long varchar NULL,
	"PageHeight"    		money NULL,
	"PageWidth"     		money NULL,
	"InsideMargin"  		money NULL,
	"OutSideMargin" 		money NULL,
	"TopMargin"     		money NULL,
	"BottomMargin"  		money NULL,
	PRIMARY KEY ("UNID")
)
go
CREATE TABLE "DBA"."NAMESDATA"
(
	"dKey"  			integer NOT NULL,
	"DBName"        		char(50) NULL,
	"DATA"  			char(10) NULL,
	"YEAR"  			char(10) NULL,
	"DATESTAMP"     		char(15) NULL,
	"REV"   			char(10) NULL,
	"XMLCONTENT"    		long varchar NULL,
	PRIMARY KEY ("dKey")
)
go
CREATE TABLE "DBA"."PAGESDATA"
(
	"dKey"  			integer NOT NULL,
	"DBName"        		char(50) NULL,
	"DATA"  			char(10) NULL,
	"YEAR"  			char(10) NULL,
	"DATESTAMP"     		char(15) NULL,
	"REV"   			char(10) NULL,
	"XMLCONTENT"    		long varchar NULL,
	PRIMARY KEY ("dKey")
)
go
CREATE TABLE "DBA"."SortHeadings"
(
	"dKey"  			smallint NOT NULL,
	"SortHead"      		char(1) NULL,
	PRIMARY KEY ("dKey")
)
go
CREATE TABLE "DBA"."SUBJECTDATA"
(
	"dKey"  			integer NOT NULL,
	"DBName"        		char(50) NULL,
	"DATA"  			char(10) NULL,
	"YEAR"  			char(10) NULL,
	"DATESTAMP"     		char(15) NULL,
	"REV"   			char(10) NULL,
	"XMLCONTENT"    		long varchar NULL,
	PRIMARY KEY ("dKey")
)
go
CREATE TABLE "DBA"."subjects"
(
	"dkey"  			integer NOT NULL,
	"XMLContent"    		long varchar NULL,
	PRIMARY KEY ("dkey")
)
go
CREATE TABLE "DBA"."TESTXML"
(
	"dKey"  			integer NOT NULL,
	"id"    			char(10) NULL,
	"TESTXML"       		long varchar NULL,
	PRIMARY KEY ("dKey")
)
go
CREATE TABLE "DBA"."XMLContent"
(
	"dKey"  			integer NOT NULL,
	"DBName"        		char(50) NULL,
	"DATA"  			char(10) NULL,
	"YEAR"  			char(10) NULL,
	"DATESTAMP"     		char(15) NULL,
	"REV"   			char(10) NULL,
	"PUBDATA"       		long varchar NULL,
	PRIMARY KEY ("dKey")
)
go
CREATE TABLE "DBA"."log_result"
(
	"id"    			integer NOT NULL,
	"name"  			char(30) NOT NULL,
	"sort_id"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."log_result" ADD UNIQUE ( "id"
)
go

ALTER TABLE "DBA"."log_result" ADD UNIQUE ( "sort_id"
)
go
CREATE TABLE "DBA"."log_need"
(
	"id"    			integer NOT NULL,
	"name"  			char(50) NOT NULL,
	"sort_id"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."log_need" ADD UNIQUE ( "id"
)
go

ALTER TABLE "DBA"."log_need" ADD UNIQUE ( "sort_id"
)
go
CREATE TABLE "DBA"."log_resource"
(
	"id"    			integer NOT NULL,
	"name"  			char(20) NOT NULL,
	"sort_id"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."log_resource" ADD UNIQUE ( "sort_id"
)
go
CREATE TABLE "DBA"."tempCIT"
(
	"cicId" 			varchar(7) NOT NULL,
	"pubCode"       		varchar(20) NOT NULL
)
go
CREATE TABLE "DBA"."pubGroupName"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"groupName"     		char(50) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."pubGroup"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"pubId" 			integer NOT NULL,
	"groupId"       		integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."pubGroup" ADD UNIQUE ( "pubId", "groupId"
)
go
CREATE TABLE "DBA"."tempGeo"
(
	"id"    			integer NOT NULL,
	"StreetAddr"    		long varchar NOT NULL,
	"City"  			long varchar NOT NULL,
	"Province"      		long binary NOT NULL,
	"UTM_X" 			integer NOT NULL,
	"UTM_Y" 			integer NOT NULL
)
go
CREATE TABLE "DBA"."orgNotes"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"orgId" 			integer NOT NULL,
	"noteType"      		integer NOT NULL,
	"note"  			long varchar NOT NULL,
	"added" 			timestamp NOT NULL DEFAULT current timestamp,
	"modified"      		timestamp NULL,
	"isactive"      		bit NOT NULL DEFAULT 1,
	"ispublic"      		bit NOT NULL DEFAULT 1,
	"alertDate"     		date NULL
)
go
CREATE TABLE "DBA"."orgNoteTypes"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"value" 			char(30) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."pubThes"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"pubId" 			integer NOT NULL,
	"thesId"        		integer NOT NULL,
	"isactive"      		bit NOT NULL DEFAULT 1,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."pubThes" ADD UNIQUE ( "id"
)
go
CREATE TABLE "DBA"."tempUTM"
(
	"ROLLNUM15"     		char(15) NOT NULL,
	"REFORMLOC"     		char(28) NULL,
	"PROPCODE"      		char(3) NULL,
	"FRONTAGEFT"    		decimal(20,5) NULL,
	"DEPTHFT"       		decimal(20,5) NULL,
	"ACRES" 			decimal(20,5) NULL,
	"ROLLCREATE"    		char(8) NULL,
	"RES_UNITS"     		decimal(20,5) NULL,
	"CURRENT"       		char(6) NULL,
	"CREATEDATE"    		char(8) NULL,
	"UTM_X" 			decimal(20,5) NULL,
	"UTM_Y" 			decimal(20,5) NULL
)
go

ALTER TABLE "DBA"."tempUTM" ADD UNIQUE ( "ROLLNUM15"
)
go
CREATE TABLE "DBA"."orgMod"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"columnId"      		integer NOT NULL,
	"oldValue"      		long varchar NULL,
	"newValue"      		long varchar NULL,
	"modified"      		timestamp NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."orgModColumns"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"columnName"    		char(50) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."og"
(
	"Item#" 			char(10) NULL,
	"Author"        		char(50) NULL,
	"Title" 			char(100) NULL,
	"Publisher"     		char(100) NULL,
	"Publication Year"      	char(4) NULL,
	"ISBN"  			char(14) NULL,
	"Cover" 			char(30) NULL,
	"Edition"       		char(50) NULL,
	"Pages" 			char(6) NULL,
	"Category"      		char(30) NULL,
	"Description"   		long varchar NULL,
	"Price" 			char(10) NULL,
	"Status"        		char(25) NULL,
	"Creation Date" 		char(10) NULL,
	"Graphic"       		char(20) NULL,
	"H"     			char(7) NULL,
	"W"     			char(7) NULL,
	"D"     			char(7) NULL,
	"Weight"        		char(7) NULL,
	"Notes" 			long varchar NULL,
	"Keys"  			long varchar NULL,
	"DJ"    			long varchar NULL
)
go
CREATE TABLE "DBA"."taxGroups"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"taxGroup"      		integer NOT NULL,
	"taxID" 			integer NOT NULL,
	"isActive"      		bit NOT NULL,
	"hasChildren"   		bit NOT NULL,
	"added" 			timestamp NULL DEFAULT current timestamp,
	"isLocal"       		bit NOT NULL DEFAULT 0,
	"modified"      		timestamp NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."temptaxgroup"
(
	"groupid"       		integer NOT NULL,
	"taxcode"       		char(13) NOT NULL
)
go
CREATE TABLE "DBA"."taxChanges"
(
	"changeType"    		integer NOT NULL,
	"oldCode"       		char(13) NOT NULL,
	"newCode"       		char(13) NOT NULL,
	"oldName"       		char(60) NOT NULL,
	"newName"       		char(60) NOT NULL,
	"dateUS"        		char(10) NOT NULL
)
go
CREATE TABLE "DBA"."tempContactComm"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"contactid"     		integer NOT NULL,
	"value" 			char(100) NOT NULL,
	"isfixed"       		bit NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."taxGroup"
(
	"id"    			integer NOT NULL,
	"name"  			char(50) NOT NULL,
	"notes" 			long varchar NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."orgUpdated"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"orgid" 			integer NOT NULL,
	"updated"       		timestamp NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."orgUpdated" ADD UNIQUE ( "orgid", "updated"
)
go
CREATE TABLE "DBA"."temp211"
(
	"num"   			char(7) NOT NULL
)
go
CREATE TABLE "DBA"."postalCodes"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"code"  			char(7) NOT NULL check(code like '[a-z][0-9][a-z] [0-9][a-z][0-9]' or code like '[a-z][0-9][a-z]'),
	"location"      		integer NOT NULL,
	"latitude"      		decimal(11,9) NULL,
	"longitude"     		decimal(11,9) NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."sqlXml"
(
	"id"    			integer NOT NULL,
	"note"  			char(100) NOT NULL,
	"fStr"  			long varchar NOT NULL,
	"pXml"  			long varchar NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."taxLink"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"linkId"        		integer NOT NULL,
	"taxId" 			integer NOT NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."taxLink" ADD UNIQUE ( "linkId", "taxId"
)
go
CREATE TABLE "DBA"."orgTaxLink"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"orgId" 			integer NOT NULL,
	"linkId"        		integer NOT NULL,
	"added" 			timestamp NULL DEFAULT current timestamp,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."orgTaxLink" ADD UNIQUE ( "orgId", "linkId"
)
go
CREATE TABLE "DBA"."taxLinkNote"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"note"  			long varchar NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."taxStartTemp"
(
	"active"        		char(1) NOT NULL,
	"code"  			char(19) NOT NULL
)
go
CREATE TABLE "DBA"."taxTemp"
(
	"name"  			char(100) NOT NULL,
	"code"  			char(19) NULL,
	"isPreferred"   		bit NOT NULL,
	"definition"    		long varchar NULL,
	"created"       		date NULL,
	"modified"      		date NULL,
	"parentCode"    		char(19) NULL
)
go
CREATE TABLE "DBA"."cioc"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"pid"   			integer NOT NULL,
	"ptype" 			integer NOT NULL,
	"xid"   			integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."ciocExport"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"updated"       		datetime NULL,
	"notes" 			long varchar NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."tempNO"
(
	"NO"    			char(7) NOT NULL,
	PRIMARY KEY ("NO")
)
go
CREATE TABLE "DBA"."taxRelTemp"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"taxCode"       		char(19) NOT NULL,
	"relCode"       		char(19) NOT NULL,
	"relType"       		char(2) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."taxTempOldCode"
(
	"code"  			char(19) NOT NULL,
	"oldCode"       		char(19) NOT NULL
)
go
CREATE TABLE "DBA"."taxonomy_copy"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"name"  			char(100) NOT NULL,
	"code"  			char(19) NULL,
	"isPreferred"   		bit NOT NULL,
	"definition"    		long varchar NULL,
	"modified"      		date NULL,
	"created"       		date NULL,
	"parentId"      		integer NULL,
	"cicModified"   		timestamp NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."funding"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"name"  			char(100) NOT NULL,
	"notes" 			long varchar NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."orgFunding"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"orgId" 			integer NOT NULL,
	"fundingId"     		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."tempTaxNames"
(
	"code"  			char(19) NOT NULL,
	"name"  			char(100) NOT NULL,
	"isPreferred"   		bit NOT NULL,
	"release"       		long varchar NULL
)
go
CREATE TABLE "DBA"."tempTaxAlso"
(
	"code"  			char(19) NOT NULL,
	"see"   			char(19) NOT NULL,
	"release"       		long varchar NULL
)
go
CREATE TABLE "DBA"."tempTaxOld"
(
	"code"  			char(19) NOT NULL,
	"old"   			char(19) NOT NULL,
	"release"       		long varchar NULL
)
go
CREATE TABLE "DBA"."tempTaxDetails"
(
	"code"  			char(19) NOT NULL,
	"definition"    		long varchar NOT NULL,
	"created"       		date NOT NULL,
	"modified"      		date NOT NULL,
	"release"       		long varchar NULL
)
go
CREATE TABLE "DBA"."isql"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"name"  			char(100) NOT NULL,
	"note"  			long varchar NULL,
	"query" 			long varchar NOT NULL,
	"parameters"    		char(100) NULL,
	"linkID"        		integer NULL,
	"created"       		timestamp NOT NULL DEFAULT current timestamp,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_location"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"name"  			varchar(100) NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_locations"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"location_id"   		integer NOT NULL,
	"address_id"    		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."pubTax"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"pubId" 			integer NOT NULL,
	"taxId" 			integer NOT NULL,
	"added" 			timestamp NOT NULL DEFAULT current timestamp,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."ic_agencies"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"orgid" 			integer NOT NULL,
	"CND"   			char(8) NULL,
	"name_1"        		char(100) NULL,
	"name_level_1"  		integer NULL,
	"name_2"        		char(100) NULL,
	"name_level_2"  		integer NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."ic_agencies" ADD UNIQUE ( "orgid"
)
go
CREATE TABLE "DBA"."ic_agency_sites"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"agencyid"      		integer NOT NULL,
	"siteid"        		integer NOT NULL,
	"CND"   			char(8) NULL,
	"site_name"     		char(200) NULL,
	"site_name_level"       	integer NULL,
	"site_name_other"       	char(3) NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."ic_site_services"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"siteid"        		integer NOT NULL,
	"serviceid"     		integer NOT NULL,
	"service_name_1"        	char(200) NULL,
	"service_name_2"        	char(200) NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."pub_tree"
(
	"id"    			integer NOT NULL,
	"parent"        		integer NOT NULL,
	"pub"   			integer NOT NULL,
	"note"  			long varchar NULL,
	"depth" 			integer NOT NULL,
	PRIMARY KEY ("id", "parent")
)
go
CREATE TABLE "DBA"."site"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_address_id"        	integer NOT NULL,
	"context_id"    		integer NOT NULL DEFAULT 1,
	"code"  			varchar(20) NULL,
	PRIMARY KEY ("id")
)
go

ALTER TABLE "DBA"."site" ADD UNIQUE ( "org_address_id"
)
go
CREATE TABLE "DBA"."org_tree"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"super_id"      		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_site"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_id"        		integer NOT NULL,
	"site_id"       		integer NOT NULL,
	"name"  			char(100) NULL,
	"note"  			long varchar NULL,
	"label" 			char(100) NULL,
	"type"  			integer NOT NULL DEFAULT 3,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_site_name"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_site_id"   		integer NOT NULL,
	"org_names_id"  		integer NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."org_thes_pub"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"org_thes_id"   		integer NOT NULL,
	"pub_id"        		integer NOT NULL,
	"is_active"     		bit NOT NULL DEFAULT 1,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."tempTaxActive"
(
	"code"  			char(25) NOT NULL
)
go
CREATE TABLE "DBA"."tempCCAC"
(
	"ext"   			varchar(10) NOT NULL,
	"id"    			varchar(10) NOT NULL,
	"name"  			varchar(200) NOT NULL
)
go
CREATE TABLE "DBA"."contact_comm"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"contact_id"    		integer NOT NULL,
	"comm_id"       		integer NOT NULL,
	"type"  			integer NULL,
	"note"  			varchar(50) NULL,
	"added" 			timestamp NOT NULL DEFAULT current timestamp,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."external"
(
	"id"    			integer NOT NULL DEFAULT autoincrement,
	"name"  			varchar(50) NOT NULL,
	"field" 			varchar(50) NOT NULL,
	"cic"   			varchar(50) NOT NULL,
	"note"  			long varchar NOT NULL,
	PRIMARY KEY ("id")
)
go
CREATE TABLE "DBA"."external_data"
(
	"id"    			integer NOT NULL,
	"external_type" 		integer NOT NULL,
	"cic_id"        		integer NOT NULL,
	"data"  			long varchar NOT NULL,
	"external_id"   		varchar(50) NOT NULL,
	PRIMARY KEY ("id")
)
go
commit work
go


-------------------------------------------------
--   Reload data
-------------------------------------------------

LOAD TABLE "DBA"."Data"
	FROM 'unload\\172.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."WebConnection"
	FROM 'unload\\173.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."WebDocumentType"
	FROM 'unload\\174.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."WebSynchronize"
	FROM 'unload\\175.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."WebTemplate"
	FROM 'unload\\176.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."WebData"
	FROM 'unload\\177.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."WebVersion"
	FROM 'unload\\178.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."thes"
	FROM 'unload\\179.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."thes_cat"
	FROM 'unload\\180.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."thes_tree"
	FROM 'unload\\181.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."thes_data"
	FROM 'unload\\182.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."StaffBook"
	FROM 'unload\\183.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."staff_calendar"
	FROM 'unload\\184.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."staff_group"
	FROM 'unload\\185.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."staff_hours"
	FROM 'unload\\186.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."city"
	FROM 'unload\\187.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pub"
	FROM 'unload\\188.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."thes_related"
	FROM 'unload\\189.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."blue_entry"
	FROM 'unload\\190.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."thes_reject"
	FROM 'unload\\191.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."thes_blue_entry"
	FROM 'unload\\192.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."thes_blue"
	FROM 'unload\\193.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."old_blue_entry"
	FROM 'unload\\194.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."thes_blue_related"
	FROM 'unload\\195.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."xref"
	FROM 'unload\\196.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."defunct"
	FROM 'unload\\197.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tlkpAddressType"
	FROM 'unload\\198.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tblAddress"
	FROM 'unload\\199.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tlkpAccessibility"
	FROM 'unload\\200.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."trelAddressAccessibility"
	FROM 'unload\\201.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tlkpCommType"
	FROM 'unload\\202.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tblComm"
	FROM 'unload\\203.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tblContact"
	FROM 'unload\\204.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tblService"
	FROM 'unload\\205.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tlkpLanguage"
	FROM 'unload\\206.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."trelServiceLanguage"
	FROM 'unload\\207.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tlkpArea"
	FROM 'unload\\208.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."trelServiceArea"
	FROM 'unload\\209.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tblOrgName"
	FROM 'unload\\210.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tlkpOrgNameType"
	FROM 'unload\\211.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."meta_word"
	FROM 'unload\\212.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."meta_column"
	FROM 'unload\\213.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_notes"
	FROM 'unload\\214.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."meta_index"
	FROM 'unload\\215.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."meta_group"
	FROM 'unload\\216.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."meta_column_group"
	FROM 'unload\\217.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_names"
	FROM 'unload\\218.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."meta_index_thes"
	FROM 'unload\\219.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org"
	FROM 'unload\\220.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_mod"
	FROM 'unload\\221.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_meta"
	FROM 'unload\\222.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."settle_thes"
	FROM 'unload\\223.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."settle_org"
	FROM 'unload\\224.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_comm_rel"
	FROM 'unload\\225.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_address_rel"
	FROM 'unload\\226.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_contact_rel"
	FROM 'unload\\227.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_rel_del"
	FROM 'unload\\228.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_service_rel"
	FROM 'unload\\229.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_del"
	FROM 'unload\\230.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pub_org"
	FROM 'unload\\231.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."thes_original"
	FROM 'unload\\232.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."res_type"
	FROM 'unload\\233.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."res_loc"
	FROM 'unload\\234.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."res"
	FROM 'unload\\235.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."res_order"
	FROM 'unload\\236.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_res_rel"
	FROM 'unload\\237.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pub_list"
	FROM 'unload\\238.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."temp_name_1"
	FROM 'unload\\239.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."temp_name_2"
	FROM 'unload\\240.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."temp_name_3"
	FROM 'unload\\241.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."thes_rel"
	FROM 'unload\\242.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."temp_insert"
	FROM 'unload\\243.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."temp_insert_rel"
	FROM 'unload\\244.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_thes"
	FROM 'unload\\245.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."temp_thes"
	FROM 'unload\\246.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pub_entry"
	FROM 'unload\\247.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."area"
	FROM 'unload\\248.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_parent_child"
	FROM 'unload\\249.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."parent_child_hours"
	FROM 'unload\\250.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxonomy_original"
	FROM 'unload\\251.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxonomy"
	FROM 'unload\\252.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxTree"
	FROM 'unload\\253.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxRel"
	FROM 'unload\\254.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_tax"
	FROM 'unload\\255.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tempSuffix"
	FROM 'unload\\256.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."addressSuffix"
	FROM 'unload\\257.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."addressUnit"
	FROM 'unload\\258.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."cura"
	FROM 'unload\\259.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."curaTarget"
	FROM 'unload\\260.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."curaTargets"
	FROM 'unload\\261.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."curaCategory"
	FROM 'unload\\262.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."curaCategories"
	FROM 'unload\\263.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."curaCatchment"
	FROM 'unload\\264.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."curaAvailability"
	FROM 'unload\\265.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tblProject"
	FROM 'unload\\266.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."trelBroadcastProject"
	FROM 'unload\\267.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tlkpBroadcastType"
	FROM 'unload\\268.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tblBroadcast"
	FROM 'unload\\269.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."trelBroadcastRec"
	FROM 'unload\\270.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tlkpBroadcastStatus"
	FROM 'unload\\271.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."locations"
	FROM 'unload\\272.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."log_level"
	FROM 'unload\\273.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."log_source"
	FROM 'unload\\274.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."log_contact"
	FROM 'unload\\275.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."log_age"
	FROM 'unload\\276.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."log_enq"
	FROM 'unload\\277.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."log_area_call"
	FROM 'unload\\278.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."log_area_need"
	FROM 'unload\\279.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."log_enq_mode"
	FROM 'unload\\280.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."staff"
	FROM 'unload\\281.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."DocInfo"
	FROM 'unload\\282.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."NAMESDATA"
	FROM 'unload\\283.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."PAGESDATA"
	FROM 'unload\\284.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."SortHeadings"
	FROM 'unload\\285.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."SUBJECTDATA"
	FROM 'unload\\286.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."subjects"
	FROM 'unload\\287.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."TESTXML"
	FROM 'unload\\288.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."XMLContent"
	FROM 'unload\\289.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."log_result"
	FROM 'unload\\290.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."log_need"
	FROM 'unload\\291.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."log_resource"
	FROM 'unload\\292.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tempCIT"
	FROM 'unload\\293.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pubGroupName"
	FROM 'unload\\294.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pubGroup"
	FROM 'unload\\295.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tempGeo"
	FROM 'unload\\296.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."orgNotes"
	FROM 'unload\\297.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."orgNoteTypes"
	FROM 'unload\\298.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pubThes"
	FROM 'unload\\299.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tempUTM"
	FROM 'unload\\300.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."orgMod"
	FROM 'unload\\338.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."orgModColumns"
	FROM 'unload\\339.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."og"
	FROM 'unload\\340.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxGroups"
	FROM 'unload\\341.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."temptaxgroup"
	FROM 'unload\\342.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxChanges"
	FROM 'unload\\343.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tempContactComm"
	FROM 'unload\\345.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxGroup"
	FROM 'unload\\349.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."orgUpdated"
	FROM 'unload\\350.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."temp211"
	FROM 'unload\\351.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."postalCodes"
	FROM 'unload\\352.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."sqlXml"
	FROM 'unload\\354.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxLink"
	FROM 'unload\\356.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."orgTaxLink"
	FROM 'unload\\357.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxLinkNote"
	FROM 'unload\\358.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxStartTemp"
	FROM 'unload\\359.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxTemp"
	FROM 'unload\\360.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."cioc"
	FROM 'unload\\361.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."ciocExport"
	FROM 'unload\\362.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tempNO"
	FROM 'unload\\363.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxRelTemp"
	FROM 'unload\\364.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxTempOldCode"
	FROM 'unload\\365.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."taxonomy_copy"
	FROM 'unload\\366.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."funding"
	FROM 'unload\\371.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."orgFunding"
	FROM 'unload\\372.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tempTaxNames"
	FROM 'unload\\374.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tempTaxAlso"
	FROM 'unload\\375.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tempTaxOld"
	FROM 'unload\\376.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tempTaxDetails"
	FROM 'unload\\377.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."isql"
	FROM 'unload\\378.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_location"
	FROM 'unload\\379.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_locations"
	FROM 'unload\\380.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pubTax"
	FROM 'unload\\381.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."ic_agencies"
	FROM 'unload\\382.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."ic_agency_sites"
	FROM 'unload\\383.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."ic_site_services"
	FROM 'unload\\384.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."pub_tree"
	FROM 'unload\\386.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."site"
	FROM 'unload\\387.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_tree"
	FROM 'unload\\390.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_site"
	FROM 'unload\\391.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_site_name"
	FROM 'unload\\392.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."org_thes_pub"
	FROM 'unload\\394.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tempTaxActive"
	FROM 'unload\\395.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."tempCCAC"
	FROM 'unload\\396.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."contact_comm"
	FROM 'unload\\398.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."external"
	FROM 'unload\\399.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
LOAD TABLE "DBA"."external_data"
	FROM 'unload\\400.dat'
	FORMAT 'ASCII'
	QUOTES ON ESCAPES ON STRIP OFF
	CHECK CONSTRAINTS OFF
	DELIMITED BY ','
go
commit work
go


-------------------------------------------------
--   Add foreign key definitions
-------------------------------------------------


CREATE INDEX "ByOrg" ON "DBA"."Data"
(
	"Org1" ASC,
	"Org2" ASC,
	"Org3" ASC,
	"Org4" ASC,
	"Org5" ASC
)
go

CREATE INDEX "ByContact" ON "DBA"."Data"
(
	"Contact1" ASC
)
go

CREATE INDEX "city" ON "DBA"."Data"
(
	"City" ASC
)
go
COMMENT ON INDEX "DBA"."city" IS
	'temporary'
go

CREATE INDEX "ByOrg5" ON "DBA"."Data"
(
	"Org5" ASC
)
go

CREATE INDEX "ByOrg4" ON "DBA"."Data"
(
	"Org4" ASC
)
go

CREATE INDEX "ByOrg3" ON "DBA"."Data"
(
	"Org3" ASC
)
go

CREATE INDEX "ByOrg2" ON "DBA"."Data"
(
	"Org2" ASC
)
go

ALTER TABLE "DBA"."WebTemplate"
	ADD FOREIGN KEY "WebConnection" ("ConnectionId") 
	REFERENCES "DBA"."WebConnection" ("Id")
go

ALTER TABLE "DBA"."WebTemplate"
	ADD FOREIGN KEY "WebDocumentType" ("DocType") 
	REFERENCES "DBA"."WebDocumentType" ("Id")
go

ALTER TABLE "DBA"."WebTemplate"
	ADD FOREIGN KEY "WebTemplate" ("ParentId") 
	REFERENCES "DBA"."WebTemplate" ("Id") on delete cascade
go

CREATE UNIQUE INDEX "NameInFolder" ON "DBA"."WebTemplate"
(
	"Name" ASC,
	"ParentId" ASC
)
go

ALTER TABLE "DBA"."WebData"
	ADD FOREIGN KEY "WebTemplate" ("Id") 
	REFERENCES "DBA"."WebTemplate" ("Id") on delete cascade
go

ALTER TABLE "DBA"."thes"
	ADD FOREIGN KEY "thes_cat" ("cat_id") 
	REFERENCES "DBA"."thes_cat" ("id")
go

CREATE INDEX "term" ON "DBA"."thes"
(
	"term" ASC
)
go

ALTER TABLE "DBA"."thes_tree"
	ADD FOREIGN KEY "parent" ("parent_id") 
	REFERENCES "DBA"."thes" ("id")
go

ALTER TABLE "DBA"."thes_data"
	ADD FOREIGN KEY "thes" ("thes_id") 
	REFERENCES "DBA"."thes" ("id")
go

ALTER TABLE "DBA"."thes_data"
	ADD FOREIGN KEY "org" ("data_id") 
	REFERENCES "DBA"."org" ("id")
go

CREATE INDEX "pub_title" ON "DBA"."pub"
(
	"title" ASC
)
go

ALTER TABLE "DBA"."thes_related"
	ADD FOREIGN KEY "related_term" ("related_id") 
	REFERENCES "DBA"."thes" ("id")
go

ALTER TABLE "DBA"."thes_related"
	ADD FOREIGN KEY "term" ("thes_id") 
	REFERENCES "DBA"."thes" ("id")
go

ALTER TABLE "DBA"."blue_entry"
	ADD FOREIGN KEY "Data" ("data_id") 
	REFERENCES "DBA"."Data" ("id")
go

ALTER TABLE "DBA"."thes_reject"
	ADD FOREIGN KEY "thes" ("thes_id") 
	REFERENCES "DBA"."thes" ("id")
go

ALTER TABLE "DBA"."thes_reject"
	ADD FOREIGN KEY "accept" ("accept_id") 
	REFERENCES "DBA"."thes" ("id")
go

ALTER TABLE "DBA"."thes_blue_entry"
	ADD FOREIGN KEY "thes" ("thes_id") 
	REFERENCES "DBA"."thes" ("id")
go

ALTER TABLE "DBA"."thes_blue"
	ADD FOREIGN KEY "thes" ("thes_id") 
	REFERENCES "DBA"."thes" ("id")
go

ALTER TABLE "DBA"."thes_blue_related"
	ADD FOREIGN KEY "thes" ("thes_blue_id") 
	REFERENCES "DBA"."thes" ("id")
go

ALTER TABLE "DBA"."thes_blue_related"
	ADD FOREIGN KEY "thes_blue" ("thes_blue_id") 
	REFERENCES "DBA"."thes_blue" ("thes_id")
go

ALTER TABLE "DBA"."thes_blue_related"
	ADD FOREIGN KEY "thes_blue_related" ("related_id") 
	REFERENCES "DBA"."thes_blue" ("thes_id")
go

ALTER TABLE "DBA"."thes_blue_related"
	ADD FOREIGN KEY "thes_related" ("related_id") 
	REFERENCES "DBA"."thes" ("id")
go

ALTER TABLE "DBA"."xref"
	ADD FOREIGN KEY "Data" ("data_id") 
	REFERENCES "DBA"."Data" ("id")
go

ALTER TABLE "DBA"."tblAddress"
	ADD FOREIGN KEY "tlkpAddressType" ("AddressTypeID") 
	REFERENCES "DBA"."tlkpAddressType" ("ID")
go

ALTER TABLE "DBA"."trelAddressAccessibility"
	ADD FOREIGN KEY "tlkpAccessibility" ("AccessibilityID") 
	REFERENCES "DBA"."tlkpAccessibility" ("ID")
go

ALTER TABLE "DBA"."trelAddressAccessibility"
	ADD FOREIGN KEY "tblAddress" ("AddressID") 
	REFERENCES "DBA"."tblAddress" ("ID")
go

ALTER TABLE "DBA"."tblComm"
	ADD FOREIGN KEY "tlkpCommType" ("CommTypeID") 
	REFERENCES "DBA"."tlkpCommType" ("ID")
go

CREATE INDEX "comm_value" ON "DBA"."tblComm"
(
	"Value" ASC
)
go

CREATE INDEX "contactType" ON "DBA"."tblContact"
(
	"ContactType" ASC
)
go

ALTER TABLE "DBA"."trelServiceLanguage"
	ADD FOREIGN KEY "tblService" ("ServiceID") 
	REFERENCES "DBA"."tblService" ("ID")
go

ALTER TABLE "DBA"."trelServiceLanguage"
	ADD FOREIGN KEY "tlkpLanguage" ("LanguageID") 
	REFERENCES "DBA"."tlkpLanguage" ("ID")
go

ALTER TABLE "DBA"."trelServiceArea"
	ADD FOREIGN KEY "tlkpArea" ("AreaID") 
	REFERENCES "DBA"."tlkpArea" ("ID")
go

ALTER TABLE "DBA"."trelServiceArea"
	ADD FOREIGN KEY "tblService" ("ServiceID") 
	REFERENCES "DBA"."tblService" ("ID")
go

ALTER TABLE "DBA"."tblOrgName"
	ADD FOREIGN KEY "tlkpOrgNameType" ("OrgNameTypeID") 
	REFERENCES "DBA"."tlkpOrgNameType" ("ID")
go

ALTER TABLE "DBA"."tblOrgName"
	ADD FOREIGN KEY "parent" ("ParentID") 
	REFERENCES "DBA"."tblOrgName" ("ID")
go

CREATE INDEX "sort" ON "DBA"."tblOrgName"
(
	"Sort" ASC
)
go

CREATE INDEX "name" ON "DBA"."tblOrgName"
(
	"Name" ASC
)
go

CREATE INDEX "name_key" ON "DBA"."tblOrgName"
(
	"sort_key" ASC
)
go

CREATE UNIQUE INDEX "word" ON "DBA"."meta_word"
(
	"word" ASC
)
go

ALTER TABLE "DBA"."meta_index"
	ADD FOREIGN KEY "meta_column" ("column_id") 
	REFERENCES "DBA"."meta_column" ("id")
go

ALTER TABLE "DBA"."meta_index"
	ADD FOREIGN KEY "meta_word" ("word_id") 
	REFERENCES "DBA"."meta_word" ("id")
go

CREATE INDEX "by_column_row" ON "DBA"."meta_index"
(
	"column_id" ASC,
	"row_id" ASC
)
go

CREATE INDEX "by_word_id" ON "DBA"."meta_index"
(
	"word_id" ASC,
	"id" ASC
)
go

ALTER TABLE "DBA"."meta_column_group"
	ADD FOREIGN KEY "meta_column" ("column_id") 
	REFERENCES "DBA"."meta_column" ("id")
go

ALTER TABLE "DBA"."meta_column_group"
	ADD FOREIGN KEY "meta_group" ("group_id") 
	REFERENCES "DBA"."meta_group" ("id")
go

ALTER TABLE "DBA"."org_names"
	ADD FOREIGN KEY "tblOrgName" ("org_name_id") 
	REFERENCES "DBA"."tblOrgName" ("ID")
go

ALTER TABLE "DBA"."org_names"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

CREATE INDEX "org_name_id" ON "DBA"."org_names"
(
	"org_name_id" ASC
)
go

CREATE INDEX "org_id" ON "DBA"."org_names"
(
	"org_id" ASC
)
go

CREATE INDEX "by_name_org" ON "DBA"."org_names"
(
	"org_name_id" ASC,
	"org_id" ASC
)
go

ALTER TABLE "DBA"."meta_index_thes"
	ADD FOREIGN KEY "meta_word" ("word_id") 
	REFERENCES "DBA"."meta_word" ("id")
go

ALTER TABLE "DBA"."meta_index_thes"
	ADD FOREIGN KEY "thes" ("row_id") 
	REFERENCES "DBA"."thes" ("id")
go

CREATE INDEX "by_word_thes" ON "DBA"."meta_index_thes"
(
	"word_id" ASC,
	"row_id" ASC
)
go

CREATE INDEX "by_thes_word" ON "DBA"."meta_index_thes"
(
	"row_id" ASC,
	"word_id" ASC
)
go

CREATE INDEX "by_word" ON "DBA"."meta_index_thes"
(
	"word_id" ASC
)
go

CREATE INDEX "by_thes" ON "DBA"."meta_index_thes"
(
	"row_id" ASC
)
go

ALTER TABLE "DBA"."org"
	ADD FOREIGN KEY "tblOrgName" ("org_name_id") 
	REFERENCES "DBA"."tblOrgName" ("ID")
go

CREATE INDEX "org_created" ON "DBA"."org"
(
	"created" ASC
)
go

CREATE INDEX "org_active" ON "DBA"."org"
(
	"isactive" ASC
)
go

CREATE INDEX "org_complete" ON "DBA"."org"
(
	"iscomplete" ASC
)
go

ALTER TABLE "DBA"."org_meta"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."org_meta"
	ADD FOREIGN KEY "meta_word" ("word_id") 
	REFERENCES "DBA"."meta_word" ("id")
go

ALTER TABLE "DBA"."org_meta"
	ADD FOREIGN KEY "meta_column" ("column_id") 
	REFERENCES "DBA"."meta_column" ("id")
go

CREATE INDEX "by_word_column_org" ON "DBA"."org_meta"
(
	"word_id" ASC,
	"column_id" ASC,
	"org_id" ASC
)
go

CREATE INDEX "by_word_org_column" ON "DBA"."org_meta"
(
	"word_id" ASC,
	"org_id" ASC,
	"column_id" ASC
)
go

ALTER TABLE "DBA"."settle_thes"
	ADD FOREIGN KEY "thes" ("thes_id") 
	REFERENCES "DBA"."thes" ("id")
go

ALTER TABLE "DBA"."settle_org"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."org_comm_rel"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."org_comm_rel"
	ADD FOREIGN KEY "tblComm" ("comm_id") 
	REFERENCES "DBA"."tblComm" ("ID")
go

ALTER TABLE "DBA"."org_address_rel"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."org_address_rel"
	ADD FOREIGN KEY "tblAddress" ("address_id") 
	REFERENCES "DBA"."tblAddress" ("ID")
go

ALTER TABLE "DBA"."org_contact_rel"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."org_contact_rel"
	ADD FOREIGN KEY "tblContact" ("contact_id") 
	REFERENCES "DBA"."tblContact" ("ID")
go

ALTER TABLE "DBA"."org_service_rel"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."org_service_rel"
	ADD FOREIGN KEY "tblService" ("service_id") 
	REFERENCES "DBA"."tblService" ("ID")
go

ALTER TABLE "DBA"."pub_org"
	ADD FOREIGN KEY "pub" ("pub_id") 
	REFERENCES "DBA"."pub" ("id")
go

ALTER TABLE "DBA"."pub_org"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."pub_org"
	ADD FOREIGN KEY "org_contact_rel" ("org_contact_id") 
	REFERENCES "DBA"."org_contact_rel" ("id") on delete set null
go

CREATE UNIQUE INDEX "de" ON "DBA"."thes_original"
(
	"de" ASC
)
go

CREATE UNIQUE INDEX "location" ON "DBA"."res_loc"
(
	"location" ASC
)
go

ALTER TABLE "DBA"."res"
	ADD FOREIGN KEY "res_loc" ("loc_id") 
	REFERENCES "DBA"."res_loc" ("id")
go

ALTER TABLE "DBA"."res"
	ADD FOREIGN KEY "res_type" ("type_id") 
	REFERENCES "DBA"."res_type" ("id")
go

CREATE INDEX "res_name" ON "DBA"."res"
(
	"name" ASC
)
go

ALTER TABLE "DBA"."res_order"
	ADD FOREIGN KEY "res" ("res_id") 
	REFERENCES "DBA"."res" ("id")
go

ALTER TABLE "DBA"."org_res_rel"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."org_res_rel"
	ADD FOREIGN KEY "res" ("res_id") 
	REFERENCES "DBA"."res" ("id")
go

ALTER TABLE "DBA"."temp_name_2"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id") on delete cascade
go

CREATE INDEX "name" ON "DBA"."temp_name_2"
(
	"name" ASC
)
go

ALTER TABLE "DBA"."thes_rel"
	ADD FOREIGN KEY "rel" ("rel_id") 
	REFERENCES "DBA"."thes_original" ("id")
go

ALTER TABLE "DBA"."thes_rel"
	ADD FOREIGN KEY "thes_cat" ("ca") 
	REFERENCES "DBA"."thes_cat" ("id")
go

ALTER TABLE "DBA"."thes_rel"
	ADD FOREIGN KEY "thes" ("thes_id") 
	REFERENCES "DBA"."thes_original" ("id")
go

CREATE INDEX "by_rel_type" ON "DBA"."thes_rel"
(
	"rel_type" ASC
)
go

ALTER TABLE "DBA"."temp_insert_rel"
	ADD FOREIGN KEY "temp_insert" ("str_id") 
	REFERENCES "DBA"."temp_insert" ("id")
go

ALTER TABLE "DBA"."org_thes"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."org_thes"
	ADD FOREIGN KEY "thes" ("thes_id") 
	REFERENCES "DBA"."thes_original" ("id")
go

ALTER TABLE "DBA"."org_thes"
	ADD FOREIGN KEY "official" ("official_id") 
	REFERENCES "DBA"."thes_original" ("id")
go

CREATE UNIQUE INDEX "orgThesOfficial" ON "DBA"."org_thes"
(
	"org_id" ASC,
	"thes_id" ASC,
	"official_id" ASC
)
go

ALTER TABLE "DBA"."pub_entry"
	ADD FOREIGN KEY "pub_org" ("pub_org_id") 
	REFERENCES "DBA"."pub_org" ("id")
go

CREATE INDEX "pubYearEntry" ON "DBA"."pub_entry"
(
	"pub_year" ASC,
	"entry" ASC
)
go

ALTER TABLE "DBA"."area"
	ADD FOREIGN KEY "located_in" ("locatedIn") 
	REFERENCES "DBA"."area" ("id")
go

CREATE UNIQUE INDEX "uniqueArea" ON "DBA"."area"
(
	"name" ASC,
	"locatedIn" ASC
)
go

ALTER TABLE "DBA"."org_parent_child"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id") on update cascade on delete cascade
go

ALTER TABLE "DBA"."parent_child_hours"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id") on update cascade on delete cascade
go

CREATE INDEX "taxCode" ON "DBA"."taxonomy_original"
(
	"termCode" ASC
)
go

ALTER TABLE "DBA"."taxonomy"
	ADD FOREIGN KEY "taxParent" ("parentId") 
	REFERENCES "DBA"."taxonomy" ("id")
go

CREATE UNIQUE INDEX "code" ON "DBA"."taxonomy"
(
	"code" ASC
)
go

CREATE INDEX "name" ON "DBA"."taxonomy"
(
	"name" ASC
)
go

CREATE INDEX "modified" ON "DBA"."taxonomy"
(
	"modified" ASC
)
go

CREATE UNIQUE INDEX "taxCode" ON "DBA"."taxTree"
(
	"level1" ASC,
	"level2" ASC,
	"level3" ASC,
	"level4" ASC,
	"level5" ASC
)
go

ALTER TABLE "DBA"."taxRel"
	ADD FOREIGN KEY "tax" ("taxID") 
	REFERENCES "DBA"."taxonomy" ("id")
go

ALTER TABLE "DBA"."taxRel"
	ADD FOREIGN KEY "rel" ("relID") 
	REFERENCES "DBA"."taxonomy" ("id")
go

CREATE UNIQUE INDEX "taxRel" ON "DBA"."taxRel"
(
	"taxID" ASC,
	"relID" ASC
)
go

ALTER TABLE "DBA"."org_tax"
	ADD FOREIGN KEY "org" ("orgID") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."cura"
	ADD FOREIGN KEY "curaAvailability" ("availability") 
	REFERENCES "DBA"."curaAvailability" ("id")
go

ALTER TABLE "DBA"."cura"
	ADD FOREIGN KEY "curaCatchment" ("catchment") 
	REFERENCES "DBA"."curaCatchment" ("id")
go

ALTER TABLE "DBA"."cura"
	ADD FOREIGN KEY "org" ("orgId") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."cura"
	ADD FOREIGN KEY "org_address_rel" ("addressId") 
	REFERENCES "DBA"."org_address_rel" ("id")
go

ALTER TABLE "DBA"."curaTargets"
	ADD FOREIGN KEY "cura" ("curaId") 
	REFERENCES "DBA"."cura" ("id")
go

ALTER TABLE "DBA"."curaTargets"
	ADD FOREIGN KEY "curaTarget" ("targetId") 
	REFERENCES "DBA"."curaTarget" ("id")
go

ALTER TABLE "DBA"."curaCategory"
	ADD FOREIGN KEY "curaCategory" ("parentId") 
	REFERENCES "DBA"."curaCategory" ("id")
go

ALTER TABLE "DBA"."curaCategories"
	ADD FOREIGN KEY "curaCategory" ("categoryId") 
	REFERENCES "DBA"."curaCategory" ("id")
go

ALTER TABLE "DBA"."curaCategories"
	ADD FOREIGN KEY "cura" ("curaId") 
	REFERENCES "DBA"."cura" ("id")
go

ALTER TABLE "DBA"."tblBroadcast"
	ADD FOREIGN KEY "project_id" ("project_id") 
	REFERENCES "DBA"."tblProject" ("project_id")
go

ALTER TABLE "DBA"."locations"
	ADD FOREIGN KEY "fkLocatedIn" ("locatedIn") 
	REFERENCES "DBA"."locations" ("id")
go

ALTER TABLE "DBA"."log_enq"
	ADD FOREIGN KEY "log_age" ("age") 
	REFERENCES "DBA"."log_age" ("id")
go

ALTER TABLE "DBA"."log_enq"
	ADD FOREIGN KEY "log_area_call" ("areac") 
	REFERENCES "DBA"."log_area_call" ("id")
go

ALTER TABLE "DBA"."log_enq"
	ADD FOREIGN KEY "log_area_need" ("arean") 
	REFERENCES "DBA"."log_area_need" ("id")
go

ALTER TABLE "DBA"."log_enq"
	ADD FOREIGN KEY "log_contact" ("contact") 
	REFERENCES "DBA"."log_contact" ("id")
go

ALTER TABLE "DBA"."log_enq"
	ADD FOREIGN KEY "log_enq_mode" ("enq_mode") 
	REFERENCES "DBA"."log_enq_mode" ("id")
go

ALTER TABLE "DBA"."log_enq"
	ADD FOREIGN KEY "log_level" ("level") 
	REFERENCES "DBA"."log_level" ("id")
go

ALTER TABLE "DBA"."log_enq"
	ADD FOREIGN KEY "log_need" ("need") 
	REFERENCES "DBA"."log_need" ("id")
go

ALTER TABLE "DBA"."log_enq"
	ADD FOREIGN KEY "log_resource" ("enq_resource") 
	REFERENCES "DBA"."log_resource" ("id")
go

ALTER TABLE "DBA"."log_enq"
	ADD FOREIGN KEY "log_result" ("result") 
	REFERENCES "DBA"."log_result" ("id")
go

ALTER TABLE "DBA"."log_enq"
	ADD FOREIGN KEY "log_source" ("source") 
	REFERENCES "DBA"."log_source" ("id")
go

ALTER TABLE "DBA"."staff"
	ADD FOREIGN KEY "staff_group" ("status") 
	REFERENCES "DBA"."staff_group" ("id")
go

CREATE INDEX "cicId" ON "DBA"."tempCIT"
(
	"cicId" ASC
)
go

CREATE INDEX "pubCode" ON "DBA"."tempCIT"
(
	"pubCode" ASC
)
go

ALTER TABLE "DBA"."pubGroup"
	ADD FOREIGN KEY "pubGroupName" ("groupId") 
	REFERENCES "DBA"."pubGroupName" ("id")
go

ALTER TABLE "DBA"."pubGroup"
	ADD FOREIGN KEY "pub" ("pubId") 
	REFERENCES "DBA"."pub" ("id")
go

CREATE INDEX "geo_id" ON "DBA"."tempGeo"
(
	"id" ASC
)
go

ALTER TABLE "DBA"."orgNotes"
	ADD FOREIGN KEY "org" ("orgId") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."orgNotes"
	ADD FOREIGN KEY "orgNoteTypes" ("noteType") 
	REFERENCES "DBA"."orgNoteTypes" ("id")
go

ALTER TABLE "DBA"."pubThes"
	ADD FOREIGN KEY "pub" ("pubId") 
	REFERENCES "DBA"."pub" ("id")
go

ALTER TABLE "DBA"."pubThes"
	ADD FOREIGN KEY "thes_original" ("thesId") 
	REFERENCES "DBA"."thes_original" ("id")
go

CREATE UNIQUE INDEX "pubThes" ON "DBA"."pubThes"
(
	"pubId" ASC,
	"thesId" ASC
)
go

ALTER TABLE "DBA"."orgMod"
	ADD FOREIGN KEY "orgModColumns" ("columnId") 
	REFERENCES "DBA"."orgModColumns" ("id")
go

ALTER TABLE "DBA"."taxGroups"
	ADD FOREIGN KEY "taxonomy" ("taxID") 
	REFERENCES "DBA"."taxonomy" ("id")
go

CREATE UNIQUE INDEX "grouptax" ON "DBA"."taxGroups"
(
	"taxGroup" ASC,
	"taxID" ASC
)
go

ALTER TABLE "DBA"."orgUpdated"
	ADD FOREIGN KEY "org" ("orgid") 
	REFERENCES "DBA"."org" ("id")
go

CREATE UNIQUE INDEX "num" ON "DBA"."temp211"
(
	"num" ASC
)
go

ALTER TABLE "DBA"."postalCodes"
	ADD FOREIGN KEY "locations" ("location") 
	REFERENCES "DBA"."locations" ("id")
go

ALTER TABLE "DBA"."taxLink"
	ADD FOREIGN KEY "taxonomy" ("taxId") 
	REFERENCES "DBA"."taxonomy" ("id")
go

ALTER TABLE "DBA"."taxLink"
	ADD FOREIGN KEY "taxLinkNote" ("linkId") 
	REFERENCES "DBA"."taxLinkNote" ("id") on delete cascade
go

ALTER TABLE "DBA"."orgTaxLink"
	ADD FOREIGN KEY "org" ("orgId") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."orgTaxLink"
	ADD FOREIGN KEY "taxLinkNote" ("linkId") 
	REFERENCES "DBA"."taxLinkNote" ("id") on delete cascade
go

CREATE INDEX "taxtempcode" ON "DBA"."taxTemp"
(
	"code" ASC
)
go

CREATE INDEX "taxtempparentcode" ON "DBA"."taxTemp"
(
	"parentCode" ASC
)
go

CREATE INDEX "taxtempmodified" ON "DBA"."taxTemp"
(
	"modified" ASC
)
go

CREATE INDEX "isPreferred" ON "DBA"."taxTemp"
(
	"isPreferred" ASC
)
go

ALTER TABLE "DBA"."cioc"
	ADD FOREIGN KEY "pub" ("pid") 
	REFERENCES "DBA"."pub" ("id")
go

ALTER TABLE "DBA"."cioc"
	ADD FOREIGN KEY "ciocExport" ("xid") 
	REFERENCES "DBA"."ciocExport" ("id")
go

CREATE UNIQUE INDEX "exportPubType" ON "DBA"."cioc"
(
	"xid" ASC,
	"ptype" ASC,
	"pid" ASC
)
go

CREATE INDEX "code" ON "DBA"."taxTempOldCode"
(
	"code" ASC
)
go

CREATE INDEX "oldCode" ON "DBA"."taxTempOldCode"
(
	"oldCode" ASC
)
go

ALTER TABLE "DBA"."orgFunding"
	ADD FOREIGN KEY "org" ("orgId") 
	REFERENCES "DBA"."org" ("id") on delete cascade
go

ALTER TABLE "DBA"."orgFunding"
	ADD FOREIGN KEY "funding" ("fundingId") 
	REFERENCES "DBA"."funding" ("id")
go

CREATE INDEX "tempTaxNameCode" ON "DBA"."tempTaxNames"
(
	"code" ASC
)
go

CREATE INDEX "tempTaxAlsoCode" ON "DBA"."tempTaxAlso"
(
	"code" ASC
)
go

CREATE INDEX "tempTaxAlso" ON "DBA"."tempTaxAlso"
(
	"see" ASC
)
go

CREATE INDEX "tempTaxOldCode" ON "DBA"."tempTaxOld"
(
	"code" ASC
)
go

CREATE INDEX "tempTaxOld" ON "DBA"."tempTaxOld"
(
	"old" ASC
)
go

CREATE INDEX "tempTaxDetailCode" ON "DBA"."tempTaxDetails"
(
	"code" ASC
)
go

ALTER TABLE "DBA"."isql"
	ADD FOREIGN KEY "isql" ("linkID") 
	REFERENCES "DBA"."isql" ("id")
go

ALTER TABLE "DBA"."org_location"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."org_locations"
	ADD FOREIGN KEY "org_location" ("location_id") 
	REFERENCES "DBA"."org_location" ("id")
go

ALTER TABLE "DBA"."org_locations"
	ADD FOREIGN KEY "tblAddress" ("address_id") 
	REFERENCES "DBA"."tblAddress" ("ID")
go

ALTER TABLE "DBA"."pubTax"
	ADD FOREIGN KEY "taxLinkNote" ("taxId") 
	REFERENCES "DBA"."taxLinkNote" ("id") on delete cascade
go

ALTER TABLE "DBA"."pubTax"
	ADD FOREIGN KEY "pub" ("pubId") 
	REFERENCES "DBA"."pub" ("id")
go

CREATE UNIQUE INDEX "pubtax" ON "DBA"."pubTax"
(
	"pubId" ASC,
	"taxId" ASC
)
go

ALTER TABLE "DBA"."ic_agencies"
	ADD FOREIGN KEY "org" ("orgid") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."ic_agency_sites"
	ADD FOREIGN KEY "ic_agencies" ("agencyid") 
	REFERENCES "DBA"."ic_agencies" ("id")
go

ALTER TABLE "DBA"."ic_agency_sites"
	ADD FOREIGN KEY "org" ("siteid") 
	REFERENCES "DBA"."org" ("id")
go

CREATE UNIQUE INDEX "agencysite" ON "DBA"."ic_agency_sites"
(
	"agencyid" ASC,
	"siteid" ASC
)
go

ALTER TABLE "DBA"."ic_site_services"
	ADD FOREIGN KEY "ic_agency_sites" ("siteid") 
	REFERENCES "DBA"."ic_agency_sites" ("id")
go

ALTER TABLE "DBA"."ic_site_services"
	ADD FOREIGN KEY "org" ("serviceid") 
	REFERENCES "DBA"."org" ("id")
go

CREATE UNIQUE INDEX "siteservice" ON "DBA"."ic_site_services"
(
	"siteid" ASC,
	"serviceid" ASC
)
go

ALTER TABLE "DBA"."pub_tree"
	ADD FOREIGN KEY "pub" ("pub") 
	REFERENCES "DBA"."pub" ("id")
go

CREATE INDEX "pub_tree_parent" ON "DBA"."pub_tree"
(
	"parent" ASC
)
go

CREATE INDEX "pub_tree_pub" ON "DBA"."pub_tree"
(
	"pub" ASC
)
go

CREATE INDEX "pub_tree_id" ON "DBA"."pub_tree"
(
	"id" ASC
)
go

ALTER TABLE "DBA"."site"
	ADD FOREIGN KEY "org_address_rel" ("org_address_id") 
	REFERENCES "DBA"."org_address_rel" ("id") on delete cascade
go

ALTER TABLE "DBA"."org_tree"
	ADD FOREIGN KEY "org_tree" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."org_tree"
	ADD FOREIGN KEY "org_tree_super" ("super_id") 
	REFERENCES "DBA"."org_tree" ("id")
go

ALTER TABLE "DBA"."org_site"
	ADD FOREIGN KEY "org" ("org_id") 
	REFERENCES "DBA"."org" ("id")
go

ALTER TABLE "DBA"."org_site"
	ADD FOREIGN KEY "site" ("site_id") 
	REFERENCES "DBA"."site" ("id")
go

CREATE UNIQUE INDEX "org_site_label" ON "DBA"."org_site"
(
	"org_id" ASC,
	"site_id" ASC,
	"label" ASC
)
go

ALTER TABLE "DBA"."org_site_name"
	ADD FOREIGN KEY "org_site" ("org_site_id") 
	REFERENCES "DBA"."org_site" ("id")
go

ALTER TABLE "DBA"."org_site_name"
	ADD FOREIGN KEY "org_names" ("org_names_id") 
	REFERENCES "DBA"."org_names" ("id")
go

ALTER TABLE "DBA"."org_thes_pub"
	ADD FOREIGN KEY "org_thes" ("org_thes_id") 
	REFERENCES "DBA"."org_thes" ("id") on delete cascade
go

ALTER TABLE "DBA"."org_thes_pub"
	ADD FOREIGN KEY "pub" ("pub_id") 
	REFERENCES "DBA"."pub" ("id") on delete cascade
go

CREATE UNIQUE INDEX "org_thes_pub" ON "DBA"."org_thes_pub"
(
	"org_thes_id" ASC,
	"pub_id" ASC
)
go

CREATE UNIQUE INDEX "activeCodes" ON "DBA"."tempTaxActive"
(
	"code" ASC
)
go

ALTER TABLE "DBA"."contact_comm"
	ADD FOREIGN KEY "tblComm" ("comm_id") 
	REFERENCES "DBA"."tblComm" ("ID")
go

ALTER TABLE "DBA"."contact_comm"
	ADD FOREIGN KEY "tblContact" ("contact_id") 
	REFERENCES "DBA"."tblContact" ("ID")
go

ALTER TABLE "DBA"."external_data"
	ADD FOREIGN KEY "external" ("external_type") 
	REFERENCES "DBA"."external" ("id")
go
commit work
go


-------------------------------------------------
--   Create functions
-------------------------------------------------

setuser "DBA" 
go

create function 
DBA.htmlStrong(in str long varchar)
returns long varchar
begin
  declare ret long varchar;
  return('<strong>' || str || '</strong>')
end
go

create function 
dba.cleanstring(in @strData long varchar)
returns long varchar
on exception resume
begin
  declare strCleanValue long varchar;
  declare strDelim char(20);
  declare curDelim char;
  declare nDelim integer;
  declare nOffset integer;
  --  message 'Starting cleanstring('+@strData+')';
  --  message 'strDelim = '+strDelim;
  set nDelim=1;
  set strCleanValue=@strData;
  set strDelim='@;:!()[]'+'",'+'Ý'+'|'+'\x0A';
  --  message 'set strDelim='+strDelim;
  while(nDelim < LENGTH(strDelim)) loop
    set curDelim=SUBSTR(strDelim,nDelim,1);
    --    message 'curDelim = '+curDelim;
    set nOffset=locate(strCleanValue,curDelim);
    --    message 'strCleanValue = '+strCleanValue;
    while(nOffset > 0) loop
      set strCleanValue="LEFT"(strCleanValue,nOffset-1)+' '+SUBSTR(strCleanValue,nOffset+1);
      --      message '  new strCleanValue = '+strCleanValue;
      set nOffset=locate(strCleanValue,curDelim)
    end loop;
    set nDelim=nDelim+1
  end loop;
  --  message 'strCleanValue = '+strCleanValue;
  return(strCleanValue)
end
go

create function 
dba.clnstring(in str long varchar)
returns long varchar
begin
  declare newstr long varchar;
  declare x integer;
  declare y integer;
  declare current_char integer;
  set newstr=str;
  set newstr=lcase(newstr);
  set newstr=trim(newstr);
  set x=1;
  set y=length(newstr);
  while x <= y loop
    set current_char=ascii(substr(newstr,x,1));
    if(current_char not between 97 and 122) and
      (current_char not between 48 and 57) then
      set newstr="left"(newstr,x-1)+' '+"right"(newstr,y-x)
    end if;
    set x=x+1
  end loop;
  set newstr=trim(newstr);
  return(newstr)
end
go
COMMENT ON PROCEDURE "DBA"."clnstring" IS
	'new version of CLEANSTRING, using ascii numbers'
go

create function 
DBA.url_googlemap(in in_address char(100),in in_city char(50),in in_province char(50),in in_postalcode char(7))
returns long varchar
begin
  declare ret long varchar;
  set ret='http://maps.google.ca/maps?q=' || 
    ifnull(nullif(in_address,''),'',url_escape(in_address) || ',+') || 
    url_escape(in_city) || '+' || url_escape(in_province) || '+' || url_escape(in_postalcode);
  return(ret)
end
go

create function 
dba.edb_f_org(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_item char(100);
  declare item_id integer;
  declare count_items integer;
  declare cur_item dynamic scroll cursor for select name from
      org_names key join tblorgname where
      orgnametypeid = 3 and org_id = org_id_in;
  declare err_notfound exception for sqlstate value '02000';
  set count_items=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_item;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if count_items > 0 then
      set items_out=items_out || '; '
    end if;
    set items_out=items_out || current_item;
    set count_items=count_items+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
dba.edb_toll_free(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_item char(255);
  declare item_id integer;
  declare count_items integer;
  declare cur_item dynamic scroll cursor for select c.value from
      org_comm_rel as o join tblcomm as c on o.comm_id = c.id where c.commtypeid = 1 and c.value like '1-%' and o.org_id = org_id_in;
  declare err_notfound exception for sqlstate value '02000';
  set count_items=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_item;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if count_items > 0 then
      set items_out=items_out || '; '
    end if;
    set items_out=items_out || current_item;
    set count_items=count_items+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
dba.blue_comm_type(in org_id_in integer,in type_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_item char(255);
  declare items_count integer;
  declare cur_item dynamic scroll cursor for select tblcomm.value from
      org_comm_rel key join tblcomm where org_id = org_id_in and tblcomm.commtypeid = type_in order by tblcomm.commtypeid asc;
  declare err_notfound exception for sqlstate value '02000';
  set items_out='';
  set items_count=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_item;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if items_count > 0 then
      set items_out=items_out || ' ~ '
    end if;
    set items_out=items_out || current_item;
    set items_count=items_count+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
DBA.cic_contact(in org_in integer)
returns long varchar
begin
  declare contact_out long varchar;
  declare current_name char(60);
  declare current_title char(120);
  declare current_org char(90);
  declare current_comm long varchar;
  declare current_bool integer;
  declare cur_contact dynamic scroll cursor for select name,title,org,comm from tblcontact key join org_contact_rel where org_contact_rel.org_id = org_in order by name asc;
  declare err_notfound exception for sqlstate value '02000';
  set contact_out='';
  set current_bool=0;
  open cur_contact;
  contact_loop: loop
    fetch next cur_contact into current_name,current_title,current_org,current_comm;
    if sqlstate = err_notfound then leave contact_loop
    end if;
    set contact_out=contact_out || '<small><strong>contact:</strong></small> ';
    if current_name is not null then set contact_out=contact_out || current_name;
      set current_bool=1
    end if;
    if current_title is not null then
      if current_bool = 1 then
        set contact_out=contact_out || ', '
      else set current_bool=1
      end if;
      set contact_out=contact_out || current_title
    end if;
    if current_org is not null then
      if current_bool = 1 then
        set contact_out=contact_out || ', '
      else set current_bool=1
      end if;
      set contact_out=contact_out || current_org
    end if;
    if current_comm is not null then set contact_out=contact_out || ' ' || current_comm
    end if;
    set contact_out=contact_out || '<br>';
    set current_bool=0
  end loop contact_loop;
  close cur_contact;
  return(contact_out)
end
go

create function 
DBA.org_name_full(in org_id_in integer)
returns long varchar
begin
  declare name_out long varchar;
  declare current_name char(100);
  declare count_names integer;
  declare cur_name dynamic scroll cursor for select name from
      tblorgname key join org_names where orgnametypeid = 1 and org_id = org_id_in order by
      level asc;
  declare err_notfound exception for sqlstate value '02000';
  set count_names=0;
  open cur_name;
  name_loop: loop
    fetch next cur_name into current_name;
    if sqlstate = err_notfound then leave name_loop
    end if;
    if count_names > 0 then
      set name_out=name_out || ', '
    end if;
    set name_out=name_out || current_name;
    set count_names=count_names+1
  end loop name_loop;
  close cur_name;
  return(name_out)
end
go

create function 
DBA.url_escape(in str long varchar)
returns long varchar
begin
  declare ret long varchar;
  declare x integer;
  declare y integer;
  declare current_char integer;
  set ret=str;
  set ret=trim(ret);
  set x=1;
  set y=length(ret);
  while x <= y loop
    set current_char=ascii(substr(ret,x,1));
    if current_char = 32 then
      set ret="left"(ret,x-1)+'+'+"right"(ret,y-x)
    elseif current_char = 39 then
      set ret="left"(ret,x-1)+"right"(ret,y-x);
      set y=y-1
    end if;
    set x=x+1
  end loop;
  set ret=trim(ret);
  return(ret)
end
go

create function 
DBA.edb_thes(in org integer)
returns long varchar
begin
  declare terms_out long varchar;
  declare current_term char(60);
  declare term_id integer;
  declare count_terms integer;
  declare cur_term dynamic scroll cursor for select isnull(thes.use,thes.de),thes.id from
      thes_original as thes key join org_thes as o where o.thes_id = o.official_id and o.org_id = org;
  declare err_notfound exception for sqlstate value '02000';
  set count_terms=0;
  open cur_term;
  accept_loop: loop
    fetch next cur_term into current_term,term_id;
    if sqlstate = err_notfound then leave accept_loop
    end if;
    if count_terms > 0 then
      set terms_out=terms_out || '; '
    end if;
    set terms_out=terms_out || current_term;
    set count_terms=count_terms+1
  end loop accept_loop;
  close cur_term;
  return(terms_out)
end
go

create function 
DBA.edb_uf(in org integer)
returns long varchar
begin
  declare terms_out long varchar;
  declare term_id integer;
  declare current_reject char(60);
  declare count_terms integer;
  declare cur_term dynamic scroll cursor for select thes.id from
      thes_original as thes key join org_thes where org_thes.thes_id = org_thes.official_id and org_id = org;
  declare cur_reject dynamic scroll cursor for select de from
      thes_original as rel key join thes_rel where rel_type = 'uf' and thes_id = term_id;
  declare err_notfound exception for sqlstate value '02000';
  set count_terms=0;
  open cur_term;
  accept_loop: loop
    fetch next cur_term into term_id;
    if sqlstate = err_notfound then leave accept_loop
    end if;
    open cur_reject;
    reject_loop: loop
      fetch next cur_reject into current_reject;
      if sqlstate = err_notfound then leave reject_loop
      end if;
      if count_terms > 0 then
        set terms_out=terms_out || '; '
      end if;
      set terms_out=terms_out || current_reject;
      set count_terms=count_terms+1
    end loop reject_loop;
    close cur_reject
  end loop accept_loop;
  close cur_term;
  return(terms_out)
end
go

create function 
dba.edb_alt_org(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_item char(100);
  declare item_id integer;
  declare count_items integer;
  declare cur_item dynamic scroll cursor for select name from
      org_names key join tblorgname where
      orgnametypeid in(2,6,4) and org_id = org_id_in;
  declare err_notfound exception for sqlstate value '02000';
  set count_items=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_item;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if count_items > 0 then
      set items_out=items_out || '; '
    end if;
    set items_out=items_out || current_item;
    set count_items=count_items+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
dba.apt_alt_org(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_item char(100);
  declare item_id integer;
  declare count_items integer;
  declare cur_item dynamic scroll cursor for select name from
      org_names key join tblorgname where
      orgnametypeid in(2,4,6) and org_id = org_id_in;
  declare err_notfound exception for sqlstate value '02000';
  set count_items=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_item;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if count_items > 0 then
      set items_out=items_out || '; '
    end if;
    set items_out=items_out || current_item;
    set count_items=count_items+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
dba.edb_comm(in org_id_in integer,in type_id integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_item char(255);
  declare item_id integer;
  declare count_items integer;
  declare cur_item dynamic scroll cursor for select c.value from
      org_comm_rel as o join tblcomm as c on o.comm_id = c.id where c.commtypeid = type_id and o.org_id = org_id_in;
  declare err_notfound exception for sqlstate value '02000';
  set count_items=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_item;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if count_items > 0 then
      set items_out=items_out || '; '
    end if;
    set items_out=items_out || current_item;
    set count_items=count_items+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
dba.edb_multi_generic(in str long varchar,in inDelimiter char(1),in outDelimiter char(5))
returns long varchar
begin
  declare newstr long varchar;
  declare x integer;
  declare y integer;
  declare current_char integer;
  declare oldDelimiter integer;
  declare newDelimiter char(5);
  set oldDelimiter=ascii(inDelimiter);
  set newDelimiter=outDelimiter;
  set newstr=str;
  set x=1;
  set y=length(newstr);
  while x <= y loop
    set current_char=ascii(substr(newstr,x,1));
    if current_char = oldDelimiter then
      set newstr="left"(newstr,x-1)+newDelimiter+"right"(newstr,y-x)
    end if;
    set x=x+1
  end loop;
  return(newstr)
end
go

create function 
dba.pub_comm(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_item char(255);
  declare current_type integer;
  declare type_token integer;
  declare type_out char(30);
  declare items_count integer;
  declare cur_item dynamic scroll cursor for select tblcomm.value,tblcomm.commtypeid from
      org_comm_rel key join tblcomm where org_id = org_id_in order by tblcomm.commtypeid asc;
  declare err_notfound exception for sqlstate value '02000';
  set type_token=0;
  set items_out='';
  set type_out='';
  set items_count=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_item,current_type;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if current_type <> type_token then
      if items_count > 0 then
        set items_out=items_out || '<br>'
      end if;
      case current_type
      when 1 then set type_out='<bold>Phone:</bold> '
      when 2 then set type_out='<bold>Crisis:</bold> '
      when 3 then set type_out='<bold>Modem:</bold> '
      when 4 then set type_out='<bold>Email:</bold> '
      when 5 then set type_out='<bold>Fax:</bold> '
      when 6 then set type_out='<bold>TTY:</bold> '
      when 7 then set type_out='<bold>WWW:</bold> '
      end case
    else
      set type_out=' ~ '
    end if;
    set items_out=items_out || type_out || current_item;
    set type_token=current_type;
    set items_count=items_count+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
dba.edb_multi_occ(in str long varchar)
returns long varchar
begin
  declare newstr long varchar;
  declare x integer;
  declare y integer;
  declare current_char integer;
  set newstr=str;
  set x=1;
  set y=length(newstr);
  while x <= y loop
    set current_char=ascii(substr(newstr,x,1));
    if current_char = 126 then
      set newstr="left"(newstr,x-1)+'*'+"right"(newstr,y-x)
    end if;
    set x=x+1
  end loop;
  return(newstr)
end
go

create function 
DBA.pub_contact(in org_in integer)
returns long varchar
begin
  declare contact_out long varchar;
  declare current_name char(60);
  declare current_title char(120);
  declare current_org char(90);
  declare current_comm long varchar;
  declare current_int integer;
  declare cur_contact dynamic scroll cursor for select name,title,org,comm from tblcontact key join org_contact_rel where org_contact_rel.org_id = org_in;
  declare err_notfound exception for sqlstate value '02000';
  set current_int=0;
  set contact_out='';
  open cur_contact;
  contact_loop: loop
    fetch next cur_contact into current_name,current_title,current_org,current_comm;
    if sqlstate = err_notfound then leave contact_loop
    end if;
    if current_int > 0 then set contact_out=contact_out || '<br>'
    end if;
    if current_name is not null then set contact_out=contact_out || current_name || ' '
    end if;
    if current_title is not null then set contact_out=contact_out || '<em>' || current_title || '</em> '
    end if;
    if current_org is not null then set contact_out=contact_out || '<bold>' || current_org || '</bold> '
    end if;
    if current_comm is not null then set contact_out=contact_out || current_comm
    end if;
    set current_int=current_int+1
  end loop contact_loop;
  close cur_contact;
  return(contact_out)
end
go

create function 
DBA.edb_settle_uf(in org_id integer)
returns long varchar
begin
  declare terms_out long varchar;
  declare term_id integer;
  declare current_reject char(60);
  declare count_terms integer;
  declare cur_term dynamic scroll cursor for select distinct thes.id from
      settle_thes key join thes key join thes_data where data_id = org_id;
  declare cur_reject dynamic scroll cursor for select term from
      thes as thes key join thes_reject where accept_id = term_id;
  declare err_notfound exception for sqlstate value '02000';
  set count_terms=0;
  open cur_term;
  accept_loop: loop
    fetch next cur_term into term_id;
    if sqlstate = err_notfound then leave accept_loop
    end if;
    open cur_reject;
    reject_loop: loop
      fetch next cur_reject into current_reject;
      if sqlstate = err_notfound then leave reject_loop
      end if;
      if count_terms > 0 then
        set terms_out=terms_out || '; '
      end if;
      set terms_out=terms_out || current_reject;
      set count_terms=count_terms+1
    end loop reject_loop;
    close cur_reject
  end loop accept_loop;
  close cur_term;
  return(terms_out)
end
go

create function 
dba.cic_comm(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_value char(255);
  declare current_type_id integer;
  declare current_type char(50);
  declare items_count integer;
  declare type_id integer;
  declare cur_item dynamic scroll cursor for select tlkpcommtype.id,tlkpcommtype.name,tblcomm.value from
      org_comm_rel key join tblcomm key join tlkpcommtype where
      org_id = org_id_in order by 1 asc;
  declare err_notfound exception for sqlstate value '02000';
  set items_out='';
  set items_count=0;
  set type_id=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_type_id,current_type,current_value;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if type_id <> current_type_id then
      if type_id > 0 then
        set items_out=items_out || '<br>'
      end if;
      set items_out=items_out || '<small><strong>' || lower(current_type) || ':</strong></small> ';
      set items_count=0;
      set type_id=current_type_id
    end if;
    if items_count > 0 then
      set items_out=items_out || ' ~ '
    end if;
    if type_id = 7 then
      set items_out=items_out || '<a href="http://' || current_value || '" target="out">' || current_value || '</a>'
    else
      set items_out=items_out || current_value
    end if;
    set items_count=items_count+1
  end loop item_loop;
  close cur_item;
  if items_out <> '' then
    set items_out=items_out || '<br>'
  end if;
  return(items_out)
end
go

create function 
dba.wp_comm(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_item char(255);
  declare current_type integer;
  declare type_token integer;
  declare type_out char(30);
  declare items_count integer;
  declare cur_item dynamic scroll cursor for select tblcomm.value,tblcomm.commtypeid from
      org_comm_rel key join tblcomm where org_id = org_id_in and commtypeid in(1,2,6) order by tblcomm.commtypeid asc;
  declare err_notfound exception for sqlstate value '02000';
  set type_token=0;
  set items_out='';
  set type_out='';
  set items_count=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_item,current_type;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if items_count > 0 then
      if current_type <> type_token then
        set items_out=items_out || '   ';
        case current_type
        when 1 then set type_out='<bold>Phone:</bold> '
        when 2 then set type_out='<bold>Crisis:</bold> '
        when 3 then set type_out='<bold>Modem:</bold> '
        when 4 then set type_out='<bold>Email:</bold> '
        when 5 then set type_out='<bold>Fax:</bold> '
        when 6 then set type_out='<bold>TTY:</bold> '
        end case
      else
        set type_out=' ~ '
      end if
    end if;
    set items_out=items_out || type_out || current_item;
    set type_token=current_type;
    set items_count=items_count+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
dba.wp_alt_org(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_item char(100);
  declare item_id integer;
  declare count_items integer;
  declare cur_item dynamic scroll cursor for select name from
      org_names key join tblorgname where
      orgnametypeid in(2,4,6) and org_id = org_id_in;
  declare err_notfound exception for sqlstate value '02000';
  set count_items=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_item;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if count_items > 0 then
      set items_out=items_out || ' ~ '
    end if;
    set items_out=items_out || current_item;
    set count_items=count_items+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
dba.bluComm(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_value char(255);
  declare current_type_id integer;
  declare current_type char(50);
  declare items_count integer;
  declare type_id integer;
  declare cur_item dynamic scroll cursor for select tlkpcommtype.id,tlkpcommtype.name,tblcomm.value from
      org_comm_rel key join tblcomm key join tlkpcommtype where
      org_id = org_id_in and tlkpcommtype.id in(1,2,4,5,6) order by 1 asc;
  declare err_notfound exception for sqlstate value '02000';
  set items_out='';
  set items_count=0;
  set type_id=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_type_id,current_type,current_value;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if type_id <> current_type_id then
      if type_id > 0 then
        set items_out=items_out || '&nbsp;&nbsp;'
      end if;
      if items_count > 0 then
        set items_out=items_out || '<b>' || current_type || ':</b> '
      end if;
      set items_count=0;
      set type_id=current_type_id
    end if;
    if items_count > 0 then
      set items_out=items_out || ' ~ '
    end if;
    if(current_type_id <> 4 and current_value not like '([1-9][0-9][0-9]) %' and current_value not like '1-%') then
      set current_value='519-' || current_value
    end if;
    set items_out=items_out || current_value;
    set items_count=items_count+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
dba.bluCommLabel(in org_id_in integer)
returns char(20)
begin
  declare labelOut char(20);
  select first tlkpcommtype.name into labelOut
    from org_comm_rel key join tblcomm key join tlkpcommtype where
    org_id = org_id_in order by tlkpcommtype.id asc;
  return(labelOut)
end
go

create function 
DBA.edb_settle_thes(in org_id integer)
returns long varchar
begin
  declare terms_out long varchar;
  declare current_term char(60);
  declare term_id integer;
  declare count_terms integer;
  declare cur_term dynamic scroll cursor for select min(term),thes.id from
      settle_thes key join thes key join thes_data where action = 'accept' and data_id = org_id group by thes.id;
  declare err_notfound exception for sqlstate value '02000';
  set count_terms=0;
  open cur_term;
  accept_loop: loop
    fetch next cur_term into current_term,term_id;
    if sqlstate = err_notfound then leave accept_loop
    end if;
    if count_terms > 0 then
      set terms_out=terms_out || '; '
    end if;
    set terms_out=terms_out || current_term;
    set count_terms=count_terms+1
  end loop accept_loop;
  close cur_term;
  return(terms_out)
end
go

create function 
dba.blue_comm(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_item char(255);
  declare current_type integer;
  declare type_token integer;
  declare type_out char(30);
  declare items_count integer;
  declare cur_item dynamic scroll cursor for select tblcomm.value,tblcomm.commtypeid from
      org_comm_rel key join tblcomm where org_id = org_id_in and tblcomm.commtypeid <> 7 order by tblcomm.commtypeid asc;
  declare err_notfound exception for sqlstate value '02000';
  set type_token=0;
  set items_out='';
  set type_out='';
  set items_count=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_item,current_type;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if items_count > 0 then
      if current_type <> type_token then
        set items_out=items_out || '   ';
        case current_type
        when 1 then set type_out='<bold>Phone:</bold> '
        when 2 then set type_out='<bold>Crisis:</bold> '
        when 3 then set type_out='<bold>Modem:</bold> '
        when 4 then set type_out='<bold>Email:</bold> '
        when 5 then set type_out='<bold>Fax:</bold> '
        when 6 then set type_out='<bold>TTY:</bold> '
        end case
      else
        set type_out=' ~ '
      end if
    end if;
    set items_out=items_out || type_out || current_item;
    set type_token=current_type;
    set items_count=items_count+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
DBA.htmlSmall(in str long varchar)
returns long varchar
begin
  declare ret long varchar;
  return('<small>' || str || '</small>')
end
go

create function 
DBA.url_mapquest(in in_address char(100),in in_city char(50),in in_postalcode char(7))
returns long varchar
begin
  declare ret long varchar;
  set ret='http://www.mapquest.com/maps/map.adp?countryid=41&amp;country=CA&amp;address=' || 
    ifnull(nullif(substring(in_address,1,4),'box '),'',url_escape(in_address)) || '&amp;city=' || 
    url_escape(in_city) || '&amp;state=on&amp;zipcode=' || 
    url_escape(in_postalcode);
  return(ret)
end
go

create function 
dba.urlSearchId(in orgIdInt integer)
returns long varchar
begin
  declare url long varchar;
  set url='<a href="http://192.168.0.128/temp/todd/new_search.ssc?act=view&view='+string(orgIdInt)+'">'+string(orgIdInt)+'</a>';
  return(url)
end
go

create function 
dba.orgNoteEnquiry(in org integer)
returns long varchar
begin
  declare noteStr long varchar;
  declare noteQry dynamic scroll cursor for select note || ' <small>' || ifnull(modified,"date"(added),"date"(modified)) || '</small>' from orgNotes where isactive = 1 and(noteType = 1 or ispublic = 1) and orgId = org order by added desc;
  declare err_notfound exception for sqlstate value '02000';
  declare currentNote long varchar;
  set noteStr='';
  open noteQry;
  noteLoop: loop
    fetch next noteQry into currentNote;
    if sqlstate = err_notfound then leave noteLoop
    end if;
    set noteStr=noteStr || '<p>' || currentNote || '</p>'
  end loop noteLoop;
  return(noteStr)
end
go

create function 
dba.cicCommHtml(in org_id_in integer,in type_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_value char(255);
  declare current_type_id integer;
  declare current_type char(50);
  declare items_count integer;
  declare type_id integer;
  declare cur_item dynamic scroll cursor for select tlkpcommtype.id,tlkpcommtype.name,tblcomm.value from
      org_comm_rel key join tblcomm key join tlkpcommtype where
      org_id = org_id_in and tlkpcommtype.id = type_in order by 1 asc;
  declare err_notfound exception for sqlstate value '02000';
  set items_out='';
  set items_count=0;
  set type_id=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_type_id,current_type,current_value;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if type_id <> current_type_id then
      if type_id > 0 then
        set items_out=items_out || '<br>'
      end if;
      set items_out=items_out || '<small><strong>' || lower(current_type) || ':</strong></small> ';
      set items_count=0;
      set type_id=current_type_id
    end if;
    if items_count > 0 then
      set items_out=items_out || ' ~ '
    end if;
    if type_id = 7 then
      set items_out=items_out || '<a href="http://' || current_value || '" target="out">' || current_value || '</a>'
    else
      set items_out=items_out || current_value
    end if;
    set items_count=items_count+1
  end loop item_loop;
  close cur_item;
  if items_out <> '' then
    set items_out=items_out || '<br>'
  end if;
  return(items_out)
end
go

create function 
dba.urlOrgName(in orgIdInt integer)
returns long varchar
begin
  declare url long varchar;
  set url='<a href="/cic/search.ssc?act=view&amp;view='+string(orgIdInt)+'">'+org_name_full(orgIdInt)+'</a>';
  return(url)
end
go

create function 
dba.cit_comm(in org_id_in integer,in type_id integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_item char(255);
  declare item_id integer;
  declare count_items integer;
  declare cur_item dynamic scroll cursor for select tblcomm.value from
      org_comm_rel key join tblcomm where tblcomm.commtypeid = type_id and org_id = org_id_in;
  declare err_notfound exception for sqlstate value '02000';
  set count_items=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_item;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if(current_item like '1-%' and type_id = 1) then
      set count_items=count_items-1
    else
      if count_items > 0 then
        set items_out=items_out || ' ; '
      end if;
      if(current_item like '([1-9][0-9][0-9]) %' or current_item like '1-%') then
        set items_out=items_out || current_item
      elseif current_item like '226-%' then
        set items_out=items_out || '(226) ' || substring(current_item,5)
      else
        set items_out=items_out || '(519) ' || current_item
      end if
    end if;
    set count_items=count_items+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
dba.addressStr(in addressId integer)
returns long varchar
begin
  declare retStr long varchar;
  select ifnull(unit,ifnull(unitValue,null,unitValue || '-'),null) || 
    ifnull(streetNumber,null,streetNumber || ' ') || 
    ifnull(address,null,address) || 
    ifnull(streetsuffix,null,' ' || streetsuffix) || 
    ifnull(streetDirection,null,' ' || streetDirection) || 
    ifnull(unit,null,', ' || unit || ' ' || unitValue) || 
    ifnull(unitExtra,null,', ' || unitExtra) || 
    ifnull(deliveryMode,null,ifnull(address,null,', ') || 
    deliveryMode || ' ' || deliveryNumber || 
    ifnull(deliveryStation,null,' ' || deliveryStation)) into retStr
    from
    tbladdress where tbladdress.id = addressId;
  return(retStr)
end
go
GRANT EXECUTE ON "DBA"."addressStr" TO "ever"
go

create function 
dba.commStr(in org_id_in integer,in type_id integer,in delimiter char(10))
returns long varchar
begin
  declare items_out long varchar;
  declare current_item char(255);
  declare item_id integer;
  declare count_items integer;
  declare cur_item dynamic scroll cursor for select tblcomm.value from
      org_comm_rel key join tblcomm where commtypeid = type_id and org_id = org_id_in;
  declare err_notfound exception for sqlstate value '02000';
  set count_items=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_item;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if count_items > 0 then
      set items_out=items_out || delimiter
    end if;
    set items_out=items_out || current_item;
    set count_items=count_items+1
  end loop item_loop;
  close cur_item;
  return(items_out)
end
go

create function 
dba.replaceStringOutput(in str long varchar,in inPattern char(100),in outPattern char(100))
returns long varchar
begin
  declare newStr long varchar;
  declare appendStr long varchar;
  declare tempStr long varchar;
  declare x integer;
  declare y integer;
  set appendStr=str;
  set newStr='';
  set y=length(inPattern);
  set x=charindex(inPattern,str);
  while x <> 0 loop
    set tempStr=substring(appendStr,1,x);
    set appendStr=substring(appendStr,x+y);
    set newStr=newStr+tempStr+outPattern;
    set x=charindex(inPattern,appendStr)
  end loop;
  set newStr=newStr+appendStr;
  return(newstr)
end
go

create function 
dba.lineBreaksToHTML(in str long varchar)
returns long varchar
begin
  declare newStr long varchar;
  declare appendStr long varchar;
  declare tempStr long varchar;
  declare x integer;
  set appendStr=str;
  set newStr='';
  set x=charindex('\x0A',str);
  while x <> 0 loop
    set tempStr=substring(appendStr,1,x);
    set appendStr=substring(appendStr,x+1);
    set newStr=newStr+tempStr+'<br>';
    set x=charindex('\x0A',appendStr)
  end loop;
  set newStr=newStr+appendStr;
  return(newstr)
end
go

create function 
dba.cic_commTest(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_value char(255);
  declare current_type_id integer;
  declare current_type char(50);
  declare items_count integer;
  declare type_id integer;
  declare cur_item dynamic scroll cursor for select tlkpcommtype.id,tlkpcommtype.name,tblcomm.value from
      org_comm_rel key join tblcomm key join tlkpcommtype where
      org_id = org_id_in order by 1 asc;
  declare err_notfound exception for sqlstate value '02000';
  set items_out='';
  set items_count=0;
  set type_id=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_type_id,current_type,current_value;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if type_id <> current_type_id then
      if type_id > 0 then
        set items_out=items_out || '<br>'
      end if;
      set items_out=items_out || '<small><strong>' || lower(current_type) || ':</strong></small> ';
      set items_count=0;
      set type_id=current_type_id
    end if;
    if items_count > 0 then
      set items_out=items_out || ' ~ '
    end if;
    if type_id = 7 then
      set items_out=items_out || '<a href="http://' || current_value || '" target="out">' || current_value || '</a>'
    else
      set items_out=items_out || current_value
    end if;
    set items_count=items_count+1
  end loop item_loop;
  close cur_item;
  if items_out <> '' then
    set items_out=items_out || '<br>'
  end if;
  return(items_out)
end
go

create function 
DBA.htmlP(in str long varchar)
returns long varchar
begin
  declare ret long varchar;
  return('<p>' || str || '</p>')
end
go

create function 
dba.orgDisplayContact(in orgId integer)
returns long varchar
begin
  declare retStr long varchar;
  select ifnull(mail.city,null,'<div><strong>address</strong></div>\x0A<p>\x0A') || 
    ifnull(mail.incareof,null,'c/o ' || mail.incareof || ', ') || 
    ifnull(mail.building,null,mail.building || ', ') || 
    ifnull(isnull(mail.address,mail.unitValue,mail.deliveryMode),null,addressStr(mail.id) || ', ') || 
    ifnull(mail.city,null,mail.city || ' ') || ifnull(mail.postalcode,'',mail.postalcode || ' <small><a ' || (case mail.ismappable when 1 then '' else 'class="caution" ' end) || 'href="javascript:map=open(''' || 
    ifnull(mail.latitude,
    url_googlemap(mapStr(mail.id),mail.city,mail.province,mail.postalcode),
    url_googlemap2(mail.latitude,mail.longitude,mapStr(mail.id),mail.city,mail.province,mail.postalcode,orgId)) || ''',''map'');map.focus();">map</a></small>') || 
    ifnull(mail.city,null,'</p>') || 
    ifnull(mail.intersection,null,'<div>intersection</div>\x0A<p>' || mail.intersection || '</p>\x0A') || 
    ifnull(access1.name,null,'<div>access</div>\x0A<p>' || access1.name || '</p>\x0A') || 
    ifnull(street.city,null,'<div><strong>location</strong></div>\x0A<p>') || 
    ifnull(street.building,null,street.building || ', ') || 
    ifnull(isnull(street.address,street.deliveryMode),null,addressStr(street.id) || ', ') || street.city || 
    ifnull(street.city,'',' <small><a ' || (case street.ismappable when 1 then '' else 'class="caution" ' end) || 'href="javascript:map=open(''' || 
    ifnull(street.latitude,
    url_googlemap(mapStr(street.id),street.city,street.province,street.postalcode),
    url_googlemap2(street.latitude,street.longitude,mapStr(street.id),street.city,street.province,street.postalcode,orgId)) || ''',''map'');map.focus();">map</a></small>') || 
    ifnull(street.city,null,'</p>\x0A') || 
    ifnull(street.intersection,null,'<div>intersection</div><p>' || street.intersection || '</p>') || 
    ifnull(access2.name,null,'<div>access</div>\x0A<p>' || access2.name || '</p>\x0A') || 
    cic_commTest2(org.id) || cic_contact2(org.id) into retStr
    from
    org left outer join(org_address_rel as omail key join(tbladdress as mail key left outer join(treladdressaccessibility as mailaccess key join tlkpaccessibility as access1)) on mail.addresstypeid = 1),
    org left outer join(org_address_rel as ostreet key join(tbladdress as street key left outer join(treladdressaccessibility as streetaccess key join tlkpaccessibility as access2)) on street.addresstypeid = 2) where
    org.id = orgId;
  return(retStr)
end
go

create function 
dba.orgDisplayService(in orgId integer)
returns long varchar
begin
  declare retStr long varchar;
  select ifnull(tblservice.eligibility,'','<div><strong>eligibility</strong></div>\x0A<p>' || tblservice.eligibility || '</p>\x0A') || 
    ifnull(tblservice.description,'','<div><strong>description</strong></div>\x0A<p>' || replaceStringOutput(tblservice.description,"char"(13) || "char"(10),'<br />') || '</p>\x0A') || 
    ifnull(tlkparea.name,'','<div>area served</div>\x0A<p>' || tlkparea.name || '</p>\x0A') || 
    ifnull(tblservice.application,'','<div>to apply</div>\x0A<p>' || tblservice.application || '</p>\x0A') || 
    ifnull(tblservice.hours,ifnull(tblservice.dates,'','<div>dates</div>\x0A<p>' || tblservice.dates || '</p>\x0A'),'<div>hours</div>\x0A<p>' || tblservice.hours || ifnull(tblservice.dates,'',' (' || tblservice.dates || ')') || '</p>\x0A') || 
    ifnull(tlkplanguage.name,'','<div>languages</div>\x0A<p>English ~ ' || tlkplanguage.name || '</p>\x0A') || 
    ifnull(tblservice.fees,'','<div>fees</div>\x0A<p>' || tblservice.fees || '</p>\x0A') || 
    ifnull(tblservice.info,'','<div>other info</div>\x0A<p>' || replaceStringOutput(tblservice.info,"char"(13) || "char"(10),'<br />') || '</p>\x0A') into retStr
    from
    org key join org_service_rel key join tblservice,
    tblservice key left outer join(trelservicearea key join tlkparea),
    tblservice key left outer join(trelservicelanguage key join tlkplanguage) where
    org.id = orgId;
  return(retStr)
end
go

create function 
dba.mapStr(in addressId integer)
returns long varchar
begin
  declare retStr long varchar;
  select ifnull(streetNumber,null,streetNumber || ' ') || 
    ifnull(address,null,address) || 
    ifnull(streetsuffix,null,' ' || streetsuffix) || 
    ifnull(streetDirection,null,' ' || streetDirection) into retStr
    from
    tbladdress where tbladdress.id = addressId;
  return(retStr)
end
go

create function 
dba.orgNote(in org integer,in showPrivate bit)
returns long varchar
begin
  declare noteStr long varchar;
  declare noteQry dynamic scroll cursor for select note || ' <small>' || "date"(added) || '</small>',ispublic from orgNotes where isactive = 1 and orgId = org order by added desc;
  declare err_notfound exception for sqlstate value '02000';
  declare currentNote long varchar;
  declare currentIsPublic bit;
  set noteStr='';
  open noteQry;
  noteLoop: loop
    fetch next noteQry into currentNote,currentIsPublic;
    if sqlstate = err_notfound then leave noteLoop
    end if;
    if currentIsPublic = 0 then
      if showPrivate = 1 then
        set noteStr=noteStr || '<p>' || currentNote || '</p>'
      end if
    else
      set noteStr=noteStr || '<p>' || currentNote || '</p>'
    end if
  end loop noteLoop;
  return(noteStr)
end
go

create function 
dba.cic_commTest2(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_value char(255);
  declare current_type_id integer;
  declare current_type char(50);
  declare items_count integer;
  declare type_id integer;
  declare cur_item dynamic scroll cursor for select tlkpcommtype.id,tlkpcommtype.name,tblcomm.value from
      org_comm_rel key join tblcomm key join tlkpcommtype where
      org_id = org_id_in order by 1 asc;
  declare err_notfound exception for sqlstate value '02000';
  set items_out='';
  set items_count=0;
  set type_id=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_type_id,current_type,current_value;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if type_id <> current_type_id then
      if type_id > 0 then
        set items_out=items_out || '</p>\x0A'
      end if;
      if current_type_id = 1 then
        set current_type='<strong>' || current_type || '</strong>'
      end if;
      set items_out=items_out || '<div>' || lower(current_type) || '</div>\x0A<p>';
      set items_count=0;
      set type_id=current_type_id
    end if;
    if items_count > 0 then
      set items_out=items_out || ' ~ '
    end if;
    if type_id = 7 then
      set items_out=items_out || '<a href="http://' || current_value || '" target="out">' || current_value || '</a>'
    else
      set items_out=items_out || current_value
    end if;
    set items_count=items_count+1
  end loop item_loop;
  close cur_item;
  if items_out <> '' then
    set items_out=items_out || '</p>\x0A'
  end if;
  return(items_out)
end
go

create function 
DBA.cic_contact2(in org_in integer)
returns long varchar
begin
  declare contact_out long varchar;
  declare current_name char(60);
  declare current_title char(120);
  declare current_org char(90);
  declare current_comm long varchar;
  declare current_bool integer;
  declare cur_contact dynamic scroll cursor for select name,title,org,comm from tblcontact key join org_contact_rel where org_contact_rel.org_id = org_in order by name asc;
  declare err_notfound exception for sqlstate value '02000';
  set contact_out='';
  set current_bool=0;
  open cur_contact;
  contact_loop: loop
    fetch next cur_contact into current_name,current_title,current_org,current_comm;
    if sqlstate = err_notfound then leave contact_loop
    end if;
    set contact_out=contact_out || '<div><strong>contact</strong></div>\x0A<p>';
    if current_name is not null then set contact_out=contact_out || current_name;
      set current_bool=1
    end if;
    if current_title is not null then
      if current_bool = 1 then
        set contact_out=contact_out || ', '
      else set current_bool=1
      end if;
      set contact_out=contact_out || current_title
    end if;
    if current_org is not null then
      if current_bool = 1 then
        set contact_out=contact_out || ', '
      else set current_bool=1
      end if;
      set contact_out=contact_out || current_org
    end if;
    if current_comm is not null then set contact_out=contact_out || ' ' || current_comm
    end if;
    set contact_out=contact_out || '</p>\x0A';
    set current_bool=0
  end loop contact_loop;
  close cur_contact;
  return(contact_out)
end
go

create function 
dba.streetStr(in addressId integer)
returns long varchar
begin
  declare retStr long varchar;
  select ifnull(address,null,address) || 
    ifnull(streetsuffix,null,' ' || streetsuffix) || 
    ifnull(streetDirection,null,' ' || streetDirection) into retStr
    from
    tbladdress where tbladdress.id = addressId;
  return(retStr)
end
go

create function 
dba.ccComm(in org_id_in integer)
returns long varchar
begin
  declare items_out long varchar;
  declare current_value char(255);
  declare current_type_id integer;
  declare current_type char(50);
  declare items_count integer;
  declare type_id integer;
  declare cur_item dynamic scroll cursor for select tlkpcommtype.id,tlkpcommtype.name,tblcomm.value from
      org_comm_rel key join tblcomm key join tlkpcommtype where
      org_id = org_id_in and tlkpcommtype.id in(1,2,4,5,6) order by 1 asc;
  declare err_notfound exception for sqlstate value '02000';
  declare phoneText char(50);
  set phoneText='519-579-3800 (CIC)';
  set items_out='';
  set items_count=0;
  set type_id=0;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_type_id,current_type,current_value;
    if sqlstate = err_notfound then leave item_loop
    end if;
    if type_id <> current_type_id then
      if type_id > 0 then
        set items_out=items_out || '&nbsp;&nbsp;'
      end if;
      if items_count > 0 then
        set items_out=items_out || current_type || ': '
      end if;
      if type_id = 0 and current_type_id > 1 then
        set items_out=phoneText || '&nbsp;&nbsp;' || current_type || ': '
      end if;
      set items_count=0;
      set type_id=current_type_id
    end if;
    if items_count > 0 then
      set items_out=items_out || ' ~ '
    end if;
    if(current_type_id <> 4 and current_value not like '([1-9][0-9][0-9]) %' and current_value not like '1-%' and current_value not like '226%') then
      set current_value='519-' || current_value
    end if;
    /*if current_type_id = 1 then
    set current_value='<b>' || current_value || '</b>'
    end if;*/
    set items_out=items_out || current_value;
    set items_count=items_count+1
  end loop item_loop;
  close cur_item;
  if type_id = 0 then
    set items_out=phoneText
  end if;
  return(items_out)
end
go

create function dba.countPattern(in str long varchar,in pattern char(50))
returns integer
begin
  declare x integer;
  declare y integer;
  set x=0;
  set y=charindex(pattern,str);
  while y > 0 loop
    set x=x+1;
    set str=substring(str,y+length(pattern));
    set y=charindex(pattern,str)
  end loop;
  return(x)
end
go

create function dba.locations_text(in org_id_in integer)
returns long varchar
begin
  declare output long varchar;
  declare cur_item dynamic scroll cursor for select oaddress.label as location,
      oaddress.note as note,
      ifnull(address.incareof,null,'c/o ' || address.incareof || ', ') || 
      ifnull(address.building,null,address.building || ', ') || 
      ifnull(
      isnull(address.address,address.unitValue,address.deliveryMode),null,
      addressStr(address.id) || ', ') || 
      ifnull(address.city,null,address.city || ' ') || 
      ifnull(address.postalcode,'',address.postalcode) as address from
      org key join
      org_address_rel as oaddress key join
      tbladdress as address where
      address.addresstypeid = 3 and
      org.id = org_id_in order by
      oaddress.label asc,
      address.city asc,
      isnull(address.building,address.address) asc;
  declare err_notfound exception for sqlstate value '02000';
  open cur_item;
  return(output)
end
go
COMMENT ON PROCEDURE "DBA"."locations_text" IS
	'List of locations for an org'
go

create function dba.zeroNull(in str char(9))
returns integer
begin
  declare ret integer;
  set ret=cast(str as integer);
  if ret = 0 then
    set ret=null
  end if;
  return(ret)
end
go

create function dba.xmlcsshead(in orgIdInt integer)
returns long varchar
begin
  declare headings long varchar;
  declare current_title char(120);
  declare heading dynamic scroll cursor for select title from pub_org as o key join pub where o.isactive = 1 and code like 'css.%' and o.org_id = orgIdInt order by title asc;
  declare err_notfound exception for sqlstate value '02000';
  set headings='';
  open heading;
  head_loop: loop
    fetch next heading into current_title;
    if sqlstate = err_notfound then leave head_loop
    end if;
    set headings=headings || '<heading>' || current_title || '</heading>'
  end loop head_loop;
  return(headings)
end
go

create function 
DBA.cic_contact3(in contactId integer)
returns long varchar
begin
  declare contact_out long varchar;
  declare current_name char(60);
  declare current_title char(120);
  declare current_org char(90);
  declare current_comm long varchar;
  declare current_bool integer;
  declare cur_contact dynamic scroll cursor for select name,title,org,comm from tblcontact where tblcontact.id = contactId;
  declare err_notfound exception for sqlstate value '02000';
  set contact_out='';
  set current_bool=0;
  open cur_contact;
  contact_loop: loop
    fetch next cur_contact into current_name,current_title,current_org,current_comm;
    if sqlstate = err_notfound then leave contact_loop
    end if;
    if current_name is not null then set contact_out=current_name;
      set current_bool=1
    end if;
    if current_title is not null then
      if current_bool = 1 then
        set contact_out=contact_out || ', '
      else set current_bool=1
      end if;
      set contact_out=contact_out || current_title
    end if;
    if current_org is not null then
      if current_bool = 1 then
        set contact_out=contact_out || ', '
      else set current_bool=1
      end if;
      set contact_out=contact_out || current_org
    end if;
    if current_comm is not null then set contact_out=contact_out || ' ' || current_comm
    end if;
    set current_bool=0
  end loop contact_loop;
  close cur_contact;
  return(contact_out)
end
go

create function 
dba.addressForGoogle(in addressId integer)
returns long varchar
begin
  declare retStr long varchar;
  select ifnull(streetNumber,null,streetNumber || ' ') || 
    ifnull(address,null,address) || 
    ifnull(streetsuffix,null,' ' || streetsuffix) || 
    ifnull(streetDirection,null,' ' || streetDirection) into retStr
    from
    tbladdress where tbladdress.id = addressId;
  return(retStr)
end
go

create function dba.taxBranch(in taxIn integer,in delimiter char(10))
returns long varchar
begin
  declare taxOut long varchar;
  declare taxParent integer;
  declare taxStr char(100);
  declare taxID integer;
  set taxOut='';
  set taxID=taxIn;
  taxLoop: loop
    select name,parentid into taxStr,taxParent from taxonomy where id = taxID;
    set taxOut=taxStr+delimiter+taxOut;
    if taxParent is null then leave taxLoop
    else set taxID=taxParent
    end if
  end loop taxLoop;
  return(taxOut)
end
go

create function 
DBA.url_googlemap2(in in_latitude decimal(11,9),in in_longitude decimal(11,9),in in_address char(100),in in_city char(50),in in_province char(50),in in_postalcode char(7),in in_orgId integer)
returns long varchar
begin
  declare ret long varchar;
  declare orgName long varchar;
  select org_name_full(in_orgId) into orgName from dummy;
  set ret='http://maps.google.ca/maps?q=' || 
    string(in_latitude) || ',+' || string(in_longitude) || '+(' || 
    url_escape(orgName) || ',+' || 
    ifnull(nullif(in_address,''),'',url_escape(in_address) || ',+') || 
    url_escape(in_city) || '+' || url_escape(in_province) || '+' || url_escape(in_postalcode) || ')';
  return(ret)
end
go
commit work
go


-------------------------------------------------
--   Create views
-------------------------------------------------


create view 
  dba.access_tlkpaddresstype(id,name)
  as select tlkpAddressType.ID,tlkpAddressType.Name from
    DBA.tlkpAddressType
go

create view 
  dba.access_tlkpcommtype(id,name)
  as select tlkpCommType.ID,tlkpCommType.Name from
    DBA.tlkpCommType
go

create view 
  dba.access_tlkpaccessibility(id,name)
  as select tlkpAccessibility.ID,tlkpAccessibility.Name from
    DBA.tlkpAccessibility
go

create view 
  dba.access_tlkparea(id,name)
  as select tlkpArea.ID,tlkpArea.Name from
    DBA.tlkpArea
go

create view 
  dba.access_tlkplanguage(id,name)
  as select tlkpLanguage.ID,tlkpLanguage.Name from
    DBA.tlkpLanguage
go

create view 
  dba.access_tlkporgnametype(id,type)
  as select tlkpOrgNameType.ID,tlkpOrgNameType.Type from
    DBA.tlkpOrgNameType
go

create view 
  dba.access_treladdressaccessibility(addressid,accessibilityid)
  as select trelAddressAccessibility.AddressID,trelAddressAccessibility.AccessibilityID from
    DBA.trelAddressAccessibility
go

create view 
  dba.access_trelorgcomm(orgid,commid)
  as select org_comm_rel.org_id,org_comm_rel.comm_id from
    DBA.org_comm_rel
go

create view 
  dba.access_trelorgcontact(orgid,contactid)
  as select org_contact_rel.org_id,org_contact_rel.contact_id from
    DBA.org_contact_rel
go

create view 
  dba.access_trelorgservice(orgid,serviceid)
  as select org_service_rel.org_id,org_service_rel.service_id from
    DBA.org_service_rel
go

create view 
  dba.access_trelservicearea(serviceid,areaid)
  as select trelServiceArea.ServiceID,trelServiceArea.AreaID from
    DBA.trelServiceArea
go

create view 
  dba.access_trelservicelanguage(serviceid,languageid)
  as select trelServiceLanguage.ServiceID,trelServiceLanguage.LanguageID from
    DBA.trelServiceLanguage
go

create view 
  DBA.access_trelorgcat(org_id,cat_id)
  as select org_id,thes_rel.ca from
    DBA.org_thes join DBA.thes_original as thes on
    org_thes.thes_id = thes.id and org_thes.thes_id = org_thes.official_id join
    DBA.thes_rel on thes.id = thes_rel.thes_id and rel_type = 'bt' where
    thes_rel.ca not in(5,11)
    group by thes_rel.ca,org_id
go

create view 
  DBA.access_tlkpcat(id,category)
  as select thes_cat.id,thes_cat.category from
    DBA.thes_cat where id not in(5,11)
go

create view 
  DBA.org_service(id,org_id,service_id,added,note,description,eligibility,info,fees,hours,dates,application,area,languages)
  as select org_service_rel.id,org.id,org_service_rel.service_id,org_service_rel.added,
    org_service_rel.note,tblService.Description,tblService.Eligibility,tblService.Info,tblService.Fees,
    tblService.Hours,tblService.Dates,tblService.Application,tlkpArea.Name,tlkpLanguage.Name from
    dba.org key join DBA.org_service_rel key join DBA.tblService,
    DBA.tblService key left outer join(DBA.trelservicelanguage key join DBA.tlkpLanguage),
    DBA.tblService key left outer join(DBA.trelservicearea key join DBA.tlkpArea)
go

create view 
  dba.org_name(id,org_id,name_id,name_type,name,parent_id,level,sort,sort_key)
  as select org_names.id,org.id,tblOrgName.ID,tlkporgnametype.type,tblOrgName.Name,
    tblOrgName.ParentID,tblOrgName.Level,tblOrgName.Sort,tblOrgName.sort_key from
    DBA.org key join dba.org_names key join DBA.tblOrgName key join dba.tlkporgnametype
go

create view 
  DBA.org_contact(id,org_id,contact_id,name,title,org,comm,note)
  as select org_contact_rel.id,org.id,org_contact_rel.contact_id,tblContact.Name,
    tblContact.Title,tblContact.Org,tblContact.Comm,org_contact_rel.note from
    dba.org key join DBA.org_contact_rel key join DBA.tblContact
go

create view 
  DBA.org_comm(id,org_id,comm_id,added,note,value,comm_ent,comm_type_id)
  as select org_comm_rel.id,org.id,org_comm_rel.comm_id,org_comm_rel.added,
    org_comm_rel.note,tblComm.Value,tblComm."Comment",tblComm.commtypeid from
    dba.org key join DBA.org_comm_rel key join DBA.tblComm
go

create view 
  DBA.org_address(id,org_id,address_id,added,note,c_o,building,address,city,province,postal_code,intersection,address_type)
  as select org_address_rel.id,org.id,org_address_rel.address_id,org_address_rel.added,
    org_address_rel.note,tblAddress.InCareOf,tblAddress.Building,addressStr(tblAddress.id),tblAddress.City,
    tblAddress.Province,tblAddress.PostalCode,tblAddress.Intersection,tlkpAddressType.Name from
    dba.org key join DBA.org_address_rel key join DBA.tblAddress key join DBA.tlkpAddressType
go

create view 
  dba.everOrg(id,sortKey,nameLevel,name1,name2,name3,name4,name5,serviceType,eligibility,
  description,areaServed,languages,application,hours,dates)
  as select org.id,
    sort.sort_key,
    sort.level,
    org1.name as name1,
    org2.name as name2,
    org3.name as name3,
    org4.name as name4,
    org5.name as name5,
    org.service_level,
    tblservice.eligibility,
    tblservice.description,
    tlkparea.name as areaServed,
    tlkplanguage.name as languages,
    tblservice.application,
    tblservice.hours,
    tblservice.dates from
    DBA.org key join DBA.tblorgname as sort,
    DBA.org key join DBA.org_names as on1 key join DBA.tblorgname as org1 on org1.level = 1 and org1.orgnametypeid = 1,
    DBA.org key left outer join(DBA.org_names as on2 key join DBA.tblorgname as org2 on org2.level = 2 and org2.orgnametypeid = 1),
    DBA.org key left outer join(DBA.org_names as on3 key join DBA.tblorgname as org3 on org3.level = 3 and org3.orgnametypeid = 1),
    DBA.org key left outer join(DBA.org_names as on4 key join DBA.tblorgname as org4 on org4.level = 4 and org4.orgnametypeid = 1),
    DBA.org key left outer join(DBA.org_names as on5 key join DBA.tblorgname as org5 on org5.level = 5 and org5.orgnametypeid = 1),
    DBA.org key join DBA.pub_org on pub_org.pub_id = 1,
    DBA.org key join DBA.org_service_rel key join DBA.tblservice,
    DBA.tblservice key left outer join(DBA.trelservicearea key join DBA.tlkparea),
    DBA.tblservice key left outer join(DBA.trelservicelanguage key join DBA.tlkplanguage) where
    org.iscomplete = 1 with check option
go
COMMENT ON VIEW "DBA"."everOrg" IS
	''
go
GRANT SELECT ON "DBA"."everOrg" TO "ever"
go

create view 
  DBA.everContact(id,orgId,name,title,org,comm)
  as select oc.id as id,
    oc.org_id as orgId,
    c.name as name,
    c.title as title,
    c.org as org,
    c.comm as comm from
    DBA.org_contact_rel as oc join DBA.tblcontact as c on oc.contact_id = c.id with check option
go
GRANT SELECT ON "DBA"."everContact" TO "ever"
go

create view 
  DBA.everComm(id,orgId,commType,commValue)
  as select oc.id as id,
    oc.org_id as orgId,
    c.commTypeId as commType,
    c.value as commValue from
    DBA.org_comm_rel as oc join
    DBA.tblcomm as c on oc.comm_id = c.id with check option
go
GRANT SELECT ON "DBA"."everComm" TO "ever"
go

create view 
  DBA.everAddressType(id,value)
  as select id,name from
    DBA.tlkpaddresstype
go
GRANT SELECT ON "DBA"."everAddressType" TO "ever"
go

create view 
  DBA.everCommType(id,value)
  as select id,name from
    DBA.tlkpcommType
go
GRANT SELECT ON "DBA"."everCommType" TO "ever"
go

create view 
  DBA.everPubOrgEntry(id,pubOrgId,pubYear,entry)
  as select id,pub_org_id,pub_year,entry from
    DBA.pub_entry with check option
go
GRANT SELECT ON "DBA"."everPubOrgEntry" TO "ever"
go

create view 
  DBA.everThesaurusRelation(id,thesaurusId,relatedId,relationType,category)
  as select id,thes_id,rel_id,rel_type,ca from
    DBA.thes_rel with check option
go
GRANT SELECT ON "DBA"."everThesaurusRelation" TO "ever"
go

create view 
  DBA.everThesaurus(id,term,isAccepted)
  as select id,de,
    (case act when 'Accept' then 1
    else 0
    end) as isAccepted from
    DBA.thes_original with check option
go
GRANT SELECT ON "DBA"."everThesaurus" TO "ever"
go

create view 
  DBA.everAddress(id,orgId,addressType,inCareOf,building,address,city,province,postalCode,intersection,access)
  as select oa.id as id,
    oa.org_id as orgId,
    a.AddressTypeID as addressType,
    a.InCareOf as inCareOf,
    a.Building as building,
    dba.addressStr(a.id) as address,
    a.City as city,
    a.Province as province,
    a.PostalCode as postalCode,
    a.Intersection as intersection,
    acc.name as access from
    DBA.org_address_rel as oa join
    DBA.tbladdress as a on oa.address_id = a.id left outer join(
    DBA.treladdressaccessibility as aa join
    DBA.tlkpaccessibility as acc on aa.accessibilityid = acc.id) on a.id = aa.addressid with check option
go
GRANT SELECT ON "DBA"."everAddress" TO "ever"
go

create view 
  DBA.everOrgThesaurus(id,orgId,thesaurusId)
  as select ot.id,ot.org_id,ot.thes_id from
    DBA.org_thes as ot key join dba.org key join dba.pub_org on pub_id = 1 with check option
go
GRANT SELECT ON "DBA"."everOrgThesaurus" TO "ever"
go

create view 
  DBA.everOrgName(id,orgId,nameId,name,nameType,sortKey)
  as select org_names.id,org_names.org_id,org_names.org_name_id,tblorgname.name,tblorgname.orgnametypeid,tblorgname.sort_key from
    dba.pub_org key join dba.org key join DBA.org_names key join DBA.tblorgname where
    pub_org.pub_id = 1
go
GRANT SELECT ON "DBA"."everOrgName" TO "ever"
go

create view 
  dba.access_tblcontact(id,name,title,org,comm)
  as select tblContact.ID,tblContact.Name,tblContact.Title,tblContact.Org,
    tblContact.Comm from
    DBA.tblContact key join DBA.org_contact_rel key join DBA.pub_org on pub_org.pub_id = 1 and pub_org.isactive = 1
go

create view 
  dba.access_tblorg(id,sortorder,name,level,name1,name2,name3,name4,name5,alt_names,levelofservice,keywords,access)
  as select org.id,
    sort.sort_key,
    sort.name,
    sort.level,
    org1.name as org_1,
    org2.name as org_2,
    org3.name as org_3,
    org4.name as org_4,
    org5.name as org_5,
    (select list(name) from dba.org_names key join dba.tblorgname where orgnametypeid in(2,3,4) and org_id = org.id),
    org.service_level,
    (select list(distinct word) from dba.org_meta key join dba.meta_word where column_id = 6 and org_id = org.id),0 from
    org key join DBA.tblorgname as sort,
    org key join DBA.org_names as on1 key join DBA.tblorgname as org1 on org1.level = 1 and org1.orgnametypeid = 1,
    org key left outer join(DBA.org_names as on2 key join DBA.tblorgname as org2 on org2.level = 2 and org2.orgnametypeid = 1),
    org key left outer join(DBA.org_names as on3 key join DBA.tblorgname as org3 on org3.level = 3 and org3.orgnametypeid = 1),
    org key left outer join(DBA.org_names as on4 key join DBA.tblorgname as org4 on org4.level = 4 and org4.orgnametypeid = 1),
    org key left outer join(DBA.org_names as on5 key join DBA.tblorgname as org5 on org5.level = 5 and org5.orgnametypeid = 1),
    dba.org key join dba.pub_org on pub_org.pub_id = 1 and pub_org.isactive = 1
go

create view 
  DBA.everPubOrg(id,pubId,orgId,contactId)
  as select id,pub_id,org_id,org_contact_id from
    DBA.pub_org where pub_id = 1 and isactive = 1 with check option
go
GRANT SELECT ON "DBA"."everPubOrg" TO "ever"
go

create view 
  dba.access_tblcomm(id,commtypeid,value,"comment")
  as select tblComm.ID,tblComm.CommTypeID,tblComm.Value,null from
    DBA.tblComm key join DBA.org_comm_rel key join DBA.access_tblorg
go

create view 
  dba.access_tblservice(id,description,eligibility,info,fees,hours,dates,application,access)
  as select tblService.ID,tblService.Description,
    tblService.Eligibility,tblService.Info,
    tblService.Fees,tblService.Hours,
    tblService.Dates,tblService.Application,null from
    DBA.tblService key join DBA.org_service_rel key join DBA.access_tblorg
go

create view 
  dba.access_tbladdress(id,addresstypeid,incareof,building,address,city,province,postalcode,intersection)
  as select tblAddress.ID,min(tblAddress.AddressTypeID),min(tblAddress.InCareOf),min(tblAddress.Building),min(addressStr(tblAddress.id)),
    min(tblAddress.City),min(tblAddress.Province),min(tblAddress.PostalCode),min(tblAddress.Intersection) from
    DBA.tblAddress key join DBA.org_address_rel key join DBA.access_tblorg
    group by tblAddress.ID
go

create view dba.eispub /* view column name,... */
  as select id,code,title from dba.pub where code like 'eis.%'
go

create view dba.eisorgpub
  as select org_id,pub_id from dba.pub_org key join DBA.eispub where pub_org.isactive = 1
go

create view dba.enquiries /* view column name,... */
  as select "date"(e.ts) as eDate,m.name as eMode,
    s.name as Source,ac.name as CallArea,an.name as NeedArea,a.name as Age,l.name as Level,r.name as Result,n.name as Need,
    (case when length(e.enq_pc) = 7 then upper(substring(e.enq_pc,1,3) || substring(e.enq_pc,5,3)) else upper(e.enq_pc) end) as PostalCode from
    log_enq as e join dba.log_source as s on e.source = s.id,
    log_enq as e join dba.log_area_call as ac on e.areac = ac.id,
    log_enq as e join dba.log_age as a on e.age = a.id,
    log_enq as e join dba.log_level as l on e.level = l.id,
    log_enq as e join dba.log_area_need as an on e.arean = an.id,
    log_enq as e join dba.log_result as r on e.result = r.id,
    log_enq as e join dba.log_need as n on e.need = n.id,
    dba.log_enq as e join dba.log_enq_mode as m on e.enq_mode = m.id where
    e.enq_mode < 20
go

create view dba.orgUp /* view column name,... */
  as select org.id,org.org_name_id,org.update_note,org.cic_id,
    org.updated,org.service_level,org.created,org.isactive,org.iscomplete,
    org.modified,org.established,org.bn,org.deleted from
    DBA.org where years(org.updated,2) > now(*)
go

create view dba.ciocStreet /* view column name,... */
  as select org.id,
    street.building as STBD,
    addressStr(street.id) as SADR,
    street.streetnumber as STNUM,
    street.address as ST,
    street.streetsuffix as STTYPE,
    street.streetdirection as STDIR,
    ifnull(street.unitvalue,null,ifnull(street.unit,'Unit ',street.unit || ' ') || street.unitvalue) as SFX,
    street.city as SCTY,
    street.postalcode as STPC,
    street.province as SPRV from
    org key left outer join(dba.org_address_rel as s key join dba.tbladdress as street key left outer join(
    dba.treladdressaccessibility as saa key join dba.tlkpaccessibility as sa)),
    dba.org left outer join(dba.org_address_rel as s2 key join dba.tbladdress as street2 on street2.addresstypeid = 2) where
    (street.addresstypeid = 2) or
    (street.addresstypeid = 1 and street2.city is null and street.ismappable = 1)
go

create view DBA.ciocMail /* view column name,... */
  as select org.id,
    mail.incareof as MCO,
    mail.building as BDG,
    addressStr(mail.id) as ADR,
    mail.deliverymode as MBXTP,
    mail.deliverynumber as MBOX,
    mail.streetnumber as MSTNUM,
    mail.address as MST,
    mail.streetsuffix as MSTTYPE,
    mail.streetdirection as MSTDIR,
    ifnull(mail.unitvalue,null,ifnull(mail.unit,'Unit ',mail.unit || ' ') || mail.unitvalue) as MSFX,
    mail.city as CTY,
    mail.province as PRV,
    mail.postalcode as PCD,
    ma.name as ACC,
    mail.intersection as "INT" from
    org key left outer join(DBA.org_address_rel as m key join DBA.tbladdress as mail on mail.addresstypeid = 1 key left outer join(
    DBA.treladdressaccessibility as maa key join DBA.tlkpaccessibility as ma)),
    DBA.org key left outer join(DBA.org_address_rel as s key join DBA.tbladdress as street on street.addresstypeid = 2 key left outer join(
    DBA.treladdressaccessibility as saa key join DBA.tlkpaccessibility as sa)) where
    mail.ismappable = 0 or mail.ismappable is null or street.city is not null
go

create view dba.tax211
  as select* from
    DBA.taxGroups where
    taxgroup = 4
go

create view dba.ciocOrgPub(orgid,orgactive,iscomplete,orgdeleted,modified,updated,pubtype,pubid,exportid,pubactive,pubdeleted)
  as select org.id as orgid,org.isactive as orgactive,org.iscomplete as iscomplete,
    org.deleted as orgdeleted,org.modified,org.updated,
    c.ptype as pubtype,c.pid as pubid,c.xid as exportid,
    p.isactive as pubactive,p.deleted as pubdeleted from
    dba.org key join dba.pub_org as p key join dba.pub key join dba.cioc as c
go

create view DBA.pub_tree_org(org,parent)
  as select o.id,
    pub_tree.parent from
    DBA.org as o key join
    DBA.pub_org as p key join
    DBA.pub key join
    DBA.pub_tree join
    DBA.pub_tree as parent on
    pub_tree.parent = parent.id and
    parent.depth = 1 where
    pub_tree.depth = 1
    group by o.id,
    pub_tree.parent
go

create view --SQL-1002-0297325153
  dba.site_org(site_id,
  org_id,
  cic_id,
  code,
  address_id,
  context_id,
  building,
  address,
  city,
  latitude,
  longitude,
  access)
  as select s.id,
    o.id,
    o.cic_id,
    s.code,
    o_a.id,
    s.context_id,
    a.building,
    addressStr(a.id),
    a.city,
    a.latitude,
    a.longitude,
    x.name from
    dba.org as o key join
    org_address_rel as o_a key join
    dba.tbladdress as a key left outer join(
    dba.treladdressaccessibility as a_x key join
    dba.tlkpaccessibility as x),
    dba.org_address_rel as o_a key join
    dba.site as s
go

create view --SQL-1007-0419250398
  dba.access_trelorgaddress(orgid,addressid) as
  select org_address_rel.org_id,org_address_rel.address_id from
    DBA.org_address_rel union
  select org_site.org_id,org_address_rel.address_id from
    dba.org_site key join dba.site key join dba.org_address_rel where
    org_site.type in(1,2)
go
commit work
go


-------------------------------------------------
--   Create user messages
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Create procedures
-------------------------------------------------

setuser "DBA" 
go

create procedure 
DBA.copyOrg(in orgIdIn integer,in nameIdIn integer default null,out orgIdOut integer)
begin
  declare copyLevel char(60);
  declare copyBN char(15);
  declare copyEstablished char(4);
  declare copyNameId integer;
  declare copyWRN char(7);
  declare newWRN integer;
  declare newOrgId integer;
  declare newAddressId integer;
  declare newCommId integer;
  declare newContactId integer;
  declare newPubId integer;
  declare newServiceId integer;
  declare newAreaId integer;
  declare newLanguageId integer;
  declare copyAddressId integer;
  declare copyCommId integer;
  declare copyContactId integer;
  declare copyPubId integer;
  declare copyAreaId integer;
  declare copyLanguageId integer;
  declare cursorAddress dynamic scroll cursor for select address_id from org_address_rel where org_id = orgIdIn;
  declare cursorComm dynamic scroll cursor for select comm_id from org_comm_rel where org_id = orgIdIn;
  declare cursorContact dynamic scroll cursor for select contact_id from org_contact_rel where org_id = orgIdIn;
  declare errorNotFound exception for sqlstate value '02000';
  select org_name_id,service_level,bn,established,cic_id into copyNameId,
    copyLevel,copyBN,copyEstablished,
    copyWRN from org where org.id = orgIdIn;
  select cast(substring(max(cic_id),4) as integer)+1 into newWRN from org;
  select areaid into copyAreaId from org_service_rel key join tblservice key join trelservicearea where org_id = orgIdIn;
  select languageid into copyLanguageId from org_service_rel key join tblservice key join trelservicelanguage where org_id = orgIdIn;
  select max(id)+1 into newOrgId from org;
  select max(id)+1 into newAddressId from tbladdress;
  select max(id)+1 into newCommId from tblcomm;
  select max(id)+1 into newContactId from tblcontact;
  select max(id)+1 into newPubId from org;
  select max(id)+1 into newServiceId from tblservice;
  select max(id)+1 into newAreaId from tlkparea;
  select max(id)+1 into newLanguageId from tlkplanguage;
  if nameIdIn is null then
    insert into org(id,cic_id,org_name_id,service_level,bn,established) values(
      newOrgId,'WRN' || newWRN,copyNameId,copyLevel,copyBN,copyEstablished)
  else
    insert into org(id,cic_id,org_name_id,service_level,bn,established) values(
      newOrgId,'WRN' || newWRN,nameIdIn,copyLevel,copyBN,copyEstablished)
  end if;
  insert into tblservice(id,description,eligibility,info,fees,hours,dates,application)
    select newServiceId,description,eligibility,info,fees,hours,dates,application from
      org_service_rel key join tblservice where org_id = orgIdIn;
  insert into org_service_rel(org_id,service_id) values(newOrgId,newServiceId);
  if copyAreaId is not null then
    insert into tlkparea(id,name)
      select newAreaId,name from tlkparea where id = copyAreaId;
    insert into trelservicearea(serviceid,areaid) values(newServiceId,newAreaId)
  end if;
  if copyLanguageId is not null then
    insert into tlkplanguage(id,name)
      select newLanguageId,name from tlkplanguage where id = copyLanguageId;
    insert into trelservicelanguage(serviceid,languageid) values(newServiceId,newLanguageId)
  end if;
  insert into orgNotes(orgId,ispublic,noteType,note) values(
    newOrgId,1,2,'Under construction');
  insert into orgNotes(orgId,ispublic,noteType,note,alertDate) values(
    newOrgId,0,2,'Copied from ' || copyWRN,"date"(now(*)));
  open cursorAddress;
  loopAddress: loop
    fetch next cursorAddress into copyAddressId;
    if sqlstate = errorNotFound then leave loopAddress
    end if;
    insert into tbladdress(id,
      addresstypeid,incareof,building,address,city,province,postalcode,intersection,
      unit,unitValue,unitExtra,streetNumber,streetSuffix,streetDirection,deliveryMode,
      deliveryNumber,deliveryStation,busRoute,ismappable,latitude,longitude)
      select newAddressId,addresstypeid,incareof,building,address,city,province,postalcode,intersection,
        unit,unitValue,unitExtra,streetNumber,streetSuffix,streetDirection,deliveryMode,deliveryNumber,deliveryStation,busRoute,ismappable,latitude,longitude from
        tbladdress where id = copyAddressId;
    insert into org_address_rel(address_id,org_id) values(newAddressId,newOrgId);
    insert into treladdressaccessibility(addressid,accessibilityid)
      select newAddressId,accessibilityid from treladdressaccessibility where addressid = copyAddressId;
    set newAddressId=newAddressId+1
  end loop loopAddress;
  close cursorAddress;
  open cursorComm;
  loopComm: loop
    fetch next cursorComm into copyCommId;
    if sqlstate = errorNotFound then leave loopComm
    end if;
    insert into tblComm(id,commtypeid,value)
      select newCommId,commtypeid,value from
        tblcomm where id = copyCommId;
    insert into org_comm_rel(comm_id,org_id) values(newCommId,newOrgId);
    set newCommId=newCommId+1
  end loop loopComm;
  close cursorComm;
  open cursorContact;
  loopContact: loop
    fetch next cursorContact into copyContactId;
    if sqlstate = errorNotFound then leave loopContact
    end if;
    insert into tblContact(ID,Name,Title,Org,Comm)
      select newContactId,Name,Title,Org,Comm from
        tblcontact where id = copyContactId;
    insert into org_contact_rel(contact_id,org_id) values(newContactId,newOrgId);
    set newContactId=newContactId+1
  end loop loopContact;
  close cursorContact;
  insert into pub_org(pub_id,org_id)
    select pub_id,newOrgId from pub_org as po where po.isactive = 1 and org_id = orgIdIn
--  insert into org_thes(org_id,thes_id,official_id)
--    select newOrgId,thes_id,official_id from org_thes where org_id = orgIdIn
end
go

create procedure 
dba.make_org_name_sort_key(in current_parent_id integer)
begin
  declare current_int integer;
  declare current_id integer;
  declare current_key char(100);
  declare err_not_found exception for sqlstate value '02000';
  declare cur_sort_key dynamic scroll cursor for select tblorgname.id,parent.sort_key from
      tblorgname key join tblorgname as parent where
      tblorgname.parentid = current_parent_id and tblorgname.orgnametypeid = 1 order by
      isnull(tblorgname.sort,tblorgname.name) asc;
  set current_int=0;
  open cur_sort_key;
  sort_key_loop: loop
    fetch next cur_sort_key into current_id,current_key;
    if sqlstate = err_not_found then leave sort_key_loop
    end if;
    update tblorgname set sort_key
       = string(current_key,substring('.000',1,5-length(current_int)),current_int) where
      id = current_id;
    set current_int=current_int+1
  end loop sort_key_loop;
  close cur_sort_key
end
go

create procedure 
DBA.new_org2(in name_in char(6),in level_in char(50),out ret_org integer)
/* create new org record with existing name */
begin
  declare new_cic_id integer;
  declare new_org_id integer;
  declare new_service_id integer;
  select cast(substring(max(cic_id),4) as integer)+1 into new_cic_id from org;
  select max(id)+1 into new_org_id from org;
  insert into org(id,cic_id,org_name_id,service_level) values(new_org_id,'WRN' || new_cic_id,name_in,level_in);
  select max(id)+1 into new_service_id from tblservice;
  insert into tblservice(id) values(new_service_id);
  insert into org_service_rel(org_id,service_id) values(new_org_id,new_service_id);
  set ret_org=new_org_id
end
go

create procedure 
DBA.new_org(in name_in char(100),in parent_in char(6),in level_in char(50),in sort_in char(100) default null,out ret_org integer)
/* create new org record with new name */
begin
  declare new_name_id integer;
  declare new_cic_id integer;
  declare new_org_id integer;
  declare new_service_id integer;
  select cast(substring(max(cic_id),4) as integer)+1 into new_cic_id from org;
  select max(id)+1 into new_name_id from tblorgname;
  insert into tblorgname(id,name,sort,orgnametypeid,parentid) values(
    new_name_id,name_in,nullif(trim(sort_in),''),1,ifnull(nullif(trim(parent_in),''),null,cast(parent_in as integer)));
  select max(id)+1 into new_org_id from org;
  insert into org(id,cic_id,org_name_id,service_level) values(new_org_id,'WRN' || new_cic_id,new_name_id,level_in);
  select max(id)+1 into new_service_id from tblservice;
  insert into tblservice(id) values(new_service_id);
  insert into org_service_rel(org_id,service_id) values(new_org_id,new_service_id);
  insert into orgNotes(orgId,ispublic,noteType,note,alertDate) values(
    new_org_id,1,2,'Under construction',"date"(now(*)));
  set ret_org=new_org_id
end
go

create procedure 
dba.make_org_name_sort_key_from_top()
begin
  declare current_int integer;
  declare current_id integer;
  declare current_key char(100);
  declare err_not_found exception for sqlstate value '02000';
  declare cur_sort_key dynamic scroll cursor for select tblorgname.id,'x' from
      tblorgname where
      tblorgname.parentid is null order by isnull(tblorgname.sort,tblorgname.name) asc;
  set current_int=0;
  open cur_sort_key;
  sort_key_loop: loop
    fetch next cur_sort_key into current_id,current_key;
    if sqlstate = err_not_found then leave sort_key_loop
    end if;
    update tblorgname set sort_key
       = string(current_key,substring('.000',1,5-length(current_int)),current_int) where
      id = current_id;
    set current_int=current_int+1
  end loop sort_key_loop;
  close cur_sort_key
end
go

create procedure 
dba.temp_in(in other_id_in integer,in str_in char(10))
begin
  declare new_id integer;
  insert into temp_insert(str) values(str_in);
  select @@identity into new_id;
  insert into temp_insert_rel(other_id,str_id) values(other_id_in,new_id)
end
go

create procedure 
dba.WebChanged as
begin
  update WebSynchronize set Revision = Revision+1 where
    TableName = 'WebTemplate'
end
go

create procedure 
dba.temp_org_meta()
begin
  declare current_org integer;
  declare current_thes long varchar;
  declare cur_item dynamic scroll cursor for select org_id,thes_id from org_thes;
  declare err_notfound exception for sqlstate value '02000';
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_org,current_thes;
    if sqlstate = err_notfound then leave item_loop
    end if;
    insert into org_meta select current_org,word_id,column_id,current_thes from meta_index where row_id = current_thes and column_id = 6
  end loop item_loop;
  close cur_item
end
go

create procedure 
DBA.replaceText(in tableName char(100),in columnName char(100),in oldValue char(100),in newValue char(100))
begin
  execute immediate 'update ' || tableName || ' set ' || columnName || ' = substring( ' || columnName || ', 1, charindex( ''' || oldValue || ''', ' || columnName || ')-1  ) + ''' || newValue || ''' + substring( ' || columnName || ' , charindex( ''' || oldValue || ''', ' || columnName || '  ) + length( ''' || oldValue || ''') ) where ' || columnName || ' like ''%' || oldValue || '%'''
end
go

create procedure 
dba.res_meta_index()
begin
  declare current_row integer;
  declare current_value long varchar;
  declare cur_item dynamic scroll cursor for select id,name from res;
  declare err_notfound exception for sqlstate value '02000';
  delete from meta_index where column_id = 7;
  delete from org_meta where column_id = 7;
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_row,current_value;
    if sqlstate = err_notfound then leave item_loop
    end if;
    call meta_index(7,current_row,current_value)
  end loop item_loop;
  close cur_item;
  insert into org_meta
    select org_id,word_id,column_id,res_id from
      org_res_rel join meta_index on res_id = row_id and column_id = 7
end
go

create procedure 
dba.WebCopyTemplate(@Id integer,@parentId integer) as
begin
  declare @newId integer
  insert into WebTemplate(ConnectionId,
    ParentId,DocType,Name,Location,Description,Size)
    select ConnectionId,@parentId,DocType,Name,Location,Description,Size from
      WebTemplate where Id = @Id
  select @newId=@@identity
  /* Copy the data */
  insert into WebData(Id,
    Sequence,Data)
    select @newId,Sequence,Data from WebData where
      Id = @Id
  declare children dynamic scroll cursor for select Id from WebTemplate where ParentId = @Id
  declare @child integer
  open children
  fetch next children into @child
  while(@@sqlstatus = 0) begin
      execute WebCopyTemplate @child,@newId
      fetch next children into @child
    end
  execute WebChanged
  /* Return the new id */
  select @Id=@newId
end
go

create procedure 
dba.meta_index(in this_column_id integer,in this_row integer,in this_column_value long varchar)
begin
  declare current_string long varchar;
  declare current_word long varchar;
  declare current_word_id integer;
  declare new_word_id integer;
  declare current_position integer;
  declare offset integer;
  set current_string=trim(clnstring(this_column_value));
  if length(current_string) > 0 then
    select max(id)+1 into new_word_id from meta_word;
    set current_position=1;
    set offset=locate(current_string,' ');
    while offset > 0 loop
      set current_word="left"(current_string,offset-1);
      set current_string=ltrim(substr(current_string,offset+1));
      select ifnull(max(id),0,max(id)) into current_word_id from meta_word where word = current_word;
      if current_word_id = 0 then
        insert into meta_word values(new_word_id,current_word);
        set current_word_id=new_word_id;
        set new_word_id=new_word_id+1
      end if;
      insert into meta_index(row_id,word_id,column_id,position) values(this_row,current_word_id,this_column_id,current_position);
      set current_position=current_position+1;
      set offset=locate(current_string,' ')
    end loop;
    set current_word=current_string;
    select ifnull(max(id),0,max(id)) into current_word_id from meta_word where word = current_word;
    if current_word_id = 0 then
      insert into meta_word values(new_word_id,current_word);
      set current_word_id=new_word_id
    end if;
    insert into meta_index(row_id,word_id,column_id,position) values(this_row,current_word_id,this_column_id,current_position)
  end if
end
go

create procedure 
dba.addressInsert(in addressType integer,in addressCareOf char(60),in addressBuilding char(50),in addressAddress char(50),in addressCity char(50),in addressProvince char(2),in addressPostalCode char(7),in addressIntersection char(255),in addressOrgId integer,in addressAccessId integer,in addressUnit char(10),in addressUnitValue char(10),in addressUnitExtra char(10),in addressNumber char(10),in addressSuffix char(10),in addressDirection char(2),in addressDelivery char(20),in addressDeliveryNumber char(10),in addressDeliveryStation char(20),in addressBusRoute char(50),in addressMappable bit,in addressLabel char(50),in addressNote char(100))
begin
  declare newAddressId integer;
  select max(id)+1 into newAddressId from tbladdress;
  insert into tbladdress(id,
    addresstypeid,incareof,building,address,city,province,postalcode,intersection,
    unit,unitValue,unitExtra,streetNumber,streetSuffix,streetDirection,deliveryMode,deliveryNumber,deliveryStation,busRoute,ismappable) values(
    newAddressId,
    addressType,
    ifnull(addressCareOf,null,trim(addressCareOf)),
    ifnull(addressBuilding,null,trim(addressBuilding)),
    ifnull(addressAddress,null,trim(addressAddress)),
    ifnull(addressCity,null,trim(addressCity)),
    ifnull(addressProvince,'ON',trim(addressProvince)),
    ifnull(addressPostalCode,null,trim(upper(addressPostalCode))),
    ifnull(addressIntersection,null,trim(addressIntersection)),
    ifnull(addressUnit,null,trim(addressUnit)),
    ifnull(addressUnitValue,null,trim(addressUnitValue)),
    ifnull(addressUnitExtra,null,trim(addressUnitExtra)),
    ifnull(addressNumber,null,trim(addressNumber)),
    ifnull(addressSuffix,null,trim(addressSuffix)),
    ifnull(addressDirection,null,trim(addressDirection)),
    ifnull(addressDelivery,null,trim(addressDelivery)),
    ifnull(addressDeliveryNumber,null,trim(addressDeliveryNumber)),
    ifnull(addressDeliveryStation,null,trim(addressDeliveryStation)),
    ifnull(addressBusRoute,null,trim(addressBusRoute)),
    addressMappable);
  insert into org_address_rel(org_id,address_id,added,label,note) values(
    addressOrgId,newAddressId,now(*),ifnull(addressLabel,null,trim(addressLabel)),ifnull(addressNote,null,trim(addressNote)));
  if addressAccessId <> 0 then
    insert into treladdressaccessibility(addressid,accessibilityid) values(
      newAddressId,addressAccessId)
  end if
end
go

create procedure 
dba.temp_meta_index()
begin
  declare current_row integer;
  declare current_value long varchar;
  declare cur_item dynamic scroll cursor for select id,de from thes_original;
  declare err_notfound exception for sqlstate value '02000';
  open cur_item;
  item_loop: loop
    fetch next cur_item into current_row,current_value;
    if sqlstate = err_notfound then leave item_loop
    end if;
    call meta_index(6,current_row,current_value)
  end loop item_loop;
  close cur_item
end
go

create procedure 
dba.orgAddressUpdate(in addressOrgId integer,in addressType integer,in addressCareOf char(60),in addressBuilding char(50),in addressUnit char(10),in addressUnitValue char(10),in addressUnitExtra char(10),in addressNumber char(10),in addressAddress char(50),in addressSuffix char(10),in addressDirection char(2),in addressDelivery char(20),in addressDeliveryNumber char(10),in addressDeliveryStation char(20),in addressCity char(50),in addressProvince char(2),in addressPostalCode char(7),in addressIntersection char(255),in addressBusRoute char(50),in addressAccessId integer)
begin
  update tbladdress as a set
    addresstypeid = addressType,
    incareof = ifnull(addressCareOf,null,trim(addressCareOf)),
    building = ifnull(addressBuilding,null,trim(addressBuilding)),
    unit = ifnull(addressUnit,null,trim(addressUnit)),
    unitValue = ifnull(addressUnitValue,null,trim(addressUnitValue)),
    unitExtra = ifnull(addressUnitExtra,null,trim(addressUnitExtra)),
    streetNumber = ifnull(addressNumber,null,trim(addressNumber)),
    address = ifnull(addressAddress,null,trim(addressAddress)),
    streetSuffix = ifnull(addressSuffix,null,trim(addressSuffix)),
    streetDirection = ifnull(addressDirection,null,trim(addressDirection)),
    deliveryMode = ifnull(addressDelivery,null,trim(addressDelivery)),
    deliveryNumber = ifnull(addressDeliveryNumber,null,trim(addressDeliveryNumber)),
    deliveryStation = ifnull(addressDeliveryStation,null,trim(addressDeliveryStation)),
    city = ifnull(addressCity,null,trim(addressCity)),
    province = ifnull(addressProvince,null,trim(addressProvince)),
    postalcode = ifnull(addressPostalCode,null,trim(addressPostalCode)),
    intersection = ifnull(addressIntersection,null,trim(addressIntersection)),
    busRoute = ifnull(addressBusRoute,null,trim(addressBusRoute)) from
    org_address_rel as o key join tbladdress as a where
    o.id = addressOrgId;
  delete from treladdressaccessibility from
    org_address_rel as o key join tbladdress key join treladdressaccessibility where
    o.id = addressOrgId;
  if addressAccessId <> 0 then
    insert into treladdressaccessibility(addressid,accessibilityid)
      select o.address_id,addressAccessId from
        org_address_rel as o where
        o.id = addressOrgId
  end if
end
go

create procedure 
DBA.orgModNow(in orgid integer)
begin
  update org set modified = now(*) where id = orgid
end
go

create procedure 
DBA.orgCommInsert(in orgId integer,in commValue char(255),in commType integer)
begin
  declare newCommId integer;
  select max(id)+1 into newCommId from tblcomm;
  insert into tblcomm(id,value,commtypeid) values(newCommid,trim(commValue),commType);
  insert into org_comm_rel(org_id,comm_id) values(orgId,newCommId)
end
go

create procedure 
dba.orgAddressInsert(in addressOrgId integer,in addressType integer,in addressCareOf char(60),in addressBuilding char(50),in addressUnit char(10),in addressUnitValue char(10),in addressUnitExtra char(10),in addressNumber char(10),in addressAddress char(50),in addressSuffix char(10),in addressDirection char(2),in addressDelivery char(20),in addressDeliveryNumber char(10),in addressDeliveryStation char(20),in addressCity char(50),in addressProvince char(2),in addressPostalCode char(7),in addressIntersection char(255),in addressBusRoute char(50),in addressAccessId integer)
begin
  declare newAddressId integer;
  select max(id)+1 into newAddressId from tbladdress;
  insert into tbladdress(id,
    addresstypeid,incareof,building,unit,unitValue,unitExtra,streetNumber,address,
    streetSuffix,streetDirection,deliveryMode,deliveryNumber,deliveryStation,
    city,province,postalcode,intersection,
    busRoute) values(
    newAddressId,
    addressType,
    ifnull(addressCareOf,null,trim(addressCareOf)),
    ifnull(addressBuilding,null,trim(addressBuilding)),
    ifnull(addressUnit,null,trim(addressUnit)),
    ifnull(addressUnitValue,null,trim(addressUnitValue)),
    ifnull(addressUnitExtra,null,trim(addressUnitExtra)),
    ifnull(addressNumber,null,trim(addressNumber)),
    ifnull(addressAddress,null,trim(addressAddress)),
    ifnull(addressSuffix,null,trim(addressSuffix)),
    ifnull(addressDirection,null,trim(addressDirection)),
    ifnull(addressDelivery,null,trim(addressDelivery)),
    ifnull(addressDeliveryNumber,null,trim(addressDeliveryNumber)),
    ifnull(addressDeliveryStation,null,trim(addressDeliveryStation)),
    ifnull(addressCity,null,trim(addressCity)),
    ifnull(addressProvince,'ON',trim(addressProvince)),
    ifnull(addressPostalCode,null,trim(addressPostalCode)),
    ifnull(addressIntersection,null,trim(addressIntersection)),
    ifnull(addressBusRoute,null,trim(addressBusRoute)));
  insert into org_address_rel(org_id,address_id,added) values(
    addressOrgId,newAddressId,now(*));
  if addressAccessId <> 0 then
    insert into treladdressaccessibility(addressid,accessibilityid) values(
      newAddressId,addressAccessId)
  end if
end
go

create procedure 
DBA.orgContactInsert(in orgId integer,in ContactName char(60),in ContactTitle char(120),in ContactOrg char(90),in ContactComm long varchar)
begin
  declare newContactId integer;
  select max(ID)+1 into newContactId from tblcontact;
  insert into tblcontact(ID,Name,Title,Org,Comm) values(newContactId,ContactName,
    ContactTitle,ContactOrg,ContactComm);
  insert into org_contact_rel(org_id,contact_id) values(orgId,newContactId)
end
go

create procedure 
DBA.defunct(in_org_id integer)
begin
  update pub_org set isactive = 0,deleted = now(*) where
    org_id = in_org_id;
  delete from org_thes where
    thes_id = official_id and org_id = in_org_id;
  delete from orgTaxLink where orgid = in_org_id;
  update org set isactive = 0 where id = in_org_id
end
go

create procedure 
DBA.orgNameInsert(in orgID integer,in NameTypeID integer,in NameName char(100),in NameParentID integer,in NameLevel integer,in NameSort char(100) default null)
begin
  declare newNameId integer;
  select max(ID)+1 into newNameId from tblOrgName;
  insert into tblOrgName(ID,orgNameTypeID,Name,ParentID,Level,Sort) values(
    newNameId,NameTypeID,NameName,NameParentID,NameLevel,NameSort);
  insert into Org_Names(org_id,org_name_id) values(orgId,newNameId)
end
go

create procedure 
dba.newAltOrgName(in org_id_in integer,in name_in char(100),in type_in integer,in sort_in char(100) default null)
begin
  declare new_id integer;
  select max(id)+1 into new_id from tblorgname;
  insert into tblorgname(id,name,sort,orgnametypeid,parentid) values(
    new_id,name_in,sort_in,type_in,null);
  insert into org_names(org_id,org_name_id) values(org_id_in,new_id)
end
go

create procedure 
dba.addressUpdate(in orgAddressId integer,in addressType integer,in addressCareOf char(60),in addressBuilding char(50),in addressAddress char(50),in addressCity char(50),in addressProvince char(2),in addressPostalCode char(7),in addressIntersection char(255),in addressAccessId integer,in addressUnit char(10),in addressUnitValue char(10),in addressUnitExtra char(25),in addressNumber char(10),in addressSuffix char(10),in addressDirection char(2),in addressDelivery char(20),in addressDeliveryNumber char(10),in addressDeliveryStation char(20),in addressBusRoute char(50),in addressMappable bit,in addressLabel char(50),in addressNote char(100))
begin
  update tbladdress as a set addresstypeid = addressType,
    incareof = ifnull(addressCareOf,null,trim(addressCareOf)),
    building = ifnull(addressBuilding,null,trim(addressBuilding)),
    address = ifnull(addressAddress,null,trim(addressAddress)),
    city = ifnull(addressCity,null,trim(addressCity)),
    province = ifnull(addressProvince,null,trim(addressProvince)),
    postalcode = ifnull(addressPostalCode,null,trim(addressPostalCode)),
    intersection = ifnull(addressIntersection,null,trim(addressIntersection)),
    unit = ifnull(addressUnit,null,trim(addressUnit)),
    unitValue = ifnull(addressUnitValue,null,trim(addressUnitValue)),
    unitExtra = ifnull(addressUnitExtra,null,trim(addressUnitExtra)),
    streetNumber = ifnull(addressNumber,null,trim(addressNumber)),
    streetSuffix = ifnull(addressSuffix,null,trim(addressSuffix)),
    streetDirection = ifnull(addressDirection,null,trim(addressDirection)),
    deliveryMode = ifnull(addressDelivery,null,trim(addressDelivery)),
    deliveryNumber = ifnull(addressDeliveryNumber,null,trim(addressDeliveryNumber)),
    deliveryStation = ifnull(addressDeliveryStation,null,trim(addressDeliveryStation)),
    busRoute = ifnull(addressBusRoute,null,trim(addressBusRoute)),
    ismappable = addressMappable from
    org_address_rel as o key join tbladdress as a where o.id = orgAddressId;
  update org_address_rel as o set
    label = ifnull(addressLabel,null,trim(addressLabel)),
    note = ifnull(addressNote,null,trim(addressNote)) where
    o.id = orgAddressId;
  delete from treladdressaccessibility from
    org_address_rel as o key join tbladdress key join treladdressaccessibility where o.id = orgAddressId;
  if addressAccessId <> 0 then
    insert into treladdressaccessibility(addressid,accessibilityid)
      select o.address_id,addressAccessId from
        org_address_rel as o where
        o.id = orgAddressId
  end if
end
go

create procedure dba.greater(in ctxt char(15))
result(c integer)
begin
  declare a integer;
  select max(id)+1 into a from city;
  insert into city(id,city) values(a,ctxt);
  set c=a
end
go

create procedure 
dba.pubEntry(in pubId integer,in pubYear integer)
begin
  delete from pub_entry from
    pub_entry key join pub_org where pub_id = pubId and pub_year = pubYear;
  insert into pub_entry(pub_org_id,entry,pub_year) select pub_org.id,number(*),pubYear from
      pub_org key join org key join tblorgname,
      org key left outer join ic_agencies as a,
      org key left outer join(org_address_rel as oa1 key join tbladdress as mail on mail.addresstypeid = 1),
      org key left outer join(org_address_rel as oa2 key join tbladdress as street on street.addresstypeid = 2) where
      pub_id = pubId and pub_org.isactive = 1 order by
      sort_key asc,a.id desc,isnull(street.city,mail.city) asc
end
go

create procedure 
dba.meta_index_city()
/* adds tbladdress.city/street/building to meta_index/org_meta for keyword searching*/
begin
  declare currentAddressID integer;
  declare currentBuilding char(50);
  declare currentStreet char(50);
  declare currentCity char(50);
  declare addressCursor dynamic scroll cursor for select distinct
      tbladdress.id,tbladdress.building,tbladdress.address,tbladdress.city from
      org_address_rel key join tbladdress;
  declare notFound exception for sqlstate value '02000';
  delete from org_meta where column_id in(8,9,10);
  delete from meta_index where column_id in(8,9,10);
  open addressCursor;
  addressLoop: loop
    fetch next addressCursor into currentAddressID,currentBuilding,currentStreet,currentCity;
    if sqlstate = notFound then leave addressLoop
    end if;
    call meta_index(10,currentAddressID,currentBuilding);
    call meta_index(9,currentAddressID,currentStreet);
    call meta_index(8,currentAddressID,currentCity);
    insert into org_meta(org_id,word_id,column_id,row_id,position)
      select org_id,word_id,column_id,row_id,position from
        meta_index join tbladdress on meta_index.row_id = tbladdress.id and column_id in(8,9,10) key join
        org_address_rel where tblAddress.id = currentAddressID;
    insert into org_meta(org_id,word_id,column_id,row_id,position)
      select org_site.org_id,word_id,column_id,row_id,position from
        meta_index join tbladdress on meta_index.row_id = tbladdress.id and column_id in(8,9,10) key join
        org_address_rel key join site key join org_site where
        tblAddress.id = currentAddressID
  end loop addressLoop;
  close addressCursor
end
go

create procedure dba.orgDelete(orgidin integer)
begin
  call defunct(orgidin);
  delete from pub_entry from pub_entry key join pub_org where org_id = orgidin;
  delete from pub_org where org_id = orgidin;
  delete from org_service_rel where org_id = orgidin;
  delete from org_names where org_id = orgidin;
  delete from org_address_rel where org_id = orgidin;
  delete from org_contact_rel where org_id = orgidin;
  delete from org_comm_rel where org_id = orgidin;
  delete from orgnotes where orgid = orgidin;
  delete from orgupdated where orgid = orgidin;
  delete from org_meta where org_id = orgidin;
  delete from org where id = orgidin;
  delete from meta_index where column_id = 11 and row_id = orgidin
end
go

create procedure dba.new_pub_tree(in pub_id integer,in parent_id integer)
/* RESULT ( column-name,... ) */
begin
  declare new_tree_id integer;
  select max(id)+1 into new_tree_id from pub_tree;
  insert into pub_tree(id,parent,pub,depth) values(new_tree_id,new_tree_id,pub_id,0);
  if parent_id > 0 then
    insert into pub_tree(id,parent,pub,depth) select new_tree_id,parent,pub_id,depth+1 from pub_tree where id = parent_id
  end if
end
go

create procedure dba.copyOrgAddress(in orgId integer,in oldAddress integer)
/* denormalizing tbladdress: creates a new address for org_address_rel */
begin
  declare newAddress integer;
  declare accessCopy integer;
  declare err_notfound exception for sqlstate value '02000';
  select max(id)+1 into newAddress from tbladdress;
  insert into tbladdress(id,
    addresstypeid,incareof,building,unit,unitValue,unitExtra,streetNumber,address,
    streetSuffix,streetDirection,deliveryMode,deliveryNumber,deliveryStation,
    city,province,postalcode,intersection,busRoute,utm_x,utm_y,ismappable,
    latitude,longitude)
    select newAddress,addresstypeid,incareof,building,unit,unitValue,unitExtra,streetNumber,
      address,streetSuffix,streetDirection,deliveryMode,deliveryNumber,deliveryStation,
      city,province,postalcode,intersection,busRoute,utm_x,utm_y,ismappable,
      latitude,longitude from
      tbladdress where id = oldAddress;
  update org_address_rel set address_id = newAddress where
    org_id = orgId and address_id = oldAddress;
  select first accessibilityid into accessCopy
    from tbladdress key left outer join treladdressaccessibility where
    tbladdress.id = oldAddress;
  if accessCopy is not null then
    insert into treladdressaccessibility(addressid,accessibilityid) values(
      newAddress,accessCopy)
  end if
end
go

create procedure 
dba.meta_index_column(in newColumnId integer)
/* adds a column to meta_index/org_meta for keyword searching*/
/* newColumnId = meta_column.id */
/* need to declare the correct data type for currentValue*/
/* need to edit qryCursor */
/* need to edit insert statement after call meta_index()*/
begin
  declare currentRow integer;
  declare currentValue char(7);
  declare qryCursor dynamic scroll cursor for select distinct org.id,org.cic_id from org;
  declare notFound exception for sqlstate value '02000';
  delete from org_meta where column_id = newColumnId;
  delete from meta_index where column_id = newColumnId;
  open qryCursor;
  qryLoop: loop
    fetch next qryCursor into currentRow,currentValue;
    if sqlstate = notFound then leave qryLoop
    end if;
    call meta_index(newColumnId,currentRow,currentValue);
    insert into org_meta(org_id,word_id,column_id,row_id,position)
      select org.id,word_id,column_id,row_id,position from
        meta_index join org on meta_index.row_id = org.id and column_id = newColumnId where
        org.id = currentRow
  end loop qryLoop;
  close qryCursor
end
go
commit work
go


-------------------------------------------------
--   Create triggers
-------------------------------------------------

setuser "DBA" 
go

create trigger
dba.WebChangeTemplate on DBA.WebTemplate for update as
begin
  if @@rowcount = 0 return
  set self_recursion on
  if update(Name) or update(Location) begin
      /* Change locations pointers in any children */
      update WebTemplate set
        Location = lower(ltrim(inserted.Location+'/'+inserted.Name)) from
        inserted where
        WebTemplate.ParentId = inserted.Id
    end
  if update(ParentId) begin
      /* Change locations pointers here */
      /* Recursive triggers will fix the rest */
      update WebTemplate as NewOne set
        Location = lower(ltrim(parent.Location+'/'+parent.Name)) from
        WebTemplate as parent where
        NewOne.ParentId = parent.Id and
        NewOne.Id = any(select Id from inserted)
    end
  execute WebChanged
end
go

create trigger
dba.WebAddTemplate on DBA.WebTemplate for insert as
begin
  if @@rowcount = 0 return
  /* Fix up my location */
  update WebTemplate as NewOne set
    Location = lower(ltrim(parent.Location+'/'+parent.Name)) from
    WebTemplate as parent where
    NewOne.ParentId = parent.Id and
    NewOne.Id = any(select Id from inserted)
  execute WebChanged
end
go

create trigger
dba.WebDataChange on DBA.WebData for insert,delete,update as
begin
  execute WebChanged
end
go

create trigger
dba.DeleteIndex after delete order 3 on
DBA.Data
referencing old as o
for each row
begin
  -- Delete keywords for this record
  delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber
end
go
COMMENT ON TRIGGER "DeleteIndex" IS
	''
go

create trigger
dba.meta_insert_orgname after insert order 1 on
DBA.tblOrgName
referencing new as n
for each row
begin
  call meta_index(1,n.id,n.name)
end
go
COMMENT ON TRIGGER "meta_insert_orgname" IS
	''
go

create trigger
dba.InsertIndex after insert order 2 on
DBA.Data
referencing new as n
for each row
begin
  -- Update each column
  call recindex(n.Org1,n.RecordNumber,1);
  call recindex(n.Org2,n.RecordNumber,2);
  call recindex(n.Org3,n.RecordNumber,3);
  call recindex(n.Org4,n.RecordNumber,4);
  call recindex(n.Org5,n.RecordNumber,5);
  call recindex(n.AltOrg,n.RecordNumber,6);
  call recindex(n.FormerOrg,n.RecordNumber,7);
  call recindex(n.Eligibility,n.RecordNumber,8);
  call recindex(n.Description,n.RecordNumber,9);
  call recindex(n.PubDescription,n.RecordNumber,10);
  call recindex(n.GeneralInfo,n.RecordNumber,11);
  call recindex(n.BND,n.RecordNumber,12);
  call recindex(n.Subject,n.RecordNumber,13);
  call recindex(n.UsedFor,n.RecordNumber,14);
  call recIndex(n.LocalSubjects,n.RecordNumber,15)
end
go
COMMENT ON TRIGGER "InsertIndex" IS
	''
go

create trigger
dba.org_meta_delete_names after delete order 1 on
DBA.org_names
referencing old as o
for each row
begin
  delete from org_meta where org_id = o.org_id and row_id = o.org_name_id and column_id = 1
end
go
COMMENT ON TRIGGER "org_meta_delete_names" IS
	''
go

create trigger
dba.meta_insert_service after insert order 1 on
DBA.tblService
referencing new as n
for each row
begin
  call meta_index(2,n.id,n.description);
  call meta_index(3,n.id,n.eligibility)
end
go
COMMENT ON TRIGGER "meta_insert_service" IS
	''
go

create trigger
dba.meta_delete_orgname after delete order 1 on
DBA.tblOrgName
referencing old as o
for each row
begin
  delete from meta_index where row_id = o.id and column_id = 1
end
go
COMMENT ON TRIGGER "meta_delete_orgname" IS
	''
go

create trigger
dba.meta_update_orgname after update of Name
order 1 on DBA.tblOrgName
referencing old as o new as n
for each row
begin
  declare current_org_id integer;
  declare org_id_cursor dynamic scroll cursor for select org_id from org_names where org_name_id = o.id;
  declare err_notfound exception for sqlstate value '02000';
  delete from meta_index where row_id = o.id and column_id = 1;
  call meta_index(1,n.id,n.name);
  open org_id_cursor;
  org_loop: loop
    fetch next org_id_cursor into current_org_id;
    if sqlstate = err_notfound then leave org_loop
    end if;
    delete from org_meta where
      org_id = current_org_id and
      row_id = o.id and column_id = 1;
    insert into org_meta(org_id,word_id,column_id,row_id,position)
      select current_org_id,word_id,column_id,row_id,position from meta_index where row_id = o.id and column_id = 1;
    call orgModNow(current_org_id)
  end loop org_loop;
  close org_id_cursor
end
go
COMMENT ON TRIGGER "meta_update_orgname" IS
	''
go

create trigger
dba.meta_update_service after update of Description,
Eligibility order 1 on DBA.tblService
referencing old as o new as n
for each row
begin
  declare this_org_id integer;
  select org_id into this_org_id from org_service_rel where service_id = n.id;
  delete from org_meta where column_id between 2 and 4 and org_id = this_org_id;
  delete from meta_index where row_id = n.id and column_id in(2,3);
  call meta_index(2,n.id,n.description);
  call meta_index(3,n.id,n.eligibility);
  insert into org_meta(org_id,word_id,column_id,row_id,position) select org_id,word_id,column_id,service_id,position from org_service_rel join meta_index on service_id = row_id and column_id between 2 and 4 where org_id = this_org_id and service_id = n.id
end
go
COMMENT ON TRIGGER "meta_update_service" IS
	''
go

create trigger
dba.activeDate after update of isactive
order 4 on DBA.org
referencing new as n
for each row
begin
  update org set deleted = (case isactive when 1 then null else now(*) end) where org.id = n.id
end
go
COMMENT ON TRIGGER "activeDate" IS
	'changes deleted column when isactive gets updated'
go

create trigger
dba.meta_delete_service after delete order 1 on
DBA.tblService
referencing old as o
for each row
begin
  delete from meta_index where row_id = o.id and column_id in(2,3)
end
go
COMMENT ON TRIGGER "meta_delete_service" IS
	''
go

create trigger dba.meta_update_cicid after update of cic_id
order 7 on DBA.org
referencing old as o new as n
for each row
begin
  delete from org_meta where column_id = 11 and row_id = o.id;
  delete from meta_index where row_id = o.id and column_id = 11;
  call meta_index(11,n.id,n.cic_id);
  insert into org_meta(org_id,word_id,column_id,row_id,position)
    select org_id,word_id,column_id,row_id,position from
      org join meta_index on org.id = row_id and column_id = 11 where
      org.id = n.id
end
go
COMMENT ON TRIGGER "meta_update_cicid" IS
	''
go

create trigger
dba.org_meta_insert_names after insert order 1 on
DBA.org_names
referencing new as n
for each row
begin
  insert into org_meta(org_id,word_id,column_id,row_id,position) select org_id,word_id,column_id,org_name_id,position from org_names join meta_index on org_name_id = row_id and column_id = 1 where org_id = n.org_id and org_name_id = n.org_name_id
end
go
COMMENT ON TRIGGER "org_meta_insert_names" IS
	''
go

create trigger
dba.org_meta_insert_thes after insert order 3 on
DBA.org_thes
referencing new as n
for each row
begin
  insert into org_meta(org_id,word_id,column_id,row_id,position) select org_id,word_id,column_id,thes_id,position from org_thes join meta_index on thes_id = row_id and column_id = 6 where org_id = n.org_id and thes_id = n.thes_id
end
go
COMMENT ON TRIGGER "org_meta_insert_thes" IS
	''
go

create trigger
dba.org_meta_delete_thes after delete order 2 on
DBA.org_thes
referencing old as o
for each row
begin
  delete from org_meta where org_id = o.org_id and row_id = o.thes_id and column_id = 6
end
go
COMMENT ON TRIGGER "org_meta_delete_thes" IS
	''
go

create trigger
dba.org_address_del after delete order 1 on
DBA.org_address_rel
referencing old as o
for each row
begin
  insert into org_rel_del(org_id,rel_id,added,note,deleted,table_id) values(
    o.org_id,o.address_id,o.added,o.note,now(*),271)
end
go
COMMENT ON TRIGGER "org_address_del" IS
	''
go

create trigger
dba.org_comm_del after delete order 1 on
DBA.org_comm_rel
referencing old as o
for each row
begin
  insert into org_rel_del(org_id,rel_id,added,note,deleted,table_id) values(
    o.org_id,o.comm_id,o.added,o.note,now(*),270)
end
go
COMMENT ON TRIGGER "org_comm_del" IS
	''
go

create trigger
dba.org_contact_del after delete order 1 on
DBA.org_contact_rel
referencing old as o
for each row
begin
  insert into org_rel_del(org_id,rel_id,added,note,deleted,table_id) values(
    o.org_id,o.contact_id,o.added,o.note,now(*),272);
  call orgModNow(o.org_id)
end
go
COMMENT ON TRIGGER "org_contact_del" IS
	''
go

create trigger
dba.org_service_del after delete order 1 on
DBA.org_service_rel
referencing old as o
for each row
begin
  insert into org_rel_del(org_id,rel_id,added,note,deleted,table_id) values(
    o.org_id,o.service_id,o.added,o.note,now(*),275)
end
go
COMMENT ON TRIGGER "org_service_del" IS
	''
go

create trigger
dba.org_del after delete order 1 on
DBA.org
referencing old as o
for each row
begin
  insert into org_del values(o.id,o.org_name_id,o.update_note,o.cic_id,now(*),o.service_level)
end
go
COMMENT ON TRIGGER "org_del" IS
	''
go

create trigger
dba.org_name_del after delete order 2 on
DBA.org_names
referencing old as o
for each row
begin
  insert into org_rel_del(org_id,rel_id,added,deleted,table_id) values(
    o.org_id,o.org_name_id,now(*),now(*),249)
end
go
COMMENT ON TRIGGER "org_name_del" IS
	''
go

create trigger
dba.update_org_name after update of org_name_id
order 2 on DBA.org
referencing new as n
for each row
begin
  declare current_id integer;
  declare next_id integer;
  declare current_level integer;
  set current_id=n.org_name_id;
  select level into current_level from tblorgname where id = current_id;
  delete from org_names where org_id = n.id and org_name_id = any(select id from tblorgname where orgnametypeid = 1);
  while current_level > 0 loop
    select parentid into next_id from tblorgname where
      id = current_id;
    insert into org_names(org_id,org_name_id) values(n.id,current_id);
    set current_id=next_id;
    set current_level=current_level-1
  end loop;
  update org set modified = now(*) where id = n.id
end
go
COMMENT ON TRIGGER "update_org_name" IS
	''
go

create trigger
dba.update_name_parent after update of ParentID
order 2 on DBA.tblOrgName
referencing old as o new as n
for each row
when(n.orgnametypeid = 1)
begin
  declare current_id integer;
  declare next_id integer;
  declare current_level integer;
  set current_id=n.parentid;
  select level into current_level from tblorgname where id = current_id;
  if o.parentid is not null then
    delete from org_names where org_id = any(select org_id from org_names where org_name_id = o.id) and
      org_name_id = any(select id from tblorgname where level between 1 and(o.level-1) and orgnametypeid = 1)
  end if;
  if n.parentid is not null then
    while current_level > 0 loop
      select parentid into next_id from tblorgname where
        id = current_id;
      insert into org_names(org_id,org_name_id)
        select distinct org_id,current_id from org_names where
          org_id = any(select org_id from org_names where org_name_id = o.id);
      set current_id=next_id;
      set current_level=current_level-1
    end loop
  end if
end
go
COMMENT ON TRIGGER "update_name_parent" IS
	''
go

create trigger
dba.deleteDeletedPubs before insert order 2 on
DBA.pub_org
referencing new as new_pub
for each row
begin
  delete from pub_org from
    pub_org key join pub where
    org_id = new_pub.org_id and
    pub.code = (select 'x' || code from pub where id = new_pub.pub_id)
end
go
COMMENT ON TRIGGER "deleteDeletedPubs" IS
	''
go

create trigger
dba.org_insert after insert order 3 on
DBA.org
referencing new as n
for each row
begin
  declare current_id integer;
  declare next_id integer;
  declare current_level integer;
  set current_id=n.org_name_id;
  select level into current_level from tblorgname where id = current_id;
  while current_level > 0 loop
    select parentid into next_id from tblorgname where
      id = current_id;
    insert into org_names(org_id,org_name_id) values(n.id,current_id);
    set current_id=next_id;
    set current_level=current_level-1
  end loop;
  call meta_index(11,n.id,n.cic_id);
  insert into org_meta(org_id,word_id,column_id,row_id,position) select org.id,word_id,column_id,org.id,position from org join meta_index on org.id = row_id and column_id = 11 where org.id = n.id
end
go
COMMENT ON TRIGGER "org_insert" IS
	''
go

create trigger
dba.pub_org_del after delete order 1 on
DBA.pub_org
referencing old as o
for each row
begin
  insert into org_rel_del(org_id,rel_id,added,deleted,table_id) values(
    o.org_id,o.pub_id,o.added,now(*),285)
end
go
COMMENT ON TRIGGER "pub_org_del" IS
	''
go

create trigger
dba.MetaIndex after update of RecordNumber,Org1,Org2,Org3,Org4,Org5,AltOrg,FormerOrg,Description,PubDescription,GeneralInfo,BND,Eligibility,Subject,UsedFor,
LocalSubjects order 1 on DBA.Data
referencing old as o new as n
for each row
begin
  -- Declare variables
  declare @fieldid integer;
  -- Check each column for change in value
  if o.Org1 <> n.Org1 then
    set @fieldid=1;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.Org1,n.RecordNumber,@fieldid)
  end if;
  if o.Org2 <> n.Org2 then
    set @fieldid=2;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.Org2,n.RecordNumber,@fieldid)
  end if;
  if o.Org3 <> n.Org3 then
    set @fieldid=3;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.Org3,n.RecordNumber,@fieldid)
  end if;
  if o.Org4 <> n.Org4 then
    set @fieldid=4;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.Org4,n.RecordNumber,@fieldid)
  end if;
  if o.Org5 <> n.Org5 then
    set @fieldid=5;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.Org5,n.RecordNumber,@fieldid)
  end if;
  if o.AltOrg <> n.AltOrg then
    set @fieldid=6;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.AltOrg,n.RecordNumber,@fieldid)
  end if;
  if o.FormerOrg <> n.FormerOrg then
    set @fieldid=7;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.FormerOrg,n.RecordNumber,@fieldid)
  end if;
  if o.Eligibility <> n.Eligibility then
    set @fieldid=8;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.Eligibility,n.RecordNumber,@fieldid)
  end if;
  if o.Description <> n.Description then
    set @fieldid=9;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.Description,n.RecordNumber,@fieldid)
  end if;
  if o.PubDescription <> n.PubDescription then
    set @fieldid=10;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.PubDescription,n.RecordNumber,@fieldid)
  end if;
  if o.GeneralInfo <> n.GeneralInfo then
    set @fieldid=11;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.GeneralInfo,n.RecordNumber,@fieldid)
  end if;
  if o.BND <> n.BND then
    set @fieldid=12;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.BND,n.RecordNumber,@fieldid)
  end if;
  if o.Subject <> n.Subject then
    set @fieldid=13;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.Subject,n.RecordNumber,@fieldid)
  end if;
  if o.UsedFor <> n.UsedFor then
    set @fieldid=14;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recindex(n.UsedFor,n.RecordNumber,@fieldid)
  end if;
  if o.LocalSubjects <> n.LocalSubjects then
    set @fieldid=15;
    delete from MetaIndex where MetaIndex.RecordNumber = o.RecordNumber and MetaIndex.FieldID = @fieldid;
    call recIndex(n.LocalSubjects,n.RecordNumber,@fieldid)
  end if
end
go
COMMENT ON TRIGGER "MetaIndex" IS
	''
go

create trigger
dba.update_name_sort_parent after update of Name,ParentID,
Sort order 3 on DBA.tblOrgName
referencing old as o new as n
for each row
when(n.orgnametypeid = 1)
begin
  if n.parentid is not null then
    call make_org_name_sort_key(n.parentid)
  else
    call make_org_name_sort_key_from_top()
  end if
end
go
COMMENT ON TRIGGER "update_name_sort_parent" IS
	''
go

create trigger
dba.update_child_sort_key after update of sort_key
order 5 on DBA.tblOrgName
referencing old as o new as n
for each row
when(n.orgnametypeid = 1)
begin
  update tblorgname set sort_key
     = string(n.sort_key,substring(tblorgname.sort_key,length(tblorgname.sort_key)-4)) where
    parentid = n.id
end
go
COMMENT ON TRIGGER "update_child_sort_key" IS
	''
go

create trigger
dba.create_org_name_sort_key after insert order 6 on
DBA.tblOrgName
referencing new as n
for each row
begin
  if n.parentid is not null then
    call make_org_name_sort_key(n.parentid)
  else
    call make_org_name_sort_key_from_top()
  end if
end
go
COMMENT ON TRIGGER "create_org_name_sort_key" IS
	''
go

create trigger
dba.insert_uf after insert order 1 on
DBA.org_thes
referencing new as n
for each row
when(n.thes_id = n.official_id)
begin
  insert into org_thes(org_id,thes_id,official_id)
    select n.org_id,rel_id,n.thes_id from thes_rel where
      rel_type = 'uf' and thes_id = n.thes_id
end
go
COMMENT ON TRIGGER "insert_uf" IS
	''
go

create trigger
DBA.orgModNameDel after delete order 3 on
DBA.org_names
referencing old as o
for each row
begin
  call orgModNow(o.org_id)
end
go
COMMENT ON TRIGGER "orgModNameDel" IS
	''
go

create trigger
dba.delete_uf after delete order 1 on
DBA.org_thes
referencing old as o
for each row
when(o.thes_id = o.official_id)
begin
  delete from org_thes where
    official_id = o.official_id and org_id = o.org_id
end
go
COMMENT ON TRIGGER "delete_uf" IS
	''
go

create trigger
dba.meta_insert_thes_o after insert order 1 on
DBA.thes_original
referencing new as n
for each row
begin
  call meta_index(6,n.id,n.de)
end
go
COMMENT ON TRIGGER "meta_insert_thes_o" IS
	''
go

create trigger
dba.meta_delete_thes_o after delete order 2 on
DBA.thes_original
referencing old as o
for each row
begin
  delete from meta_index where column_id = 6 and row_id = o.id
end
go
COMMENT ON TRIGGER "meta_delete_thes_o" IS
	''
go

create trigger
dba.meta_update_thes_o after update of de
order 3 on DBA.thes_original
referencing old as o new as n
for each row
begin
  declare orgID integer;
  declare orgThesID integer;
  declare officialID integer;
  declare currentRow dynamic scroll cursor for select id,org_id,official_id from org_thes where thes_id = o.id;
  declare err_notfound exception for sqlstate value '02000';
  delete from meta_index where column_id = 6 and row_id = o.id;
  call meta_index(6,n.id,n.de);
  open currentRow;
  rowLoop: loop
    fetch next currentRow into orgThesID,orgID,officialID;
    if sqlstate = err_notfound then leave rowLoop
    end if;
    delete from org_thes where id = orgThesID;
    insert into org_thes(org_id,thes_id,official_id) values(orgID,n.id,officialID)
  end loop rowLoop;
  close currentRow
end
go
COMMENT ON TRIGGER "meta_update_thes_o" IS
	''
go

create trigger
dba.org_meta_insert_res after insert order 2 on
DBA.org_res_rel
referencing new as n
for each row
begin
  insert into org_meta(org_id,word_id,column_id,row_id,position) select org_id,word_id,column_id,res_id,position from org_res_rel join
      meta_index on res_id = row_id and column_id = 7 where org_id = n.org_id and res_id = n.res_id
end
go
COMMENT ON TRIGGER "org_meta_insert_res" IS
	''
go

create trigger
dba.org_meta_delete_res after delete order 1 on
DBA.org_res_rel
referencing old as o
for each row
begin
  delete from org_meta where org_id = o.org_id and row_id = o.res_id and column_id = 7
end
go
COMMENT ON TRIGGER "org_meta_delete_res" IS
	''
go

create trigger
dba.meta_delete_resource after delete order 1 on
DBA.res
referencing old as o
for each row
begin
  delete from meta_index where row_id = o.id and column_id = 7
end
go
COMMENT ON TRIGGER "meta_delete_resource" IS
	''
go

create trigger
dba.meta_insert_resource after insert order 2 on
DBA.res
referencing new as n
for each row
begin
  call meta_index(7,n.id,n.name)
end
go
COMMENT ON TRIGGER "meta_insert_resource" IS
	''
go

create trigger
dba.meta_update_res after update of name order 3 on
DBA.res
referencing old as o new as n
for each row
begin
  delete from meta_index where row_id = o.id and column_id = 7;
  delete from org_meta where row_id = o.id and column_id = 7;
  call meta_index(7,n.id,n.name);
  insert into org_meta(org_id,word_id,column_id,row_id,position)
    select org_id,word_id,column_id,res_id,position from
      org_res_rel join meta_index on res_id = row_id and column_id = 7 where
      row_id = n.id
end
go
COMMENT ON TRIGGER "meta_update_res" IS
	''
go

create trigger
DBA.orgModContactDel after delete order 2 on
DBA.org_contact_rel
referencing old as o
for each row
begin
  call orgModNow(o.org_id)
end
go
COMMENT ON TRIGGER "orgModContactDel" IS
	''
go

create trigger
DBA.orgModCommIns after insert order 3 on
DBA.org_comm_rel
referencing new as n
for each row
begin
  call orgModNow(n.org_id)
end
go
COMMENT ON TRIGGER "orgModCommIns" IS
	''
go

create trigger
DBA.orgModCommDel after delete order 2 on
DBA.org_comm_rel
referencing old as o
for each row
begin
  call orgModNow(o.org_id)
end
go
COMMENT ON TRIGGER "orgModCommDel" IS
	''
go

create trigger
DBA.orgModAddressDel after delete order 2 on
DBA.org_address_rel
referencing old as o
for each row
begin
  call orgModNow(o.org_id)
end
go
COMMENT ON TRIGGER "orgModAddressDel" IS
	''
go

create trigger
DBA.orgModAddressIns after insert order 3 on
DBA.org_address_rel
referencing new as n
for each row
begin
  call orgModNow(n.org_id)
end
go
COMMENT ON TRIGGER "orgModAddressIns" IS
	''
go

create trigger
DBA.orgModContactIns after insert order 3 on
DBA.org_contact_rel
referencing new as n
for each row
begin
  call orgModNow(n.org_id)
end
go
COMMENT ON TRIGGER "orgModContactIns" IS
	''
go

create trigger
DBA.orgModServiceUp after update order 2 on
DBA.tblService
referencing old as o
for each row
begin
  update org set modified = now(*) from
    org key join org_service_rel as s on s.service_id = o.id;
  update tblservice set updated = now(*) where tblservice.id = o.id
end
go
COMMENT ON TRIGGER "orgModServiceUp" IS
	''
go

create trigger
dba.meta_insert_address after insert order 1 on
DBA.tblAddress
referencing new as n
for each row
begin
  call meta_index(8,n.id,n.city);
  call meta_index(9,n.id,n.address);
  call meta_index(10,n.id,n.building)
end
go
COMMENT ON TRIGGER "meta_insert_address" IS
	''
go

create trigger
DBA.orgModNameIns after insert order 4 on
DBA.org_names
referencing new as n
for each row
begin
  call orgModNow(n.org_id)
end
go
COMMENT ON TRIGGER "orgModNameIns" IS
	''
go

create trigger
dba.org_meta_insert_address after insert order 1 on
DBA.org_address_rel
referencing new as n
for each row
begin
  insert into org_meta(org_id,word_id,column_id,row_id,position)
    select org_id,word_id,column_id,address_id,position from
      org_address_rel join meta_index on address_id = row_id and column_id in(8,9,10) where
      org_id = n.org_id and address_id = n.address_id
end
go
COMMENT ON TRIGGER "org_meta_insert_address" IS
	''
go

create trigger
dba.org_meta_delete_address after delete order 3 on
DBA.org_address_rel
referencing old as o
for each row
begin
  delete from org_meta where column_id in(8,9,10) and row_id = o.address_id and org_id = o.org_id
end
go
COMMENT ON TRIGGER "org_meta_delete_address" IS
	''
go

create trigger dba.orgModThesInsert after insert order 4 on
DBA.org_thes
referencing new as n
for each row
begin
  call orgModNow(n.org_id)
end
go
COMMENT ON TRIGGER "orgModThesInsert" IS
	''
go

create trigger dba.orgUpdated after update of updated
order 5 on DBA.org
referencing new as n
for each row
begin
  insert into orgUpdated(orgid,updated) values(n.id,n.updated)
end
go
COMMENT ON TRIGGER "orgUpdated" IS
	''
go

create trigger dba.orgModThesDelete after delete order 5 on
DBA.org_thes
referencing old as o
for each row
begin
  call orgModNow(o.org_id)
end
go
COMMENT ON TRIGGER "orgModThesDelete" IS
	''
go

create trigger dba.orgModTaxInsert after insert order 1 on
DBA.orgTaxLink
referencing new as n
for each row
begin
  call orgModNow(n.orgid)
end
go
COMMENT ON TRIGGER "orgModTaxInsert" IS
	''
go

create trigger dba.orgModTaxDelete after delete order 2 on
DBA.orgTaxLink
referencing old as o
for each row
begin
  call orgModNow(o.orgid)
end
go
COMMENT ON TRIGGER "orgModTaxDelete" IS
	''
go

create trigger dba.orgModPubContact after update of org_contact_id,
isActive order 2 on DBA.pub_org
referencing new as n
for each row
begin
  call orgModNow(n.org_id)
end
go
COMMENT ON TRIGGER "orgModPubContact" IS
	''
go

create trigger dba.updateAddressOrgMod after update order 2 on
DBA.tblAddress
referencing old as o new as n
for each row
begin
  declare current_org_id integer;
  declare org_id_cursor dynamic scroll cursor for select org_id from org_address_rel where address_id = n.id;
  declare err_notfound exception for sqlstate value '02000';
  open org_id_cursor;
  org_loop: loop
    fetch next org_id_cursor into current_org_id;
    if sqlstate = err_notfound then leave org_loop
    end if;
    call orgModNow(current_org_id)
  end loop org_loop;
  close org_id_cursor
end
go
COMMENT ON TRIGGER "updateAddressOrgMod" IS
	''
go

create trigger dba.updateCommOrgMod after update order 1 on
DBA.tblComm
referencing old as o new as n
for each row
begin
  declare current_org_id integer;
  declare org_id_cursor dynamic scroll cursor for select org_id from org_comm_rel where comm_id = n.id;
  declare err_notfound exception for sqlstate value '02000';
  open org_id_cursor;
  org_loop: loop
    fetch next org_id_cursor into current_org_id;
    if sqlstate = err_notfound then leave org_loop
    end if;
    call orgModNow(current_org_id)
  end loop org_loop;
  close org_id_cursor
end
go
COMMENT ON TRIGGER "updateCommOrgMod" IS
	''
go

create trigger dba.updateContactOrgMod after update order 1 on
DBA.tblContact
referencing old as o new as n
for each row
begin
  declare current_org_id integer;
  declare org_id_cursor dynamic scroll cursor for select org_id from org_contact_rel where contact_id = n.id;
  declare err_notfound exception for sqlstate value '02000';
  open org_id_cursor;
  org_loop: loop
    fetch next org_id_cursor into current_org_id;
    if sqlstate = err_notfound then leave org_loop
    end if;
    call orgModNow(current_org_id)
  end loop org_loop;
  close org_id_cursor
end
go
COMMENT ON TRIGGER "updateContactOrgMod" IS
	''
go

create trigger dba.deleteIncomplete after update of iscomplete
order 6 on DBA.org
referencing old as o new as n
for each row
when(o.iscomplete = 1 and n.iscomplete = 0)
begin
  update org set deleted = now(*) where id = n.id
end
go
COMMENT ON TRIGGER "deleteIncomplete" IS
	''
go

create trigger dba.pubOrgInsert after insert order 3 on
DBA.pub_org
referencing new as n
for each row
begin
  call orgModNow(n.org_id)
end
go
COMMENT ON TRIGGER "pubOrgInsert" IS
	''
go

create trigger
dba.meta_update_address after update of building,city order 3 on DBA.tblAddress
referencing old as o new as n
for each row
begin
  delete from org_meta where column_id in(8,9,10) and row_id = o.id;
  delete from meta_index where row_id = o.id and column_id in(8,9,10);
  call meta_index(8,n.id,n.city);
  call meta_index(9,n.id,n.address);
  call meta_index(10,n.id,n.building);
  insert into org_meta(org_id,word_id,column_id,row_id,position)
    select org_id,word_id,column_id,row_id,position from
      org_address_rel join meta_index on address_id = row_id and column_id in(8,9,10) where address_id = n.id
end
go
COMMENT ON TRIGGER "meta_update_address" IS
	''
go

create trigger dba.org_services after update order 1 on
DBA.ic_site_services
referencing old as o new as n
for each row
begin
  call orgModNow(o.serviceid);
  call orgModNow(n.serviceid);
  update org set modified = now(*) where id = 
    any(select ic_agency_sites.siteid from
      ic_agency_sites key join ic_site_services where
      serviceid in(o.serviceid,n.serviceid))
end
go
COMMENT ON TRIGGER "org_services" IS
	''
go

create trigger
dba.meta_delete_address after delete order 2 on
DBA.tblAddress
referencing old as o
for each row
begin
  delete from meta_index where column_id in(8,9,10) and row_id = o.id
end
go
COMMENT ON TRIGGER "meta_delete_address" IS
	''
go

create trigger dba.mod after update of taxgroup,taxid,isactive,haschildren,
islocal order 1 on DBA.taxGroups
referencing old as o new as n
for each row
begin
  update taxgroups set modified = now(*) where id = n.id
end
go
COMMENT ON TRIGGER "mod" IS
	''
go

create trigger dba.org_sites after update order 1 on
DBA.ic_agency_sites
referencing old as o new as n
for each row
begin
  call orgModNow(o.siteid);
  call orgModNow(n.siteid);
  update org set modified = now(*) where id = 
    any(select orgid from
      ic_agencies key join ic_agency_sites where
      siteid in(o.siteid,n.siteid));
  update org set modified = now(*) where id = 
    any(select serviceid from
      ic_site_services where
      siteid in(o.siteid,n.siteid))
end
go
COMMENT ON TRIGGER "org_sites" IS
	''
go

create trigger dba.org_services_insert after insert order 1 on
DBA.ic_site_services
referencing new as n
for each row
begin
  call orgModNow(n.serviceid);
  update org set modified = now(*) where id = 
    any(select ic_agency_sites.siteid from
      ic_agency_sites key join ic_site_services where
      serviceid in(n.serviceid))
end
go
COMMENT ON TRIGGER "org_services_insert" IS
	''
go

create trigger dba.org_services_delete before delete order 1 on
DBA.ic_site_services
referencing old as o
for each row
begin
  call orgModNow(o.serviceid);
  update org set modified = now(*) where id = 
    any(select ic_agency_sites.siteid from
      ic_agency_sites key join ic_site_services where
      serviceid in(o.serviceid))
end
go
COMMENT ON TRIGGER "org_services_delete" IS
	''
go

create trigger dba.org_sites_insert after insert order 1 on
DBA.ic_agency_sites
referencing new as n
for each row
begin
  call orgModNow(n.siteid);
  update org set modified = now(*) where id = 
    any(select orgid from
      ic_agencies key join ic_agency_sites where
      siteid in(n.siteid));
  update org set modified = now(*) where id = 
    any(select serviceid from
      ic_site_services where
      siteid in(n.siteid))
end
go
COMMENT ON TRIGGER "org_sites_insert" IS
	''
go

create trigger dba.org_sites_delete after delete order 1 on
DBA.ic_agency_sites
referencing old as o
for each row
begin
  call orgModNow(o.siteid);
  update org set modified = now(*) where id = 
    any(select orgid from
      ic_agencies key join ic_agency_sites where
      siteid in(o.siteid));
  update org set modified = now(*) where id = 
    any(select serviceid from
      ic_site_services where
      siteid in(o.siteid))
end
go
COMMENT ON TRIGGER "org_sites_delete" IS
	''
go

create trigger dba.org_agency_insert after insert order 1 on
DBA.ic_agencies
referencing new as n
for each row
begin
  call orgModNow(n.orgid);
  update org set modified = now(*) where id = 
    any(select siteid from
      ic_agencies key join ic_agency_sites where
      orgid in(n.orgid));
  update org set modified = now(*) where id = 
    any(select serviceid from
      ic_agencies key join ic_agency_sites key join ic_site_services where
      orgid in(n.orgid))
end
go
COMMENT ON TRIGGER "org_agency_insert" IS
	''
go

create trigger dba.org_agency_delete after delete order 1 on
DBA.ic_agencies
referencing old as o
for each row
begin
  call orgModNow(o.orgid);
  update org set modified = now(*) where id = 
    any(select siteid from
      ic_agencies key join ic_agency_sites where
      orgid in(o.orgid));
  update org set modified = now(*) where id = 
    any(select serviceid from
      ic_agencies key join ic_agency_sites key join ic_site_services where
      orgid in(o.orgid))
end
go
COMMENT ON TRIGGER "org_agency_delete" IS
	''
go

create trigger dba.org_agency after update order 1 on
DBA.ic_agencies
referencing old as o new as n
for each row
begin
  call orgModNow(o.orgid);
  call orgModNow(n.orgid);
  update org set modified = now(*) where id = 
    any(select siteid from
      ic_agencies key join ic_agency_sites where
      orgid in(o.orgid,n.orgid));
  update org set modified = now(*) where id = 
    any(select serviceid from
      ic_agencies key join ic_agency_sites key join ic_site_services where
      orgid in(o.orgid,n.orgid))
end
go
COMMENT ON TRIGGER "org_agency" IS
	''
go

create trigger dba.org_meta_insert_site after insert order 2 on
DBA.org_site
referencing new as n
for each row
begin
  insert into org_meta(org_id,word_id,column_id,row_id,position)
    select org_site.org_id,word_id,column_id,address_id,position from
      org_site key join site key join
      org_address_rel join meta_index on address_id = row_id and
      column_id in(8,9,10) where
      org_site.id = n.id
end
go
COMMENT ON TRIGGER "org_meta_insert_site" IS
	''
go

create trigger dba.org_meta_delete_site after delete order 1 on
DBA.org_site
referencing old as o
for each row
begin
  delete from org_meta where column_id in(8,9,10) and row_id = 
    (select address_id from
      org_site key join site key join org_address_rel where
      org_site.id = o.id) and
    org_id = o.org_id
end
go
COMMENT ON TRIGGER "org_meta_delete_site" IS
	''
go
setuser "DBA" 
go
commit work
go


-------------------------------------------------
--   Create SQL remote definitions
-------------------------------------------------

CREATE REMOTE TYPE "FILE" ADDRESS ''
go
CREATE REMOTE TYPE "MAPI" ADDRESS ''
go
CREATE REMOTE TYPE "VIM" ADDRESS ''
go
CREATE REMOTE TYPE "SMTP" ADDRESS ''
go
CREATE REMOTE TYPE "FTP" ADDRESS ''
go
commit work
go


-------------------------------------------------
--   Remove SQL remote definitions
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Repserver Commit Offsets
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Check view definitions
-------------------------------------------------

GRANT CONNECT TO "DBA" IDENTIFIED BY ENCRYPTED '\x42\x59\xFC\x79\xF6\xB2\x9F\x75\xAE\x04\xC3\x9A\x2C\x9B\xDB\x03\xB9\x79\xB0\xD6\x8C\xAE\x2A\xCB\xB4\xCB\x04\x5B\x29\x10\x1B\x1E\x9B\xE0\xB3\x69'
go
commit work
go


-------------------------------------------------
--   Create integrated logins
-------------------------------------------------

commit work
go


-------------------------------------------------
--   Set option values
-------------------------------------------------


SET OPTION Statistics =
go
SET OPTION Date_order =
go
SET OPTION describe_java_format=
go


--
--SQL Option Statements for user 
--

SET OPTION "DBA"."ISQL_log" = ''
go
SET OPTION "DBA"."Bell" = 'Off'
go
SET OPTION "DBA"."Auto_refetch" = 'On'
go
SET OPTION "DBA"."On_error" = 'prompt'
go
SET OPTION "DBA"."Statistics" = '3'
go
SET OPTION "DBA"."Date_order" = 'YMD'
go
SET OPTION "DBA"."Describe_Java_Format" = 'binary'
go


--
--SQL Option Statements for user 
--

SET OPTION "PUBLIC"."Blocking" = 'On'
go
SET OPTION "PUBLIC"."Checkpoint_time" = '60'
go
SET OPTION "PUBLIC"."Conversion_error" = 'On'
go
SET OPTION "PUBLIC"."Date_format" = 'YYYY-MM-DD'
go
SET OPTION "PUBLIC"."Date_order" = 'YMD'
go
SET OPTION "PUBLIC"."Isolation_level" = '0'
go
SET OPTION "PUBLIC"."Lock_rejected_rows" = 'Off'
go
SET OPTION "PUBLIC"."Login_procedure" = 'sp_login_environment'
go
SET OPTION "PUBLIC"."On_tsql_error" = 'Conditional'
go
SET OPTION "PUBLIC"."Precision" = '30'
go
SET OPTION "PUBLIC"."Recovery_time" = '2'
go
SET OPTION "PUBLIC"."Replicate_all" = 'Off'
go
SET OPTION "PUBLIC"."Row_counts" = 'Off'
go
SET OPTION "PUBLIC"."Scale" = '6'
go
SET OPTION "PUBLIC"."Thread_count" = '0'
go
SET OPTION "PUBLIC"."Thread_stack" = '4096'
go
SET OPTION "PUBLIC"."Thread_swaps" = '18'
go
SET OPTION "PUBLIC"."Timestamp_format" = 'YYYY-MM-DD HH:NN:SS.SSS'
go
SET OPTION "PUBLIC"."Time_format" = 'HH:NN:SS.SSS'
go
SET OPTION "PUBLIC"."Wait_for_commit" = 'Off'
go
SET OPTION "PUBLIC"."Quoted_identifier" = 'On'
go
SET OPTION "PUBLIC"."Allow_nulls_by_default" = 'On'
go
SET OPTION "PUBLIC"."Automatic_timestamp" = 'Off'
go
SET OPTION "PUBLIC"."Query_plan_on_open" = 'Off'
go
SET OPTION "PUBLIC"."Cooperative_commits" = 'On'
go
SET OPTION "PUBLIC"."Cooperative_commit_timeout" = '250'
go
SET OPTION "PUBLIC"."Delayed_commits" = 'Off'
go
SET OPTION "PUBLIC"."Delayed_commit_timeout" = '500'
go
SET OPTION "PUBLIC"."Non_keywords" = ''
go
SET OPTION "PUBLIC"."SQL_flagger_error_level" = 'W'
go
SET OPTION "PUBLIC"."SQL_flagger_warning_level" = 'W'
go
SET OPTION "PUBLIC"."Ansi_blanks" = 'Off'
go
SET OPTION "PUBLIC"."Ansi_integer_overflow" = 'Off'
go
SET OPTION "PUBLIC"."String_rtruncation" = 'On'
go
SET OPTION "PUBLIC"."Divide_by_zero_error" = 'On'
go
SET OPTION "PUBLIC"."Ansinull" = 'On'
go
SET OPTION "PUBLIC"."Ansi_permissions" = 'On'
go
SET OPTION "PUBLIC"."Close_on_endtrans" = 'On'
go
SET OPTION "PUBLIC"."Tsql_variables" = 'Off'
go
SET OPTION "PUBLIC"."RI_Trigger_time" = 'After'
go
SET OPTION "PUBLIC"."Tsql_hex_constant" = 'On'
go
SET OPTION "PUBLIC"."Chained" = 'On'
go
SET OPTION "PUBLIC"."Nearest_century" = '50'
go
SET OPTION "PUBLIC"."Fire_triggers" = 'On'
go
SET OPTION "PUBLIC"."Background_priority" = 'Off'
go
SET OPTION "PUBLIC"."Login_mode" = 'Standard'
go
SET OPTION "PUBLIC"."Database_authentication" = ''
go
SET OPTION "PUBLIC"."Float_as_double" = 'Off'
go
SET OPTION "PUBLIC"."Default_timestamp_increment" = '1'
go
SET OPTION "PUBLIC"."Escape_character" = 'On'
go
SET OPTION "PUBLIC"."Prefetch" = 'On'
go
SET OPTION "PUBLIC"."Java_heap_size" = '1000000'
go
SET OPTION "PUBLIC"."Continue_after_raiserror" = 'On'
go
SET OPTION "PUBLIC"."Cis_option" = '0'
go
SET OPTION "PUBLIC"."Cis_rowset_size" = '50'
go
SET OPTION "PUBLIC"."Java_namespace_size" = '4000000'
go
SET OPTION "PUBLIC"."Java_page_buffer_size" = '50'
go
SET OPTION "PUBLIC"."Ansi_close_cursors_on_rollback" = 'Off'
go
SET OPTION "PUBLIC"."Max_statement_count" = '50'
go
SET OPTION "PUBLIC"."Max_cursor_count" = '50'
go
SET OPTION "PUBLIC"."Min_password_length" = '0'
go
SET OPTION "PUBLIC"."Auditing" = 'Off'
go
SET OPTION "PUBLIC"."Optimization_level" = '9'
go
SET OPTION "PUBLIC"."Extended_join_syntax" = 'On'
go
SET OPTION "PUBLIC"."Optimization_goal" = 'Response-time'
go
SET OPTION "PUBLIC"."Java_input_output" = 'Off'
go
SET OPTION "PUBLIC"."Truncate_with_auto_commit" = 'On'
go
SET OPTION "PUBLIC"."Auto_commit" = 'Off'
go
SET OPTION "PUBLIC"."Auto_refetch" = 'On'
go
SET OPTION "PUBLIC"."Bell" = 'On'
go
SET OPTION "PUBLIC"."Char_OEM_Translation" = 'Detect'
go
SET OPTION "PUBLIC"."Command_delimiter" = ';'
go
SET OPTION "PUBLIC"."Commit_on_exit" = 'On'
go
SET OPTION "PUBLIC"."Describe_Java_Format" = 'Varchar'
go
SET OPTION "PUBLIC"."Echo" = 'On'
go
SET OPTION "PUBLIC"."Headings" = 'On'
go
SET OPTION "PUBLIC"."Input_format" = 'ASCII'
go
SET OPTION "PUBLIC"."ISQL_log" = ''
go
SET OPTION "PUBLIC"."NULLS" = '(NULL)'
go
SET OPTION "PUBLIC"."On_error" = 'Prompt'
go
SET OPTION "PUBLIC"."Output_format" = 'ASCII'
go
SET OPTION "PUBLIC"."Output_length" = '0'
go
SET OPTION "PUBLIC"."Output_nulls" = ''
go
SET OPTION "PUBLIC"."Percent_as_comment" = 'On'
go
SET OPTION "PUBLIC"."Quiet" = 'Off'
go
SET OPTION "PUBLIC"."Screen_format" = 'Text'
go
SET OPTION "PUBLIC"."SQLConnect" = ''
go
SET OPTION "PUBLIC"."SQLStart" = ''
go
SET OPTION "PUBLIC"."Statistics" = '3'
go
SET OPTION "PUBLIC"."Truncation_length" = '30'
go
SET OPTION "PUBLIC"."Verify_all_columns" = 'Off'
go
SET OPTION "PUBLIC"."Delete_old_logs" = 'Off'
go
SET OPTION "PUBLIC"."Qualify_owners" = 'On'
go
SET OPTION "PUBLIC"."Quote_all_identifiers" = 'Off'
go
SET OPTION "PUBLIC"."Replication_error" = ''
go
SET OPTION "PUBLIC"."Subscribe_by_remote" = 'On'
go
SET OPTION "PUBLIC"."Verify_threshold" = '1000'
go
SET OPTION "PUBLIC"."Blob_threshold" = '256'
go
SET OPTION "PUBLIC"."Compression" = '6'
go
SET OPTION "PUBLIC"."External_remote_options" = 'Off'
go
SET OPTION "PUBLIC"."Save_remote_passwords" = 'On'
go
SET OPTION "PUBLIC"."Logon_type" = 'Standard'
go
commit work
go


-------------------------------------------------
--   Destroy userids
-------------------------------------------------

commit work
go

