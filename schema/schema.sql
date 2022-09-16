CREATE DATABASE IF NOT EXISTS catalog_db;

\c catalog_db;

CREATE TABLE author (
    id  INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY(id)
);

-- Create table Games
CREATE TABLE Game(
  id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  publish_date DATE NOT NULL,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
  item_id INT NOT NULL,
  CONSTRAINT item_fk FOREIGN KEY (item_id) REFERENCES Items (id) 
);

CREATE TABLE music_album(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  on_spotify BOOLEAN NOT NULL,
  archived BOOLEAN NOT NULL,
  label_ID INT REFERENCES label(ID),
  author_ID INT REFERENCES author(ID),
  genre_ID INT REFERENCES genre(ID)
);

CREATE TABLE genre(
  ID SERIAL PRIMARY KEY,
  name VARCHAR(30)
);
