from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .routers import ai

app = FastAPI(
    title="Product Intelligence Platform — AI Service",
    description="AI-powered product Q&A, comparison, and cart optimization",
    version="1.0.0",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(ai.router)


@app.get("/", tags=["health"])
def health_check():
    return {"status": "ok", "service": "Product Intelligence Platform — AI Service"}
