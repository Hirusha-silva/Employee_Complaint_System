CREATE DATABASE  complaint;

CREATE TABLE user (
             id INT AUTO_INCREMENT PRIMARY KEY,
             username VARCHAR(100) NOT NULL,
             password VARCHAR(100) NOT NULL,
             role ENUM('Employee','Admin') NOT NULL
);

CREATE TABLE complaints (
             id INT AUTO_INCREMENT PRIMARY KEY,
             title VARCHAR(200),
             description TEXT,
             user_id INT,
             status VARCHAR(100),
             solution VARCHAR(100),
             FOREIGN KEY (user_id) REFERENCES user(id)
);

INSERT INTO user (username, password, role) VALUES
    ( 'Hirusha',  '1221' , 'Admin');


INSERT INTO user (username, password, role) VALUES
    ( 'Silva ' ,  '1234' , 'Employee');