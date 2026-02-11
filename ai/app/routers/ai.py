from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from typing import Optional

from ..agent import run_agent
from .. import backend_client

router = APIRouter(prefix="/ai", tags=["ai"])


class QueryRequest(BaseModel):
    query: str


class CartQueryRequest(BaseModel):
    cart_id: int
    query: Optional[str] = None


class AIResponse(BaseModel):
    answer: str
    sources: list[str]
    tool_calls: list[dict]


@router.post("/product-qa", response_model=AIResponse)
def product_qa(body: QueryRequest):
    """Answer general product questions — specs, features, reviews, comparisons."""
    result = run_agent(body.query)
    return AIResponse(**result)


@router.post("/product-comparison", response_model=AIResponse)
def product_comparison(body: QueryRequest):
    """Compare products across vendors — price, rating, delivery, coupons."""
    result = run_agent(
        f"Compare products across vendors for the following request: {body.query}"
    )
    return AIResponse(**result)


@router.post("/cart-optimization", response_model=AIResponse)
def cart_optimization(body: CartQueryRequest):
    """Analyze a cart and suggest cheaper alternatives or optimizations."""
    query = body.query or "Analyze this cart and suggest ways to save money."
    result = run_agent(
        f"Look at cart ID {body.cart_id}. {query} "
        f"For each item, check if cheaper vendor options exist."
    )
    return AIResponse(**result)


@router.post("/budget-check", response_model=AIResponse)
def budget_check(body: CartQueryRequest):
    """Check if a cart's total is within the budget limit."""
    try:
        cart = backend_client.get_cart(body.cart_id)
    except Exception:
        raise HTTPException(status_code=404, detail="Cart not found")

    budget = cart.get("budget_limit")
    total = cart.get("cart_total", 0)

    if budget is None:
        return AIResponse(
            answer=f"Cart #{body.cart_id} has no budget limit set. Current total: ${total:.2f}.",
            sources=["get_cart_contents"],
            tool_calls=[{"tool": "get_cart_contents", "input": {"cart_id": body.cart_id}}],
        )

    within_budget = total <= budget
    remaining = budget - total

    items_summary = []
    for item in cart.get("items", []):
        items_summary.append(
            f"- {item['product_name']} from {item['vendor_name']}: "
            f"${item['price']:.2f} x {item['quantity']} = ${item['line_total']:.2f}"
        )

    status = "WITHIN BUDGET" if within_budget else "OVER BUDGET"
    answer = (
        f"**Budget Check for Cart #{body.cart_id}**\n\n"
        f"**Status: {status}**\n\n"
        f"Items:\n" + "\n".join(items_summary) + "\n\n"
        f"Cart Total: ${total:.2f}\n"
        f"Budget Limit: ${budget:.2f}\n"
        f"{'Remaining' if within_budget else 'Over by'}: ${abs(remaining):.2f}"
    )

    return AIResponse(
        answer=answer,
        sources=["get_cart_contents"],
        tool_calls=[{"tool": "get_cart_contents", "input": {"cart_id": body.cart_id}}],
    )
