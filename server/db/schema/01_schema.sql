-- Drop and recreate users table
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  password VARCHAR(255) NOT NULL,
  is_admin BOOLEAN NOT NULL DEFAULT false
);

-- Drop and recreate playlists table
DROP TABLE IF EXISTS playlists CASCADE;
CREATE TABLE playlists (
  id SERIAL PRIMARY KEY NOT NULL,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  FOREIGN KEY (user_id) INTEGER REFERENCES users(id) ON DELETE CASCADE
);