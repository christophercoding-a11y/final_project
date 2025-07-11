DROP DATABASE IF EXISTS librarydb;
CREATE DATABASE librarydb;
USE librarydb;

CREATE TABLE format (
    format_id TINYINT UNSIGNED AUTO_INCREMENT NOT NULL,
    format VARCHAR(20) NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_format PRIMARY KEY (format_id)
);



CREATE TABLE genre (
    genre_id TINYINT UNSIGNED AUTO_INCREMENT NOT NULL,
    genre VARCHAR(50),
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_genre PRIMARY KEY (genre_id)
);

CREATE TABLE publisher (
    publisher_id TINYINT UNSIGNED AUTO_INCREMENT NOT NULL,
    publisher VARCHAR(30),
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_publisher PRIMARY KEY (publisher_id)
);


CREATE TABLE author (
    author_id TINYINT UNSIGNED AUTO_INCREMENT NOT NULL,
    author VARCHAR(20),
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_author PRIMARY KEY (author_id)
);

CREATE TABLE book (
    book_id SMALLINT UNSIGNED AUTO_INCREMENT NOT NULL,
    title VARCHAR(100) NOT NULL,
    author_id TINYINT UNSIGNED NOT NULL,
    publisher_id TINYINT UNSIGNED NOT NULL,
    copyright_year YEAR,
    edition ENUM ('1st edition', '2nd edition', '3rd edition', '4th edition') DEFAULT '1st edition',
    edition_year YEAR,
    binding ENUM ('paperback', 'hardback', 'e-book') DEFAULT 'hardback',
    rating ENUM ('1','2','3','4','5') DEFAULT '1',
    language ENUM  ('english', 'japanese', 'korean') DEFAULT 'english',
    num_pages SMALLINT UNSIGNED NOT NULL,
    qty TINYINT UNSIGNED NOT NULL,
    cover_image MEDIUMTEXT,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_book PRIMARY KEY (book_id),
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author (author_id),
    CONSTRAINT fk_publisher FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id)
);

CREATE TABLE book_to_genre (
    book_id SMALLINT UNSIGNED NOT NULL,
    genre_id TINYINT UNSIGNED NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_book_bg FOREIGN KEY (book_id) REFERENCES book (book_id),
    CONSTRAINT fk_genre_bg FOREIGN KEY (genre_id) REFERENCES genre (genre_id)
);

CREATE TABLE book_to_format (
    book_id SMALLINT UNSIGNED NOT NULL,
    format_id TINYINT UNSIGNED NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_book_bf FOREIGN KEY (book_id) REFERENCES book (book_id),
    CONSTRAINT fk_format_bf FOREIGN KEY (format_id) REFERENCES format (format_id)
);

ALTER TABLE author
    ADD COLUMN img_url MEDIUMTEXT;

    ALTER TABLE publisher
    ADD COLUMN img_url MEDIUMTEXT;




-- resetting auto increment
set @num:= 0;
UPDATE my_table SET id = @num:= (@num + 1);
ALTER TABLE my_table AUTO_INCREMENT = 1;