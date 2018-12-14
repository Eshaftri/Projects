DROP TABLE attendauts;
DROP TABLE members;
DROP TABLE events;


CREATE TABLE members
(
  id SERIAL8 primay key,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255),
  titel VARCHAR(255),
  address VARCHAR(255),
  dob VARCHAR(255)
);

CREATE TABLE events
(
  id SERIAL8 primay key,
  event_type VARCHAR(255),
  event_date VARCHAR(255),
  event_time VARCHAR(255),
  event_size VARCHAR(255)
);

CREATE TABLE attendauts
(
  id SERIAL8 primay key,
  member_id INT8 references  members(id),
  event_id INT8 references events(id)
);
