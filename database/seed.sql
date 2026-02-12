-- =========================================
-- PRODUCT INTELLIGENCE PLATFORM
-- SEED DATA v2 — 50 Products, GenZ + Festive
-- =========================================

-- -----------------------------------------
-- vendors (6)
-- -----------------------------------------

INSERT INTO public.vendors (name, description, return_policy_days, exchange_policy_days, cancellation_window_hours) VALUES
('TechHub',       'Premium electronics retailer with fast shipping and expert support',              30, 30, 24),
('MegaMart',      'Large marketplace with competitive pricing and wide selection',                   15, 15, 12),
('PrimeDeals',    'Budget-friendly store with frequent flash sales and combo discounts',             7,  14, 6),
('ValueStore',    'Trusted seller with excellent customer service and extended warranties',          45, 45, 48),
('TrendyCart',    'GenZ-focused store with aesthetic packaging, unboxing experience, and free stickers', 21, 21, 24),
('FestiveFinds',  'Seasonal gifting specialist — curated picks for Diwali, Christmas, Valentine''s and more', 30, 30, 48);

-- -----------------------------------------
-- products (50)
-- -----------------------------------------

INSERT INTO public.products (name, brand, category, description, specifications) VALUES

-- === ELECTRONICS (1-12) ===
(
    'UltraBook Pro 15',
    'NovaTech',
    'electronics',
    'High-performance laptop with 15-inch Retina display. Perfect Christmas gift for students and professionals. Great for Diwali season productivity upgrades.',
    '{"cpu": "M3 Pro", "ram": "16GB", "storage": "512GB SSD", "display": "15.3 inch Retina", "battery": "22 hours"}'
),
(
    'AirSound Max',
    'SonicWave',
    'electronics',
    'Noise-cancelling over-ear headphones with spatial audio. Ideal Valentine''s Day gift for music lovers. Trending on TikTok for ASMR content.',
    '{"driver": "40mm", "battery": "30 hours", "noise_cancellation": "active", "connectivity": "Bluetooth 5.3", "weight": "250g"}'
),
(
    'SmartWatch Ultra',
    'FitPulse',
    'electronics',
    'Advanced fitness tracker with GPS and health monitoring. Top-rated New Year resolution companion. Makes a thoughtful Raksha Bandhan gift.',
    '{"display": "1.9 inch AMOLED", "battery": "72 hours", "water_resistance": "100m", "sensors": ["heart rate", "SpO2", "temperature"]}'
),
(
    'StreamCam 4K',
    'VizPro',
    'electronics',
    'Professional 4K webcam for streaming and content creation. Must-have for aspiring YouTubers and Twitch streamers. Great Christmas gift for creators.',
    '{"resolution": "4K 30fps / 1080p 60fps", "autofocus": "AI face tracking", "mic": "dual stereo", "mount": "tripod + monitor clip", "connectivity": "USB-C"}'
),
(
    'Wireless Earbuds SE',
    'SonicWave',
    'electronics',
    'Compact true wireless earbuds with transparency mode. Budget-friendly Diwali gift option. Viral on Instagram Reels for gym workouts.',
    '{"driver": "12mm", "battery": "8 hours (32 with case)", "noise_cancellation": "passive", "connectivity": "Bluetooth 5.2", "water_resistance": "IPX5"}'
),
(
    'ClearView Monitor 27',
    'PixelPro',
    'electronics',
    '27-inch 4K IPS monitor with USB-C hub. Essential for WFH setups. Popular back-to-school and Christmas upgrade.',
    '{"resolution": "3840x2160", "panel": "IPS", "refresh_rate": "60Hz", "ports": ["USB-C 90W", "HDMI 2.1", "DisplayPort 1.4"], "hdr": "HDR400"}'
),
(
    'Portable Projector Mini',
    'CineMate',
    'electronics',
    'Pocket-sized HD projector for movie nights and outdoor screenings. Perfect for Christmas movie marathons and Diwali family gatherings. TikTok aesthetic room essential.',
    '{"resolution": "1080p native", "brightness": "500 ANSI lumens", "battery": "3 hours", "screen_size": "40-120 inches", "speakers": "built-in 5W stereo", "connectivity": "HDMI, WiFi, Bluetooth"}'
),
(
    'Smart Speaker Home',
    'EchoVibe',
    'electronics',
    'Voice-controlled smart speaker with room-filling sound. Play festive playlists during Diwali, Christmas carols, or Valentine''s mood music. Works with all smart home devices.',
    '{"audio": "360-degree stereo", "assistant": "multi-assistant compatible", "connectivity": "WiFi 6, Bluetooth 5.0", "mic_array": "4 far-field mics", "smart_home": "Zigbee hub built-in"}'
),
(
    'Vlog Kit Pro',
    'CreatorGear',
    'electronics',
    'All-in-one vlogging kit with gimbal, mic, and LED light. Essential for Gen Z content creators. Great Christmas gift for aspiring influencers and travel vloggers.',
    '{"gimbal": "3-axis stabilizer", "mic": "shotgun + wireless lav", "light": "bi-color LED panel", "compatibility": "smartphones + action cameras", "battery": "12 hours gimbal"}'
),
(
    'Gaming Monitor 165Hz',
    'PixelPro',
    'electronics',
    '27-inch QHD gaming monitor with 165Hz refresh rate. Christmas wishlist favorite for gamers. Essential for competitive esports.',
    '{"resolution": "2560x1440", "panel": "IPS", "refresh_rate": "165Hz", "response_time": "1ms GtG", "adaptive_sync": "FreeSync Premium + G-Sync compatible", "hdr": "HDR600"}'
),
(
    'Retro Instant Camera',
    'SnapVibe',
    'electronics',
    'Instant film camera with vintage aesthetic. Viral on TikTok and Instagram. Perfect Valentine''s Day couples gift or Christmas stocking stuffer. Aesthetic room decor with printed photos.',
    '{"film_type": "Instax Mini", "lens": "60mm f/12.7", "flash": "auto", "selfie_mode": "yes", "colors_available": ["pastel pink", "mint green", "lavender", "classic black"]}'
),
(
    'Smart Display Hub',
    'EchoVibe',
    'electronics',
    'Smart display with 10-inch touchscreen for video calls, recipes, and photo frames. Shows festive screensavers during Christmas and Diwali. Perfect housewarming or wedding gift.',
    '{"display": "10.1 inch HD IPS", "camera": "13MP auto-framing", "speakers": "dual 2-inch drivers", "assistant": "multi-assistant", "connectivity": "WiFi 6, Bluetooth 5.0"}'
),

-- === GAMING (13-20) ===
(
    'ProGamer Mouse RGB',
    'ClickStorm',
    'gaming',
    'Ultra-lightweight gaming mouse with customizable RGB. Christmas gift essential for PC gamers. Used by top esports pros.',
    '{"sensor": "25600 DPI optical", "weight": "58g", "switches": "optical, 80M clicks", "buttons": 6, "cable": "paracord / wireless", "battery": "70 hours wireless", "rgb": "per-key RGB"}'
),
(
    'Surround Headset 7.1',
    'SonicWave',
    'gaming',
    'Virtual 7.1 surround sound gaming headset with detachable mic. Great Christmas or birthday gift for gamers. Compatible with PC, PS5, Xbox.',
    '{"driver": "50mm neodymium", "surround": "virtual 7.1", "mic": "detachable cardioid", "connectivity": "USB + 3.5mm", "weight": "310g", "ear_cushion": "memory foam"}'
),
(
    'Controller Pro Wireless',
    'GameForce',
    'gaming',
    'Premium wireless controller with Hall effect sticks — zero drift guaranteed. Diwali gaming marathon essential. Works with PC, Switch, iOS, Android.',
    '{"connectivity": "Bluetooth 5.0 + 2.4GHz dongle", "battery": "40 hours", "sticks": "Hall effect", "triggers": "analog + digital", "vibration": "HD rumble", "gyro": "6-axis"}'
),
(
    'Gaming Chair ErgoMax',
    'SitRight',
    'gaming',
    'Ergonomic gaming chair with lumbar support and recline. Popular Christmas and back-to-college gift. Aesthetic enough for TikTok room tours.',
    '{"recline": "90-165 degrees", "armrests": "4D adjustable", "material": "breathable mesh + PU leather", "weight_capacity": "300 lbs", "lumbar": "adjustable pillow", "colors": ["black/red", "white/pink", "all black"]}'
),
(
    'Capture Card 4K',
    'StreamPro',
    'gaming',
    'External 4K capture card for game streaming. Must-have for Twitch and YouTube gaming creators. Perfect tech gift for Christmas.',
    '{"input": "4K60 HDR passthrough", "capture": "1080p60 / 4K30", "interface": "USB 3.0", "latency": "ultra-low", "compatibility": "OBS, Streamlabs, XSplit"}'
),
(
    'Desk Mat XXL Galaxy',
    'ClickStorm',
    'gaming',
    'Extended desk mat with galaxy print and RGB edge lighting. Aesthetic desk setup essential. Makes a great Diwali or Christmas gift for gamers and students.',
    '{"size": "900x400x4mm", "surface": "micro-textured cloth", "base": "non-slip rubber", "rgb": "14 lighting modes", "power": "USB-C"}'
),
(
    'Portable Gaming Console',
    'GameForce',
    'gaming',
    'Handheld gaming console with 7-inch OLED screen. Perfect Christmas gift for retro and indie game lovers. Travel-friendly for holiday road trips.',
    '{"display": "7 inch OLED 120Hz", "chip": "custom APU", "storage": "256GB + microSD", "battery": "6 hours", "weight": "420g", "os": "Linux-based", "controls": "dual analog + hall effect triggers"}'
),
(
    'VR Headset Lite',
    'VirtuPlay',
    'gaming',
    'Standalone VR headset — no PC required. Mind-blowing Christmas gift. Experience virtual Diwali fireworks or explore winter wonderlands in VR.',
    '{"display": "dual 2160x2160 LCD", "refresh_rate": "120Hz", "tracking": "inside-out 6DoF", "storage": "128GB", "battery": "2.5 hours", "weight": "503g", "ipd": "adjustable"}'
),

-- === ACCESSORIES (21-30) ===
(
    'PowerBank 20K',
    'ChargeTech',
    'accessories',
    'Portable charger with 20000mAh capacity and 65W fast charging. Travel essential for holiday trips. Great Raksha Bandhan or Christmas stocking stuffer.',
    '{"capacity": "20000mAh", "output": "65W USB-C PD", "ports": 3, "weight": "350g"}'
),
(
    'MechKey 75',
    'TypeCraft',
    'accessories',
    'Compact mechanical keyboard with hot-swappable switches and RGB. Aesthetic desk setup essential. Popular Christmas and back-to-school gift for GenZ.',
    '{"layout": "75%", "switches": "Gateron Pro", "backlight": "RGB per-key", "connectivity": "USB-C / Bluetooth 5.0", "battery": "4000mAh", "keycaps": "PBT double-shot"}'
),
(
    'LED Strip Lights RGB',
    'GlowUp',
    'accessories',
    'Smart RGB LED strip lights with app and voice control. Essential for Diwali home decoration, Christmas room glow-up, or creating aesthetic TikTok room vibes.',
    '{"length": "10 meters", "leds": "300 SMD 5050", "colors": "16 million RGBIC", "control": "app + voice + remote", "sync": "music reactive", "smart_home": "Alexa, Google Home"}'
),
(
    'Phone Grip PopStand',
    'GripTok',
    'accessories',
    'Magnetic phone grip and stand combo. Trending on TikTok. Cute Valentine''s Day gift — comes in couple-matching designs.',
    '{"type": "magnetic MagSafe compatible", "material": "zinc alloy + silicone", "designs": ["holographic", "marble", "anime", "custom photo"], "weight": "30g"}'
),
(
    'Aesthetic Phone Case',
    'VibeCase',
    'accessories',
    'Trendy clear phone case with dried flower or holographic design. Perfect Valentine''s or Galentine''s Day gift. Instagrammable aesthetics.',
    '{"material": "TPU + PC hybrid", "protection": "6ft drop tested", "designs": ["dried flowers", "holographic", "butterfly", "cloud", "aura gradient"], "compatibility": "iPhone 14-16 / Samsung S24-S25", "magsafe": "optional"}'
),
(
    'USB-C Hub 7-in-1',
    'ConnectAll',
    'accessories',
    'Compact USB-C hub with HDMI, USB-A, SD card reader. Essential back-to-school accessory. Great Christmas stocking stuffer for tech students.',
    '{"ports": ["HDMI 4K60", "USB-A 3.0 x2", "USB-C PD 100W", "SD", "microSD", "Ethernet"], "material": "aluminum", "cable": "integrated 15cm", "weight": "65g"}'
),
(
    'Wireless Charger Pad',
    'ChargeTech',
    'accessories',
    'Sleek 3-in-1 wireless charging pad for phone, watch, and earbuds. Aesthetic nightstand essential. Popular Diwali and Christmas gift.',
    '{"output": "15W phone + 5W watch + 5W earbuds", "compatibility": "Qi + MagSafe", "material": "vegan leather + aluminum", "led": "subtle breathing indicator", "colors": ["black", "white", "sage green"]}'
),
(
    'Camera Lens Kit',
    'LensPro',
    'accessories',
    'Clip-on phone lens kit — macro, wide-angle, fisheye. Content creation essential for Reels and TikToks. Great Christmas gift for photography enthusiasts.',
    '{"lenses": ["0.6x wide angle", "15x macro", "198° fisheye", "2x telephoto"], "material": "multi-coated optical glass", "clip": "universal spring clip", "case": "premium carrying pouch"}'
),
(
    'Mini Bluetooth Printer',
    'SnapVibe',
    'accessories',
    'Pocket thermal printer for photos, stickers, and notes. Viral TikTok product. Cute Valentine''s Day gift to print couple photos instantly.',
    '{"print": "thermal, no ink needed", "resolution": "304 DPI", "paper_width": "57mm", "connectivity": "Bluetooth 5.0", "battery": "1000mAh", "app": "iOS + Android"}'
),
(
    'Smart Water Bottle',
    'HydroVibe',
    'accessories',
    'Temperature-display water bottle with hydration reminders. New Year fitness resolution essential. Makes a thoughtful Christmas or birthday gift.',
    '{"capacity": "500ml", "display": "LED temperature", "material": "304 stainless steel", "insulation": "24hr cold / 12hr hot", "reminder": "glow reminder every 2 hours", "colors": ["matte black", "rose gold", "pastel blue"]}'
),

-- === HOME (31-40) ===
(
    'ErgoDesk Stand',
    'WorkFlow',
    'home',
    'Adjustable standing desk converter with monitor arm. Work-from-home essential. Popular Diwali office upgrade and Christmas gift for remote workers.',
    '{"height_range": "6-20 inches", "weight_capacity": "35 lbs", "surface": "32 x 22 inches", "material": "bamboo"}'
),
(
    'AirPure Mini',
    'BreathEasy',
    'home',
    'Compact HEPA air purifier for rooms up to 300 sq ft. Essential during Diwali for smoke and pollution. Great for allergy season and holiday gatherings.',
    '{"filter": "True HEPA H13", "coverage": "300 sq ft", "noise": "24 dB", "modes": ["auto", "sleep", "turbo"]}'
),
(
    'Sunset Lamp Projector',
    'GlowUp',
    'home',
    'Rainbow sunset projection lamp for aesthetic room vibes. Viral on TikTok with 500M+ views. Perfect Valentine''s Day ambiance or Instagram photo backdrop.',
    '{"modes": ["sunset", "rainbow", "sun", "galaxy"], "rotation": "360 degrees", "brightness": "adjustable", "power": "USB-C", "height": "10 inches"}'
),
(
    'Aroma Diffuser LED',
    'ZenSpace',
    'home',
    'Ultrasonic essential oil diffuser with ambient LED lighting. Perfect for Diwali pooja room ambiance, Christmas cozy vibes, or daily relaxation.',
    '{"capacity": "300ml", "coverage": "350 sq ft", "timer": "1/3/6 hours + continuous", "led": "7 color modes", "noise": "under 30 dB", "auto_shutoff": "yes"}'
),
(
    'Neon Sign Custom',
    'GlowUp',
    'home',
    'LED neon sign for room decoration — customizable text and designs. Aesthetic room essential for GenZ. Great Christmas, birthday, or housewarming gift.',
    '{"type": "LED neon flex", "sizes": ["12 inch", "18 inch", "24 inch"], "colors": ["warm white", "pink", "blue", "multi"], "mounting": "wall mount + stand", "power": "USB + adapter", "dimmer": "yes"}'
),
(
    'Smart Plug Mini 4-Pack',
    'SmartNest',
    'home',
    'WiFi smart plug pack for automating your home. Schedule Diwali lights, Christmas tree, or daily routines. Voice control with Alexa and Google.',
    '{"connectivity": "WiFi 2.4GHz", "control": "app + voice", "schedule": "timer + sunrise/sunset", "energy_monitoring": "yes", "max_load": "15A per plug", "quantity": 4}'
),
(
    'Smart LED Bulb 4-Pack',
    'SmartNest',
    'home',
    'Color-changing smart bulbs with music sync. Set festive colors for Diwali, Christmas green/red, Valentine''s pink, or Halloween orange. App and voice controlled.',
    '{"lumens": "800 per bulb", "colors": "16 million RGBW", "base": "E26/E27", "control": "app + voice", "sync": "music reactive", "schedule": "yes", "quantity": 4}'
),
(
    'Mini Fridge Portable',
    'ChillBox',
    'home',
    'Retro-style mini fridge for skincare, beverages, or snacks. Aesthetic room essential for GenZ. Great dorm room or Christmas gift.',
    '{"capacity": "4 liters", "cooling": "thermoelectric", "temperature": "cool to 40°F / warm to 140°F", "power": "AC + 12V car adapter", "noise": "under 28 dB", "colors": ["pink", "mint", "white", "lavender"]}'
),
(
    'Galaxy Star Projector',
    'GlowUp',
    'home',
    'Laser star and nebula projector with Bluetooth speaker. Create magical Christmas, Diwali, or Valentine''s night ambiance. Viral on TikTok room transformations.',
    '{"projection": "laser stars + LED nebula", "area": "covers entire ceiling", "speaker": "Bluetooth 5.0", "timer": "1-4 hours", "modes": "8 lighting scenes", "control": "remote + app"}'
),
(
    'Vinyl Record Player',
    'RetroVibe',
    'home',
    'Modern turntable with Bluetooth output and built-in speakers. Vintage aesthetic meets modern tech. Trendy Christmas or birthday gift for music-loving GenZ.',
    '{"speeds": "33/45/78 RPM", "speakers": "built-in stereo", "output": "Bluetooth + RCA + headphone jack", "cartridge": "replaceable", "material": "wood grain + aluminum", "auto_stop": "yes"}'
),

-- === LIFESTYLE (41-46) ===
(
    'Skincare Fridge Glow',
    'ChillBox',
    'lifestyle',
    'Dedicated skincare mini fridge with mirror and LED. Keep serums and sheet masks perfectly chilled. Valentine''s self-care gift or Christmas treat-yourself present.',
    '{"capacity": "6 liters", "shelves": "removable", "mirror": "LED-lit door mirror", "temperature": "35-46°F", "noise": "silent 25 dB", "colors": ["blush pink", "pearl white"]}'
),
(
    'Journaling Kit Aesthetic',
    'PaperVibes',
    'lifestyle',
    'Complete journaling set with dotted notebook, brush pens, washi tape, and stickers. New Year resolution planner kit. Trendy Christmas or birthday gift for creative GenZ.',
    '{"notebook": "160 pages, 160gsm dotted", "pens": "24 brush pen set", "washi_tape": "10 rolls pastel", "stickers": "200+ aesthetic stickers", "pouch": "canvas zipper pouch"}'
),
(
    'Anti-Theft Backpack',
    'UrbanGear',
    'lifestyle',
    'Tech-friendly backpack with hidden zippers and USB charging port. Essential for college students and travel. Great back-to-school or Christmas gift.',
    '{"capacity": "25 liters", "laptop": "fits up to 16 inch", "usb_port": "external charging port", "material": "water-resistant oxford", "features": ["hidden zip", "luggage strap", "RFID pocket"], "weight": "0.8 kg"}'
),
(
    'Polaroid Photo Wall Kit',
    'SnapVibe',
    'lifestyle',
    'DIY photo wall kit with fairy lights, clips, and frames. Display Valentine''s couple photos, Christmas memories, or travel pics. Aesthetic room decor essential.',
    '{"fairy_lights": "10 meters warm white", "clips": "50 wooden clips", "frames": "20 cardboard frames", "string": "hemp rope 5m", "stickers": "photo corner stickers 100pc"}'
),
(
    'Scented Candle Gift Set',
    'ZenSpace',
    'lifestyle',
    'Luxury soy candle set with seasonal scents. Includes Christmas Pine, Diwali Jasmine, Valentine Rose, and Summer Breeze. Perfect festival gift box.',
    '{"candles": 4, "scents": ["Christmas Pine & Cinnamon", "Diwali Jasmine & Sandalwood", "Valentine Rose & Vanilla", "Summer Ocean Breeze"], "burn_time": "30 hours each", "wax": "natural soy", "packaging": "premium gift box"}'
),
(
    'Fitness Resistance Band Set',
    'FitPulse',
    'lifestyle',
    'Complete resistance band set for home workouts. New Year fitness resolution starter kit. Great affordable Christmas or birthday gift.',
    '{"bands": "5 resistance levels", "handles": "cushioned grips", "anchors": ["door anchor", "ankle straps"], "material": "natural latex", "carrying_bag": "mesh bag included", "guide": "workout poster included"}'
),

-- === FESTIVE SPECIALS (47-50) ===
(
    'Christmas LED Tree Light',
    'FestivGlow',
    'festive',
    'Smart RGB Christmas tree with app-controlled lights and 400+ effects. The ultimate Christmas decoration. Also great for New Year celebrations and winter parties.',
    '{"height": "6 feet", "leds": "400 RGB smart LEDs", "control": "app + remote", "effects": "400+ patterns", "timer": "auto on/off schedule", "power": "AC adapter", "storage": "foldable design"}'
),
(
    'Diwali Diya LED Set',
    'FestivGlow',
    'festive',
    'Traditional-style LED diyas with flickering flame effect. Safe, reusable Diwali decoration. Perfect for Diwali pooja, rangoli borders, and festive home decor. Battery operated.',
    '{"quantity": 12, "type": "LED flickering flame", "battery": "CR2032 (included)", "material": "brass-finish plastic", "burn_time": "200 hours per battery", "waterproof": "IPX4 for outdoor use"}'
),
(
    'Valentine Gift Box Deluxe',
    'GiftCraft',
    'festive',
    'Premium Valentine''s Day gift box with preserved roses, chocolate truffles placeholder, and a handwritten card kit. Romantic surprise for Valentine''s Day, anniversaries, or proposals.',
    '{"preserved_roses": "3 eternal roses (red/pink)", "card_kit": "handmade card materials", "box": "magnetic closure luxury box", "extras": ["satin ribbon", "tissue paper", "love coupons booklet"], "size": "12 x 10 x 5 inches"}'
),
(
    'Halloween Fog Machine Pro',
    'FestivGlow',
    'festive',
    'Portable fog machine with LED lights for Halloween parties. Creates spooky atmosphere for Halloween decorations, haunted houses, and themed parties. Also great for Holi color parties.',
    '{"output": "3000 CFM", "tank": "1 liter", "heat_time": "3 minutes", "leds": "RGB built-in", "remote": "wireless + wired", "coverage": "fills 500 sq ft in 1 minute"}'
);

-- -----------------------------------------
-- vendor_products (mapping products to vendors with prices)
-- Each product mapped to 2-4 vendors
-- IDs will be 1-130 approximately
-- -----------------------------------------

INSERT INTO public.vendor_products (vendor_id, product_id, price, stock_quantity, vendor_rating, delivery_days, coupon_code) VALUES

-- Product 1: UltraBook Pro 15
(1, 1, 1899.99, 25, 4.8, 2, NULL),
(2, 1, 1849.00, 40, 4.5, 4, 'MEGA10'),
(3, 1, 1799.99, 10, 4.2, 5, 'DEAL200'),
(5, 1, 1879.00, 15, 4.7, 3, 'TRENDY50'),

-- Product 2: AirSound Max
(1, 2, 349.99, 100, 4.9, 1, NULL),
(2, 2, 329.00, 200, 4.4, 3, 'MEGA5'),
(3, 2, 299.99, 50, 4.1, 6, 'SOUND30'),

-- Product 3: SmartWatch Ultra
(1, 3, 449.00, 60, 4.7, 2, NULL),
(2, 3, 425.00, 80, 4.6, 3, NULL),
(5, 3, 439.99, 35, 4.8, 2, 'TRENDY10'),

-- Product 4: StreamCam 4K
(1, 4, 179.99, 45, 4.6, 2, NULL),
(5, 4, 169.99, 60, 4.7, 3, 'STREAM15'),
(3, 4, 159.99, 30, 4.3, 5, NULL),

-- Product 5: Wireless Earbuds SE
(2, 5, 79.99, 300, 4.3, 2, NULL),
(3, 5, 69.99, 150, 4.1, 4, 'BUDS10'),
(5, 5, 74.99, 200, 4.5, 3, NULL),

-- Product 6: ClearView Monitor 27
(1, 6, 549.99, 30, 4.7, 3, NULL),
(2, 6, 529.00, 45, 4.4, 4, 'MEGA15'),
(4, 6, 539.99, 20, 4.6, 3, NULL),

-- Product 7: Portable Projector Mini
(1, 7, 299.99, 40, 4.5, 3, NULL),
(3, 7, 269.99, 25, 4.2, 5, 'PROJ20'),
(5, 7, 289.99, 50, 4.6, 2, NULL),
(6, 7, 279.99, 35, 4.7, 3, 'FEST10'),

-- Product 8: Smart Speaker Home
(1, 8, 129.99, 80, 4.6, 2, NULL),
(2, 8, 119.99, 120, 4.3, 3, NULL),
(4, 8, 124.99, 60, 4.5, 2, NULL),

-- Product 9: Vlog Kit Pro
(1, 9, 249.99, 30, 4.7, 3, NULL),
(5, 9, 239.99, 45, 4.8, 2, 'VLOG20'),
(3, 9, 229.99, 20, 4.4, 5, NULL),

-- Product 10: Gaming Monitor 165Hz
(1, 10, 449.99, 25, 4.8, 2, NULL),
(2, 10, 429.00, 40, 4.5, 4, 'MEGA20'),
(3, 10, 419.99, 15, 4.3, 5, NULL),

-- Product 11: Retro Instant Camera
(5, 11, 89.99, 100, 4.7, 2, 'SNAP10'),
(6, 11, 84.99, 80, 4.8, 2, 'FEST5'),
(2, 11, 94.99, 60, 4.4, 3, NULL),

-- Product 12: Smart Display Hub
(1, 12, 249.99, 35, 4.6, 3, NULL),
(4, 12, 239.99, 25, 4.7, 2, 'VALUE15'),
(6, 12, 244.99, 40, 4.5, 3, NULL),

-- Product 13: ProGamer Mouse RGB
(1, 13, 79.99, 150, 4.8, 1, NULL),
(2, 13, 74.99, 200, 4.5, 3, 'MEGA5'),
(5, 13, 77.99, 100, 4.7, 2, NULL),

-- Product 14: Surround Headset 7.1
(1, 14, 99.99, 80, 4.6, 2, NULL),
(2, 14, 89.99, 120, 4.4, 3, 'MEGA10'),
(3, 14, 84.99, 50, 4.2, 5, NULL),

-- Product 15: Controller Pro Wireless
(1, 15, 69.99, 100, 4.7, 2, NULL),
(2, 15, 64.99, 150, 4.5, 3, NULL),
(5, 15, 67.99, 80, 4.6, 2, 'GAME5'),

-- Product 16: Gaming Chair ErgoMax
(1, 16, 349.99, 20, 4.5, 5, NULL),
(2, 16, 329.99, 30, 4.3, 6, 'CHAIR20'),
(4, 16, 339.99, 15, 4.6, 4, NULL),

-- Product 17: Capture Card 4K
(1, 17, 149.99, 50, 4.7, 2, NULL),
(5, 17, 144.99, 35, 4.6, 3, 'STREAM10'),

-- Product 18: Desk Mat XXL Galaxy
(2, 18, 29.99, 300, 4.4, 3, NULL),
(3, 18, 24.99, 200, 4.2, 5, 'MAT5'),
(5, 18, 27.99, 250, 4.6, 2, NULL),

-- Product 19: Portable Gaming Console
(1, 19, 399.99, 15, 4.8, 3, NULL),
(2, 19, 389.99, 25, 4.5, 4, NULL),
(5, 19, 394.99, 20, 4.7, 3, 'GAME20'),

-- Product 20: VR Headset Lite
(1, 20, 349.99, 30, 4.6, 3, NULL),
(2, 20, 339.99, 40, 4.4, 4, 'VR15'),
(6, 20, 344.99, 25, 4.7, 3, NULL),

-- Product 21: PowerBank 20K
(2, 21, 49.99, 500, 4.3, 2, NULL),
(3, 21, 39.99, 300, 4.0, 4, 'CHEAP5'),
(5, 21, 44.99, 200, 4.5, 2, NULL),

-- Product 22: MechKey 75
(1, 22, 129.99, 75, 4.8, 2, NULL),
(2, 22, 119.00, 150, 4.5, 3, 'MEGA10'),
(3, 22, 109.99, 40, 4.3, 5, NULL),
(5, 22, 124.99, 60, 4.7, 2, 'TYPE10'),

-- Product 23: LED Strip Lights RGB
(2, 23, 24.99, 400, 4.3, 3, NULL),
(3, 23, 19.99, 250, 4.0, 5, 'GLOW5'),
(5, 23, 22.99, 300, 4.5, 2, NULL),
(6, 23, 21.99, 200, 4.6, 2, 'DIWALI10'),

-- Product 24: Phone Grip PopStand
(2, 24, 14.99, 500, 4.2, 2, NULL),
(5, 24, 16.99, 300, 4.6, 1, NULL),
(6, 24, 15.99, 200, 4.5, 2, 'VDAY5'),

-- Product 25: Aesthetic Phone Case
(5, 25, 29.99, 200, 4.7, 2, 'CASE10'),
(2, 25, 24.99, 300, 4.3, 3, NULL),
(6, 25, 27.99, 150, 4.6, 2, NULL),

-- Product 26: USB-C Hub 7-in-1
(1, 26, 49.99, 100, 4.6, 2, NULL),
(2, 26, 44.99, 150, 4.3, 3, NULL),
(3, 26, 39.99, 80, 4.1, 5, 'HUB5'),

-- Product 27: Wireless Charger Pad
(1, 27, 59.99, 60, 4.7, 2, NULL),
(5, 27, 54.99, 80, 4.6, 2, 'CHARGE10'),
(6, 27, 56.99, 50, 4.5, 3, 'GIFT5'),

-- Product 28: Camera Lens Kit
(2, 28, 34.99, 200, 4.3, 3, NULL),
(5, 28, 39.99, 150, 4.6, 2, NULL),
(3, 28, 29.99, 100, 4.0, 5, NULL),

-- Product 29: Mini Bluetooth Printer
(5, 29, 49.99, 100, 4.7, 2, 'PRINT10'),
(2, 29, 44.99, 150, 4.4, 3, NULL),
(6, 29, 47.99, 80, 4.6, 2, 'VDAY10'),

-- Product 30: Smart Water Bottle
(5, 30, 39.99, 150, 4.6, 2, NULL),
(4, 30, 37.99, 100, 4.5, 3, NULL),
(6, 30, 38.99, 80, 4.4, 2, 'FIT5'),

-- Product 31: ErgoDesk Stand
(1, 31, 299.00, 20, 4.6, 5, NULL),
(4, 31, 279.99, 30, 4.5, 4, 'ERGO20'),

-- Product 32: AirPure Mini
(3, 32, 89.99, 200, 4.2, 3, 'AIR10'),
(4, 32, 99.99, 120, 4.6, 2, NULL),
(6, 32, 94.99, 80, 4.5, 2, 'DIWALI15'),

-- Product 33: Sunset Lamp Projector
(5, 33, 34.99, 200, 4.7, 2, NULL),
(2, 33, 29.99, 300, 4.3, 3, NULL),
(6, 33, 32.99, 150, 4.6, 2, 'VIBE10'),

-- Product 34: Aroma Diffuser LED
(4, 34, 44.99, 80, 4.6, 3, NULL),
(5, 34, 42.99, 100, 4.5, 2, NULL),
(6, 34, 39.99, 120, 4.7, 2, 'DIWALI10'),

-- Product 35: Neon Sign Custom
(5, 35, 59.99, 60, 4.8, 3, 'NEON10'),
(2, 35, 54.99, 80, 4.4, 4, NULL),
(6, 35, 56.99, 50, 4.6, 3, NULL),

-- Product 36: Smart Plug Mini 4-Pack
(2, 36, 29.99, 300, 4.3, 2, NULL),
(3, 36, 24.99, 200, 4.1, 4, 'PLUG5'),
(4, 36, 27.99, 150, 4.5, 3, NULL),

-- Product 37: Smart LED Bulb 4-Pack
(2, 37, 39.99, 250, 4.4, 2, NULL),
(3, 37, 34.99, 180, 4.2, 4, 'LIGHT10'),
(6, 37, 37.99, 200, 4.6, 2, 'FEST10'),

-- Product 38: Mini Fridge Portable
(5, 38, 49.99, 80, 4.6, 3, NULL),
(2, 38, 44.99, 100, 4.3, 4, NULL),
(4, 38, 47.99, 60, 4.5, 3, NULL),

-- Product 39: Galaxy Star Projector
(5, 39, 44.99, 120, 4.7, 2, NULL),
(2, 39, 39.99, 200, 4.4, 3, NULL),
(6, 39, 42.99, 100, 4.6, 2, 'STAR10'),

-- Product 40: Vinyl Record Player
(1, 40, 129.99, 25, 4.7, 3, NULL),
(5, 40, 119.99, 40, 4.8, 2, 'VINYL10'),
(4, 40, 124.99, 30, 4.5, 3, NULL),

-- Product 41: Skincare Fridge Glow
(5, 41, 59.99, 100, 4.7, 2, 'GLOW10'),
(6, 41, 57.99, 80, 4.6, 2, 'VDAY15'),
(2, 41, 54.99, 120, 4.3, 3, NULL),

-- Product 42: Journaling Kit Aesthetic
(5, 42, 39.99, 150, 4.8, 2, 'JOURNAL5'),
(6, 42, 37.99, 100, 4.7, 2, NULL),
(2, 42, 34.99, 200, 4.4, 3, NULL),

-- Product 43: Anti-Theft Backpack
(1, 43, 79.99, 50, 4.6, 3, NULL),
(2, 43, 69.99, 80, 4.4, 4, 'MEGA10'),
(5, 43, 74.99, 60, 4.7, 2, NULL),

-- Product 44: Polaroid Photo Wall Kit
(5, 44, 29.99, 200, 4.7, 2, 'PHOTO5'),
(6, 44, 27.99, 150, 4.6, 2, 'VDAY10'),
(2, 44, 24.99, 250, 4.3, 3, NULL),

-- Product 45: Scented Candle Gift Set
(6, 45, 49.99, 120, 4.8, 2, 'FEST15'),
(5, 45, 47.99, 80, 4.7, 2, NULL),
(4, 45, 44.99, 60, 4.6, 3, NULL),

-- Product 46: Fitness Resistance Band Set
(2, 46, 24.99, 300, 4.3, 2, NULL),
(3, 46, 19.99, 200, 4.1, 4, 'FIT5'),
(5, 46, 22.99, 150, 4.5, 2, NULL),

-- Product 47: Christmas LED Tree Light
(6, 47, 149.99, 50, 4.8, 3, 'XMAS20'),
(2, 47, 139.99, 80, 4.4, 4, NULL),
(4, 47, 144.99, 30, 4.6, 3, NULL),

-- Product 48: Diwali Diya LED Set
(6, 48, 24.99, 300, 4.9, 1, 'DIWALI20'),
(5, 48, 22.99, 200, 4.6, 2, NULL),
(3, 48, 19.99, 150, 4.3, 4, NULL),

-- Product 49: Valentine Gift Box Deluxe
(6, 49, 69.99, 100, 4.8, 2, 'LOVE15'),
(5, 49, 64.99, 80, 4.7, 2, 'VDAY20'),

-- Product 50: Halloween Fog Machine Pro
(6, 50, 79.99, 40, 4.7, 3, 'SPOOKY10'),
(2, 50, 74.99, 60, 4.4, 4, NULL),
(3, 50, 69.99, 30, 4.2, 5, NULL);

-- -----------------------------------------
-- product_reviews (100+ reviews across all products)
-- -----------------------------------------

INSERT INTO public.product_reviews (vendor_product_id, rating, review_text) VALUES

-- Product 1: UltraBook Pro 15 (vp 1-4)
(1, 5.0, 'Incredible machine. The M3 Pro handles everything I throw at it. Battery easily lasts a full workday. Bought it as a Christmas gift for myself!'),
(1, 4.5, 'Great laptop but runs a bit warm under heavy load. Display is stunning. Perfect for my college work.'),
(2, 4.0, 'Good price from MegaMart with the MEGA10 coupon. Arrived well-packaged. Solid performance for coding and editing.'),
(3, 3.5, 'Decent deal but shipping took longer than expected. The laptop itself is great — worth the wait.'),

-- Product 2: AirSound Max (vp 5-7)
(5, 5.0, 'Best noise cancellation I have ever experienced. Spatial audio is a game changer for studying and focus.'),
(5, 4.5, 'Comfortable for long sessions. Sound quality is phenomenal. Gifted these for Valentine''s Day and they loved it.'),
(6, 4.0, 'Great headphones at a fair price. Bluetooth connection is rock solid.'),
(7, 4.5, 'Amazing value. These rival headphones that cost twice as much. ASMR sounds incredible on these.'),

-- Product 3: SmartWatch Ultra (vp 8-10)
(8, 4.5, 'Accurate health tracking and the GPS works flawlessly on runs. Wearing it for my New Year fitness goals.'),
(9, 4.0, 'Battery life is impressive. UI could be a bit more intuitive though.'),
(10, 5.0, 'Love it! The temperature sensor is surprisingly accurate. Got matching ones as couple watches for Valentine''s.'),

-- Product 4: StreamCam 4K (vp 11-13)
(11, 5.0, 'Upgraded my streaming setup massively. AI face tracking is incredibly smooth. My viewers noticed the quality jump immediately.'),
(12, 4.5, 'Perfect for my YouTube channel. The dual stereo mics actually sound really good. Christmas gift from my parents!'),
(13, 4.0, 'Good camera for the price. Works great with OBS. Lighting matters though — pair with a ring light.'),

-- Product 5: Wireless Earbuds SE (vp 14-16)
(14, 4.0, 'Solid budget earbuds. Sound is clear and battery is decent. Perfect gym companion.'),
(15, 3.5, 'Good for the price but the passive noise cancellation isn''t great in noisy environments.'),
(16, 4.5, 'Love the aesthetic packaging from TrendyCart. Sound is surprisingly rich for this price range.'),

-- Product 6: ClearView Monitor 27 (vp 17-19)
(17, 4.5, 'Colors are gorgeous out of the box. USB-C hub is super convenient — one cable to rule them all.'),
(18, 4.0, 'Great 4K monitor. HDR400 is a bit weak but perfect for productivity and photo editing.'),

-- Product 7: Portable Projector Mini (vp 20-23)
(20, 4.5, 'Had an amazing Christmas movie night with this. 100-inch screen in my bedroom! The future is here.'),
(21, 4.0, 'Good value projector. Image is surprisingly sharp for the price. Battery could last longer.'),
(23, 5.0, 'Used this for Diwali movie night with the family. Everyone was blown away. FestiveFinds shipped it perfectly.'),

-- Product 8: Smart Speaker Home (vp 24-26)
(24, 4.5, 'Sound quality rivals much more expensive speakers. Smart home control is seamless.'),
(25, 4.0, 'Great speaker for the price. Played Christmas carols all December. Kids love talking to it.'),

-- Product 9: Vlog Kit Pro (vp 27-29)
(28, 5.0, 'This kit leveled up my content creation game instantly. The gimbal is butter-smooth. TrendyCart packaging was fire.'),
(29, 4.0, 'Good starter kit for new creators. The wireless lav mic is surprisingly good quality.'),

-- Product 10: Gaming Monitor 165Hz (vp 30-32)
(30, 5.0, 'The smoothness at 165Hz is insane. Cannot go back to 60Hz ever. Colors pop in every game.'),
(31, 4.5, 'Great gaming monitor. Slight light bleed in corners but unnoticeable during gameplay.'),

-- Product 11: Retro Instant Camera (vp 33-35)
(33, 5.0, 'SO aesthetic!! The pastel pink color is gorgeous. My Instagram stories look amazing with the printed photos.'),
(34, 4.5, 'Got this from FestiveFinds for Valentine''s. Printed couple photos are now all over my room wall. Love it!'),
(35, 4.0, 'Fun camera! Film is a bit expensive but the instant gratification of physical photos is worth it.'),

-- Product 12: Smart Display Hub (vp 36-38)
(36, 4.5, 'Perfect kitchen companion. Follow recipes, video call family, and it shows our wedding photos as screensaver.'),
(37, 5.0, 'Bought for my parents as a Diwali gift. They use it for video calls and absolutely love it.'),

-- Product 13: ProGamer Mouse RGB (vp 39-41)
(39, 5.0, 'At 58g this thing feels like air. Sensor is flawless. RGB customization through the app is sick.'),
(40, 4.5, 'Best gaming mouse under $80. Clicks are crisp and the paracord cable doesn''t drag.'),
(41, 4.5, 'Got this as a Christmas gift. The RGB matches my whole setup. Zero complaints.'),

-- Product 14: Surround Headset 7.1 (vp 42-44)
(42, 4.5, 'Footsteps in Valorant are crystal clear with 7.1 surround. Mic quality is surprisingly good for the price.'),
(43, 4.0, 'Comfortable for long gaming sessions. Memory foam ear cushions are chef''s kiss.'),

-- Product 15: Controller Pro Wireless (vp 45-47)
(45, 5.0, 'Hall effect sticks = ZERO drift. Finally a controller that will last. Works perfectly on PC and Switch.'),
(46, 4.5, 'Great controller. 40-hour battery is not a joke — I charge it once a week during gaming marathons.'),
(47, 4.5, 'Solid build quality. Bought from TrendyCart — the packaging made it feel like a premium unboxing.'),

-- Product 16: Gaming Chair ErgoMax (vp 48-50)
(48, 4.5, 'Back pain GONE after switching to this chair. The mesh back is way better than pleather in summer.'),
(49, 4.0, 'Got the white/pink one — looks amazing in my room tour videos. Comfortable for 8-hour streams.'),

-- Product 17: Capture Card 4K (vp 51-52)
(51, 5.0, 'Ultra-low latency is no joke. Stream my PS5 in crisp quality now. Setup took 5 minutes.'),
(52, 4.5, 'Perfect for my YouTube gaming channel. 4K passthrough while capturing 1080p60 is the sweet spot.'),

-- Product 18: Desk Mat XXL Galaxy (vp 53-55)
(53, 4.0, 'The galaxy print looks fire. RGB edge lighting syncs with my peripherals. Good size for keyboard + mouse.'),
(55, 4.5, 'TrendyCart delivered this in perfect condition. The micro-texture is smooth but gives enough control for gaming.'),

-- Product 19: Portable Gaming Console (vp 56-58)
(56, 5.0, 'This little beast runs everything I throw at it. OLED screen is gorgeous. Took it on our Christmas road trip — 10/10.'),
(57, 4.5, 'Great handheld. The emulation community support is incredible. Battery lasts through long flights.'),

-- Product 20: VR Headset Lite (vp 59-61)
(59, 4.5, 'First VR headset and I''m blown away. No PC needed. Beat Saber at Christmas party was the highlight.'),
(60, 4.0, 'Good entry-level VR. Gets a bit heavy after 2 hours. Display clarity is impressive for standalone.'),

-- Product 21: PowerBank 20K (vp 62-64)
(62, 4.0, '65W charging is fast enough to charge my laptop. Compact and well-built. Travel essential.'),
(63, 3.5, 'Works fine for the price. A bit heavier than expected but the capacity makes up for it.'),
(64, 4.5, 'Sleek design from TrendyCart. Charged my MacBook on a 5-hour flight. Lifesaver.'),

-- Product 22: MechKey 75 (vp 65-68)
(65, 5.0, 'Hot-swap switches are addictive. Typing feel is incredible. RGB customization is top tier.'),
(66, 4.5, 'Excellent keyboard for the price. Bluetooth mode works flawlessly with my iPad.'),
(67, 4.0, 'Good budget mechanical. PBT keycaps feel premium. Switch options could be wider.'),
(68, 4.5, 'TrendyCart included free keycap pullers and extra switches. The thocc sound is perfection.'),

-- Product 23: LED Strip Lights RGB (vp 69-72)
(69, 4.0, 'Easy to install. Music sync is fun at parties. App control works reliably.'),
(70, 3.5, 'Good for the price. Adhesive could be stronger. Colors are vibrant though.'),
(71, 4.5, 'My room looks like a TikTok setup now. Music reactive mode goes crazy during Diwali celebrations.'),
(72, 5.0, 'Bought from FestiveFinds for Diwali decorations. The warm tones look beautiful around the windows. Reusable every year!'),

-- Product 24: Phone Grip PopStand (vp 73-75)
(73, 4.0, 'Simple but effective. MagSafe attachment is strong. Doubles as a stand for watching videos.'),
(74, 4.5, 'Got the holographic one — SO cute. Everyone asks where I got it. Holds phone securely.'),
(75, 4.5, 'Bought matching designs for me and my boyfriend for Valentine''s. Adorable couple gift!'),

-- Product 25: Aesthetic Phone Case (vp 76-78)
(76, 5.0, 'The dried flower design is GORGEOUS. Clear case shows it off perfectly. Survived a drop from my desk.'),
(77, 4.0, 'Good protection and looks amazing. The holographic version catches light beautifully in photos.'),
(78, 4.5, 'Got the butterfly design as a Valentine''s gift. She loves it. Quality feels premium.'),

-- Product 26: USB-C Hub 7-in-1 (vp 79-81)
(79, 4.5, 'Saved my MacBook life. One cable — HDMI, USB, SD, charging. All in aluminum. Essential.'),
(80, 4.0, 'Compact and works well. Gets slightly warm during extended use but functions perfectly.'),

-- Product 27: Wireless Charger Pad (vp 82-84)
(82, 4.5, 'Charges my phone, watch, and AirPods simultaneously. Nightstand is finally clean. Love the sage green color.'),
(83, 4.5, 'The vegan leather finish looks classy. Charging speed is solid at 15W. Got it for Diwali self-gifting.'),
(84, 5.0, 'Bought this from FestiveFinds as a Christmas gift. The subtle LED breathing light looks premium at night.'),

-- Product 28: Camera Lens Kit (vp 85-87)
(85, 4.0, 'Wide angle lens is great for group photos. Macro lens reveals tiny details I never noticed. Fun to play with!'),
(86, 4.5, 'Content creation on a budget. These lenses actually produce sharp images. The telephoto is impressive for a clip-on.'),

-- Product 29: Mini Bluetooth Printer (vp 88-90)
(88, 5.0, 'SO cute and addictive! Print photos, stickers, study notes — anything. No ink needed. My whole friend group bought one.'),
(89, 4.0, 'Prints are decent quality. Black and white only but the nostalgia factor is real.'),
(90, 4.5, 'Printed all our Valentine''s Day photos instantly. The sticker paper option is chef''s kiss.'),

-- Product 30: Smart Water Bottle (vp 91-93)
(91, 4.5, 'The temperature display is actually useful. Hydration reminders helped me drink more water. Aesthetic in rose gold.'),
(92, 4.0, 'Good quality stainless steel. Keeps water cold for a full day. The LED glow reminder is a nice touch.'),

-- Product 31: ErgoDesk Stand (vp 94-95)
(94, 4.5, 'Transformed my workspace. The bamboo surface looks premium. Standing while working = game changer.'),
(95, 4.0, 'Sturdy and easy to adjust. Monitor arm is a nice bonus. Bought it during Diwali office sale.'),

-- Product 32: AirPure Mini (vp 96-98)
(96, 4.0, 'Whisper quiet on sleep mode. Noticeably cleaner air within a day. A must-have.'),
(97, 4.5, 'Small but powerful. Auto mode adjusts perfectly. Highly recommend for pet owners.'),
(98, 5.0, 'Bought this from FestiveFinds specifically for Diwali season — the smoke from crackers and diyas was handled amazingly. Runs 24/7 now.'),

-- Product 33: Sunset Lamp Projector (vp 99-101)
(99, 5.0, 'My room looks like a Pinterest board now. The sunset mode is literally therapy. TikTok made me buy it and NO regrets.'),
(100, 4.0, 'Good for photos and ambiance. The rainbow mode is beautiful for Valentine''s night.'),
(101, 4.5, 'Got this for my dorm room. Everyone who walks in asks about it. The galaxy mode is my favorite.'),

-- Product 34: Aroma Diffuser LED (vp 102-104)
(102, 4.5, 'The LED color modes set the perfect mood. Use lavender oil every night — sleep quality improved dramatically.'),
(103, 4.0, 'Good diffuser with decent coverage. Timer feature is convenient. Looks elegant on my shelf.'),
(104, 5.0, 'Used this during Diwali pooja with sandalwood essential oil. The soft LED glow and fragrance created perfect ambiance. Beautiful.'),

-- Product 35: Neon Sign Custom (vp 105-107)
(105, 5.0, 'Got "Good Vibes Only" in pink. My room literally glows now. Best purchase for my TikTok room makeover.'),
(106, 4.0, 'Quality is solid. The dimmer is useful — bright enough for videos, soft enough for sleep.'),
(107, 4.5, 'Ordered a custom name sign as a birthday gift. They loved it. Shipping was fast from FestiveFinds.'),

-- Product 36: Smart Plug Mini 4-Pack (vp 108-110)
(108, 4.0, 'Automated my desk lamp, fairy lights, and fan. Energy monitoring is a nice bonus feature.'),
(109, 3.5, 'Basic but reliable. Setup was easy. Scheduled my Christmas tree lights to turn on at sunset.'),

-- Product 37: Smart LED Bulb 4-Pack (vp 111-113)
(111, 4.5, 'Set my room to red and green for Christmas, then orange for Halloween. Music sync at parties is INSANE.'),
(112, 4.0, 'Good smart bulbs. Colors are vibrant. App is straightforward. Just wish they were brighter.'),
(113, 5.0, 'FestiveFinds recommended these for Diwali and they were PERFECT. Set them to warm gold and the house looked magical.'),

-- Product 38: Mini Fridge Portable (vp 114-116)
(114, 4.5, 'The lavender color matches my room aesthetic perfectly. Keeps my skincare AND snacks at the perfect temp.'),
(115, 4.0, 'Runs super quiet. Good for a dorm room. The retro design is cute. Fits 6 cans comfortably.'),

-- Product 39: Galaxy Star Projector (vp 117-119)
(117, 5.0, 'My bedroom ceiling looks like the Milky Way. The Bluetooth speaker is a nice bonus — play lo-fi beats while stargazing in bed.'),
(118, 4.0, 'Good projector for the price. Stars could be a bit sharper. Nebula effect is gorgeous though.'),
(119, 5.0, 'Used this for our Christmas Eve party — everyone was mesmerized. Playing holiday music through the built-in speaker was perfect.'),

-- Product 40: Vinyl Record Player (vp 120-122)
(120, 4.5, 'The warm vinyl sound is unmatched. Bluetooth output to my speaker is seamless. Looks beautiful on my shelf.'),
(121, 5.0, 'TrendyCart shipped it with a free vinyl starter pack. The wood grain finish is gorgeous. Aesthetic room essential.'),

-- Product 41: Skincare Fridge Glow (vp 123-125)
(123, 5.0, 'The LED mirror on the door is genius. My morning routine is now a vibe. Serums stay perfectly chilled.'),
(124, 4.5, 'Bought as a Valentine''s treat-yourself gift. The blush pink is adorable. My skincare game is next level.'),
(125, 4.0, 'Good mini fridge. Runs quietly. The shelves are removable for different bottle sizes. Worth it.'),

-- Product 42: Journaling Kit Aesthetic (vp 126-128)
(126, 5.0, 'This kit has EVERYTHING. The 160gsm paper is thick, brush pens don''t bleed. My bullet journal looks professional now.'),
(127, 4.5, 'Perfect New Year gift for planning the year ahead. The washi tape collection is beautiful.'),
(128, 4.0, 'Great value for everything included. The canvas pouch holds it all neatly. Good stocking stuffer.'),

-- Product 43: Anti-Theft Backpack (vp 129-131)
(129, 4.5, 'Hidden zippers give peace of mind in crowded places. Laptop compartment fits my 15-inch perfectly. USB port is handy.'),
(130, 4.0, 'Water-resistant material held up in rain. Good organization pockets. Comfortable straps.'),
(131, 4.5, 'Bought for college. Looks sleek, fits everything, and the anti-theft features are clutch on public transport.'),

-- Product 44: Polaroid Photo Wall Kit (vp 132-134)
(132, 5.0, 'My room wall is now a gallery of memories. The fairy lights make it glow at night. Total Pinterest aesthetic.'),
(133, 4.5, 'Got this for Valentine''s Day — displayed all our photos together. She cried happy tears. Best gift ever.'),
(134, 4.0, 'Easy to set up. The wooden clips hold photos well. Fairy lights add warm vibes. Good dorm room decor.'),

-- Product 45: Scented Candle Gift Set (vp 135-137)
(135, 5.0, 'The Christmas Pine scent is DIVINE. Each candle burns for ages. Luxurious gift box presentation. My favorite festival gift set.'),
(136, 4.5, 'Diwali Jasmine & Sandalwood is heavenly. Gifted to my mom and she adores it. Burns clean with no soot.'),
(137, 4.5, 'The Valentine Rose candle set the mood perfectly. 4 seasonal scents — great value. Soy wax quality.'),

-- Product 46: Fitness Resistance Band Set (vp 138-140)
(138, 4.0, 'Started my New Year workout journey with these. 5 levels cover beginner to advanced. The poster guide helps.'),
(139, 3.5, 'Decent bands for the price. The latex feels durable. Ankle straps are a nice inclusion.'),
(140, 4.5, 'Great home gym starter. TrendyCart included a workout e-book. Latex quality feels premium for the price.'),

-- Product 47: Christmas LED Tree Light (vp 141-143)
(141, 5.0, 'The app control is next-level. 400+ effects and I can sync it to Christmas music. Our tree was the star of the neighborhood.'),
(142, 4.5, 'Easy setup — foldable design stores in one box. Beautiful warm white mode for elegant look, crazy RGB for fun.'),

-- Product 48: Diwali Diya LED Set (vp 144-146)
(144, 5.0, 'These look incredibly realistic! The flickering flame effect fooled our guests. Safe around kids and pets. Used them all around the house for Diwali. Will buy more next year.'),
(145, 4.5, 'Beautiful brass-finish look. Battery lasts forever. Used on my balcony for Diwali and they''re still going after weeks.'),
(146, 4.0, 'Good value for 12 pieces. The waterproof rating meant I could use them outdoors too. Nice Diwali touch.'),

-- Product 49: Valentine Gift Box Deluxe (vp 147-148)
(147, 5.0, 'The preserved roses are STUNNING — they look fresh months later. My girlfriend was speechless. The love coupons booklet was such a cute touch. 11/10 Valentine''s gift.'),
(148, 4.5, 'Beautiful presentation. The magnetic box itself is reusable. TrendyCart added free stickers which made it extra special.'),

-- Product 50: Halloween Fog Machine Pro (vp 149-151)
(149, 5.0, 'Our Halloween party was LEGENDARY. Filled the entire room in a minute. RGB LEDs made the fog glow in different colors. Everyone asked where I got it.'),
(150, 4.5, 'Heats up fast and output is impressive. Used it for a haunted house setup. Also works great for TikTok video effects.'),
(151, 4.0, 'Good fog machine for the price. Tank capacity is generous. Remote control is convenient during parties.');

-- -----------------------------------------
-- carts
-- -----------------------------------------

INSERT INTO public.carts (user_id, budget_limit) VALUES
('user_alice', 2500.00),
('user_bob',   500.00),
('user_gen_z', 200.00);

-- -----------------------------------------
-- cart_items
-- -----------------------------------------

INSERT INTO public.cart_items (cart_id, vendor_product_id, quantity) VALUES
-- Alice's cart: laptop + headphones + keyboard + charger pad
(1, 1,  1),   -- UltraBook Pro 15 from TechHub ($1899.99)
(1, 5,  1),   -- AirSound Max from TechHub ($349.99)
(1, 65, 1),   -- MechKey 75 from TechHub ($129.99)
(1, 82, 1),   -- Wireless Charger Pad from TechHub ($59.99)

-- Bob's cart: powerbank + air purifier + smart watch
(2, 63, 2),   -- PowerBank 20K from PrimeDeals ($39.99 x2)
(2, 97, 1),   -- AirPure Mini from ValueStore ($99.99)
(2, 10, 1),   -- SmartWatch Ultra from TrendyCart ($439.99)

-- Gen Z cart: aesthetic haul
(3, 99, 1),   -- Sunset Lamp from TrendyCart ($34.99)
(3, 76, 1),   -- Aesthetic Phone Case from TrendyCart ($29.99)
(3, 71, 1),   -- LED Strip Lights from TrendyCart ($22.99)
(3, 88, 1),   -- Mini Bluetooth Printer from TrendyCart ($49.99)
(3, 74, 1);   -- Phone Grip from TrendyCart ($16.99)
