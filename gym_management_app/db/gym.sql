DROP TABLE attendants;
DROP TABLE members;
DROP TABLE events;


CREATE TABLE members
(
  id SERIAL8 primary key,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255),
  titel VARCHAR(255),
  address VARCHAR(255),
  dob VARCHAR(255)
);

CREATE TABLE events
(
  id SERIAL8 primary key,
  event_type VARCHAR(255),
  event_date VARCHAR(255),
  event_time VARCHAR(255),
  event_size INT8
);

CREATE TABLE attendants
(
  id SERIAL8 primary key,
  member_id INT8 references  members(id),
  event_id INT8 references events(id)
);
