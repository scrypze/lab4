-- Индекс для поиска по email пользователей
CREATE INDEX idx_users_email ON users(email);

-- Индекс для поиска рабочих мест по коворкингу
CREATE INDEX idx_desks_coworking ON desks(coworking_id);

-- Составной индекс для поиска бронирований по времени
CREATE INDEX idx_bookings_time ON bookings(start_time, end_time);

-- Индекс для поиска бронирований пользователя
CREATE INDEX idx_bookings_user ON bookings(user_id);

-- Индекс для поиска бронирований рабочего места
CREATE INDEX idx_bookings_desk ON bookings(desk_id); 