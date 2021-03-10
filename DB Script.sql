CREATE DATABASE produitdb CREATE TABLE userspro (
  id int(3) NOT NULL AUTO_INCREMENT,
  first_name varchar(20) DEFAULT NULL,
  last_name varchar(20) DEFAULT NULL,
  username varchar(250) DEFAULT NULL,
  password varchar(20) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE products (
  id bigint(20) NOT NULL AUTO_INCREMENT,
  name varchar(255) DEFAULT NULL,
  type varchar(255) NOT NULL,
  price int(255) DEFAULT NULL,
  quantity int(255) DEFAULT NULL,
  target_date datetime(6) DEFAULT NULL,
  PRIMARY KEY (id)
)