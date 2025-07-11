from flask import Flask, jsonify
from .routes import whatsapp_session_bp
from .config import Config



def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    app.register_blueprint(whatsapp_session_bp)
    return app


app = create_app()


