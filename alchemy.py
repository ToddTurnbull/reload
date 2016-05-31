from sqlalchemy import Boolean
from sqlalchemy import CheckConstraint
from sqlalchemy import Column
from sqlalchemy import DateTime
from sqlalchemy import DECIMAL
from sqlalchemy import func
from sqlalchemy import Integer
from sqlalchemy import PrimaryKeyConstraint
from sqlalchemy import Sequence
from sqlalchemy import String
from sqlalchemy import UniqueConstraint

from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
Base.metadata.schema = "tempdb"

class Data(Base):
  __tablename__ = "data"
  recordnumber = Column(String(5), nullable=False, unique=True)
  internalmemo = Column(String)
  comments = Column(String)
  recnum = Column(
    String(7),
    CheckConstraint("left(RecNum, 3) = 'WRN'"),
    nullable=False,
    unique=True
  )
  org1 = Column(String(100))
  org2 = Column(String(70))
  org3 = Column(String(70))
  org4 = Column(String(70))
  org5 = Column(String(70))
  altorg = Column(String)
  formerorg = Column(String)
  xref = Column(String)
  streetbuilding = Column(String(90))
  streetaddress = Column(String(90))
  streetcity = Column(String(40))
  mailcareof = Column(String(60))
  building = Column(String(90))
  address  = Column(String(90))
  city = Column(String(40))
  province = Column(String(25))
  postalcode = Column(String(7))
  accessibility = Column(String)
  location = Column(String(60))
  intersection = Column(String(60))
  officephone = Column(String)
  fax = Column(String)
  email = Column(String)
  www = Column(String(255))
  afterhoursphone = Column(String)
  crisisphone = Column(String)
  tddphone = Column(String)
  data = Column(String(30))
  description = Column(String)
  pubdescription = Column(String)
  generalinfo = Column(String)
  bnd = Column(String)
  otherresource = Column(String)
  fees = Column(String)
  hours = Column(String)
  dates = Column(String)
  areaserved = Column(String)
  eligibility = Column(String)
  application = Column(String)
  languages = Column(String)
  contact1 = Column(String(60))
  contact1title = Column(String(120))
  contact1org = Column(String(90))
  contact1phone = Column(String)
  contact2 = Column(String(60))
  contact2title = Column(String(120))
  printedmaterial = Column(String)
  contact2org = Column(String(90))
  contact2phone = Column(String)
  contact3 = Column(String(60))
  contact3title = Column(String(120))
  contact3org = Column(String(90))
  contact3phone = Column(String)
  contact4 = Column(String(60))
  contact4title = Column(String(120))
  contact4org = Column(String(90))
  contact4phone = Column(String)
  dateestablished = Column(String(60))
  elections = Column(String(120))
  funding = Column(String)
  ddcode = Column(String(10))
  levelofservice = Column(String(60))
  subject = Column(String)
  usedfor = Column(String)
  blue = Column(String)
  seealso = Column(String)
  localsubjects = Column(String)
  typeofrecord = Column(String(2))
  qualitylevel = Column(String(20))
  tobedeleted = Column(String(20))
  distribution = Column(String)
  pub = Column(String)
  sourceofinfo = Column(String(60))
  sourcetitle = Column(String(60))
  sourceorg = Column(String(60))
  sourcebuilding = Column(String(30))
  sourceaddress = Column(String(60))
  sourcecity = Column(String(30))
  sourceprovince = Column(String(2))
  sourcepostalcode = Column(String(7))
  sourcephone = Column(String)
  collectedby = Column(String(40))
  datecollected = Column(String(10))
  createdby = Column(String(40))
  updatedby = Column(String(40))
  updatedate = Column(String(10))
  updateschedule = Column(String(10))
  historyofupdate = Column(String(10))
  lastmodified = Column(String)
  org1_sort = Column(String(100))
  id = Column(Integer, primary_key=True)
  org_name_id = Column(Integer, nullable=False)

class Thes(Base):
  __tablename__ = "thes"
  id = Column(Integer, primary_key=True)
  term = Column(String(60), nullable=False)
  note = Column(String, nullable=False)
  action = Column(String(6))
  cat_id = Column(Integer)
  sort = Column(String(6))

class ThesCat(Base):
  __tablename__ = "thes_cat"
  id = Column(Integer, primary_key=True)
  category = Column(String(30), nullable=False)

class ThesTree(Base):
  __tablename__ = "thes_tree"
  id = Column(Integer, primary_key=True)
  term = Column(String, nullable=False)
  parent_id = Column(Integer)
  cat_id = Column(Integer, nullable=False)

class City(Base):
  __tablename__ = "city"
  id = Column(Integer, primary_key=True)
  city = Column(String(20), nullable=False)

class Pub(Base):
  __tablename__ = "pub"
  id = Column(Integer, primary_key=True)
  code = Column(String(20), nullable=False, unique=True)
  title = Column(String(50), nullable=False)
  isdefault = Column(Boolean, nullable=False, default=False)
  lastUpdated = Column(DateTime)
  note = Column(String)

class ThesRelated(Base):
  __tablename__ = "thes_related"
  thes_id = Column(Integer, nullable=False)
  related_id = Column(Integer, nullable=False)
  __table_args__ = (
    PrimaryKeyConstraint("thes_id", "related_id"),
  )

class ThesReject(Base):
  __tablename__ = "thes_reject"
  thes_id = Column(Integer, nullable=False)
  accept_id = Column(Integer, nullable=False)
  # SQLAlchemy needs a primary key
  __table_args__ = (
    PrimaryKeyConstraint("thes_id", "accept_id"),
  )

class AddressType(Base):
  __tablename__ = "tlkpaddresstype"
  id = Column(Integer, primary_key=True)
  name = Column(String(50), nullable=False)

class Address(Base):
  __tablename__ = "address"
  id = Column(Integer, primary_key=True)
  addresstypeid = Column(Integer, nullable=False)
  incareof = Column(String(60))
  building = Column(String(50))
  address = Column(String(50))
  city = Column(String(50))
  province = Column(String(2), default="ON")
  postalcode = Column(String(7), CheckConstraint("postalcode ~* '[a-z][0-9][a-z] [0-9][a-z][0-9]'"))
  intersection = Column(String(255))
  unit = Column(String(10))
  unitvalue = Column(String(10))
  streetnumber = Column(String(10))
  streetsuffix = Column(String(10))
  streetdirection = Column(String(2))
  unitextra = Column(String(25))
  deliverynumber = Column(String(10))
  deliverystation = Column(String(30))
  deliverymode = Column(String(20))
  busroute = Column(String(50))
  utm_x = Column(Integer)
  utm_y = Column(Integer)
  ismappable = Column(Boolean)
  latitude = Column(DECIMAL(11,9))
  longitude = Column(DECIMAL(11,9))
  __table_args__ = (
    CheckConstraint("""
      (utm_x is null and utm_y is null)
      or
      (utm_x is not null and utm_y is not null)
      or
      (latitude is null and longitude is null)
      or
      (latitude is not null and longitude is not null)
    """),
  )

class Accessibility(Base):
  __tablename__ = "tlkpaccessibility"
  id = Column(Integer, primary_key=True)
  name = Column(String(100), nullable=False)

class AddressAccessibility(Base):
  __tablename__ = "treladdressaccessibility"
  addressid = Column(Integer, primary_key=True)
  accessibilityid = Column(Integer, nullable=False)

class CommType(Base):
  __tablename__ = "tlkpcommtype"
  id = Column(Integer, primary_key=True)
  name = Column(String(50), nullable=False, unique=True)

class Comm(Base):
  __tablename__ = "tblcomm"
  id = Column(Integer, primary_key=True)
  commtypeid = Column(Integer, nullable=False)
  value = Column(String(255), nullable=False)
  comment = Column(String())
  __table_args__ = (
    CheckConstraint("""
      (commtypeid in (1, 2, 3, 5, 6) and value ~* '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
      or
      (commtypeid = 2 and value = '911')
      or
      (commtypeid = 4 and value like '_%@%.%')
      or
      (commtypeid = 7 and value like '%.__%')
      or
      commtypeid > 7
    """),
  )

class Contact(Base):
  __tablename__ = "tblcontact"
  id = Column(Integer, primary_key=True)
  name = Column(String(60))
  title = Column(String(120))
  org = Column(String(90))
  comm = Column(String())
  contacttype = Column(Integer, default=0)

class Service(Base):
  __tablename__ = "tblservice"
  id = Column(Integer, primary_key=True)
  description = Column(String())
  eligibility = Column(String())
  info = Column(String())
  fees = Column(String())
  hours = Column(String())
  dates = Column(String())
  application = Column(String())
  updated = Column(DateTime)
  ciocdescription = Column(String())
  cioceligibility = Column(String())
  ciocapplication = Column(String())

class Language(Base):
  __tablename__ = "tlkplanguage"
  id = Column(Integer, primary_key=True)
  name = Column(String(), nullable=False)

class ServiceLanguage(Base):
  __tablename__ = "trelservicelanguage"
  serviceid = Column(Integer, nullable=False)
  languageid = Column(Integer, nullable=False)
  __table_args__ = (
    PrimaryKeyConstraint("serviceid", "languageid"),
  )

class Area(Base):
  __tablename__ = "tlkparea"
  id = Column(Integer, primary_key=True)
  name = Column(String(), nullable=False)

class ServiceArea(Base):
  __tablename__ = "trelservicearea"
  serviceid = Column(Integer, nullable=False)
  areaid = Column(Integer, nullable=False)
  __table_args__ = (
    PrimaryKeyConstraint("serviceid", "areaid"),
  )

class OrgName(Base):
  __tablename__ = "tblorgname"
  id = Column(Integer, primary_key=True)
  orgnametypeid = Column(Integer, nullable=False)
  name = Column(String(100), nullable=False)
  parentid = Column(Integer)
  level = Column(Integer)
  sort = Column(String(100))
  sort_key = Column(String(100))
  added = Column(DateTime, default=func.now())

class OrgNameType(Base):
  __tablename__ = "tlkporgnametype"
  id = Column(Integer, primary_key=True)
  type = Column(String(20), nullable=False)

class OrgNames(Base):
  __tablename__ = "org_names"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, nullable=False)
  org_name_id = Column(Integer, nullable=False)
  added = Column(DateTime, default=func.now())
  __table_args__ = (
    UniqueConstraint("org_id", "org_name_id"),
  )

class Org(Base):
  __tablename__ = "org"
  id = Column(Integer, primary_key=True)
  org_name_id = Column(Integer, nullable=False)
  update_note = Column(String())
  cic_id = Column(String(7), nullable=False, unique=True)
  updated = Column(DateTime, default=func.now())
  service_level = Column(String(60), nullable=False)
  created = Column(DateTime, nullable=False, default=func.now())
  isactive = Column(Boolean, nullable=False, default=True)
  iscomplete = Column(Boolean, nullable=False, default=False)
  modified = Column(DateTime)
  established = Column(String(4), CheckConstraint("established ~* '[1-2][0-9][0-9][0-9]'"))
  bn = Column(String(15), CheckConstraint("bn ~* '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]RR[0-9][0-9][0-9][0-9]'"))
  deleted = Column(DateTime)

class OrgComm(Base):
  __tablename__ = "org_comm_rel"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, nullable=False)
  comm_id  = Column(Integer, nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  note = Column(String())

class OrgAddress(Base):
  __tablename__ = "org_address_rel"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, nullable=False)
  address_id  = Column(Integer, nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  note = Column(String(100))
  label = Column(String(50))

class OrgContact(Base):
  __tablename__ = "org_contact_rel"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, nullable=False)
  contact_id  = Column(Integer, nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  note = Column(String())

class OrgRelatedDeletions(Base):
  __tablename__ = "org_rel_del"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, nullable=False)
  rel_id = Column(Integer, nullable=False)
  added = Column(DateTime, nullable=False)
  note = Column(String())
  deleted  = Column(DateTime, nullable=False)
  table_id = Column(Integer, nullable=False)

class OrgService(Base):
  __tablename__ = "org_service_rel"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, nullable=False)
  service_id = Column(Integer, nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  note = Column(String())

class OrgDeletions(Base):
  __tablename__ = "org_del"
  id = Column(Integer, primary_key=True)
  org_name_id = Column(Integer, nullable=False)
  update_note = Column(String())
  cic_id = Column(String(7), nullable=False, unique=True)
  updated = Column(DateTime)
  service_level = Column(String(60))

class PubOrg(Base):
  __tablename__ = "pub_org"
  id = Column(Integer, primary_key=True)
  pub_id = Column(Integer, nullable=False)
  org_id = Column(Integer, nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  org_contact_id = Column(Integer, nullable=False)
  deleted = Column(DateTime)
  isActive = Column(Boolean, nullable=False, default=True)
  xml = Column(String())
  __table_args__ = (
    UniqueConstraint("pub_id", "org_id"),
  )

class Thesaurus(Base):
  __tablename__ =  "thes_original"
  id = Column(Integer, primary_key=True)
  de = Column(String(100), nullable = False, unique=True)
  use = Column(String(100))
  woo = Column(String(1))
  eq = Column(String(100))
  uf = Column(String())
  sn = Column(String())
  bt = Column(String(100))
  nt = Column(String())
  rt = Column(String(150))
  ca = Column(String(50))
  input = Column(String(50))
  act = Column(String(10), nullable=False)
  msg = Column(String(50))
  cr = Column(String(50))
  up = Column(String(50))
  sort = Column(String(100))
  comments = Column(String())
