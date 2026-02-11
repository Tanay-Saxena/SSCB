from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .routers import vendors, products, carts

app = FastAPI(
    title="Product Intelligence Platform API",
    description="Deterministic commerce API for multi-vendor product comparison",
    version="1.0.0",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(vendors.router)
app.include_router(products.router)
app.include_router(carts.router)


@app.get("/", tags=["health"])
def health_check():
    return {"status": "ok", "service": "Product Intelligence Platform API"}
