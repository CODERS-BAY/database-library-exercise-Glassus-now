CREATE DATABASE library;
USE library;

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT NOT NULL ,
    first_name varchar(30),
    last_name varchar(30),
    email varchar(40),
    PRIMARY KEY (customer_id)
);

CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT NOT NULL ,
    first_name varchar(30),
    last_name varchar(30),
    PRIMARY KEY (employee_id)
);

CREATE TABLE publishing_house (
    publishing_house_id INT AUTO_INCREMENT NOT NULL ,
    publish_name varchar(30),
    PRIMARY KEY (publishing_house_id)
);

CREATE TABLE reserve (
    reserve_id INT AUTO_INCREMENT NOT NULL,
    customer_id INT NOT NULL ,
    employee_id INT NOT NULL ,
    PRIMARY KEY (reserve_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON UPDATE CASCADE ,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON UPDATE CASCADE
);

CREATE TABLE loan (
    loan_id INT AUTO_INCREMENT NOT NULL,
    customer_id INT NOT NULL ,
    employee_id_create INT NOT NULL ,
    employee_id_back INT NOT NULL,
    PRIMARY KEY (loan_id),
    FOREIGN KEY (employee_id_create) REFERENCES employee(employee_id) ON UPDATE CASCADE,
    FOREIGN KEY (employee_id_back) REFERENCES employee(employee_id) ON UPDATE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON UPDATE CASCADE
);


CREATE TABLE author (
    author_id INT AUTO_INCREMENT NOT NULL ,
    first_name varchar(30),
    last_name varchar(30),
    date_of_birth date NOT NULL,
    PRIMARY KEY (author_id)
);

CREATE TABLE shelf (
    shelf_id INT AUTO_INCREMENT NOT NULL ,
    row INT,
    shelf_number INT,
    PRIMARY KEY (shelf_id)
);

CREATE TABLE book (
    book_id INT AUTO_INCREMENT NOT NULL ,
    title varchar(30),
    publishing_house_id INT NOT NULL,
    shelf_id INT NOT NULL,
    PRIMARY KEY (book_id),
    FOREIGN KEY (publishing_house_id) REFERENCES publishing_house(publishing_house_id) ON UPDATE CASCADE,
    FOREIGN KEY (shelf_id) REFERENCES shelf (shelf_id) ON UPDATE CASCADE
);

CREATE TABLE journal (
    journal_id INT AUTO_INCREMENT NOT NULL ,
    title varchar(30),
    publishing_house_id INT NOT NULL ,
    shelf_id INT NOT NULL ,
    PRIMARY KEY (journal_id),
    FOREIGN KEY (publishing_house_id) REFERENCES publishing_house(publishing_house_id) ON UPDATE CASCADE ,
    FOREIGN KEY (shelf_id) REFERENCES shelf(shelf_id) ON UPDATE CASCADE
);

CREATE TABLE article (
    article_id INT AUTO_INCREMENT NOT NULL ,
    title varchar(30),
    journal_id INT NOT NULL ,
    PRIMARY KEY (article_id),
    FOREIGN KEY (journal_id) REFERENCES journal (journal_id) ON UPDATE CASCADE
);

CREATE TABLE keyword (
    keyword_id INT AUTO_INCREMENT NOT NULL ,
    name varchar(30),
    PRIMARY KEY (keyword_id)
);

CREATE TABLE subject_area (
    subject_area_id INT AUTO_INCREMENT NOT NULL ,
    subject_name varchar(30),
    PRIMARY KEY (subject_area_id)
);

CREATE TABLE article_include_keyword (
    article_id INT NOT NULL,
    keyword_id INT NOT NULL,
    PRIMARY KEY (article_id, keyword_id),
    FOREIGN KEY (article_id) REFERENCES article(article_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword(keyword_id)
);

CREATE TABLE book_include_keyword (
    book_id INT NOT NULL,
    keyword_id INT NOT NULL,
    PRIMARY KEY (book_id, keyword_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword(keyword_id)
);

CREATE TABLE author_write_article (
    article_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (article_id, author_id),
    FOREIGN KEY (article_id) REFERENCES article(article_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE author_write_book (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

INSERT INTO author(first_name, last_name, date_of_birth)
VALUES ('Max', 'Mustermann', '2019-10-09');

INSERT INTO customer(first_name, last_name, email)
VALUES ('Susi', 'Musterfrau', 'Susi.muster@beispiel.com');

INSERT INTO employee(first_name, last_name)
VALUES ('Fred', 'Feuerstein');

INSERT INTO keyword(name)
VALUES ('Apfel');

INSERT INTO publishing_house(publish_name)
VALUES ('HelloWorld');

INSERT INTO reserve(customer_id, employee_id)
VALUES (1, 1);

INSERT INTO shelf(row, shelf_number)
VALUES (1, 1);

INSERT INTO subject_area(subject_name)
VALUES ('Datenbanken');

INSERT INTO loan(customer_id, employee_id_create, employee_id_back)
VALUES (1, 1, 1);

INSERT INTO journal(title, publishing_house_id, shelf_id)
VALUES ('journal123', 1, 1);

INSERT INTO article(title, journal_id)
VALUES ('article123', 1);

INSERT INTO book(title, publishing_house_id, shelf_id)
VALUES ('Book123', 1, 1);

INSERT INTO article_include_keyword(article_id, keyword_id)
VALUES (1, 1);

INSERT INTO author_write_article(article_id, author_id)
VALUES (1, 1);

INSERT INTO author_write_book(book_id, author_id)
VALUES (1, 1);

INSERT INTO book_include_keyword(book_id, keyword_id)
VALUES (1, 1);