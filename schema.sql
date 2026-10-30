CREATE DATABASE IF NOT EXISTS canteen_db;
USE canteen_db;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS food_items;

CREATE TABLE food_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    description VARCHAR(255),
    image_url VARCHAR(255),
    available BOOLEAN DEFAULT TRUE
);

CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    table_number INT NOT NULL,
    total_price DOUBLE NOT NULL,
    status VARCHAR(30) DEFAULT 'Received',
    order_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT,
    food_item_id BIGINT,
    quantity INT NOT NULL,
    price DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (food_item_id) REFERENCES food_items(id)
);

INSERT INTO food_items (name, category, price, description, image_url, available) VALUES
('Masala Dosa', 'South Indian', 60.00, 'Crispy golden dosa stuffed with spiced potato masala served with chutney and sambar.', 'https://images.unsplash.com/photo-1668236543090-82eba5ee5976?auto=format&fit=crop&w=500&q=80', true),
('Chicken Biryani', 'Main Course', 140.00, 'Aromatic basmati rice cooked with tender chicken pieces and traditional spices.', 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8?auto=format&fit=crop&w=500&q=80', true),
('Veg Fried Rice', 'Chinese', 90.00, 'Wok-tossed rice with fresh vegetables, soy sauce, and scallions.', 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=500&q=80', true),
('Paneer Butter Masala', 'Main Course', 120.00, 'Soft paneer cubes simmered in a rich, creamy buttery tomato gravy.', 'https://images.unsplash.com/photo-1631452180519-c014fe946bc7?auto=format&fit=crop&w=500&q=80', true),
('Cold Coffee', 'Beverages', 50.00, 'Chilled blended coffee served with a creamy froth on top.', 'https://images.unsplash.com/photo-1517701604599-bb29b565090c?auto=format&fit=crop&w=500&q=80', true),
('Veg Burger', 'Fast Food', 70.00, 'Crunchy vegetable patty layered with fresh lettuce, mayo, and cheese slice.', 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=500&q=80', true),
('Samosa (2 pcs)', 'Snacks', 30.00, 'Crispy fried pastry filled with savory spiced potatoes and peas.', 'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=500&q=80', true),
('Chocolate Brownie', 'Desserts', 80.00, 'Rich, fudgy chocolate brownie baked to gooey perfection.', 'https://images.unsplash.com/photo-1606313564200-e75d5e30476c?auto=format&fit=crop&w=500&q=80', true);