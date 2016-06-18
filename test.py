from alchemy import *
from collections import OrderedDict
import json

print("Starting session")
session = Session()
print("Don't forget to session.close()")

def jsonify(sort_keys=False, indent=2):
  """Decorate a function to return JSON instead of a dict"""
  def jsonified(dict_function):
    def wrapper(*args, **kwargs):
      dict_ = dict_function(*args, **kwargs)
      return json.dumps(dict_, sort_keys=sort_keys, indent=indent)
    return wrapper
  return jsonified

class MetaTest(object):
  """Do stuff with Base.metadata"""
  def schema(self):
    """Show schema"""
    return Base.metadata.schema

class AddressTest(object):
  """Create an Address object from tbladdress.id"""
  def __init__(self, address_id):
    self.address_id = address_id
  def query(self):
    """Get address item from database"""
    return session.query(Address).filter_by(id=self.address_id).one()

class OrgTest(object):
  """Create an Org object from org.id"""
  def __init__(self, org_id):
    self.org_id = org_id
  def query(self):
    """Get org item from database"""
    return session.query(Org).filter_by(cic_id=self.org_id).one()

class ThesaurusTest(object):
  """Create a Thesaurus object from thes_original.id"""
  def __init__(self, thes_id):
    self.thes_id = thes_id
  def query(self):
    """Get thesaurus item from database"""
    return session.query(Thesaurus).filter_by(id=self.thes_id).one()

class AreasTest(object):
  """Create an Areas object from area.name"""
  def __init__(self, area_name):
    self.area_name = area_name
  def query(self):
    """Get area item from database"""
    return session.query(Areas).filter_by(name=self.area_name).one()

class TaxonomyTest(object):
  """Create a Taxonomy object from taxonomy.code"""
  def __init__(self, code):
    self.code = code
  def query(self):
    """Get taxonomy item from database"""
    return session.query(Taxonomy).filter_by(code=self.code).one()

class PubTest(object):
  """Create a Publication item from pub.id"""
  def __init__(self, pub_id):
    self.pub_id = pub_id
  def query(self):
    """Get publication from database"""
    return session.query(Pub).filter_by(id=self.pub_id).one()

class AgencyTest(object):
  """Create an Agency item from ic_agencies.id"""
  def __init__(self, agency_id):
    self.agency_id = agency_id
  def query(self):
    """Get agency from database"""
    return session.query(ICAgency).filter_by(id=self.agency_id).one()

class SiteTest(object):
  """Create a Site item from site.id"""
  def __init__(self, site_id):
    self.site_id = site_id
  def query(self):
    """Get site from database"""
    return session.query(Site).filter_by(id=self.site_id).one()

def test_meta():
  """Do stuff with MetaTest"""
  meta = MetaTest()
  return "The schema is '{}'".format(meta.schema())

def test_address(address_id):
  """Test joining tbladdress to tlkpaddressaccessibility"""
  address = AddressTest(address_id).query()
  return "Address {} is '{}'".format(address_id, address.access.name)

@jsonify()
def test_org(org_id):
  """Test joining org to: names, contacts, publications, addresses, etc"""
  org = OrgTest(org_id).query()
  return OrderedDict([
    ("Names", [name.name for name in org.names]),
    ("Alternate Names", [name.name for name in org.alt_names]),
    ("Contacts", [(contact.name, len(contact.comms)) for contact in org.contacts]),
    ("Publications/Contacts", [
      (pub.pub.title, pub.contact.name) if pub.contact
      else (pub.pub.title, None) 
      for pub in org.pubs
    ]),
    ("Postal codes", [address.postalcode for address in org.addresses]),
    ("Service Description", org.service.description),
    ("Thesaurus Terms", [thes.de for thes in org.thes_official]),
    ("Notes", [note.note for note in org.notes]),
    ("Update History", [str(update.updated) for update in org.updates]),
    ("Taxonomy", [
      {
        link.note: [tax.name for tax in link.taxonomy]
      }
      for link in org.taxonomy_links
    ]),
    ("Agency", "Is an agency" if org.ic_agency else "Is not an agency")
  ])
  
@jsonify(sort_keys=True)
def test_thesaurus(thes_id):
  """Test joining thesaurus term to its related terms"""
  thes = ThesaurusTest(thes_id).query()
  return OrderedDict([
    ("Term", thes.de),
    ("Related", [(rel.rel_type, rel.related.de) for rel in thes.relations]),
    ("Used for", [uf.related.de for uf in thes.used_fors]),
    ("See also", [sa.related.de for sa in thes.see_alsos]),
    ("Broader terms", [bt.related.de for bt in thes.broader_terms])
  ])

@jsonify()
def test_taxonomy(code):
  """Test joining taxonomy term to its related terms"""
  tax = TaxonomyTest(code).query()
  return OrderedDict([
    ("Term", tax.name),
    ("Related", [
      (rel.reltype, rel.related.code, rel.related.name)
      for rel in tax.relations
    ])
  ])

@jsonify()
def test_pub(pub_id):
  """Test joining publication to its taxonomy terms"""
  pub = PubTest(pub_id).query()
  return OrderedDict([
    ("Title", pub.title),
    ("Taxonomy", [tax.note for tax in pub.taxonomy])
  ])

@jsonify()
def test_agency(agency_id):
  """Test joining agency to its org, sites, services"""
  agency = AgencyTest(agency_id).query()
  return OrderedDict([
    ("Agency", agency.id),
    ("Org", [name.name for name in agency.org.names]),
    ("Sites", [site.site_name for site in agency.sites]),
    ("Services", [
      (
        site.site_name,
        [(service.service_name_1, service.service_name_2) for service in site.services]
      )
      for site in agency.sites
    ])
  ])

@jsonify()
def test_site(site_id):
  """Test joining site to its address"""
  site = SiteTest(site_id).query()
  return OrderedDict([
    ("Site", site.id),
    ("Address", (site.address.address, site.address.city))
  ])

@jsonify()
def test_org_site(org_id):
  """List sites for an org record"""
  org = OrgTest(org_id).query()
  return OrderedDict([
    ("Org", [name.name for name in org.names]),
    ("Sites", [OrderedDict([
      ("Label", site.label),
      ("Site Name", site.name),
      ("Site Address City", site.site.address.city),
      ("Org Name", site.org_name.name.name if site.org_name else None)
      ]) for site in org.sites
    ])
  ])

if __name__ == "__main__":
  print(test_meta())
  print(test_address(5571))
  print(test_org("WRN4535"))
  print(test_thesaurus(3))
  print(test_taxonomy("BD"))
  print(test_pub(527))
  print(test_org("WRN2000"))
  print(test_agency(1214))
  print(test_site(89))
  print(test_org_site("WRN5575"))

  area = AreasTest("Waterloo Region").query()
  print [includes.name for includes in area.surrounds]
  print area.surrounded_by.name
  print area.surrounded_by.surrounded_by.name

  session.close()
