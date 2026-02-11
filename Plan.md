Product Intelligence Platform – Master Architecture Plan (v1 Locked)

0. Scope & Ownership
This project is a complete end-to-end multi-vendor commerce system built and maintained by a single developer.
It includes:
* Database layer (PostgreSQL via Docker)
* Backend API layer (FastAPI)
* AI intelligence layer (LangChain + LLM)
* Vector store layer (Chroma / FAISS)
* Frontend UI (React)
* Observability (LangSmith)
All layers must remain cleanly separated.

1. Tech Stack (Locked)
Frontend
* React
Backend
* FastAPI
* SQLAlchemy (ORM only, schema defined via schema.sql)
* Pydantic
Database
* PostgreSQL (Docker)
* Schema versioned in schema.sql
* Seeded via seed.sql
AI Layer
* LangChain
* OpenAI-compatible LLMs
* Tool-based retrieval only
* Deterministic-first logic
Vector Store
* Chroma or FAISS
* Used only for:
    * Review embeddings
    * Semantic product Q&A
* Not used for price, stock, or policy facts
Observability
* LangSmith (LLM tracing)
* Structured logging in backend

2. Infrastructure
Database
* Docker PostgreSQL instance
* Database name: product_ai
* Schema defined in schema.sql
* DB is source-of-truth for structured commerce data
* AI must never access DB directly

3. Database Schema (Locked via schema.sql)
Tables:
* vendors
* products
* vendor_products
* product_reviews
* carts
* cart_items
Key guarantees:
* Proper NOT NULL constraints
* CHECK constraints
* UNIQUE (vendor_id, product_id)
* ON DELETE CASCADE rules
* Indexed foreign keys
* Indexed search fields
* Numeric precision enforced
This schema is considered locked (v1).
Structural changes require versioning.

4. System Architecture
React UI
    ↓
FastAPI Backend (Deterministic APIs)
    ↓
PostgreSQL (Docker)

React UI
    ↓
AI Layer (LangChain Service)
    ↓
FastAPI Backend APIs
    ↓
PostgreSQL

AI Layer
    ↓
Vector Store (Chroma / FAISS)
Rules:
* AI never imports SQLAlchemy models
* AI never opens DB sessions
* AI only calls backend HTTP APIs
* Vector store never replaces structured truth

5. Backend Responsibilities (FastAPI)
Backend handles:
* CRUD operations
* Validation
* Deterministic filtering
* Aggregations
* Cart total calculations
* Vendor comparison queries
* Policy retrieval
Backend must:
* Use SQLAlchemy models aligned with schema.sql
* Return strict Pydantic response schemas
* Contain no AI reasoning logic

6. Core Commerce APIs
Vendor APIs
GET /vendors
GET /vendors/{vendor_id}
GET /vendors/{vendor_id}/policies
Product APIs
GET /products
GET /products/search?query=...
GET /products/{product_id}
GET /products/{product_id}/vendors
GET /products/{product_id}/reviews
Cart APIs
POST   /carts
GET    /carts/{cart_id}
POST   /carts/{cart_id}/items
DELETE /carts/{cart_id}/items/{item_id}
PATCH  /carts/{cart_id}/items/{item_id}
All APIs deterministic.

7. AI Layer Responsibilities
AI is an orchestration and reasoning layer.
AI must:
* Accept natural language queries
* Detect intent
* Extract constraints
* Call backend APIs via tool wrappers
* Apply deterministic filtering
* Use vector store for semantic review queries
* Generate structured JSON output
* Always return sources
AI must not:
* Access DB directly
* Mutate commerce data
* Guess prices
* Guess stock
* Infer policies not returned by API
If data missing:
{
  "answer": "insufficient data",
  "sources": []
}

8. AI Endpoints
POST /ai/product-qa
POST /ai/product-comparison
POST /ai/cart-optimization
POST /ai/budget-check

9. Vector Store Usage
Vector store (Chroma / FAISS) used for:
* Embedding product reviews
* Semantic similarity search
* Review summarization
* “Users say…” explanations
Vector store is NOT used for:
* Pricing
* Availability
* Policy data
* Cart totals
Structured DB remains truth.

10. Phased Execution Plan

Phase 0 – Architecture Lock (Complete)
* Tech stack finalized
* schema.sql locked
* Docker PostgreSQL running
* AI isolation defined

Phase 1 – Database Initialization
* Apply schema.sql
* Validate constraints
* Add seed.sql
* Manually test joins
* Confirm integrity

Phase 2 – Backend Implementation
* Implement all core commerce APIs
* Align SQLAlchemy models with schema.sql
* Add request validation
* Add response schemas
* Test with Swagger
No AI yet.

Phase 3 – AI Tool Layer
* Create HTTP client wrappers
* Connect AI to backend APIs
* Deterministic filtering only
* No LLM reasoning yet

Phase 4 – Deterministic AI Engine
* Implement constraint parsing
* Implement filtering logic
* Return structured JSON
Still no hallucination risk.

Phase 5 – LLM Integration
* Add LangChain chain
* Temperature = 0
* Strict system prompt
* JSON-only responses
* Tool-grounded output
Add LangSmith tracing.

Phase 6 – Vector Store Integration
* Embed reviews
* Store in Chroma / FAISS
* Add semantic search capability
* Integrate into AI review Q&A

Phase 7 – Frontend (React)
Build UI for:
* Product listing
* Product detail view
* Vendor comparison view
* Cart page
* AI assistant panel
Frontend consumes both:
* Backend APIs
* AI APIs

11. Observability
* Backend structured logging
* Error middleware
* LangSmith for LLM trace logging
* Clear separation of deterministic vs AI logic

12. Core Design Principles
* Deterministic first, AI second
* Database is truth
* APIs are contract
* AI is orchestrator
* Vector store is semantic layer only
* No hidden coupling
* Strict boundaries between layers
* Structured JSON outputs only

13. Final System Flow
User → React UI
React → Backend APIs
React → AI APIs
AI → Backend APIs
Backend → PostgreSQL
AI → Vector Store
Observability → LangSmith
