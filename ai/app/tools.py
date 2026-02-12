import json
from langchain_core.tools import tool
from typing import Optional

from . import backend_client
from .vector_store import search_reviews as _search_reviews


@tool
def list_vendors() -> str:
    """Get all available vendors in the marketplace. Returns vendor names, descriptions, and IDs."""
    result = backend_client.get_vendors()
    return json.dumps(result)


@tool
def get_vendor_details(vendor_id: int) -> str:
    """Get details for a specific vendor by ID. Returns name, description, and creation date."""
    result = backend_client.get_vendor(vendor_id)
    return json.dumps(result)


@tool
def get_vendor_policies(vendor_id: int) -> str:
    """Get return, exchange, and cancellation policies for a specific vendor.
    Returns return_policy_days, exchange_policy_days, and cancellation_window_hours."""
    result = backend_client.get_vendor_policies(vendor_id)
    return json.dumps(result)


@tool
def list_products(category: Optional[str] = None) -> str:
    """List all products, optionally filtered by category.
    Valid categories include: electronics, accessories, home.
    Returns product names, brands, categories, and descriptions."""
    result = backend_client.get_products(category)
    return json.dumps(result)


@tool
def search_products(query: str) -> str:
    """Search for products by name, brand, or category.
    Use this when the user mentions a product by name or brand.
    Returns matching products with names, brands, categories, and descriptions."""
    result = backend_client.search_products(query)
    return json.dumps(result)


@tool
def get_product_details(product_id: int) -> str:
    """Get full details for a specific product including specifications (CPU, RAM, battery, etc.).
    Use this when the user asks about specs or technical details of a product."""
    result = backend_client.get_product(product_id)
    return json.dumps(result)


@tool
def compare_product_prices(product_id: int) -> str:
    """Get all vendor offerings for a product, sorted by price (lowest first).
    Returns price, stock quantity, vendor rating, delivery days, and coupon codes per vendor.
    Use this for price comparison across vendors."""
    result = backend_client.get_product_vendors(product_id)
    return json.dumps(result)


@tool
def get_product_reviews(product_id: int) -> str:
    """Get all customer reviews for a product across all vendors.
    Returns ratings (0-5), review text, and which vendor the review is for.
    Use this when the user asks about reviews, ratings, or what customers think."""
    result = backend_client.get_product_reviews(product_id)
    return json.dumps(result)


@tool
def get_cart_contents(cart_id: int) -> str:
    """Get the contents of a shopping cart including all items, their prices, quantities,
    line totals, the overall cart total, and the budget limit if set.
    Use this to analyze cart contents, check totals, or compare against budget."""
    result = backend_client.get_cart(cart_id)
    return json.dumps(result)


@tool
def semantic_review_search(query: str, product_name: Optional[str] = None) -> str:
    """Search product reviews using semantic similarity. Use this when the user asks
    things like 'what do users say about...', 'how do people feel about...', or
    'find reviews mentioning...'. This searches review TEXT meaning, not just keywords.
    Optionally filter by product_name to scope to a specific product."""
    results = _search_reviews(query, n_results=5, product_name=product_name)
    return json.dumps(results)


ALL_TOOLS = [
    list_vendors,
    get_vendor_details,
    get_vendor_policies,
    list_products,
    search_products,
    get_product_details,
    compare_product_prices,
    get_product_reviews,
    get_cart_contents,
    semantic_review_search,
]
