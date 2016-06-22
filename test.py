from alchemy import *

from collections import OrderedDict
from contextlib import contextmanager
from functools import wraps

import click
import json

# http://docs.sqlalchemy.org/en/rel_1_0/orm/session_basics.html
@contextmanager
def session_scope():
  """Provide a transactional scope around a series of operations."""
  click.echo("I am session_scope()")
  session = Session()
  try:
    yield session
    session.commit()
  except:
    session.rollback()
    raise
  finally:
    click.echo("Closing session")
    session.close()

def transactional(query_function):
  """Decorate a function to use session_scope()
  query_function should have only named arguments, including "session"
  """
  click.echo("I am transactional({})".format(query_function.__name__))
  @wraps(query_function)
  def wrapper(**kwargs):
    click.echo("I am transactional.wrapper({})".format(query_function.__name__))
    click.echo(query_function.__doc__)
    with session_scope() as session:
      return query_function(session=session, **kwargs)
  return wrapper

def jsonify(dict_function):
  """Decorate a function to return JSON instead of a dict"""
  click.echo("I am jsonify()")
  @wraps(dict_function)
  def wrapper(*args, **kwargs):
    dict_ = dict_function(*args, **kwargs)
    return json.dumps(dict_, sort_keys=False, indent=2)
  return wrapper

@transactional
def address(session=None, address_id=5571):
  """Test joining tbladdress to tlkpaddressaccessibility"""
  address = session.query(Address).filter_by(id=address_id).one()
  return_value = "Address {} is '{}'".format(address_id, address.access.name)
  print("Return value should be: {}".format(address.access.name))
  return return_value

@transactional
@jsonify
def test_org(session=None, org_id="WRN2000"):
  """Test joining org to: names, contacts, publications, addresses, etc"""
  org = session.query(Org).filter_by(cic_id=org_id).one()
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
  
@transactional
@jsonify
def test_thesaurus(session=None, thes_id=0):
  """Test joining thesaurus term to its related terms"""
  thes = session.query(Thesaurus).filter_by(id=thes_id).one()
  return OrderedDict([
    ("Term", thes.de),
    ("Related", [(rel.rel_type, rel.related.de) for rel in thes.relations]),
    ("Used for", [uf.related.de for uf in thes.used_fors]),
    ("See also", [sa.related.de for sa in thes.see_alsos]),
    ("Broader terms", [bt.related.de for bt in thes.broader_terms])
  ])

@transactional
@jsonify
def test_taxonomy(session=None, code="BD"):
  """Test joining taxonomy term to its related terms"""
  tax = session.query(Taxonomy).filter_by(code=code).one()
  return OrderedDict([
    ("Term", tax.name),
    ("Related", [
      (rel.reltype, rel.related.code, rel.related.name)
      for rel in tax.relations
    ])
  ])

@transactional
@jsonify
def test_pub(session=None, pub_id=527):
  """Test joining publication to its taxonomy terms"""
  pub = session.query(Pub).filter_by(id=pub_id).one()
  return OrderedDict([
    ("Title", pub.title),
    ("Taxonomy", [tax.note for tax in pub.taxonomy])
  ])

@transactional
@jsonify
def test_agency(session=None, agency_id=1214):
  """Test joining agency to its org, sites, services"""
  agency = session.query(ICAgency).filter_by(id=agency_id).one()
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

@transactional
@jsonify
def test_site(session=None, site_id=89):
  """Test joining site to its address"""
  site = session.query(Site).filter_by(id=site_id).one()
  return OrderedDict([
    ("Site", site.id),
    ("Address", (site.address.address, site.address.city))
  ])

@transactional
@jsonify
def test_org_site(session=None, org_id="WRN5575"):
  """List sites for an org record"""
  org = session.query(Org).filter_by(cic_id=org_id).one()
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
  print(address())
  print(test_org())
  print(test_thesaurus(thes_id=3))
  print(test_taxonomy(code="BD"))
  print(test_pub(pub_id=527))
  print(test_agency(agency_id=1214))
  print(test_site())
  print(test_org_site())

