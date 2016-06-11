from alchemy import *

# print(Base.metadata.tables)

print(Base.metadata.schema)

session = Session()

addresses = session.query(Address).filter_by(id=5571)

print(addresses)

address = addresses[0]

print(address.access.name)

print(session.identity_map)

print("Don't forget to session.close()")

if __name__ == "__main__":
  session.close()
