-- -----------------------------------------------------
-- Table `Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Client`;
CREATE TABLE IF NOT EXISTS `Client` (
  `ClientID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  PRIMARY KEY (`ClientID`)
);


-- -----------------------------------------------------
-- Table `Order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Order`;
CREATE TABLE IF NOT EXISTS `Order` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATETIME NULL,
  `ClientID` INT NULL,
  PRIMARY KEY (`OrderID`),
  FOREIGN KEY (`ClientID`) REFERENCES `Client` (`ClientID`)
);

-- -----------------------------------------------------
-- Table `Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Product`;
CREATE TABLE IF NOT EXISTS `Product` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(45) NULL,
  PRIMARY KEY (`ProductID`)
);



-- -----------------------------------------------------
-- Table `OrderDetails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OrderDetails`;
CREATE TABLE IF NOT EXISTS `OrderDetails` (
  `OrderID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `Quantity` INT NULL,
  PRIMARY KEY (`OrderID`, `ProductID`),
  FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`),
  FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`)
);

-- -----------------------------------------------------
-- Data
-- -----------------------------------------------------

INSERT INTO `Client` (`ClientID`, `Name`, `Address`) VALUES
(1, 'Мельник', 'Хрещатик 1'),
(2, 'Шевченко', 'Басейна 2'),
(3, 'Коваленко', 'Комп''ютерна 3');

INSERT INTO `Product` (`ProductID`, `ProductName`) VALUES
(1, 'Лептоп'),
(2, 'Мишка'),
(3, 'Принтер');

INSERT INTO `Order` (`OrderID`, `ClientID`, `OrderDate`) VALUES
(101, 1, '2023-03-15'), -- Order 101: Мельник 2023-03-15
(102, 2, '2023-03-16'), -- Order 102: Шевченко 2023-03-16
(103, 3, '2023-03-17'); -- Order 103: Коваленко 2023-03-17

-- Insert data into OrderDetails table
INSERT INTO `OrderDetails` (`OrderID`, `ProductID`, `Quantity`) VALUES
(101, 1, 3),  -- Order 101: Лептоп - 3 pieces
(101, 2, 2),  -- Order 101: Мишка - 2 pieces
(102, 3, 1),  -- Order 102: Принтер - 1 piece
(103, 2, 4);  -- Order 103: Мишка - 4 pieces
