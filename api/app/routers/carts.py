from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session, joinedload

from ..database import get_db
from ..models import Cart, CartItem, VendorProduct
from ..schemas import CartCreate, CartItemCreate, CartItemUpdate, CartResponse, CartItemResponse

router = APIRouter(prefix="/carts", tags=["carts"])


def _build_cart_response(cart: Cart) -> CartResponse:
    items = []
    cart_total = 0.0
    for ci in cart.items:
        vp = ci.vendor_product
        price = float(vp.price)
        line_total = price * ci.quantity
        cart_total += line_total
        items.append(CartItemResponse(
            id=ci.id,
            vendor_product_id=ci.vendor_product_id,
            product_name=vp.product.name,
            vendor_name=vp.vendor.name,
            price=price,
            quantity=ci.quantity,
            line_total=line_total,
        ))
    return CartResponse(
        id=cart.id,
        user_id=cart.user_id,
        budget_limit=float(cart.budget_limit) if cart.budget_limit else None,
        items=items,
        cart_total=cart_total,
        created_at=cart.created_at,
    )


def _get_cart_or_404(cart_id: int, db: Session) -> Cart:
    cart = (
        db.query(Cart)
        .options(
            joinedload(Cart.items)
            .joinedload(CartItem.vendor_product)
            .joinedload(VendorProduct.vendor),
            joinedload(Cart.items)
            .joinedload(CartItem.vendor_product)
            .joinedload(VendorProduct.product),
        )
        .filter(Cart.id == cart_id)
        .first()
    )
    if not cart:
        raise HTTPException(status_code=404, detail="Cart not found")
    return cart


@router.post("", response_model=CartResponse, status_code=201)
def create_cart(body: CartCreate, db: Session = Depends(get_db)):
    cart = Cart(user_id=body.user_id, budget_limit=body.budget_limit)
    db.add(cart)
    db.commit()
    db.refresh(cart)
    cart = _get_cart_or_404(cart.id, db)
    return _build_cart_response(cart)


@router.get("/{cart_id}", response_model=CartResponse)
def get_cart(cart_id: int, db: Session = Depends(get_db)):
    cart = _get_cart_or_404(cart_id, db)
    return _build_cart_response(cart)


@router.post("/{cart_id}/items", response_model=CartResponse, status_code=201)
def add_cart_item(cart_id: int, body: CartItemCreate, db: Session = Depends(get_db)):
    cart = db.query(Cart).filter(Cart.id == cart_id).first()
    if not cart:
        raise HTTPException(status_code=404, detail="Cart not found")

    vp = db.query(VendorProduct).filter(VendorProduct.id == body.vendor_product_id).first()
    if not vp:
        raise HTTPException(status_code=404, detail="Vendor product not found")

    item = CartItem(cart_id=cart_id, vendor_product_id=body.vendor_product_id, quantity=body.quantity)
    db.add(item)
    db.commit()
    cart = _get_cart_or_404(cart_id, db)
    return _build_cart_response(cart)


@router.delete("/{cart_id}/items/{item_id}", response_model=CartResponse)
def remove_cart_item(cart_id: int, item_id: int, db: Session = Depends(get_db)):
    item = db.query(CartItem).filter(CartItem.id == item_id, CartItem.cart_id == cart_id).first()
    if not item:
        raise HTTPException(status_code=404, detail="Cart item not found")

    db.delete(item)
    db.commit()
    cart = _get_cart_or_404(cart_id, db)
    return _build_cart_response(cart)


@router.patch("/{cart_id}/items/{item_id}", response_model=CartResponse)
def update_cart_item(cart_id: int, item_id: int, body: CartItemUpdate, db: Session = Depends(get_db)):
    item = db.query(CartItem).filter(CartItem.id == item_id, CartItem.cart_id == cart_id).first()
    if not item:
        raise HTTPException(status_code=404, detail="Cart item not found")

    item.quantity = body.quantity
    db.commit()
    cart = _get_cart_or_404(cart_id, db)
    return _build_cart_response(cart)
