-- Drop and recreate users table
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id INT GENERATED ALWAYS AS IDENTITY,
  username VARCHAR(255) NOT NULL,
  name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255) NOT NULL,
  is_admin BOOLEAN NOT NULL DEFAULT false
  PRIMARY KEY (id),
);

-- Drop and recreate playlists table
DROP TABLE IF EXISTS playlists CASCADE;
CREATE TABLE playlists (
  id INT GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255),
  worlds VARCHAR(255)[],
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) INTEGER REFERENCES users(id) ON DELETE CASCADE
);

-- Drop and recreate favorites table
DROP TABLE IF EXISTS favorites CASCADE;
CREATE TABLE favorites (
  id INT GENERATED ALWAYS AS IDENTITY,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) INTEGER REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (playlist_id) INTEGER REFERENCES playlists(id) ON DELETE CASCADE
);