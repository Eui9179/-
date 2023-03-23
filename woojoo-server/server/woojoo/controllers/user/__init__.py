from flask import Blueprint

user_bp = Blueprint("user", __name__, url_prefix="/api/user")

from woojoo.controllers.user.profile import *
