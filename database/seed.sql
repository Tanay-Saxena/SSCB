-- =========================================
-- PRODUCT INTELLIGENCE PLATFORM
-- SEED DATA v1
-- =========================================

-- -----------------------------------------
-- vendors
-- -----------------------------------------

INSERT INTO public.vendors (name, description, return_policy_days, exchange_policy_days, cancellation_window_hours) VALUES
('TechHub',     'Premium electronics retailer with fast shipping',           30, 30, 24),
('MegaMart',    'Large marketplace with competitive pricing',                15, 15, 12),
('PrimeDeals',  'Budget-friendly store with frequent discounts',             7,  14, 6),
('ValueStore',  'Trusted seller with excellent customer service',            45, 45, 48);

-- -----------------------------------------
-- products
-- -----------------------------------------

INSERT INTO public.products (name, brand, category, description, specifications) VALUES
(
    'UltraBook Pro 15',
    'NovaTech',
    'electronics',
    'High-performance laptop with 15-inch Retina display',
    '{"cpu": "M3 Pro", "ram": "16GB", "storage": "512GB SSD", "display": "15.3 inch Retina", "battery": "22 hours"}'
),
(
    'AirSound Max',
    'SonicWave',
    'electronics',
    'Noise-cancelling over-ear headphones with spatial audio',
    '{"driver": "40mm", "battery": "30 hours", "noise_cancellation": "active", "connectivity": "Bluetooth 5.3"}'
),
(
    'SmartWatch Ultra',
    'FitPulse',
    'electronics',
    'Advanced fitness tracker with GPS and health monitoring',
    '{"display": "1.9 inch AMOLED", "battery": "72 hours", "water_resistance": "100m", "sensors": ["heart rate", "SpO2", "temperature"]}'
),
(
    'PowerBank 20K',
    'ChargeTech',
    'accessories',
    'Portable charger with 20000mAh capacity and fast charging',
    '{"capacity": "20000mAh", "output": "65W USB-C PD", "ports": 3, "weight": "350g"}'
),
(
    'ErgoDesk Stand',
    'WorkFlow',
    'home',
    'Adjustable standing desk converter with monitor arm',
    '{"height_range": "6-20 inches", "weight_capacity": "35 lbs", "surface": "32 x 22 inches", "material": "bamboo"}'
),
(
    'MechKey 75',
    'TypeCraft',
    'accessories',
    'Compact mechanical keyboard with hot-swappable switches',
    '{"layout": "75%", "switches": "Gateron Pro", "backlight": "RGB", "connectivity": "USB-C / Bluetooth", "battery": "4000mAh"}'
),
(
    'ClearView Monitor 27',
    'PixelPro',
    'electronics',
    '27-inch 4K IPS monitor with USB-C hub',
    '{"resolution": "3840x2160", "panel": "IPS", "refresh_rate": "60Hz", "ports": ["USB-C 90W", "HDMI 2.1", "DisplayPort 1.4"], "hdr": "HDR400"}'
),
(
    'AirPure Mini',
    'BreathEasy',
    'home',
    'Compact HEPA air purifier for rooms up to 300 sq ft',
    '{"filter": "True HEPA H13", "coverage": "300 sq ft", "noise": "24 dB", "modes": ["auto", "sleep", "turbo"]}'
);

-- -----------------------------------------
-- vendor_products
-- -----------------------------------------

INSERT INTO public.vendor_products (vendor_id, product_id, price, stock_quantity, vendor_rating, delivery_days, coupon_code) VALUES
-- UltraBook Pro 15 (product 1)
(1, 1, 1899.99, 25, 4.8, 2, NULL),
(2, 1, 1849.00, 40, 4.5, 4, 'MEGA10'),
(3, 1, 1799.99, 10, 4.2, 5, 'DEAL200'),
(4, 1, 1879.00, 15, 4.7, 3, NULL),

-- AirSound Max (product 2)
(1, 2, 349.99, 100, 4.9, 1, NULL),
(2, 2, 329.00, 200, 4.4, 3, 'MEGA5'),
(3, 2, 299.99, 50, 4.1, 6, 'SOUND30'),

-- SmartWatch Ultra (product 3)
(1, 3, 449.00, 60, 4.7, 2, NULL),
(2, 3, 425.00, 80, 4.6, 3, NULL),
(4, 3, 439.99, 35, 4.8, 2, 'VALUE10'),

-- PowerBank 20K (product 4)
(2, 4, 49.99, 500, 4.3, 2, NULL),
(3, 4, 39.99, 300, 4.0, 4, 'CHEAP5'),

-- ErgoDesk Stand (product 5)
(1, 5, 299.00, 20, 4.6, 5, NULL),
(4, 5, 279.99, 30, 4.5, 4, 'ERGO20'),

-- MechKey 75 (product 6)
(1, 6, 129.99, 75, 4.8, 2, NULL),
(2, 6, 119.00, 150, 4.5, 3, 'MEGA10'),
(3, 6, 109.99, 40, 4.3, 5, NULL),

-- ClearView Monitor 27 (product 7)
(1, 7, 549.99, 30, 4.7, 3, NULL),
(2, 7, 529.00, 45, 4.4, 4, 'MEGA15'),

-- AirPure Mini (product 8)
(3, 8, 89.99, 200, 4.2, 3, 'AIR10'),
(4, 8, 99.99, 120, 4.6, 2, NULL);

-- -----------------------------------------
-- product_reviews
-- -----------------------------------------

INSERT INTO public.product_reviews (vendor_product_id, rating, review_text) VALUES
-- UltraBook Pro 15 reviews
(1, 5.0, 'Incredible machine. The M3 Pro handles everything I throw at it. Battery easily lasts a full workday.'),
(1, 4.5, 'Great laptop but runs a bit warm under heavy load. Display is stunning.'),
(2, 4.0, 'Good price from MegaMart. Arrived well-packaged. Solid performance.'),
(3, 3.5, 'Decent deal but shipping took longer than expected. Laptop itself is great.'),

-- AirSound Max reviews
(5, 5.0, 'Best noise cancellation I have ever experienced. Spatial audio is a game changer.'),
(5, 4.5, 'Comfortable for long sessions. Sound quality is phenomenal.'),
(6, 4.0, 'Great headphones at a fair price. Bluetooth connection is rock solid.'),
(7, 4.5, 'Amazing value. These rival headphones that cost twice as much.'),

-- SmartWatch Ultra reviews
(8, 4.5, 'Accurate health tracking and the GPS works flawlessly on runs.'),
(9, 4.0, 'Battery life is impressive. UI could be a bit more intuitive though.'),
(10, 5.0, 'Love it. The temperature sensor is surprisingly accurate and useful.'),

-- PowerBank 20K reviews
(11, 4.0, '65W charging is fast enough to charge my laptop. Compact and well-built.'),
(12, 3.5, 'Works fine for the price. A bit heavier than I expected.'),

-- ErgoDesk Stand reviews
(13, 4.5, 'Transformed my workspace. The bamboo surface looks premium.'),
(14, 4.0, 'Sturdy and easy to adjust. Monitor arm is a nice bonus.'),

-- MechKey 75 reviews
(15, 5.0, 'Hot-swap switches are addictive. Typing feel is incredible. RGB looks great.'),
(16, 4.5, 'Excellent keyboard for the price. Bluetooth mode works perfectly.'),
(17, 4.0, 'Good budget mechanical. Switch selection could be wider.'),

-- ClearView Monitor 27 reviews
(18, 4.5, 'Colors are gorgeous out of the box. USB-C hub is super convenient.'),
(19, 4.0, 'Great 4K monitor. HDR400 is a bit weak but fine for productivity.'),

-- AirPure Mini reviews
(20, 4.0, 'Whisper quiet on sleep mode. Noticeably cleaner air within a day.'),
(21, 4.5, 'Small but powerful. Auto mode adjusts perfectly. Highly recommend.');

-- -----------------------------------------
-- carts
-- -----------------------------------------

INSERT INTO public.carts (user_id, budget_limit) VALUES
('user_alice', 2500.00),
('user_bob',   500.00);

-- -----------------------------------------
-- cart_items
-- -----------------------------------------

INSERT INTO public.cart_items (cart_id, vendor_product_id, quantity) VALUES
-- Alice's cart: laptop + headphones + keyboard
(1, 1,  1),   -- UltraBook Pro 15 from TechHub
(1, 5,  1),   -- AirSound Max from TechHub
(1, 15, 1),   -- MechKey 75 from TechHub

-- Bob's cart: powerbank + air purifier + watch
(2, 12, 2),   -- PowerBank 20K from PrimeDeals (x2)
(2, 21, 1),   -- AirPure Mini from ValueStore
(2, 10, 1);   -- SmartWatch Ultra from ValueStore
