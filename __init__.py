from flask import Flask
from flask_talisman import Talisman


def create_app():
    app = Flask(__name__)

    Talisman(
        app,
        force_https=False,
        strict_transport_security=False,
        session_cookie_secure=False,
        content_security_policy=None,
    )

    from service.routes import api
    app.register_blueprint(api)

    return app
