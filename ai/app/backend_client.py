import httpx
from typing import Optional

from .config import BACKEND_URL

_client = httpx.Client(base_url=BACKEND_URL, timeout=10.0)


def _get(path: str, params: Optional[dict] = None) -> dict | list:
    resp = _client.get(path, params=params)
    if resp.status_code == 404:
        return {"error": "Not found", "path": path}
    resp.raise_for_status()
    return resp.json()


# ── Vendors ──

def get_vendors() -> list[dict]:
    return _get("/vendors")


def get_vendor(vendor_id: int) -> dict:
    return _get(f"/vendors/{vendor_id}")


def get_vendor_policies(vendor_id: int) -> dict:
    return _get(f"/vendors/{vendor_id}/policies")


# ── Products ──

def get_products(category: Optional[str] = None) -> list[dict]:
    params = {"category": category} if category else None
    return _get("/products", params=params)


def search_products(query: str) -> list[dict]:
    return _get("/products/search", params={"query": query})


def get_product(product_id: int) -> dict:
    return _get(f"/products/{product_id}")


def get_product_vendors(product_id: int) -> list[dict]:
    return _get(f"/products/{product_id}/vendors")


def get_product_reviews(product_id: int) -> list[dict]:
    return _get(f"/products/{product_id}/reviews")


# ── Carts (read-only) ──

def get_cart(cart_id: int) -> dict:
    return _get(f"/carts/{cart_id}")
