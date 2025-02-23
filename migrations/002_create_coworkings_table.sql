CREATE TABLE coworkings (
    id INTEGER PRIMARY KEY,
    name VARCHAR NOT NULL,
    address TEXT NOT NULL,
    description TEXT,
    opening_hours VARCHAR,
    contact_phone VARCHAR,
    contact_email VARCHAR,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
); 