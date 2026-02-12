from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session, joinedload
from sqlalchemy import and_, or_
from typing import Optional

from ..database import get_db
from ..models import Product, VendorProduct, ProductReview
from ..schemas import ProductResponse, ProductDetailResponse, VendorProductResponse, ReviewResponse

router = APIRouter(prefix="/products", tags=["products"])


@router.get("", response_model=list[ProductResponse])
def list_products(category: Optional[str] = None, db: Session = Depends(get_db)):
    query = db.query(Product)
    if category:
        query = query.filter(Product.category.ilike(category))
    return query.all()


@router.get("/search", response_model=list[ProductResponse])
def search_products(query: str = Query(..., min_length=1), db: Session = Depends(get_db)):
    # Split query into words so "diwali gifts" matches products containing any term
    terms = query.strip().split()
    conditions = []
    for term in terms:
        pattern = f"%{term}%"
        conditions.append(
            (Product.name.ilike(pattern)) |
            (Product.brand.ilike(pattern)) |
            (Product.category.ilike(pattern)) |
            (Product.description.ilike(pattern))
        )
    return db.query(Product).filter(or_(*conditions)).all()


@router.get("/{product_id}", response_model=ProductDetailResponse)
def get_product(product_id: int, db: Session = Depends(get_db)):
    product = db.query(Product).filter(Product.id == product_id).first()
    if not product:
        raise HTTPException(status_code=404, detail="Product not found")
    return product


@router.get("/{product_id}/vendors", response_model=list[VendorProductResponse])
def get_product_vendors(product_id: int, db: Session = Depends(get_db)):
    product = db.query(Product).filter(Product.id == product_id).first()
    if not product:
        raise HTTPException(status_code=404, detail="Product not found")

    vps = (
        db.query(VendorProduct)
        .options(joinedload(VendorProduct.vendor))
        .filter(VendorProduct.product_id == product_id)
        .order_by(VendorProduct.price)
        .all()
    )
    return [
        VendorProductResponse(
            id=vp.id,
            vendor_id=vp.vendor_id,
            vendor_name=vp.vendor.name,
            price=float(vp.price),
            stock_quantity=vp.stock_quantity,
            vendor_rating=float(vp.vendor_rating) if vp.vendor_rating else None,
            delivery_days=vp.delivery_days,
            coupon_code=vp.coupon_code,
        )
        for vp in vps
    ]


@router.get("/{product_id}/reviews", response_model=list[ReviewResponse])
def get_product_reviews(product_id: int, db: Session = Depends(get_db)):
    product = db.query(Product).filter(Product.id == product_id).first()
    if not product:
        raise HTTPException(status_code=404, detail="Product not found")

    reviews = (
        db.query(ProductReview)
        .join(VendorProduct)
        .options(joinedload(ProductReview.vendor_product).joinedload(VendorProduct.vendor))
        .filter(VendorProduct.product_id == product_id)
        .order_by(ProductReview.rating.desc())
        .all()
    )
    return [
        ReviewResponse(
            id=r.id,
            rating=float(r.rating) if r.rating else None,
            review_text=r.review_text,
            vendor_name=r.vendor_product.vendor.name,
            created_at=r.created_at,
        )
        for r in reviews
    ]
