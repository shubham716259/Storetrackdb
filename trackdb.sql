create database storetrackdb;
use storetrackdb;

create table suppliers(
  supplier_id INT PRIMARY KEY AUTO_INCREMENT,
  supplier_name VARCHAR(100) NOT NULL,
  city VARCHAR(50),
  rating DECIMAL(2,1), 
  status INT
);

create table supplier_contact(
  contact_id INT PRIMARY KEY AUTO_INCREMENT,
  supplier_id INT,
  designation VARCHAR(50),
  email VARCHAR(120),
  FOREIGN KEY(supplier_id) REFERENCES suppliers(suppliers_id) 
);

create table categories(
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(70) NOT NULL,
  description VARCHAR(255)
);

create table Products(
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  units VARCHAR(30) UNIQUE NOT NULL,
  product_name VARCHAR(100) NOT NULL,
  category_id INT,
  prices_units DECIMAL(10,2),
  Reorder INT NOT NULL
);



