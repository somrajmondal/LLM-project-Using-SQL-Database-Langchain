-- Create the database
CREATE DATABASE brand_tshirts_database;
USE brand_tshirts_database;

-- Create the t_shirts table
CREATE TABLE t_shirts_table (
    t_shirt_id INT AUTO_INCREMENT PRIMARY KEY,
    brand ENUM('Van Huesen', 'Levi', 'Nike', 'Adidas', 'Puma', 'Under Armour', 'H&M', 'Zara', 'Gap', 'Tommy Hilfiger', 'FabIndia', 'W', 'Biba', 'Manyavar', 'Allen Solly') NOT NULL,
    color ENUM('Red', 'Blue', 'Black', 'White') NOT NULL,
    size ENUM('XS', 'S', 'M', 'L', 'XL') NOT NULL,
    price INT CHECK (price BETWEEN 200 AND 1000),
    fabric VARCHAR(260) NOT NULL,
	sleeve_length ENUM('Short Sleeve', 'Long Sleeve') NOT NULL,
    stock_quantity INT NOT NULL,
    pattern ENUM('Solid', 'Printed', 'Striped')
   --  UNIQUE KEY brand_color_size (brand, size)
);


-- Create the discounts table
CREATE TABLE discounts_table (
    discount_id INT AUTO_INCREMENT PRIMARY KEY,
    t_shirt_id INT NOT NULL,
    pct_discount DECIMAL(5,2) CHECK (pct_discount BETWEEN 0 AND 100),
    FOREIGN KEY (t_shirt_id) REFERENCES t_shirts_table(t_shirt_id)
);

Create a stored procedure to populate the t_shirts_table table
Create a stored procedure to populate the t_shirts_table table with 200 rows

DELIMITER $$

CREATE PROCEDURE PopulateTShirtsTable()
BEGIN
  DECLARE max_records INT DEFAULT 200;
  DECLARE brand ENUM('Van Huesen', 'Levi', 'Nike', 'Adidas', 'Puma', 'Under Armour', 'H&M', 'Zara', 'Gap', 'Tommy Hilfiger', 'FabIndia', 'W', 'Biba', 'Manyavar', 'Allen Solly');
  DECLARE color ENUM('Red', 'Blue', 'Black', 'White');
  DECLARE size ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL');
  DECLARE price INT;
  DECLARE stock_quantity INT;
  DECLARE fabric VARCHAR(260);
  DECLARE sleeve_length ENUM('Short Sleeve', 'Long Sleeve');
  DECLARE pattern ENUM('Solid', 'Printed', 'Striped');

  -- Seed the random number generator
  SET SESSION rand_seed1 = UNIX_TIMESTAMP();

  WHILE (SELECT COUNT(*) FROM t_shirts_table) < max_records DO
    -- Generate random values
    SET brand = ELT(FLOOR(1 + RAND() * 15), 'Van Huesen', 'Levi', 'Nike', 'Adidas', 'Puma', 'Under Armour', 'H&M', 'Zara', 'Gap', 'Tommy Hilfiger', 'FabIndia', 'W', 'Biba', 'Manyavar', 'Allen Solly');
    SET color = ELT(FLOOR(1 + RAND() * 4), 'Red', 'Blue', 'Black', 'White');
    SET size = ELT(FLOOR(1 + RAND() * 6), 'XS', 'S', 'M', 'L', 'XL', 'XXL');
    SET price = FLOOR(200 + RAND() * 801);
    SET stock_quantity = FLOOR(1 + RAND() * 100);
    SET fabric = ELT(FLOOR(1 + RAND() * 3), 'Cotton', 'Polyester', 'Blend');
    SET sleeve_length = ELT(FLOOR(1 + RAND() * 2), 'Short Sleeve', 'Long Sleeve');
    SET pattern = ELT(FLOOR(1 + RAND() * 3), 'Solid', 'Printed', 'Striped');

    -- Attempt to insert a new record
    -- Duplicate brand, color, size combinations will be ignored due to the unique constraint
    BEGIN
      DECLARE CONTINUE HANDLER FOR 1062 BEGIN END;
      INSERT INTO t_shirts_table (brand, color, size, price, stock_quantity, fabric, sleeve_length, pattern)
      VALUES (brand, color, size, price, stock_quantity, fabric, sleeve_length, pattern);
    END;
  END WHILE;
END$$

DELIMITER ;


-- Call the stored procedure to populate the t_shirts table
CALL PopulateTShirtsTable();

-- Insert at least 10 records into the discounts table
INSERT INTO discounts_table (t_shirt_id, pct_discount)
VALUES
(1, 10.00),
(2, 15.00),
(3, 20.00),
(4, 5.00),
(5, 25.00),
(6, 10.00),
(7, 30.00),
(8, 35.00),
(9, 40.00),
(10, 45.00);