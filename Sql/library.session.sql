-- @block
-- create database
CREATE DATABASE Library;

-- @block
-- The users Table 
CREATE TABLE Library.`users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `firstname` VARCHAR(255) NOT NULL,
    `lastname` VARCHAR(255) NULL,
    `Emailaddress` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `is_admin` TINYINT(1) NOT NULL,
    `Bio` TEXT NULL,
    `location` VARCHAR(255) NULL,
    `Profile-Icon` TEXT NULL COMMENT 'The path to the icon'
);


-- @block
-- authors table
CREATE TABLE Library.`authors`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` BIGINT NOT NULL
);
-- @block
-- books table
CREATE TABLE Library.`Books`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(255) NOT NULL UNIQUE,
    `description` TEXT NOT NULL,
    `cover` TEXT NULL COMMENT 'the path to the cover icon',
    `Author_ID` BIGINT UNSIGNED NOT NULL,
    `is_available` TINYINT(1) NOT NULL,
    `available-quantity` BIGINT NOT NULL,

    FOREIGN KEY (Author_ID) REFERENCES authors(id)
);

-- @block
-- borrowed books table
CREATE TABLE Library.`Borrowed_Books`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` BIGINT UNSIGNED NOT NULL,
    `Book_id` BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (Book_id) REFERENCES Books(id)
);

-- @block
-- categories table
CREATE TABLE Library.`categories`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);
-- @block
-- book categories
CREATE TABLE Library.`Book-categories`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `book_id` BIGINT UNSIGNED NOT NULL,
    `category_id` BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- @block
-- book types table like manga novel book light-novel
CREATE TABLE Library.`types`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `types` VARCHAR(255) NOT NULL
);
-- @block
-- book type table
CREATE TABLE Library.`Book-Types`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `book_id` BIGINT UNSIGNED NOT NULL,
    `type_id` BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (type_id) REFERENCES Types(id)
);
