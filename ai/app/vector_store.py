import chromadb
from chromadb.config import Settings
import httpx
import os

from .config import BACKEND_URL

CHROMA_DIR = os.path.join(os.path.dirname(__file__), "..", "chroma_data")

_client = None
_collection = None


def get_chroma_client():
    global _client
    if _client is None:
        _client = chromadb.PersistentClient(path=CHROMA_DIR)
    return _client


def get_collection():
    global _collection
    if _collection is None:
        client = get_chroma_client()
        _collection = client.get_or_create_collection(
            name="product_reviews",
            metadata={"hnsw:space": "cosine"},
        )
    return _collection


def embed_reviews():
    """Fetch all reviews from the backend and embed them into ChromaDB."""
    http = httpx.Client(base_url=BACKEND_URL, timeout=10.0)
    collection = get_collection()

    # Get all products
    products = http.get("/products").json()

    documents = []
    metadatas = []
    ids = []

    for product in products:
        pid = product["id"]
        reviews = http.get(f"/products/{pid}/reviews").json()

        for review in reviews:
            if not review.get("review_text"):
                continue

            doc = (
                f"Product: {product['name']} | "
                f"Brand: {product['brand']} | "
                f"Category: {product['category']} | "
                f"Vendor: {review['vendor_name']} | "
                f"Rating: {review.get('rating', 'N/A')} | "
                f"Review: {review['review_text']}"
            )

            documents.append(doc)
            metadatas.append({
                "product_id": pid,
                "product_name": product["name"],
                "brand": product["brand"],
                "category": product["category"],
                "vendor_name": review["vendor_name"],
                "rating": float(review["rating"]) if review.get("rating") else 0.0,
                "review_id": review["id"],
            })
            ids.append(f"review_{review['id']}")

    if documents:
        # Upsert to handle re-runs
        collection.upsert(documents=documents, metadatas=metadatas, ids=ids)

    return len(documents)


def search_reviews(query: str, n_results: int = 5, product_name: str = None) -> list[dict]:
    """Semantic search across product reviews."""
    collection = get_collection()

    where_filter = None
    if product_name:
        where_filter = {"product_name": {"$eq": product_name}}

    results = collection.query(
        query_texts=[query],
        n_results=n_results,
        where=where_filter if where_filter else None,
    )

    output = []
    if results and results["documents"]:
        for i, doc in enumerate(results["documents"][0]):
            meta = results["metadatas"][0][i] if results["metadatas"] else {}
            distance = results["distances"][0][i] if results["distances"] else None
            output.append({
                "document": doc,
                "metadata": meta,
                "similarity": round(1 - distance, 3) if distance is not None else None,
            })

    return output
