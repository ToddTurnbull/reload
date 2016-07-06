from flask import Flask
from .context import Session

app = Flask(__name__)

import edit.views

# http://flask.pocoo.org/docs/0.10/patterns/sqlalchemy/
@app.teardown_appcontext
def shutdown_session(exception=None):
  print("shutdown_session() says bye!")
  Session.remove()

