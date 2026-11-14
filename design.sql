
DROP DATABASE IF EXISTS store_management;
CREATE DATABASE store_management
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;  

USE store_management;

-----------------------------------------------------------------------
CREATE TABLE governorates (
    governorate_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name           VARCHAR(100) NOT NULL,
    PRIMARY KEY (governorate_id),
    UNIQUE KEY uq_governorates_name (name)
) ENGINE=InnoDB;


-----------------------------------------------------------------------
CREATE TABLE stores (
    store_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name     VARCHAR(150) NOT NULL,
    address  VARCHAR(255) NOT NULL,
    PRIMARY KEY (store_id)
) ENGINE=InnoDB;

-----------------------------------------------------------------------
CREATE TABLE suppliers (
    supplier_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name        VARCHAR(150) NOT NULL,
    phone       VARCHAR(20)  NOT NULL,
    email       VARCHAR(150) NOT NULL,
    brief_data  TEXT         NULL,
    PRIMARY KEY (supplier_id),
    UNIQUE KEY uq_suppliers_email (email)
) ENGINE=InnoDB;

-----------------------------------------------------------------------
CREATE TABLE products (
    product_id  INT UNSIGNED  NOT NULL AUTO_INCREMENT,
    name        VARCHAR(150)  NOT NULL,
    code        VARCHAR(50)   NOT NULL,
    description TEXT          NULL,
    price       DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    supplier_id INT UNSIGNED  NOT NULL,
    PRIMARY KEY (product_id),
    UNIQUE KEY uq_products_code (code),
    CONSTRAINT fk_products_supplier
        FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

-----------------------------------------------------------------------
CREATE TABLE governorate_stores (
    governorate_id INT UNSIGNED NOT NULL,
    store_id       INT UNSIGNED NOT NULL,
    PRIMARY KEY (governorate_id, store_id),
    CONSTRAINT fk_gs_governorate
        FOREIGN KEY (governorate_id) REFERENCES governorates (governorate_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_gs_store
        FOREIGN KEY (store_id) REFERENCES stores (store_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;

-----------------------------------------------------------------------
CREATE TABLE store_products (
    store_id   INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (store_id, product_id),
    CONSTRAINT fk_sp_store
        FOREIGN KEY (store_id) REFERENCES stores (store_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_sp_product
        FOREIGN KEY (product_id) REFERENCES products (product_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;
