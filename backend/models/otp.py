from sqlalchemy import Boolean, Column, DateTime, ForeignKey , String , Integer
from testdb.db import Base , engine
from models.users import User
from datetime import datetime, timedelta

class OTP(Base):
    __tablename__ = "otps"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    otp_code = Column(String(8), nullable=False)
    purpose = Column(String, nullable=False)
    expires_at = Column(DateTime, default=lambda: datetime.utcnow() + timedelta(minutes=5))
    is_used = Column(Boolean, default=False)
    created_at = Column(DateTime, default=datetime.utcnow) 
