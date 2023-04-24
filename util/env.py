import os
from dotenv import load_dotenv

load_dotenv(".env")

MONGO_URI = os.environ.get("MONGO_URI", "mongodb://localhost:27017/")
MONGO_DATABASE = os.environ.get("MONGO_DATABASE", "users")
TOKEN = os.environ.get("TOKEN", "token")
URL = "amizone.fly.dev:443"
