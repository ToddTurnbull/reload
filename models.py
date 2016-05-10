from sqlalchemy import Boolean
from sqlalchemy import CheckConstraint
from sqlalchemy import Column
from sqlalchemy import DateTime
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
  recnum = Column(String(7),
    CheckConstraint("left(RecNum, 3) = 'WRN'"),
    nullable=False, unique=True
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
  def __repr__(self):
    return "<Data (RecordNumber='{}')>".format(self.recordnumber)

class Thes(Base):
  __tablename__ = "thes"
  id = Column(Integer, primary_key=True)
  term = Column(String(60), nullable=False)
  note = Column(String, nullable=False)
  action = Column(String(6))
  cat_id = Column(Integer)
  sort = Column(String(6))
  def __repr__(self):
    return "<Thes (Term='{}')>".format(self.term)

class ThesCat(Base):
  __tablename__ = "thes_cat"
  id = Column(Integer, primary_key=True)
  category = Column(String(30), nullable=False)
  def __repr__(self):
    return "<ThesCat (Category='{}')>".format(self.category)

class ThesTree(Base):
  __tablename__ = "thes_tree"
  id = Column(Integer, primary_key=True)
  term = Column(String, nullable=False)
  parent_id = Column(Integer)
  cat_id = Column(Integer, nullable=False)
  def __repr__(self):
    return "<ThesTree (Term='{}')>".format(self.term)

class ThesData(Base):
  __tablename__ = "thes_data"
  id = Column(Integer, primary_key=True)
  thes_id = Column(Integer, nullable=False)
  data_id = Column(Integer, nullable=False)
  __table_args__ = (
    UniqueConstraint("thes_id", "data_id"),
  )
  def __repr__(self):
    return "<ThesData (Thes='{}', Data='{}')>".format(self.thes_id, self.data_id)

class City(Base):
  __tablename__ = "city"
  id = Column(Integer, primary_key=True)
  city = Column(String(20), nullable=False)
  def __repr__(self):
    return "<City (City='{}')>".format(self.city)

class Pub(Base):
  __tablename__ = "pub"
  id = Column(Integer, primary_key=True)
  code = Column(String(20), nullable=False, unique=True)
  title = Column(String(50), nullable=False)
  isdefault = Column(Boolean, nullable=False, default=False)
  lastUpdated = Column(DateTime)
  note = Column(String)
  def __repr__(self):
    return "<Pub (Code='{}', Title='{}')>".format(self.code, self.title)

class ThesRelated(Base):
  __tablename__ = "thes_related"
  thes_id = Column(Integer, nullable=False)
  related_id = Column(Integer, nullable=False)
  __table_args__ = (
    PrimaryKeyConstraint("thes_id", "related_id"),
  )
  def __repr__(self):
    return "<ThesRelated (Thes='{}', Related='{}')>".format(self.thes_id, self.related_id)

class BlueEntry(Base):
  __tablename__ = "blue_entry"
  entry = Column(Integer, nullable=False, unique=True)
  data_id = Column(Integer, primary_key=True)
  def __repr__(self):
    return "<BlueEntry (Entry='{}', Data='{}')>".format(self.entry, self.data_id)
