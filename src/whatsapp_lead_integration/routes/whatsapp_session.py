from flask import Blueprint, jsonify

whatsapp_session_bp = Blueprint("whatsapp_session", __name__)

@whatsapp_session_bp.route("/whatsapp-session")
def whatsapp_session():
    return jsonify({"status": "OK"})
