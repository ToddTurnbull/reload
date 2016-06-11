from sqlalchemy import Boolean
from sqlalchemy import CheckConstraint
from sqlalchemy import Column
from sqlalchemy import create_engine
from sqlalchemy import Date
from sqlalchemy import DateTime
from sqlalchemy import DECIMAL
from sqlalchemy import ForeignKey
from sqlalchemy import func
from sqlalchemy import Index
from sqlalchemy import Integer
from sqlalchemy import PrimaryKeyConstraint
from sqlalchemy import Sequence
from sqlalchemy import String
from sqlalchemy import Text
from sqlalchemy import UniqueConstraint

from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy.orm import relationship
from sqlalchemy.orm import scoped_session
from sqlalchemy.orm import sessionmaker

import config
pg = "postgresql://{user}:{password}@localhost:{port}/{database}"
db = pg.format(**config.db)
engine = create_engine(db, echo=True)

session_factory = sessionmaker(bind=engine)
Session = scoped_session(session_factory)

Base = declarative_base()
Base.metadata.schema = "tempdb"
Base.metadata.naming_convention = {
  "ix": "%(table_name)s_%(column_0_name)s_index",
  "uq": "%(table_name)s_%(column_0_name)s_key",
  # "ck": "%(table_name)s_%(column_0_name)s_check",
  "fk": "%(table_name)s_%(column_0_name)s_%(referred_table_name)s_%(referred_column_0_name)s_fkey",
  "pk": "%(table_name)s_pkey"
}

class Data(Base):
  __tablename__ = "data"
  recordnumber = Column(String(5), nullable=False, unique=True)
  internalmemo = Column(Text)
  comments = Column(Text)
  recnum = Column(
    String(7),
    CheckConstraint(
      "left(RecNum, 3) = 'WRN'",
      name = "data_recnum_check"
    ),
    nullable=False,
    unique=True
  )
  org1 = Column(String(100))
  org2 = Column(String(70))
  org3 = Column(String(70))
  org4 = Column(String(70))
  org5 = Column(String(70))
  altorg = Column(Text)
  formerorg = Column(Text)
  xref = Column(Text)
  streetbuilding = Column(String(90))
  streetaddress = Column(String(90))
  streetcity = Column(String(40))
  mailcareof = Column(String(60))
  building = Column(String(90))
  address  = Column(String(90))
  city = Column(String(40))
  province = Column(String(25))
  postalcode = Column(String(7))
  accessibility = Column(Text)
  location = Column(String(60))
  intersection = Column(String(60))
  officephone = Column(Text)
  fax = Column(Text)
  email = Column(Text)
  www = Column(String(255))
  afterhoursphone = Column(Text)
  crisisphone = Column(Text)
  tddphone = Column(Text)
  data = Column(String(30))
  description = Column(Text)
  pubdescription = Column(Text)
  generalinfo = Column(Text)
  bnd = Column(Text)
  otherresource = Column(Text)
  fees = Column(Text)
  hours = Column(Text)
  dates = Column(Text)
  areaserved = Column(Text)
  eligibility = Column(Text)
  application = Column(Text)
  languages = Column(Text)
  contact1 = Column(String(60))
  contact1title = Column(String(120))
  contact1org = Column(String(90))
  contact1phone = Column(Text)
  contact2 = Column(String(60))
  contact2title = Column(String(120))
  printedmaterial = Column(Text)
  contact2org = Column(String(90))
  contact2phone = Column(Text)
  contact3 = Column(String(60))
  contact3title = Column(String(120))
  contact3org = Column(String(90))
  contact3phone = Column(Text)
  contact4 = Column(String(60))
  contact4title = Column(String(120))
  contact4org = Column(String(90))
  contact4phone = Column(Text)
  dateestablished = Column(String(60))
  elections = Column(String(120))
  funding = Column(Text)
  ddcode = Column(String(10))
  levelofservice = Column(String(60))
  subject = Column(Text)
  usedfor = Column(Text)
  blue = Column(Text)
  seealso = Column(Text)
  localsubjects = Column(Text)
  typeofrecord = Column(String(2))
  qualitylevel = Column(String(20))
  tobedeleted = Column(String(20))
  distribution = Column(Text)
  pub = Column(Text)
  sourceofinfo = Column(String(60))
  sourcetitle = Column(String(60))
  sourceorg = Column(String(60))
  sourcebuilding = Column(String(30))
  sourceaddress = Column(String(60))
  sourcecity = Column(String(30))
  sourceprovince = Column(String(2))
  sourcepostalcode = Column(String(7))
  sourcephone = Column(Text)
  collectedby = Column(String(40))
  datecollected = Column(String(10))
  createdby = Column(String(40))
  updatedby = Column(String(40))
  updatedate = Column(String(10))
  updateschedule = Column(String(10))
  historyofupdate = Column(String(10))
  lastmodified = Column(Text)
  org1_sort = Column(String(100))
  id = Column(Integer, primary_key=True)
  org_name_id = Column(Integer, nullable=False)

# delete?
class Thes(Base):
  __tablename__ = "thes"
  id = Column(Integer, primary_key=True)
  term = Column(String(60), nullable=False, index=True)
  note = Column(Text, nullable=False)
  action = Column(String(6))
  cat_id = Column(Integer, ForeignKey("thes_cat.id"))
  sort = Column(String(6))
  

# delete?
class ThesCat(Base):
  __tablename__ = "thes_cat"
  id = Column(Integer, primary_key=True)
  category = Column(String(30), nullable=False)

# delete?
class ThesTree(Base):
  __tablename__ = "thes_tree"
  id = Column(Integer, primary_key=True)
  term = Column(Text, nullable=False)
  parent_id = Column(Integer, ForeignKey("thes.id"))
  cat_id = Column(Integer, nullable=False)

# delete?
class City(Base):
  __tablename__ = "city"
  id = Column(Integer, primary_key=True)
  city = Column(String(20), nullable=False)

class Pub(Base):
  __tablename__ = "pub"
  id = Column(Integer, primary_key=True)
  code = Column(String(20), nullable=False, unique=True)
  title = Column(String(50), nullable=False, index=True)
  isdefault = Column(Boolean, nullable=False, default=False)
  lastUpdated = Column(DateTime)
  note = Column(Text)

# delete?
class ThesRelated(Base):
  __tablename__ = "thes_related"
  thes_id = Column(Integer, ForeignKey("thes.id"), nullable=False)
  related_id = Column(Integer, ForeignKey("thes.id"), nullable=False)
  __table_args__ = (
    PrimaryKeyConstraint("thes_id", "related_id"),
  )

# delete?
class ThesReject(Base):
  __tablename__ = "thes_reject"
  thes_id = Column(Integer, ForeignKey("thes.id"), nullable=False)
  accept_id = Column(Integer, ForeignKey("thes.id"), nullable=False)
  # SQLAlchemy needs a primary key
  __table_args__ = (
    PrimaryKeyConstraint("thes_id", "accept_id"),
  )

class AddressType(Base):
  __tablename__ = "tlkpaddresstype"
  id = Column(Integer, primary_key=True)
  name = Column(String(50), nullable=False)

class Address(Base):
  __tablename__ = "tbladdress"
  id = Column(Integer, primary_key=True)
  addresstypeid = Column(Integer, ForeignKey("tlkpaddresstype.id"), nullable=False)
  incareof = Column(String(60))
  building = Column(String(50))
  address = Column(String(50))
  city = Column(String(50), nullable=False)
  province = Column(String(2), default="ON")
  postalcode = Column(
    String(7),
    CheckConstraint(
      "postalcode ~* '[a-z][0-9][a-z] [0-9][a-z][0-9]'",
      name = "tbladdress_postalcode_check"
    )
  )
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
  
  type = relationship("AddressType") # many-to-one
  access = relationship(
    "Accessibility",
    secondary="tempdb.treladdressaccessibility",
    uselist=False # one-to-one
  )

  __table_args__ = (
    CheckConstraint("""
      (utm_x is null and utm_y is null)
      or
      (utm_x is not null and utm_y is not null)
      or
      (latitude is null and longitude is null)
      or
      (latitude is not null and longitude is not null)
      """,
      name = "tbladdress_check"
    ),
  )

class Accessibility(Base):
  __tablename__ = "tlkpaccessibility"
  id = Column(Integer, primary_key=True)
  name = Column(String(100), nullable=False)

class AddressAccessibility(Base):
  __tablename__ = "treladdressaccessibility"
  addressid = Column(Integer, ForeignKey("tbladdress.id"), primary_key=True)
  accessibilityid = Column(Integer, ForeignKey("tlkpaccessibility.id"), nullable=False)

class CommType(Base):
  __tablename__ = "tlkpcommtype"
  id = Column(Integer, primary_key=True)
  name = Column(String(50), nullable=False, unique=True)

class Comm(Base):
  __tablename__ = "tblcomm"
  id = Column(Integer, primary_key=True)
  commtypeid = Column(Integer, ForeignKey("tlkpcommtype.id"), nullable=False)
  value = Column(String(255), nullable=False, index=True)
  comment = Column(Text)

  type = relationship("CommType") # many-to-one

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
      """,
      name = "tblcomm_check"
    ),
  )

class Contact(Base):
  __tablename__ = "tblcontact"
  id = Column(Integer, primary_key=True)
  name = Column(String(60))
  title = Column(String(120))
  org = Column(String(90))
  comm = Column(Text)
  contacttype = Column(Integer, default=0, index=True)

class Service(Base):
  __tablename__ = "tblservice"
  id = Column(Integer, primary_key=True)
  description = Column(Text)
  eligibility = Column(Text)
  info = Column(Text)
  fees = Column(Text)
  hours = Column(Text)
  dates = Column(Text)
  application = Column(Text)
  updated = Column(DateTime)
  ciocdescription = Column(Text)
  cioceligibility = Column(Text)
  ciocapplication = Column(Text)

  language = relationship(
    "Language",
    secondary = "tempdb.trelservicelanguage",
    uselist = False # one-to-one
  )

  area = relationship(
    "Area",
    secondary = "tempdb.trelservicearea",
    uselist = False # one-to-one
  )

class Language(Base):
  __tablename__ = "tlkplanguage"
  id = Column(Integer, primary_key=True)
  name = Column(Text, nullable=False)

class ServiceLanguage(Base):
  __tablename__ = "trelservicelanguage"
  serviceid = Column(Integer, ForeignKey("tblservice.id"), nullable=False)
  languageid = Column(Integer, ForeignKey("tlkplanguage.id"), nullable=False)
  __table_args__ = (
    PrimaryKeyConstraint("serviceid", "languageid"),
  )

class Area(Base): # see also Areas for area
  __tablename__ = "tlkparea"
  id = Column(Integer, primary_key=True)
  name = Column(Text, nullable=False)

class ServiceArea(Base):
  __tablename__ = "trelservicearea"
  serviceid = Column(Integer, ForeignKey("tblservice.id"), nullable=False)
  areaid = Column(Integer, ForeignKey("tlkparea.id"), nullable=False)
  __table_args__ = (
    PrimaryKeyConstraint("serviceid", "areaid"),
  )

class OrgName(Base):
  __tablename__ = "tblorgname"
  id = Column(Integer, primary_key=True)
  orgnametypeid = Column(Integer, ForeignKey("tlkporgnametype.id"), nullable=False)
  name = Column(String(100), nullable=False, index=True)
  parentid = Column(Integer, ForeignKey("tblorgname.id"))
  level = Column(Integer)
  sort = Column(String(100), index=True)
  sort_key = Column(String(100), index=True)
  added = Column(DateTime, default=func.now())
  
  type = relationship("OrgNameType") # many-to-one
  orgs = relationship(
    "Org",
    secondary = "tempdb.org_names",
    back_populates = "names"
  )

class OrgNameType(Base):
  __tablename__ = "tlkporgnametype"
  id = Column(Integer, primary_key=True)
  type = Column(String(20), nullable=False)

class OrgNames(Base):
  __tablename__ = "org_names"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, ForeignKey("org.id"), nullable=False, index=True)
  org_name_id = Column(Integer, ForeignKey("tblorgname.id"), nullable=False, index=True)
  added = Column(DateTime, default=func.now())
  __table_args__ = (
    UniqueConstraint("org_id", "org_name_id"),
    Index("org_names_org_name_id_org_id_index", "org_name_id", "org_id")
  )

class Org(Base):
  __tablename__ = "org"
  id = Column(Integer, primary_key=True)
  org_name_id = Column(Integer, ForeignKey("tblorgname.id"), nullable=False)
  update_note = Column(Text)
  cic_id = Column(String(7), nullable=False, unique=True)
  updated = Column(DateTime, default=func.now())
  service_level = Column(String(60), nullable=False)
  created = Column(DateTime, nullable=False, default=func.now(), index=True)
  isactive = Column(Boolean, nullable=False, default=True, index=True)
  iscomplete = Column(Boolean, nullable=False, default=False, index=True)
  modified = Column(DateTime)
  established = Column(
    String(4),
    CheckConstraint(
      "established ~* '[1-2][0-9][0-9][0-9]'",
      name = "org_established_check"
    )
  )
  bn = Column(
    String(15),
    CheckConstraint(
      "bn ~* '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]RR[0-9][0-9][0-9][0-9]'",
      name = "org_bn_check"
    )
  )
  deleted = Column(DateTime)
  
  names = relationship(
    "OrgName",
    secondary = "tempdb.org_names",
    back_populates = "orgs"
  )

class OrgComm(Base):
  __tablename__ = "org_comm_rel"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, ForeignKey("org.id"), nullable=False)
  comm_id  = Column(Integer, ForeignKey("tblcomm.id"), nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  note = Column(Text)

class OrgAddress(Base):
  __tablename__ = "org_address_rel"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, ForeignKey("org.id"), nullable=False)
  address_id  = Column(Integer, ForeignKey("tbladdress.id"), nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  note = Column(String(100))
  label = Column(String(50))

class OrgContact(Base):
  __tablename__ = "org_contact_rel"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, ForeignKey("org.id"), nullable=False)
  contact_id  = Column(Integer, ForeignKey("tblcontact.id"), nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  note = Column(Text)

class OrgRelatedDeletions(Base):
  __tablename__ = "org_rel_del"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, nullable=False)
  rel_id = Column(Integer, nullable=False)
  added = Column(DateTime, nullable=False)
  note = Column(Text)
  deleted  = Column(DateTime, nullable=False)
  table_id = Column(Integer, nullable=False)

class OrgService(Base):
  __tablename__ = "org_service_rel"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, ForeignKey("org.id"), nullable=False)
  service_id = Column(Integer, ForeignKey("tblservice.id"), nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  note = Column(Text)

class OrgDeletions(Base):
  __tablename__ = "org_del"
  id = Column(Integer, primary_key=True)
  org_name_id = Column(Integer, nullable=False)
  update_note = Column(Text)
  cic_id = Column(String(7), nullable=False, unique=True)
  updated = Column(DateTime)
  service_level = Column(String(60))

class PubOrg(Base):
  __tablename__ = "pub_org"
  id = Column(Integer, primary_key=True)
  pub_id = Column(Integer, ForeignKey("pub.id"), nullable=False)
  org_id = Column(Integer, ForeignKey("org.id"), nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  org_contact_id = Column(
    Integer,
    # SQLAlchemy defaults to "on delete set null"?
    ForeignKey("org_contact_rel.id", ondelete="set null")
  )
  deleted = Column(DateTime)
  isActive = Column(Boolean, nullable=False, default=True)
  xml = Column(Text)
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
  uf = Column(Text)
  sn = Column(Text)
  bt = Column(String(100))
  nt = Column(Text)
  rt = Column(String(150))
  ca = Column(String(50))
  input = Column(String(50))
  act = Column(String(10), nullable=False)
  msg = Column(String(50))
  cr = Column(String(50))
  up = Column(String(50))
  sort = Column(String(100))
  comments = Column(Text)

class ThesRel(Base):
  __tablename__ =  "thes_rel"
  id = Column(Integer, primary_key=True)
  thes_id = Column(Integer, ForeignKey("thes_original.id"), nullable=False)
  rel_id  = Column(Integer, ForeignKey("thes_original.id"), nullable=False)
  rel_type = Column(String(2), nullable=False, index=True)
  ca = Column(Integer, ForeignKey("thes_cat.id"))
  sort_key = Column(String(100))
  comments = Column(Text)

class OrgThes(Base):
  __tablename__ =  "org_thes"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, ForeignKey("org.id"), nullable=False)
  thes_id = Column(Integer, ForeignKey("thes_original.id"), nullable=False)
  official_id = Column(Integer, ForeignKey("thes_original.id"), nullable=False)
  __table_args__ = (
    UniqueConstraint("org_id", "thes_id", "official_id"),
  )

class PubEntry(Base):
  __tablename__ =  "pub_entry"
  id = Column(Integer, primary_key=True)
  pub_org_id = Column(Integer, ForeignKey("pub_org.id"), nullable=False)
  entry = Column(Integer, nullable=False)
  pub_year = Column(
    Integer,
    CheckConstraint(
      "pub_year > 2000",
      name = "pub_entry_pub_year_check"
    ),
    nullable = False
  )
  __table_args__ = (
    UniqueConstraint("pub_org_id", "pub_year"),
    Index("pub_entry_pub_year_entry_index", "pub_year", "entry")
  )

class Areas(Base): # see also Area for tlkparea
  __tablename__ =  "area"
  id = Column(Integer, primary_key=True)
  name = Column(String(255), nullable=False)
  locatedin = Column(Integer, ForeignKey("area.id"))
  alt = String(255)
  __table_args__ = (
    UniqueConstraint("name", "locatedin"),
  )

class Taxonomy(Base):
  __tablename__ =  "taxonomy"
  id = Column(Integer, primary_key=True)
  name = Column(String(100), nullable=False, index=True)
  code = Column(String(19), unique=True)
  ispreferred = Column(Boolean, nullable=False)
  definition = Column(Text)
  created = Column(Date)
  modified = Column(Date, index=True)
  parentid = Column(Integer, ForeignKey("taxonomy.id"))
  cicmodified = Column(DateTime)

class TaxRel(Base):
  __tablename__ =  "taxrel"
  id = Column(Integer, primary_key=True)
  taxid = Column(Integer, ForeignKey("taxonomy.id"), nullable=False)
  relid = Column(Integer, ForeignKey("taxonomy.id"), nullable=False)
  reltype = Column(String(2), nullable=False)
  __table_args__ = (
    UniqueConstraint("taxid", "relid"),
  )

class Locations(Base):
  __tablename__ =  "locations"
  id = Column(Integer, primary_key=True)
  officialname = Column(String(100), nullable=False)
  locatedin = Column(Integer, ForeignKey("locations.id"))
  sortas = Column(String(100))
  displayas = Column(String(100))

class PubGroupName(Base):
  __tablename__ =  "pubgroupname"
  id = Column(Integer, primary_key=True)
  groupname = Column(String(50), nullable=False)

class PubGroup(Base):
  __tablename__ =  "pubgroup"
  id = Column(Integer, primary_key=True)
  pubid = Column(Integer, ForeignKey("pub.id"), nullable=False)
  groupid = Column(Integer, ForeignKey("pubgroupname.id"), nullable=False)
  __table_args__ = (
    UniqueConstraint("pubid", "groupid"),
  )

class OrgNotes(Base):
  __tablename__ =  "orgnotes"
  id = Column(Integer, primary_key=True)
  orgid = Column(Integer, ForeignKey("org.id"), nullable=False)
  notetype = Column(Integer, ForeignKey("orgnotetypes.id"), nullable=False)
  note = Column(Text, nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  modified = Column(DateTime)
  isactive = Column(Boolean, nullable=False, default=True)
  ispublic = Column(Boolean, nullable=False, default=True)
  alertdate = Column(Date)

class OrgNoteTypes(Base):
  __tablename__ =  "orgnotetypes"
  id = Column(Integer, primary_key=True)
  value = Column(String(30), nullable=False)

class PubThes(Base):
  __tablename__ =  "pubthes"
  id = Column(Integer, primary_key=True)
  pubid = Column(Integer, ForeignKey("pub.id"), nullable=False)
  thesid = Column(Integer, ForeignKey("thes_original.id"), nullable=False)
  isactive = Column(Boolean, nullable=False, default=True)
  __table_args__ = (
    UniqueConstraint("pubid", "thesid"),
  )

class TaxGroups(Base):
  __tablename__ = "taxgroups"
  id = Column(Integer, primary_key=True)
  taxgroup = Column(Integer, nullable=False)
  taxid = Column(Integer, ForeignKey("taxonomy.id"), nullable=False)
  isactive = Column(Boolean, nullable=False)
  haschildren = Column(Boolean, nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  islocal = Column(Boolean, nullable=False, default=False)
  modified = Column(DateTime)
  __table_args__ = (
    UniqueConstraint("taxgroup", "taxid"),
  )

class TempTaxGroup(Base):
  __tablename__ = "temptaxgroup"
  groupid = Column(Integer, nullable=False)
  taxcode = Column(String(13), nullable=False)
  # SQLAlchemy needs a primary key
  __table_args__ = (
    PrimaryKeyConstraint("groupid", "taxcode"),
  )

class TaxChanges(Base):
  __tablename__ = "taxchanges"
  changetype = Column(Integer, nullable=False)
  oldcode = Column(String(13), nullable=False)
  newcode = Column(String(13), nullable=False)
  oldname = Column(String(60), nullable=False)
  newname = Column(String(60), nullable=False)
  dateus = Column(String(10), nullable=False)
  # SQLAlchemy needs a primary key
  __table_args__ = (
    PrimaryKeyConstraint("changetype", "oldcode", "newcode"),
  )

class OrgUpdated(Base):
  __tablename__ = "orgupdated"
  id = Column(Integer, primary_key=True)
  orgid = Column(Integer, ForeignKey("org.id"), nullable=False)
  updated = Column(DateTime, nullable=False)
  __table_args__ = (
    UniqueConstraint("orgid", "updated"),
  )

class TaxLink(Base):
  __tablename__ = "taxlink"
  id = Column(Integer, primary_key=True)
  linkid = Column(Integer, ForeignKey("taxlinknote.id"), nullable=False)
  taxid = Column(Integer, ForeignKey("taxonomy.id"), nullable=False)
  __table_args__ = (
    UniqueConstraint("linkid", "taxid"),
  )

class OrgTaxLink(Base):
  __tablename__ = "orgtaxlink"
  id = Column(Integer, primary_key=True)
  orgid = Column(Integer, ForeignKey("org.id"), nullable=False)
  linkid = Column(Integer, ForeignKey("taxlinknote.id"), nullable=False)
  added = Column(DateTime, default=func.now())
  __table_args__ = (
    UniqueConstraint("orgid", "linkid"),
  )

class TaxLinkNote(Base):
  __tablename__ = "taxlinknote"
  id = Column(Integer, primary_key=True)
  note = Column(Text, nullable=False)

class Cioc(Base):
  __tablename__ = "cioc"
  id = Column(Integer, primary_key=True)
  pid = Column(Integer, ForeignKey("pub.id"), nullable=False)
  ptype = Column(Integer, nullable=False)
  xid = Column(Integer, ForeignKey("ciocexport.id"), nullable=False)
  __table_args__ = (
    UniqueConstraint("xid", "ptype", "pid"),
  )

class CiocExport(Base):
  __tablename__ = "ciocexport"
  id = Column(Integer, primary_key=True)
  updated = Column(DateTime)
  notes = Column(Text, nullable=False)

class TaxRelTemp(Base):
  __tablename__ = "taxreltemp"
  id = Column(Integer, primary_key=True)
  taxcode = Column(String(19), nullable=False)
  relcode = Column(String(19), nullable=False)
  reltype = Column(String(2), nullable=False)

class TempTaxNames(Base):
  __tablename__ = "temptaxnames"
  code = Column(String(19), nullable=False, index=True)
  name = Column(String(100), nullable=False)
  ispreferred = Column(Boolean, nullable=False)
  release = Column(Text)
  # SQLAlchemy needs a primary key
  __table_args__ = (
    PrimaryKeyConstraint("code", "name"),
  )

class TempTaxAlso(Base):
  __tablename__ = "temptaxalso"
  code = Column(String(19), nullable=False, index=True)
  see = Column(String(19), nullable=False, index=True)
  release = Column(Text)
  # SQLAlchemy needs a primary key
  __table_args__ = (
    PrimaryKeyConstraint("code", "see"),
  )

class TempTaxOld(Base):
  __tablename__ = "temptaxold"
  code = Column(String(19), nullable=False, index=True)
  old = Column(String(19), nullable=False, index=True)
  release = Column(Text)
  # SQLAlchemy needs a primary key
  __table_args__ = (
    PrimaryKeyConstraint("code", "old"),
  )

class TempTaxDetails(Base):
  __tablename__ = "temptaxdetails"
  code = Column(String(19), primary_key=True) # SQLAlchemy needs a primary key
  definition = Column(Text, nullable=False)
  created = Column(Date, nullable=False)
  modified = Column(Date, nullable=False)
  release = Column(Text)

class PubTax(Base):
  __tablename__ = "pubtax"
  id = Column(Integer, primary_key=True)
  pubid = Column(Integer, ForeignKey("pub.id"), nullable=False)
  taxid = Column(Integer, ForeignKey("taxlinknote.id"), nullable=False)
  added = Column(DateTime, nullable=False, default=func.now())
  __table_args__ = (
    UniqueConstraint("pubid", "taxid"),
  )

class ICAgency(Base):
  __tablename__ = "ic_agencies"
  id = Column(Integer, primary_key=True)
  orgid = Column(Integer, ForeignKey("org.id"), nullable=False, unique=True)
  cnd = Column(String(8))
  name_1 = Column(String(100))
  name_level_1 = Column(Integer)
  name_2 = Column(String(100))
  name_level_2 = Column(Integer)

class ICSite(Base):
  __tablename__ = "ic_agency_sites"
  id = Column(Integer, primary_key=True)
  agencyid = Column(Integer, ForeignKey("ic_agencies.id"), nullable=False)
  siteid = Column(Integer, ForeignKey("org.id"), nullable=False)
  cnd = Column(String(8))
  site_name = Column(String(200))
  site_name_level = Column(Integer)
  site_name_other = Column(String(3))
  __table_args__ = (
    UniqueConstraint("agencyid", "siteid"),
  )

class ICService(Base):
  __tablename__ = "ic_site_services"
  id = Column(Integer, primary_key=True)
  siteid = Column(Integer, ForeignKey("ic_site_services.id"), nullable=False)
  serviceid = Column(Integer, ForeignKey("org.id"), nullable=False)
  service_name_1 = Column(String(200))
  service_name_2 = Column(String(200))
  __table_args__ = (
    UniqueConstraint("siteid", "serviceid"),
  )

class PubTree(Base):
  __tablename__ = "pub_tree"
  id = Column(Integer, nullable=False, index=True)
  parent = Column(Integer, nullable=False, index=True)
  pub = Column(Integer, ForeignKey("pub.id"), nullable=False, index=True)
  note = Column(Text)
  depth = Column(Integer, nullable=False)
  __table_args__ = (
    PrimaryKeyConstraint("id", "parent"),
  )

class Site(Base):
  __tablename__ = "site"
  id = Column(Integer, primary_key=True)
  org_address_id = Column(Integer, ForeignKey("org_address_rel.id"), nullable=False, unique=True)
  context_id = Column(Integer, nullable=False, default=1)
  code = Column(String(20))

class OrgTree(Base):
  __tablename__ = "org_tree"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, ForeignKey("org.id"), nullable=False)
  super_id = Column(Integer, ForeignKey("org_tree.id"), nullable=False)

class OrgSite(Base):
  __tablename__ = "org_site"
  id = Column(Integer, primary_key=True)
  org_id = Column(Integer, ForeignKey("org.id"), nullable=False)
  site_id = Column(Integer, ForeignKey("site.id"), nullable=False)
  name = Column(String(100))
  note = Column(Text)
  label = Column(String(100))
  type = Column(Integer, nullable=False, default=3)
  __table_args__ = (
    UniqueConstraint("org_id", "site_id", "label"),
  )

class OrgSiteName(Base):
  __tablename__ = "org_site_name"
  id = Column(Integer, primary_key=True)
  org_site_id = Column(Integer, ForeignKey("org_site.id"), nullable=False)
  org_names_id = Column(Integer, ForeignKey("org_names.id"), nullable=False)

class OrgThesPub(Base):
  __tablename__ = "org_thes_pub"
  id = Column(Integer, primary_key=True)
  org_thes_id = Column(Integer, ForeignKey("org_thes.id"), nullable=False)
  pub_id = Column(Integer, ForeignKey("pub.id"), nullable=False)
  is_active = Column(Boolean, nullable=False, default=True)
  __table_args__ = (
    UniqueConstraint("org_thes_id", "pub_id"),
  )

class TempTaxActive(Base):
  __tablename__ = "temptaxactive"
  code = Column(String(25), primary_key=True) # SQLAlchemy needs a primary key

class TempCCAC(Base):
  __tablename__ = "tempccac"
  ext = Column(String(10), primary_key=True) # SQLAlchemy needs a primary key
  id = Column(String(10), nullable=False)
  name = Column(String(200), nullable=False)

class ContactComm(Base):
  __tablename__ = "contact_comm"
  id = Column(Integer, primary_key=True)
  contact_id = Column(Integer, ForeignKey("tblcontact.id"), nullable=False)
  comm_id = Column(Integer, ForeignKey("tblcomm.id"), nullable=False)
  type = Column(Integer)
  note = Column(String(50))
  added = Column(DateTime, nullable=False, default=func.now())

class External(Base):
  __tablename__ = "external"
  id = Column(Integer, primary_key=True)
  name = Column(String(50), nullable=False)
  field = Column(String(50), nullable=False)
  cic = Column(String(50), nullable=False)
  note = Column(Text, nullable=False)

class ExternalData(Base):
  __tablename__ = "external_data"
  id = Column(Integer, primary_key=True)
  external_type = Column(Integer, ForeignKey("external.id"), nullable=False)
  cic_id = Column(Integer, nullable=False)
  data = Column(Text, nullable=False)
  external_id = Column(String(50), nullable=False)
