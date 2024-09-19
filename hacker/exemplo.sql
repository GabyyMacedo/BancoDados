CREATE DATABASE flask_app;

   USE flask_app;

   CREATE TABLE users (
       id INT AUTO_INCREMENT PRIMARY KEY,
       username VARCHAR(255) NOT NULL,
       password VARCHAR(255) NOT NULL,
       is_admin BOOLEAN NOT NULL
   );

   INSERT INTO users (username, password, is_admin) VALUES ('admin', 'adminpass', 1);
   INSERT INTO users (username, password, is_admin) VALUES ('user', 'userpass', 0);

