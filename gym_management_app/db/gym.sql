DROP TABLE attendants;
DROP TABLE members;
DROP TABLE events;


CREATE TABLE members
(
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  title VARCHAR(255),
  address TEXT,
  dob VARCHAR(255)
);

CREATE TABLE events
(
  id SERIAL8 primary key,
  event_type VARCHAR(255),
  event_date DATE,
  event_time TIME,
  event_caps INT8
);

CREATE TABLE attendants
(
  id SERIAL8 primary key,
  member_id INT8 references members(id) ON DELETE CASCADE,
  event_id INT8 references events(id) ON DELETE CASCADE
);
