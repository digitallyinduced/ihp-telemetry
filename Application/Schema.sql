-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE events (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    ihp_version TEXT NOT NULL,
    os TEXT NOT NULL,
    arch TEXT NOT NULL,
    project_id TEXT NOT NULL
);
