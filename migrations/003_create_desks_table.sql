CREATE TABLE desks (
    id INTEGER PRIMARY KEY,
    coworking_id INTEGER NOT NULL REFERENCES coworkings(id) ON DELETE CASCADE,
    name VARCHAR NOT NULL,
    type VARCHAR NOT NULL, -- 'desk', 'meeting_room', 'office'
    capacity INTEGER NOT NULL DEFAULT 1,
    price_per_hour DECIMAL(10,2) NOT NULL,
    description TEXT,
    is_available BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
); 