-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 31, 2024 at 05:41 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `system_db_2`
--

-- --------------------------------------------------------

--
-- Table structure for table `crm_admin`
--

CREATE TABLE `crm_admin` (
  `admin_ID` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_customer`
--

CREATE TABLE `crm_customer` (
  `crm_customer_ID` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  `zip_postal_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_department`
--

CREATE TABLE `crm_department` (
  `crm_department_ID` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `manager_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_employee`
--

CREATE TABLE `crm_employee` (
  `hr_employee_ID` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phonenumber` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_order`
--

CREATE TABLE `crm_order` (
  `crm_order_ID` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` text NOT NULL,
  `crm_customer_ID` int(11) NOT NULL,
  `crm_employee_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_product`
--

CREATE TABLE `crm_product` (
  `crm_product_ID` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `quantity_available` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crm_service_product_relationship`
--

CREATE TABLE `crm_service_product_relationship` (
  `hr_service_product_relationship_ID` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_attendance`
--

CREATE TABLE `hr_attendance` (
  `hr_attendance_ID` int(11) NOT NULL,
  `hr_employee_ID` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_department`
--

CREATE TABLE `hr_department` (
  `hr_department_ID` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `hr_manager_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_employee`
--

CREATE TABLE `hr_employee` (
  `hr_employee_ID` int(11) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `hr_department_ID` int(11) NOT NULL,
  `hr_position_ID` int(11) NOT NULL,
  `hire_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_leave`
--

CREATE TABLE `hr_leave` (
  `hr_leave_ID` int(11) NOT NULL,
  `hr_employee_ID` int(11) NOT NULL,
  `leave_date` date NOT NULL,
  `return_date` date NOT NULL,
  `leave_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_manager`
--

CREATE TABLE `hr_manager` (
  `hr_manager_ID` int(11) NOT NULL,
  `hr_employee_ID` int(11) NOT NULL,
  `manager_name` varchar(100) NOT NULL,
  `job_title` text NOT NULL,
  `hr_department_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_payroll`
--

CREATE TABLE `hr_payroll` (
  `hr_payroll_ID` int(11) NOT NULL,
  `hr_employee_ID` int(11) NOT NULL,
  `salary` decimal(10,0) NOT NULL,
  `pay_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_performance`
--

CREATE TABLE `hr_performance` (
  `hr_perofarmance_ID` int(11) NOT NULL,
  `hr_employee_ID` int(11) NOT NULL,
  `hr_position_ID` int(11) NOT NULL,
  `hr_department_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_position`
--

CREATE TABLE `hr_position` (
  `hr_position_ID` int(11) NOT NULL,
  `hr_employee_ID` int(11) NOT NULL,
  `hr_department_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr_training`
--

CREATE TABLE `hr_training` (
  `hr_training_ID` int(11) NOT NULL,
  `training_name` varchar(100) NOT NULL,
  `training_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iwm_customer`
--

CREATE TABLE `iwm_customer` (
  `iwm_customer_ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iwm_order`
--

CREATE TABLE `iwm_order` (
  `iwm_order_ID` int(11) NOT NULL,
  `iwm_customer_ID` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `total_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iwm_order_product`
--

CREATE TABLE `iwm_order_product` (
  `iwm_order_product_ID` int(11) NOT NULL,
  `iwm_order_ID` int(11) NOT NULL,
  `iwm_product_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iwm_product`
--

CREATE TABLE `iwm_product` (
  `iwm_product_ID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `category` varchar(100) NOT NULL,
  `iwm_supplier_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iwm_shipment`
--

CREATE TABLE `iwm_shipment` (
  `iwm_shipment` int(11) NOT NULL,
  `iwm_order_ID` int(11) NOT NULL,
  `iwm_warehouse_ID` int(11) NOT NULL,
  `shipment_date` date NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iwm_supplier`
--

CREATE TABLE `iwm_supplier` (
  `iwm_supplier_ID` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iwm_warehouse`
--

CREATE TABLE `iwm_warehouse` (
  `iwm_warehouse_id` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `capacity` varchar(1001) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `psm_customer`
--

CREATE TABLE `psm_customer` (
  `psm_customert_ID` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `contact_info` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `psm_employee`
--

CREATE TABLE `psm_employee` (
  `psm_employee_ID` int(11) NOT NULL,
  `psm_seller_ID` int(11) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `employee_contact_info` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `psm_product`
--

CREATE TABLE `psm_product` (
  `psm_product_ID` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `unit_price` decimal(10,0) NOT NULL,
  `stock_level` int(11) NOT NULL,
  `psm_supplier_ID` int(11) NOT NULL,
  `psm_category_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `psm_product_category`
--

CREATE TABLE `psm_product_category` (
  `psm_product_category_ID` int(11) NOT NULL,
  `category_name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `psm_purchase_order`
--

CREATE TABLE `psm_purchase_order` (
  `psm_purchase_order_ID` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `psm_product_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `delivery_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `psm_sales_invoice`
--

CREATE TABLE `psm_sales_invoice` (
  `psm_sales_invoice_ID` int(11) NOT NULL,
  `sales_invoice_date` date NOT NULL,
  `psm_customer_ID` int(11) NOT NULL,
  `psm_seller_ID` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `psm_product_ID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `psm_supplier`
--

CREATE TABLE `psm_supplier` (
  `psm_supplier_ID` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `supplier_name_contact_info` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scm_customer`
--

CREATE TABLE `scm_customer` (
  `scm_customer_ID` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scm_customer`
--

INSERT INTO `scm_customer` (`scm_customer_ID`, `customer_name`, `address`, `phone_number`, `email`) VALUES
(1, 'John Doe', '123 Elm Street', '555-1234', 'johndoe@example.com'),
(2, 'Jane Smith', '456 Oak Avenue', '555-5678', 'janesmith@example.com'),
(3, 'Emily Johnson', '789 Pine Road', '555-8765', 'emilyjohnson@example.com'),
(4, 'Michael Brown', '101 Maple Lane', '555-4321', 'michaelbrown@example.com'),
(5, 'Sarah Davis', '202 Birch Street', '555-6789', 'sarahdavis@example.com'),
(6, 'David Wilson', '303 Cedar Avenue', '555-3456', 'davidwilson@example.com'),
(7, 'Laura Moore', '404 Spruce Drive', '555-2345', 'lauramoore@example.com'),
(8, 'James Taylor', '505 Willow Way', '555-9876', 'jamestaylor@example.com'),
(9, 'Olivia Martinez', '606 Redwood Lane', '555-6543', 'oliviamartinez@example.com'),
(10, 'Daniel Anderson', '707 Fir Boulevard', '555-1230', 'danielanderson@example.com'),
(11, 'Sophia Thomas', '808 Ash Street', '555-5670', 'sophiathomas@example.com'),
(12, 'William White', '909 Elm Street', '555-4320', 'williamwhite@example.com'),
(13, 'Ava Harris', '1010 Oak Avenue', '555-8760', 'avaharris@example.com'),
(14, 'Ethan Clark', '1111 Pine Road', '555-3450', 'ethanclark@example.com'),
(15, 'Mia Lewis', '1212 Maple Lane', '555-6780', 'mialewis@example.com'),
(16, 'Lucas Walker', '1313 Birch Street', '555-2340', 'lucaswalker@example.com'),
(17, 'Isabella Hall', '1414 Cedar Avenue', '555-9870', 'isabellahall@example.com'),
(18, 'Liam Allen', '1515 Spruce Drive', '555-6540', 'liamallen@example.com'),
(19, 'Charlotte Young', '1616 Willow Way', '555-1235', 'charlotteyoung@example.com'),
(20, 'Noah King', '1717 Redwood Lane', '555-5675', 'noahking@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `scm_order`
--

CREATE TABLE `scm_order` (
  `scm_order_ID` int(11) NOT NULL,
  `scm_customer_ID` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `quantity_ordered` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scm_order`
--

INSERT INTO `scm_order` (`scm_order_ID`, `scm_customer_ID`, `order_date`, `quantity_ordered`) VALUES
(1, 1, '2024-07-01', 20),
(2, 2, '2024-07-02', 15),
(3, 3, '2024-07-03', 25),
(4, 4, '2024-07-04', 30),
(5, 5, '2024-07-05', 18),
(6, 6, '2024-07-06', 22),
(7, 7, '2024-07-07', 28),
(8, 8, '2024-07-08', 10),
(9, 9, '2024-07-09', 35),
(10, 10, '2024-07-10', 40),
(11, 11, '2024-07-11', 25),
(12, 12, '2024-07-12', 20),
(13, 13, '2024-07-13', 30),
(14, 14, '2024-07-14', 15),
(15, 15, '2024-07-15', 22),
(16, 16, '2024-07-16', 18),
(17, 17, '2024-07-17', 25),
(18, 18, '2024-07-18', 30),
(19, 19, '2024-07-19', 28),
(20, 20, '2024-07-20', 35);

-- --------------------------------------------------------

--
-- Table structure for table `scm_order_details`
--

CREATE TABLE `scm_order_details` (
  `scm_order_details_ID` int(11) NOT NULL,
  `scm_order_ID` int(11) NOT NULL,
  `scm_product_ID` int(11) NOT NULL,
  `quantity_ordered` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `scm_purchase_request_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scm_order_details`
--

INSERT INTO `scm_order_details` (`scm_order_details_ID`, `scm_order_ID`, `scm_product_ID`, `quantity_ordered`, `unit_price`, `scm_purchase_request_ID`) VALUES
(1, 1, 1, 10, 1, 1),
(2, 1, 2, 10, 0, 1),
(3, 2, 3, 15, 0, 2),
(4, 3, 4, 20, 0, 3),
(5, 4, 5, 30, 0, 4),
(6, 5, 6, 18, 0, 5),
(7, 6, 7, 22, 1, 6),
(8, 7, 8, 10, 4, 7),
(9, 8, 9, 15, 4, 8),
(10, 9, 10, 20, 10, 9),
(11, 10, 11, 25, 1, 10),
(12, 11, 12, 20, 3, 11),
(13, 12, 13, 30, 2, 12),
(14, 13, 14, 15, 2, 13),
(15, 14, 15, 22, 1, 14),
(16, 15, 16, 18, 5, 15),
(17, 16, 17, 25, 8, 16),
(18, 17, 18, 30, 15, 17),
(19, 18, 19, 28, 1, 18),
(20, 19, 20, 35, 1, 19);

-- --------------------------------------------------------

--
-- Table structure for table `scm_product`
--

CREATE TABLE `scm_product` (
  `scm_product_ID` int(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `quantity_available` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scm_product`
--

INSERT INTO `scm_product` (`scm_product_ID`, `Supplier_ID`, `product_name`, `description`, `unit_price`, `quantity_available`) VALUES
(1, 1, 'Apple', 'Fresh Red Apples', 0.50, 1000),
(2, 1, 'Banana', 'Organic Bananas', 0.30, 1500),
(3, 1, 'Orange', 'Juicy Oranges', 0.40, 1200),
(4, 2, 'Tomato', 'Fresh Tomatoes', 0.25, 800),
(5, 2, 'Potato', 'Idaho Potatoes', 0.20, 2000),
(6, 2, 'Carrot', 'Organic Carrots', 0.15, 1800),
(7, 2, 'Broccoli', 'Fresh Broccoli Heads', 0.75, 600),
(8, 3, 'Chicken Breast', 'Boneless Chicken Breast', 3.50, 500),
(9, 3, 'Ground Beef', 'Lean Ground Beef', 4.00, 400),
(10, 4, 'Salmon Fillet', 'Fresh Salmon Fillets', 10.00, 300),
(11, 2, 'Lettuce', 'Crisp Lettuce', 1.00, 700),
(12, 1, 'Grapes', 'Seedless Green Grapes', 2.50, 900),
(13, 1, 'Pineapple', 'Sweet Pineapple', 1.50, 400),
(14, 1, 'Mango', 'Ripe Mangoes', 2.00, 500),
(15, 2, 'Zucchini', 'Fresh Zucchini', 0.60, 750),
(16, 3, 'Pork Chops', 'Fresh Pork Chops', 5.00, 350),
(17, 3, 'Beef Steak', 'Prime Beef Steaks', 8.00, 250),
(18, 4, 'Shrimp', 'Fresh Jumbo Shrimp', 15.00, 200),
(19, 2, 'Spinach', 'Organic Spinach Leaves', 1.20, 800),
(20, 2, 'Bell Pepper', 'Mixed Color Bell Peppers', 0.90, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `scm_purchase_request`
--

CREATE TABLE `scm_purchase_request` (
  `scm_purchase_request_ID` int(11) NOT NULL,
  `order_ID` int(11) NOT NULL,
  `supplier_ID` int(11) NOT NULL,
  `request_ID` int(11) NOT NULL,
  `request_status` varchar(100) NOT NULL,
  `customer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scm_purchase_request`
--

INSERT INTO `scm_purchase_request` (`scm_purchase_request_ID`, `order_ID`, `supplier_ID`, `request_ID`, `request_status`, `customer_ID`) VALUES
(1, 1, 1, 101, 'Pending', 1),
(2, 2, 2, 102, 'Completed', 2),
(3, 3, 3, 103, 'Approved', 3),
(4, 4, 4, 104, 'Pending', 4),
(5, 5, 5, 105, 'Completed', 5),
(6, 6, 6, 106, 'Approved', 6),
(7, 7, 7, 107, 'Pending', 7),
(8, 8, 8, 108, 'Completed', 8),
(9, 9, 9, 109, 'Approved', 9),
(10, 10, 10, 110, 'Pending', 10),
(11, 11, 11, 111, 'Completed', 11),
(12, 12, 12, 112, 'Approved', 12),
(13, 13, 13, 113, 'Pending', 13),
(14, 14, 14, 114, 'Completed', 14),
(15, 15, 15, 115, 'Approved', 15),
(16, 16, 16, 116, 'Pending', 16),
(17, 17, 17, 117, 'Completed', 17),
(18, 18, 18, 118, 'Approved', 18),
(19, 19, 19, 119, 'Pending', 19),
(20, 20, 20, 120, 'Completed', 20);

-- --------------------------------------------------------

--
-- Table structure for table `scm_shipment`
--

CREATE TABLE `scm_shipment` (
  `scm_shipment_ID` int(11) NOT NULL,
  `scm_order_ID` int(11) NOT NULL,
  `shipment_date` date NOT NULL,
  `estimated_arrival_date` date NOT NULL,
  `scm_purchase_request_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scm_shipment`
--

INSERT INTO `scm_shipment` (`scm_shipment_ID`, `scm_order_ID`, `shipment_date`, `estimated_arrival_date`, `scm_purchase_request_ID`) VALUES
(1, 1, '2024-07-02', '2024-07-05', 1),
(2, 2, '2024-07-03', '2024-07-07', 2),
(3, 3, '2024-07-04', '2024-07-09', 3),
(4, 4, '2024-07-05', '2024-07-10', 4),
(5, 5, '2024-07-06', '2024-07-11', 5),
(6, 6, '2024-07-07', '2024-07-12', 6),
(7, 7, '2024-07-08', '2024-07-13', 7),
(8, 8, '2024-07-09', '2024-07-14', 8),
(9, 9, '2024-07-10', '2024-07-15', 9),
(10, 10, '2024-07-11', '2024-07-16', 10),
(11, 11, '2024-07-12', '2024-07-17', 11),
(12, 12, '2024-07-13', '2024-07-18', 12),
(13, 13, '2024-07-14', '2024-07-19', 13),
(14, 14, '2024-07-15', '2024-07-20', 14),
(15, 15, '2024-07-16', '2024-07-21', 15),
(16, 16, '2024-07-17', '2024-07-22', 16),
(17, 17, '2024-07-18', '2024-07-23', 17),
(18, 18, '2024-07-19', '2024-07-24', 18),
(19, 19, '2024-07-20', '2024-07-25', 19),
(20, 20, '2024-07-21', '2024-07-26', 20);

-- --------------------------------------------------------

--
-- Table structure for table `scm_supplier`
--

CREATE TABLE `scm_supplier` (
  `scm_supplier_ID` int(11) NOT NULL,
  `supplier_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scm_supplier`
--

INSERT INTO `scm_supplier` (`scm_supplier_ID`, `supplier_name`, `address`, `contact_person`, `phone_number`) VALUES
(1, 'Fruit Fresh Inc.', '100 Fruit Lane', 'Anna Green', '555-1001'),
(2, 'Vegetable Valley', '200 Veggie Road', 'Bob Blue', '555-1002'),
(3, 'Meat Masters', '300 Meat Drive', 'Charlie Brown', '555-1003'),
(4, 'Seafood Select', '400 Sea Street', 'Diana White', '555-1004'),
(5, 'Healthy Harvest', '500 Farm Lane', 'Eva Black', '555-1005'),
(6, 'Organic Farms', '600 Greenway', 'Frank Gray', '555-1006'),
(7, 'The Meat Shop', '700 Butcher Blvd', 'Gina Red', '555-1007'),
(8, 'Ocean Delights', '800 Fish Lane', 'Henry Blue', '555-1008'),
(9, 'Green Goodies', '900 Leaf Street', 'Ivy Gold', '555-1009'),
(10, 'Farm Fresh', '1000 Crop Circle', 'Jack Silver', '555-1010'),
(11, 'Harvest Time', '1100 Barn Road', 'Kathy Green', '555-1011'),
(12, 'The Veggie Patch', '1200 Garden Street', 'Leo White', '555-1012'),
(13, 'Prime Cuts', '1300 Meat Lane', 'Mona Brown', '555-1013'),
(14, 'Fishery Co.', '1400 Ocean Drive', 'Nick Black', '555-1014'),
(15, 'Green Acres', '1500 Agriculture Ave', 'Olivia Gray', '555-1015'),
(16, 'Market Fresh', '1600 Farmers Lane', 'Paul Gold', '555-1016'),
(17, 'Butchers Choice', '1700 Meat Street', 'Quinn Silver', '555-1017'),
(18, 'Seafood Harvest', '1800 Coastline Blvd', 'Rita Red', '555-1018'),
(19, 'Veggie Haven', '1900 Herb Way', 'Sam Gold', '555-1019'),
(20, 'Crop King', '2000 Produce Lane', 'Tina Green', '555-1020');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crm_admin`
--
ALTER TABLE `crm_admin`
  ADD PRIMARY KEY (`admin_ID`);

--
-- Indexes for table `crm_customer`
--
ALTER TABLE `crm_customer`
  ADD PRIMARY KEY (`crm_customer_ID`);

--
-- Indexes for table `crm_employee`
--
ALTER TABLE `crm_employee`
  ADD PRIMARY KEY (`hr_employee_ID`);

--
-- Indexes for table `crm_order`
--
ALTER TABLE `crm_order`
  ADD PRIMARY KEY (`crm_order_ID`),
  ADD KEY `crm_customer_ID` (`crm_customer_ID`,`crm_employee_ID`);

--
-- Indexes for table `crm_product`
--
ALTER TABLE `crm_product`
  ADD PRIMARY KEY (`crm_product_ID`);

--
-- Indexes for table `crm_service_product_relationship`
--
ALTER TABLE `crm_service_product_relationship`
  ADD PRIMARY KEY (`hr_service_product_relationship_ID`);

--
-- Indexes for table `hr_attendance`
--
ALTER TABLE `hr_attendance`
  ADD PRIMARY KEY (`hr_attendance_ID`);

--
-- Indexes for table `hr_department`
--
ALTER TABLE `hr_department`
  ADD PRIMARY KEY (`hr_department_ID`);

--
-- Indexes for table `hr_employee`
--
ALTER TABLE `hr_employee`
  ADD PRIMARY KEY (`hr_employee_ID`);

--
-- Indexes for table `hr_leave`
--
ALTER TABLE `hr_leave`
  ADD PRIMARY KEY (`hr_leave_ID`);

--
-- Indexes for table `hr_payroll`
--
ALTER TABLE `hr_payroll`
  ADD PRIMARY KEY (`hr_payroll_ID`);

--
-- Indexes for table `hr_performance`
--
ALTER TABLE `hr_performance`
  ADD PRIMARY KEY (`hr_perofarmance_ID`);

--
-- Indexes for table `hr_position`
--
ALTER TABLE `hr_position`
  ADD PRIMARY KEY (`hr_position_ID`);

--
-- Indexes for table `hr_training`
--
ALTER TABLE `hr_training`
  ADD PRIMARY KEY (`hr_training_ID`);

--
-- Indexes for table `iwm_order`
--
ALTER TABLE `iwm_order`
  ADD PRIMARY KEY (`iwm_order_ID`),
  ADD KEY `iwm_customer_ID` (`iwm_customer_ID`);

--
-- Indexes for table `iwm_order_product`
--
ALTER TABLE `iwm_order_product`
  ADD PRIMARY KEY (`iwm_order_product_ID`),
  ADD KEY `iwm_order_ID` (`iwm_order_ID`,`iwm_product_ID`);

--
-- Indexes for table `iwm_product`
--
ALTER TABLE `iwm_product`
  ADD PRIMARY KEY (`iwm_product_ID`),
  ADD KEY `iwm_supplier_ID` (`iwm_supplier_ID`);

--
-- Indexes for table `iwm_shipment`
--
ALTER TABLE `iwm_shipment`
  ADD PRIMARY KEY (`iwm_shipment`),
  ADD KEY `iwm_order_ID` (`iwm_order_ID`,`iwm_warehouse_ID`);

--
-- Indexes for table `iwm_supplier`
--
ALTER TABLE `iwm_supplier`
  ADD PRIMARY KEY (`iwm_supplier_ID`);

--
-- Indexes for table `iwm_warehouse`
--
ALTER TABLE `iwm_warehouse`
  ADD PRIMARY KEY (`iwm_warehouse_id`);

--
-- Indexes for table `psm_customer`
--
ALTER TABLE `psm_customer`
  ADD PRIMARY KEY (`psm_customert_ID`);

--
-- Indexes for table `psm_employee`
--
ALTER TABLE `psm_employee`
  ADD PRIMARY KEY (`psm_employee_ID`);

--
-- Indexes for table `psm_product`
--
ALTER TABLE `psm_product`
  ADD PRIMARY KEY (`psm_product_ID`),
  ADD KEY `psm_supplier_ID` (`psm_supplier_ID`,`psm_category_ID`);

--
-- Indexes for table `psm_product_category`
--
ALTER TABLE `psm_product_category`
  ADD PRIMARY KEY (`psm_product_category_ID`);

--
-- Indexes for table `psm_purchase_order`
--
ALTER TABLE `psm_purchase_order`
  ADD PRIMARY KEY (`psm_purchase_order_ID`),
  ADD KEY `psm_product_ID` (`psm_product_ID`);

--
-- Indexes for table `psm_sales_invoice`
--
ALTER TABLE `psm_sales_invoice`
  ADD PRIMARY KEY (`psm_sales_invoice_ID`),
  ADD KEY `psm_customer_ID` (`psm_customer_ID`,`psm_seller_ID`,`psm_product_ID`);

--
-- Indexes for table `psm_supplier`
--
ALTER TABLE `psm_supplier`
  ADD PRIMARY KEY (`psm_supplier_ID`);

--
-- Indexes for table `scm_customer`
--
ALTER TABLE `scm_customer`
  ADD PRIMARY KEY (`scm_customer_ID`);

--
-- Indexes for table `scm_order`
--
ALTER TABLE `scm_order`
  ADD PRIMARY KEY (`scm_order_ID`);

--
-- Indexes for table `scm_order_details`
--
ALTER TABLE `scm_order_details`
  ADD PRIMARY KEY (`scm_order_details_ID`),
  ADD KEY `fk_order` (`scm_order_ID`),
  ADD KEY `fk_product` (`scm_product_ID`),
  ADD KEY `fk_purchase_request` (`scm_purchase_request_ID`);

--
-- Indexes for table `scm_product`
--
ALTER TABLE `scm_product`
  ADD PRIMARY KEY (`scm_product_ID`);

--
-- Indexes for table `scm_purchase_request`
--
ALTER TABLE `scm_purchase_request`
  ADD PRIMARY KEY (`scm_purchase_request_ID`),
  ADD KEY `scm_purchase_request` (`supplier_ID`);

--
-- Indexes for table `scm_shipment`
--
ALTER TABLE `scm_shipment`
  ADD PRIMARY KEY (`scm_shipment_ID`),
  ADD KEY `scm_shipment` (`scm_order_ID`),
  ADD KEY `fk_scm_purchase_request` (`scm_purchase_request_ID`);

--
-- Indexes for table `scm_supplier`
--
ALTER TABLE `scm_supplier`
  ADD PRIMARY KEY (`scm_supplier_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crm_admin`
--
ALTER TABLE `crm_admin`
  MODIFY `admin_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_customer`
--
ALTER TABLE `crm_customer`
  MODIFY `crm_customer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_employee`
--
ALTER TABLE `crm_employee`
  MODIFY `hr_employee_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_order`
--
ALTER TABLE `crm_order`
  MODIFY `crm_order_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_product`
--
ALTER TABLE `crm_product`
  MODIFY `crm_product_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_service_product_relationship`
--
ALTER TABLE `crm_service_product_relationship`
  MODIFY `hr_service_product_relationship_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_attendance`
--
ALTER TABLE `hr_attendance`
  MODIFY `hr_attendance_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_department`
--
ALTER TABLE `hr_department`
  MODIFY `hr_department_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_employee`
--
ALTER TABLE `hr_employee`
  MODIFY `hr_employee_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_leave`
--
ALTER TABLE `hr_leave`
  MODIFY `hr_leave_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_payroll`
--
ALTER TABLE `hr_payroll`
  MODIFY `hr_payroll_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_performance`
--
ALTER TABLE `hr_performance`
  MODIFY `hr_perofarmance_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_position`
--
ALTER TABLE `hr_position`
  MODIFY `hr_position_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hr_training`
--
ALTER TABLE `hr_training`
  MODIFY `hr_training_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iwm_order`
--
ALTER TABLE `iwm_order`
  MODIFY `iwm_order_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iwm_order_product`
--
ALTER TABLE `iwm_order_product`
  MODIFY `iwm_order_product_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iwm_product`
--
ALTER TABLE `iwm_product`
  MODIFY `iwm_product_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iwm_shipment`
--
ALTER TABLE `iwm_shipment`
  MODIFY `iwm_shipment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iwm_supplier`
--
ALTER TABLE `iwm_supplier`
  MODIFY `iwm_supplier_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `iwm_warehouse`
--
ALTER TABLE `iwm_warehouse`
  MODIFY `iwm_warehouse_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `psm_customer`
--
ALTER TABLE `psm_customer`
  MODIFY `psm_customert_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `psm_employee`
--
ALTER TABLE `psm_employee`
  MODIFY `psm_employee_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `psm_product`
--
ALTER TABLE `psm_product`
  MODIFY `psm_product_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `psm_product_category`
--
ALTER TABLE `psm_product_category`
  MODIFY `psm_product_category_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `psm_purchase_order`
--
ALTER TABLE `psm_purchase_order`
  MODIFY `psm_purchase_order_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `psm_sales_invoice`
--
ALTER TABLE `psm_sales_invoice`
  MODIFY `psm_sales_invoice_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `psm_supplier`
--
ALTER TABLE `psm_supplier`
  MODIFY `psm_supplier_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scm_customer`
--
ALTER TABLE `scm_customer`
  MODIFY `scm_customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `scm_order`
--
ALTER TABLE `scm_order`
  MODIFY `scm_order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `scm_order_details`
--
ALTER TABLE `scm_order_details`
  MODIFY `scm_order_details_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `scm_product`
--
ALTER TABLE `scm_product`
  MODIFY `scm_product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `scm_purchase_request`
--
ALTER TABLE `scm_purchase_request`
  MODIFY `scm_purchase_request_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `scm_shipment`
--
ALTER TABLE `scm_shipment`
  MODIFY `scm_shipment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `scm_supplier`
--
ALTER TABLE `scm_supplier`
  MODIFY `scm_supplier_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `scm_customer`
--
ALTER TABLE `scm_customer`
  ADD CONSTRAINT `scm_customer_ibfk_1` FOREIGN KEY (`scm_customer_ID`) REFERENCES `scm_purchase_request` (`scm_purchase_request_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scm_order`
--
ALTER TABLE `scm_order`
  ADD CONSTRAINT `scm_order` FOREIGN KEY (`scm_order_ID`) REFERENCES `scm_order_details` (`scm_order_details_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `scm_order_details`
--
ALTER TABLE `scm_order_details`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`scm_order_ID`) REFERENCES `scm_order` (`scm_order_ID`),
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`scm_product_ID`) REFERENCES `scm_product` (`scm_product_ID`),
  ADD CONSTRAINT `fk_purchase_request` FOREIGN KEY (`scm_purchase_request_ID`) REFERENCES `scm_purchase_request` (`scm_purchase_request_ID`),
  ADD CONSTRAINT `scm_order_details` FOREIGN KEY (`scm_order_details_ID`) REFERENCES `scm_order` (`scm_order_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `scm_product`
--
ALTER TABLE `scm_product`
  ADD CONSTRAINT `scm_product` FOREIGN KEY (`scm_product_ID`) REFERENCES `scm_order_details` (`scm_order_details_ID`);

--
-- Constraints for table `scm_shipment`
--
ALTER TABLE `scm_shipment`
  ADD CONSTRAINT `fk_scm_purchase_request` FOREIGN KEY (`scm_purchase_request_ID`) REFERENCES `scm_purchase_request` (`scm_purchase_request_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
