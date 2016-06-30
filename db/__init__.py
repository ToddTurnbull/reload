from contextlib import contextmanager
from functools import wraps

from sqlalchemy import create_engine

from sqlalchemy.orm import scoped_session
from sqlalchemy.orm import sessionmaker

import click
import json

import config

pg = "postgresql://{user}:{password}@localhost:{port}/{database}"
db = pg.format(**config.db)
engine = create_engine(db, echo=False)

session_factory = sessionmaker(bind=engine)
Session = scoped_session(session_factory)

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


