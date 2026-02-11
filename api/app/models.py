from sqlalchemy import (
    Column, Integer, Text, Numeric, DateTime, ForeignKey, UniqueConstraint, CheckConstraint
)
from sqlalchemy.dialects.postgresql import JSONB
from sqlalchemy.orm import relationship
from sqlalchemy.sql import func

from .database import Base


class Vendor(Base):
    __tablename__ = "vendors"

    id = Column(Integer, primary_key=True)
    name = Column(Text, nullable=False)
    description = Column(Text)
    return_policy_days = Column(Integer, nullable=False)
    exchange_policy_days = Column(Integer, nullable=False)
    cancellation_window_hours = Column(Integer)
    created_at = Column(DateTime, nullable=False, server_default=func.now())

    vendor_products = relationship("VendorProduct", back_populates="vendor")


class Product(Base):
    __tablename__ = "products"

    id = Column(Integer, primary_key=True)
    name = Column(Text, nullable=False)
    brand = Column(Text, nullable=False)
    category = Column(Text, nullable=False)
    description = Column(Text)
    specifications = Column(JSONB)
    created_at = Column(DateTime, nullable=False, server_default=func.now())

    vendor_products = relationship("VendorProduct", back_populates="product")


class VendorProduct(Base):
    __tablename__ = "vendor_products"
    __table_args__ = (
        UniqueConstraint("vendor_id", "product_id", name="unique_vendor_product"),
    )

    id = Column(Integer, primary_key=True)
    vendor_id = Column(Integer, ForeignKey("vendors.id", ondelete="CASCADE"), nullable=False)
    product_id = Column(Integer, ForeignKey("products.id", ondelete="CASCADE"), nullable=False)
    price = Column(Numeric(12, 2), nullable=False)
    stock_quantity = Column(Integer, nullable=False)
    vendor_rating = Column(Numeric(2, 1))
    delivery_days = Column(Integer)
    coupon_code = Column(Text)
    created_at = Column(DateTime, nullable=False, server_default=func.now())

    vendor = relationship("Vendor", back_populates="vendor_products")
    product = relationship("Product", back_populates="vendor_products")
    reviews = relationship("ProductReview", back_populates="vendor_product")


class ProductReview(Base):
    __tablename__ = "product_reviews"

    id = Column(Integer, primary_key=True)
    vendor_product_id = Column(Integer, ForeignKey("vendor_products.id", ondelete="CASCADE"), nullable=False)
    rating = Column(Numeric(2, 1))
    review_text = Column(Text)
    created_at = Column(DateTime, nullable=False, server_default=func.now())

    vendor_product = relationship("VendorProduct", back_populates="reviews")


class Cart(Base):
    __tablename__ = "carts"

    id = Column(Integer, primary_key=True)
    user_id = Column(Text, nullable=False)
    budget_limit = Column(Numeric(12, 2))
    created_at = Column(DateTime, nullable=False, server_default=func.now())

    items = relationship("CartItem", back_populates="cart", cascade="all, delete-orphan")


class CartItem(Base):
    __tablename__ = "cart_items"

    id = Column(Integer, primary_key=True)
    cart_id = Column(Integer, ForeignKey("carts.id", ondelete="CASCADE"), nullable=False)
    vendor_product_id = Column(Integer, ForeignKey("vendor_products.id", ondelete="CASCADE"), nullable=False)
    quantity = Column(Integer, nullable=False)
    added_at = Column(DateTime, nullable=False, server_default=func.now())

    cart = relationship("Cart", back_populates="items")
    vendor_product = relationship("VendorProduct")
