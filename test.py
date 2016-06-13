from alchemy import *

# print(Base.metadata.tables)

print(Base.metadata.schema)

session = Session()

addresses = session.query(Address).filter_by(id=5571)

print(addresses)

address = addresses[0]

print(address.access.name)

print(session.identity_map)

org = session.query(Org).filter_by(cic_id="WRN2000").first()

print([comm.org.id for comm in org.comms])

print([[name.name for name in comm.org.names] for contact in org.contacts])

print("Don't forget to session.close()")

if __name__ == "__main__":
  session.close()
