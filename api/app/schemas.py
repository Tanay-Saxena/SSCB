from pydantic import BaseModel
from datetime import datetime
from typing import Optional, Any


# ── Vendor ──

class VendorResponse(BaseModel):
    id: int
    name: str
    description: Optional[str] = None
    created_at: datetime

    model_config = {"from_attributes": True}


class VendorPolicyResponse(BaseModel):
    id: int
    name: str
    return_policy_days: int
    exchange_policy_days: int
    cancellation_window_hours: Optional[int] = None

    model_config = {"from_attributes": True}


# ── Product ──

class ProductResponse(BaseModel):
    id: int
    name: str
    brand: str
    category: str
    description: Optional[str] = None
    created_at: datetime

    model_config = {"from_attributes": True}


class ProductDetailResponse(ProductResponse):
    specifications: Optional[Any] = None


# ── Vendor Product (price comparison) ──

class VendorProductResponse(BaseModel):
    id: int
    vendor_id: int
    vendor_name: str
    price: float
    stock_quantity: int
    vendor_rating: Optional[float] = None
    delivery_days: Optional[int] = None
    coupon_code: Optional[str] = None

    model_config = {"from_attributes": True}


# ── Review ──

class ReviewResponse(BaseModel):
    id: int
    rating: Optional[float] = None
    review_text: Optional[str] = None
    vendor_name: str
    created_at: datetime

    model_config = {"from_attributes": True}


# ── Cart ──

class CartItemCreate(BaseModel):
    vendor_product_id: int
    quantity: int = 1


class CartItemUpdate(BaseModel):
    quantity: int


class CartCreate(BaseModel):
    user_id: str
    budget_limit: Optional[float] = None


class CartItemResponse(BaseModel):
    id: int
    vendor_product_id: int
    product_name: str
    vendor_name: str
    price: float
    quantity: int
    line_total: float

    model_config = {"from_attributes": True}


class CartResponse(BaseModel):
    id: int
    user_id: str
    budget_limit: Optional[float] = None
    items: list[CartItemResponse]
    cart_total: float
    created_at: datetime

    model_config = {"from_attributes": True}
