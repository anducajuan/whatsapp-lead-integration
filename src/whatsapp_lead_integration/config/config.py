import os
from dotenv import load_dotenv

load_dotenv()  

class Config:
    FLASK_ENV = os.getenv("FLASK_ENV", "production")
    DEBUG = os.getenv("FLASK_DEBUG", False)
