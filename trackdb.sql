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

create table wareHouses(
 warehouse_id INT PRIMARY KEY AUTO_INCREMENT,
 warehouse_name VARCHAR(120) NOT NULL,
 location VARCHAR(100) NOT NULL,
 qty_units INT
);

create table wareHouses_location(
  location_id INT PRIMARY KEY AUTO_INCREMENT,
  warehouse_id INT,
  zone VARCHAR(30),
  Aisle_bin VARCHAR(30),
  FOREIGN KEY (warehouse_id) REFERENCES wareHouses(warehouse_id)
);

create table Inventory_Stock(
   Stock_id INT PRIMARY KEY AUTO_INCREMENT,
   product_id INT,
   warehouse_id INT,
   location_id INT,
   
);

