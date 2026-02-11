#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Product Intelligence Platform – DB Init ==="

# 1. Start PostgreSQL
echo ""
echo "[1/4] Starting PostgreSQL container..."
docker compose -f "$SCRIPT_DIR/docker-compose.yml" up -d

# 2. Wait for readiness
echo "[2/4] Waiting for PostgreSQL to be ready..."
until docker exec product_ai_db pg_isready -U postgres -d product_ai > /dev/null 2>&1; do
    sleep 1
done
echo "       PostgreSQL is ready."

# 3. Apply schema
echo "[3/4] Applying schema.sql..."
docker exec -i product_ai_db psql -U postgres -d product_ai < "$SCRIPT_DIR/schema.sql"
echo "       Schema applied."

# 4. Seed data
echo "[4/4] Applying seed.sql..."
docker exec -i product_ai_db psql -U postgres -d product_ai < "$SCRIPT_DIR/seed.sql"
echo "       Seed data loaded."

# 5. Validation
echo ""
echo "=== Running Validation Queries ==="

echo ""
echo "--- Products with vendor offerings ---"
docker exec -i product_ai_db psql -U postgres -d product_ai <<'SQL'
SELECT p.name AS product, v.name AS vendor, vp.price, vp.stock_quantity, vp.vendor_rating, vp.delivery_days
FROM vendor_products vp
JOIN products p ON p.id = vp.product_id
JOIN vendors v ON v.id = vp.vendor_id
ORDER BY p.name, vp.price;
SQL

echo ""
echo "--- Reviews with product and vendor info ---"
docker exec -i product_ai_db psql -U postgres -d product_ai <<'SQL'
SELECT p.name AS product, v.name AS vendor, r.rating, LEFT(r.review_text, 60) AS review_snippet
FROM product_reviews r
JOIN vendor_products vp ON vp.id = r.vendor_product_id
JOIN products p ON p.id = vp.product_id
JOIN vendors v ON v.id = vp.vendor_id
ORDER BY p.name, r.rating DESC
LIMIT 10;
SQL

echo ""
echo "--- Cart contents with prices ---"
docker exec -i product_ai_db psql -U postgres -d product_ai <<'SQL'
SELECT c.user_id, p.name AS product, v.name AS vendor, vp.price, ci.quantity, (vp.price * ci.quantity) AS line_total
FROM cart_items ci
JOIN carts c ON c.id = ci.cart_id
JOIN vendor_products vp ON vp.id = ci.vendor_product_id
JOIN products p ON p.id = vp.product_id
JOIN vendors v ON v.id = vp.vendor_id
ORDER BY c.user_id, p.name;
SQL

echo ""
echo "--- Average price per product across vendors ---"
docker exec -i product_ai_db psql -U postgres -d product_ai <<'SQL'
SELECT p.name AS product, COUNT(vp.id) AS vendor_count, ROUND(AVG(vp.price), 2) AS avg_price, MIN(vp.price) AS min_price, MAX(vp.price) AS max_price
FROM vendor_products vp
JOIN products p ON p.id = vp.product_id
GROUP BY p.name
ORDER BY avg_price DESC;
SQL

echo ""
echo "=== DB Init Complete ==="
