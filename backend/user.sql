DROP DATABASE IF EXISTS Username_and_Password;
CREATE DATABASE Username_and_Password;
USE Username_and_Password;


CREATE TABLE products (
    id VARCHAR(36) PRIMARY KEY,
    image VARCHAR(255),
    name VARCHAR(255),
    stars DECIMAL(3,1),
    count INT,
    priceCents INT
);

CREATE TABLE cred (
	username VARCHAR(50),
    password VARCHAR(50)
);

CREATE TABLE flag (
	flag VARCHAR(50)
);


INSERT INTO cred (username, password) VALUES
('admin', 'password123'),
('user', 'letmein');

INSERT INTO flag (flag) VALUES
('sql_injection');


CREATE TABLE reviews (
    id VARCHAR(36) PRIMARY KEY,
    username VARCHAR(255),
    stars DECIMAL(3,1),
    review VARCHAR(255)
);

INSERT INTO reviews (id, username, stars, review)
VALUES
('8c9c52b5-5a19-4bcb-a5d1-158a74287c53','John.H', 4,'Fast delivery, good price'),
('19c6a64a-5463-4d45-9af8-e41140a4100c', 'Shakir', 4, 'Good price and quality but I waited one week for delivery'),
('3fdfe8d6-9a15-4979-b459-585b0d0545b9', 'Olga', 5, 'Great product!'),
('58b4fc92-e98c-42aa-8c55-b6b79996769a', 'Mary.J', 5, 'Great quality!');




-- Insert statements for remaining products
INSERT INTO products (id, image, name, stars, count, priceCents)
VALUES
('e43638ce-6aa0-4b85-b27f-e1d07eb678c6', './products/athletic-cotton-socks-6-pairs.jpg', 'Black and Gray Athletic Cotton Socks - 6 Pairs', 1.5, 87, 1090),
('15b6fc6f-327a-4ec4-896f-486349e85a3d', './products/intermediate-composite-basketball.jpg', 'Intermediate Size Basketball', 4, 127, 2095),
('83d4ca15-0f35-48f5-b7a3-1ea210004f2e', './products/adults-plain-cotton-tshirt-2-pack-teal.jpg', 'Adults Plain Cotton T-Shirt - 2 Pack', 2.5, 56, 799),
('54e0eccd-8f36-462b-b68a-8182611d9add', './products/black-2-slot-toaster.jpg', '2 Slot Toaster - Black', 5, 2197, 1899),
('3ebe75dc-64d2-4137-8860-1f5a963e534b', './products/6-piece-white-dinner-plate-set.jpg', '6 Piece White Dinner Plate Set', 4, 37, 2067),
('8c9c52b5-5a19-4bcb-a5d1-158a74287c53', './products/6-piece-non-stick-baking-set.webp', '6-Piece Nonstick, Carbon Steel Oven Bakeware Baking Set', 4.5, 175, 3499),
('dd82ca78-a18b-4e2a-9250-31e67412f98d', './products/plain-hooded-fleece-sweatshirt-yellow.jpg', 'Plain Hooded Fleece Sweatshirt', 4.5, 317, 2400),
('77919bbe-0e56-475b-adde-4f24dfed3a04', './products/luxury-tower-set-6-piece.jpg', 'Luxury Towel Set - Graphite Gray', 3.5, 144, 3599),
('3fdfe8d6-9a15-4979-b459-585b0d0545b9', './products/liquid-laundry-detergent-plain.jpg', 'Liquid Laundry Detergent, 110 Loads, 82.5 Fl Oz', 4.5, 305, 2899),
('58b4fc92-e98c-42aa-8c55-b6b79996769a', './products/knit-athletic-sneakers-gray.jpg', 'Waterproof Knit Athletic Sneakers - Gray', 4, 89, 3390),
('a93a101d-79ef-4cf3-a6cf-6dbe532a1b4a', './products/bathroom-rug.jpg', 'Bathroom Bath Rug Mat 20 x 31 Inch - Grey', 1.5, 119, 1250),
('4f4fbcc2-4e72-45cc-935c-9e13d79cc57f', './products/women-knit-ballet-flat-black.jpg', 'Women\'s Knit Ballet Flat', 2, 326, 2640),
('8b5a2ee1-6055-422a-a666-b34ba28b76d4', './products/men-golf-polo-t-shirt-blue.jpg', 'Men\'s Regular-Fit Quick-Dry Golf Polo Shirt', 4.5, 2556, 1599),
('b86ddc8b-3501-4b17-9889-a3bad6fb585f', './products/trash-can-with-foot-pedal-50-liter.jpg', 'Trash Can with Foot Pedal - Brushed Stainless Steel', 4.5, 2286, 8300),
('19c6a64a-5463-4d45-9af8-e41140a4100c', './products/duvet-cover-set-blue-twin.jpg', 'Duvet Cover Set with Zipper Closure', 3, 456, 2399),
('d2785924-743d-49b3-8f03-ec258e640503', './products/women-chunky-beanie-gray.webp', 'Women\'s Chunky Cable Beanie - Gray', 5, 83, 1250),
('ee1f7c56-f977-40a4-9642-12ba5072e2b0', './products/men-chino-pants-beige.jpg', 'Men\'s Classic-fit Pleated Chino Pants', 4.5, 9017, 2290),
('1c079479-8586-494f-ab53-219325432536', './products/men-athletic-shoes-green.jpg', 'Men\'s Athletic Sneaker', 4, 229, 3890),
('4df68c27-fd59-4a6a-bbd1-e754ddb6d53c', './products/men-navigator-sunglasses-brown.jpg', 'Men\'s Navigator Sunglasses Pilot', 3.5, 42, 1690),
('4e37dd03-3b23-4bc6-9ff8-44e112a92c64', './products/non-stick-cooking-set-15-pieces.webp', 'Non-Stick Cookware Set, Pots, Pans and Utensils - 15 Pieces', 4.5, 511, 6797),
('a434b69f-1bc1-482d-9ce7-cd7f4a66ce8d', './products/vanity-mirror-silver.jpg', 'Vanity Mirror with Heavy Base - Chrome', 2.5, 130, 1649),
('a45cfa0a-66d6-4dc7-9475-e2b01595f7d7', './products/women-french-terry-fleece-jogger-camo.jpg', 'Women\'s Fleece Jogger Sweatpant', 4.5, 248, 2400);

