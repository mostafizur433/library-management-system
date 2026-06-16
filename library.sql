-- Active: 1781493120391@@127.0.0.1@4306@library
CREATE DATABASE Library 


CREATE Table branches(

    branch_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR (100) NOT NULL,
    location TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
)

Create Table categories(

    category_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    branch_id BIGINT UNSIGNED NOT NULL,

    Foreign Key (branch_id) REFERENCES branches(branch_id) ON DELETE RESTRICT ON UPDATE CASCADE,

    created_at TIMESTAMP not NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
    

)

CREATE TABLE books(

    book_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100)  NOT NULL,
    author VARCHAR(100)  NOT NULL,
    isbn VARCHAR(100) UNIQUE NOT NULL,
    publication_year YEAR NOT NULL,

    branch_id BIGINT UNSIGNED NOT NULL,
    category_id BIGINT UNSIGNED NOT NULL,

    Foreign Key (branch_id) REFERENCES branches(branch_id) on DELETE RESTRICT ON UPDATE CASCADE,
    Foreign Key (category_id) REFERENCES categories(category_id) ON DELETE RESTRICT ON UPDATE CASCADE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
)

CREATE TABLE books_copy(
    book_copy_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    status ENUM('available','issued','lost','damaged'),
    acquisition_date DATE,

    branch_id BIGINT UNSIGNED NOT NULL,
    book_id BIGINT UNSIGNED NOT NULL,

    Foreign Key (branch_id) REFERENCES branches (branch_id) on delete RESTRICT on update CASCADE,
    Foreign Key (book_id) REFERENCES books(book_id) on delete RESTRICT on update CASCADE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP
)



create TABLE members(

    member_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) not NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(100) UNIQUE NOT NULL,
    address TEXT ,
    membership_date DATE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP

)

CREATE TABLE borrows(

    borrow_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    borrow_date DATE,
    due_date DATE,
    return_date DATE NULL,
    fine_amount DECIMAL(10,2) DEFAULT 0,
    member_id BIGINT UNSIGNED NOT NULL,
    book_copy_id BIGINT UNSIGNED NOT NULL,

    Foreign Key (member_id) REFERENCES members (member_id) on delete RESTRICT on update CASCADE,
    Foreign Key (book_copy_id) REFERENCES books_copy (book_copy_id) on delete RESTRICT on update CASCADE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP


)
