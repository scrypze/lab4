-- Вставка тестовых пользователей
INSERT INTO users (id, email, password_hash, name, surname, phone) VALUES
(1, 'admin@example.com', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj2NUn1xqrI.', 'Админ', 'Админов', '+7 999 123 45 67'),
(2, 'user@example.com', '$2a$12$LQv3c1yqBWVHxkd0LHAkCOYz6TtxMQJqhN8/LewdBPj2NUn1xqrI.', 'Иван', 'Иванов', '+7 999 765 43 21');

-- Вставка ролей
INSERT INTO roles (id, name, description) VALUES
(1, 'admin', 'Администратор системы'),
(2, 'user', 'Обычный пользователь');

-- Назначение ролей пользователям
INSERT INTO user_roles (user_id, role_id) VALUES
(1, 1), -- admin@example.com -> admin
(2, 2); -- user@example.com -> user

-- Вставка тестовых коворкингов
INSERT INTO coworkings (id, name, address, description, opening_hours, contact_phone, contact_email) VALUES
(1, 'Центральный Коворкинг', 'ул. Ленина, 1', 'Современный коворкинг в центре города', '09:00-22:00', '+7 999 111 22 33', 'central@coworking.com'),
(2, 'Технопарк', 'ул. Гагарина, 42', 'Коворкинг для IT-специалистов', '24/7', '+7 999 444 55 66', 'tech@coworking.com');

-- Вставка тестовых рабочих мест
INSERT INTO desks (id, coworking_id, name, type, capacity, price_per_hour, description) VALUES
(1, 1, 'Стол А1', 'desk', 1, 200, 'Индивидуальное рабочее место'),
(2, 1, 'Переговорная 1', 'meeting_room', 8, 1000, 'Комната для встреч'),
(3, 2, 'Офис 101', 'office', 4, 500, 'Мини-офис'),
(4, 2, 'Стол B1', 'desk', 1, 250, 'Индивидуальное рабочее место');

-- Вставка тестовых бронирований
INSERT INTO bookings (id, user_id, desk_id, start_time, end_time, status, total_price) VALUES
(1, 2, 1, CURRENT_TIMESTAMP + INTERVAL '1 day', CURRENT_TIMESTAMP + INTERVAL '1 day 4 hours', 'confirmed', 800),
(2, 2, 2, CURRENT_TIMESTAMP + INTERVAL '2 days', CURRENT_TIMESTAMP + INTERVAL '2 days 2 hours', 'pending', 2000);

-- Вставка тестовых платежей
INSERT INTO payments (id, booking_id, amount, status, payment_method, transaction_id) VALUES
(1, 1, 800, 'completed', 'credit_card', 'TXN123456'),
(2, 2, 2000, 'pending', 'bank_transfer', 'TXN789012'); 