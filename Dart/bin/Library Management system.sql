CREATE DATABASE library;

USE library;

CREATE TABLE books (
  id INT(11) NOT NULL ,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  publisher VARCHAR(255) NOT NULL,
  publication_date DATE NOT NULL,
  isbn VARCHAR(20) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE members (
  id INT(11) NOT NULL ,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE book_transactions (
  id INT(11) NOT NULL ,
  book_id INT(11) NOT NULL,
  member_id INT(11) NOT NULL,
  borrow_date DATE NOT NULL,
  due_date DATE NOT NULL,
  return_date DATE,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id) REFERENCES books(id),
  FOREIGN KEY (member_id) REFERENCES members(id)
);
