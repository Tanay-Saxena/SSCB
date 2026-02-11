-- =========================================
-- PRODUCT INTELLIGENCE PLATFORM
-- LOCKED SCHEMA v1
-- =========================================

-- -----------------------------------------
-- Drop existing tables (safe reset)
-- -----------------------------------------

DROP TABLE IF EXISTS public.cart_items CASCADE;
DROP TABLE IF EXISTS public.product_reviews CASCADE;
DROP TABLE IF EXISTS public.vendor_products CASCADE;
DROP TABLE IF EXISTS public.carts CASCADE;
DROP TABLE IF EXISTS public.products CASCADE;
DROP TABLE IF EXISTS public.vendors CASCADE;

-- -----------------------------------------
-- vendors
-- -----------------------------------------

CREATE TABLE public.vendors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    return_policy_days INTEGER NOT NULL CHECK (return_policy_days >= 0),
    exchange_policy_days INTEGER NOT NULL CHECK (exchange_policy_days >= 0),
    cancellation_window_hours INTEGER CHECK (cancellation_window_hours >= 0),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
);

-- -----------------------------------------
-- products
-- -----------------------------------------

CREATE TABLE public.products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    brand TEXT NOT NULL,
    category TEXT NOT NULL,
    description TEXT,
    specifications JSONB,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_products_name ON public.products(name);
CREATE INDEX idx_products_category ON public.products(category);

-- -----------------------------------------
-- vendor_products (core comparison table)
-- -----------------------------------------

CREATE TABLE public.vendor_products (
    id SERIAL PRIMARY KEY,
    vendor_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    price NUMERIC(12,2) NOT NULL CHECK (price >= 0),
    stock_quantity INTEGER NOT NULL CHECK (stock_quantity >= 0),
    vendor_rating NUMERIC(2,1) CHECK (vendor_rating >= 0 AND vendor_rating <= 5),
    delivery_days INTEGER CHECK (delivery_days >= 0),
    coupon_code TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_vendor
        FOREIGN KEY (vendor_id)
        REFERENCES public.vendors(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES public.products(id)
        ON DELETE CASCADE,

    CONSTRAINT unique_vendor_product
        UNIQUE (vendor_id, product_id)
);

CREATE INDEX idx_vendor_products_product_id 
ON public.vendor_products(product_id);

CREATE INDEX idx_vendor_products_vendor_id 
ON public.vendor_products(vendor_id);

-- -----------------------------------------
-- product_reviews
-- -----------------------------------------

CREATE TABLE public.product_reviews (
    id SERIAL PRIMARY KEY,
    vendor_product_id INTEGER NOT NULL,
    rating NUMERIC(2,1) CHECK (rating >= 0 AND rating <= 5),
    review_text TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_review_vendor_product
        FOREIGN KEY (vendor_product_id)
        REFERENCES public.vendor_products(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_reviews_vendor_product 
ON public.product_reviews(vendor_product_id);

-- -----------------------------------------
-- carts
-- -----------------------------------------

CREATE TABLE public.carts (
    id SERIAL PRIMARY KEY,
    user_id TEXT NOT NULL,
    budget_limit NUMERIC(12,2) CHECK (budget_limit >= 0),
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_carts_user_id ON public.carts(user_id);

-- -----------------------------------------
-- cart_items
-- -----------------------------------------

CREATE TABLE public.cart_items (
    id SERIAL PRIMARY KEY,
    cart_id INTEGER NOT NULL,
    vendor_product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    added_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_cart
        FOREIGN KEY (cart_id)
        REFERENCES public.carts(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_cart_vendor_product
        FOREIGN KEY (vendor_product_id)
        REFERENCES public.vendor_products(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_cart_items_cart_id 
ON public.cart_items(cart_id);

CREATE INDEX idx_cart_items_vendor_product_id 
ON public.cart_items(vendor_product_id);

-- =========================================
-- SCHEMA LOCKED
-- =========================================
