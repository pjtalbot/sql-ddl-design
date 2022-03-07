-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT
);

INSERT INTO artists (name)
VALUES
('Hanson'),

('Queen'),
('Mariah Carey'),
('Boys II Men'),
('Lady Gaga'),
('Bradley Cooper'):

CREATE TABLE Producers (
  id SERIAL PRIMARY KEY,
  name TEXT);

INSERT INTO producers
VALUES
("Dust Brothers"), 
("Stephen Lironi"),
("Roy Thomas Baker"),
("Walter Afanasieff"),
("Benjamin Rice");



CREATE TABLE albums (
  id SEriAL PRIMARY KEY,
  name TEXT,
  artist_id INT[] REFERENCES artists(id)
  producer_id INT[] REFERENCES producers(id)
)

INSERT INTO albums (name, artist_id, producer_id)
VALUES
('Middle of Nowhere', 1, 1),
('A Night at the Opera', 2, 2),
('Daydream', 3, 3),
('A Star Is Born', 5, 4);



CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artistids INT[] REFERENCES artists.id,
  album_id INT REFERENCES artists.id
);



INSERT INTO songs
  (title, duration_in_seconds, release_date, artist_ids, album_id)
VALUES
  ('MMMBop', 238, '04-15-1997', [1], 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', [2], 2),
  ('One Sweet Day', 282, '11-14-1995', [3,4], 3),
  ('Shallow', 216, '09-27-2018', [5,6], 4);
