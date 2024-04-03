create database PadthaiV2;

use PadthaiV2;

CREATE TABLE `Customer` (
  `customer_id` integer PRIMARY KEY AUTO_INCREMENT,
  `customer_tel` varchar(10)
);

CREATE TABLE `Order_income` (
  `order_id` integer PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `customer_id` integer
);

CREATE TABLE `Order_Detail` (
  `Detail_id` integer PRIMARY KEY NOT NULL,
  `order_id` integer NOT NULL,
  `noodles_nameEN` varchar(30),
  `noodles_nameTH` varchar(30),
  `meat_nameEN` varchar(30),
  `meat_nameTH` varchar(30),
  `topping_nameEN` varchar(30),
  `topping_nameTH` varchar(30),
  `add_veg_nameEN` varchar(30),
  `add_veg_nameTH` varchar(30)
);

CREATE TABLE `Noodles_Type` (
  `noodles_id` integer PRIMARY KEY AUTO_INCREMENT,
  `noodles_nameEN` varchar(30) NOT NULL,
  `noodles_nameTH` varchar(30) NOT NULL,
  `price_of_noodles` int NOT NULL
);

CREATE TABLE `Meat_type` (
  `meat_id` integer PRIMARY KEY AUTO_INCREMENT,
  `meat_nameEN` varchar(30) NOT NULL,
  `meat_nameTH` varchar(30) NOT NULL,
  `price_of_meat` int NOT NULL
);

CREATE TABLE `Add_Veg_List` (
  `add_veg_id` integer PRIMARY KEY AUTO_INCREMENT,
  `add_veg_nameEN` varchar(30) NOT NULL,
  `add_veg_nameTH` varchar(30) NOT NULL,
  `price_of_veg` integer NOT NULL
);

CREATE TABLE `Topping` (
  `topping_id` integer PRIMARY KEY AUTO_INCREMENT,
  `topping_nameEN` varchar(30) NOT NULL,
  `topping_nameTH` varchar(30) NOT NULL,
  `price_of_topping` int NOT NULL
);

CREATE TABLE `Payment` (
  `payment_id` integer PRIMARY KEY AUTO_INCREMENT,
  `payment_method` varchar(20) NOT NULL,
  `total_price` integer NOT NULL,
  `order_id` integer NOT NULL
);

CREATE TABLE `Temp_Order` (
  `order_id` integer,
  `Detail_id` integer NOT NULL,
  `customer_id` integer
);

CREATE TABLE `Submit_Order` (
  `order_id` integer,
  `Detail_id` integer NOT NULL,
  `customer_id` integer
);

ALTER TABLE `Order_Detail` ADD FOREIGN KEY (`order_id`) REFERENCES `Order_income` (`order_id`);

ALTER TABLE `Order_income` ADD FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`);

ALTER TABLE `Temp_Order` ADD FOREIGN KEY (`order_id`) REFERENCES `Order_Detail` (`order_id`);

ALTER TABLE `Payment` ADD FOREIGN KEY (`order_id`) REFERENCES `Order_income` (`order_id`);

ALTER TABLE `Temp_Order` ADD FOREIGN KEY (`Detail_id`) REFERENCES `Order_Detail` (`Detail_id`);

ALTER TABLE `Submit_Order` ADD FOREIGN KEY (`order_id`) REFERENCES `Temp_Order` (`order_id`);

ALTER TABLE `Submit_Order` ADD FOREIGN KEY (`Detail_id`) REFERENCES `Temp_Order` (`Detail_id`);

ALTER TABLE `Temp_Order` ADD FOREIGN KEY (`customer_id`) REFERENCES `Order_income` (`customer_id`);

ALTER TABLE `Submit_Order` ADD FOREIGN KEY (`customer_id`) REFERENCES `Temp_Order` (`customer_id`);
