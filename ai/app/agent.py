from langgraph.prebuilt import create_react_agent

from .config import OPENAI_API_KEY, OPENAI_BASE_URL, LLM_MODEL, LLM_TEMPERATURE
from .tools import ALL_TOOLS

SYSTEM_PROMPT = """You are a Product Intelligence Assistant for a multi-vendor e-commerce platform.

STRICT RULES:
1. ONLY answer using data returned by your tools. Never guess, infer, or hallucinate information.
2. For prices, stock levels, ratings, and policies — ONLY use exact values from tool results.
3. If the tools do not return the information needed, respond with: "I don't have sufficient data to answer that."
4. Always cite which tool/data source provided your information.
5. Never recommend a product, vendor, or action without data backing from your tools.
6. When comparing products or vendors, present ALL options from the data — do not selectively omit.
7. For cart and budget analysis, use exact arithmetic on the numbers from the tools.
8. Return clear, structured answers. Use tables or bullet points for comparisons.

CRITICAL WORKFLOW — ALWAYS FOLLOW:
- You do NOT know any product IDs, vendor IDs, or cart IDs in advance.
- When a user mentions a product by name, ALWAYS use search_products first to find it and get its ID.
- When a user mentions a vendor by name, ALWAYS use list_vendors first to find it and get its ID.
- Then use the ID from the search results to call other tools (get_product_details, compare_product_prices, etc.).
- NEVER guess or make up an ID number. Always discover IDs through search/list tools first.

AVAILABLE CAPABILITIES:
- Search and list products by name, brand, or category
- Get detailed product specifications
- Compare prices across vendors for a product
- Get customer reviews and ratings
- Check vendor return/exchange/cancellation policies
- View shopping cart contents and totals
- Check cart totals against budget limits

You do NOT have the ability to modify carts, place orders, or change any data."""


def _build_llm():
    """Build the LLM instance. Supports OpenAI-compatible APIs and Groq."""
    if OPENAI_BASE_URL and "groq.com" in OPENAI_BASE_URL:
        from langchain_groq import ChatGroq
        return ChatGroq(
            model=LLM_MODEL,
            temperature=LLM_TEMPERATURE,
            api_key=OPENAI_API_KEY,
        )
    else:
        from langchain_openai import ChatOpenAI
        kwargs = {
            "model": LLM_MODEL,
            "temperature": LLM_TEMPERATURE,
            "api_key": OPENAI_API_KEY,
        }
        if OPENAI_BASE_URL:
            kwargs["base_url"] = OPENAI_BASE_URL
        return ChatOpenAI(**kwargs)


_agent = None


def _create_agent():
    llm = _build_llm()
    return create_react_agent(llm, ALL_TOOLS, prompt=SYSTEM_PROMPT)


def get_agent():
    global _agent
    if _agent is None:
        _agent = _create_agent()
    return _agent


MAX_RETRIES = 5


def run_agent(query: str) -> dict:
    agent = get_agent()

    for attempt in range(MAX_RETRIES):
        try:
            result = agent.invoke({"messages": [{"role": "user", "content": query}]})
            break
        except Exception as e:
            import traceback
            traceback.print_exc()
            if attempt < MAX_RETRIES - 1:
                continue
            return {
                "answer": f"The AI agent encountered an error after {MAX_RETRIES} attempts. Please try again.",
                "sources": [],
                "tool_calls": [],
            }

    messages = result.get("messages", [])

    # Extract tool calls from message history
    tool_calls = []
    for msg in messages:
        if hasattr(msg, "tool_calls") and msg.tool_calls:
            for tc in msg.tool_calls:
                tool_calls.append({
                    "tool": tc["name"],
                    "input": tc["args"],
                })

    # Get the final AI response
    answer = ""
    for msg in reversed(messages):
        if hasattr(msg, "content") and msg.type == "ai" and msg.content:
            answer = msg.content
            break

    if not answer:
        answer = "I don't have sufficient data to answer that."

    return {
        "answer": answer,
        "sources": list(dict.fromkeys(tc["tool"] for tc in tool_calls)),
        "tool_calls": tool_calls,
    }
