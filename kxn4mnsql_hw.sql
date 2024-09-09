# Question 1
SELECT NAME FROM country WHERE Region = "South America";
    
# Question 2
SELECT population FROM country WHERE NAME = "Germany";
    
# Question 3
SELECT Name FROM city WHERE CountryCode = "JPN";
    
# Question 4
SELECT Name, Population FROM country WHERE Continent = "Africa" ORDER BY Population DESC
LIMIT 3;

# Question 5
SELECT Name, LifeExpectancy, Population FROM country WHERE Population BETWEEN 1000000 AND 5000000;
    
# Question 6
SELECT Name FROM country
JOIN countrylanguage ON country.code = countrylanguage.CountryCode
WHERE Language = "French" AND IsOfficial = "T";

# Question 7
SELECT Title from Album WHERE ArtistId = 1;

# Question 8
SELECT FirstName, LastName, Email from Customer WHERE Country = "Brazil";

# Question 9
SELECT * from Playlist;

# Question 10
SELECT COUNT(Name) from Track WHERE GenreID = 1;

# Question 11
SELECT FirstName, LastName from Employee WHERE ReportsTo = 2;

# Question 12
SELECT
(SELECT SUM(Total) From Invoice)/
(SELECT COUNT(InvoiceID) From Invoice) as Average_Sale;


# Create tables

CREATE TABLE FoodStats(
    FoodID INT,
    Name VARCHAR(50),
    FoodGroup VARCHAR(30),
    Type VARCHAR(30),
    CaloriesPerServe INT,
    ProteinPerServe INT,
    PRIMARY KEY (FoodID)
);

CREATE TABLE InventoryOrder(
    InventOrdID INT,
    Date DATE,
    FoodID INT,
    Quantity INT,
    Cost DECIMAL(6,2), 
    PRIMARY KEY (InventOrdID),
    FOREIGN KEY (FoodID) REFERENCES FoodStats(FoodID)
);
    
CREATE TABLE FoodOrder(
    OrderID INT,
    DateTime DATETIME,
    Weekday VARCHAR(10),
    Base INT,
    Top1 INT,
    Top2 INT,
    Top3 INT,
    Protein INT,
    Cost DECIMAL(6,2),
    PRIMARY KEY (OrderID),
    FOREIGN KEY (Base) REFERENCES FoodStats(FoodID), 
    FOREIGN KEY (Top1) REFERENCES FoodStats(FoodID),
    FOREIGN KEY (Top2) REFERENCES FoodStats(FoodID), 
    FOREIGN KEY (Top3) REFERENCES FoodStats(FoodID), 
    FOREIGN KEY (Protein) REFERENCES FoodStats(FoodID)
);        


# INSERT DATA
INSERT INTO FoodStats (FoodID, Name, FoodGroup, Type, CaloriesPerServe, ProteinPerServe)
VALUES 
(1, 'Brown Rice', 'Grain', 'Base', 216, 5),
(2, 'Spinach', 'Vegetable', 'Base', 7, 1),
(3, 'Chickpea', 'Vegetable', 'Topping', 46, 2),
(4, 'Broccoli', 'Vegetable', 'Topping', 50, 4),
(5, 'Red Onion', 'Vegetable', 'Topping', 6, 1),
(6, 'Corn', 'Vegetable', 'Topping', 86, 3),
(7, 'Pita Chip', 'Grain', 'Topping', 130, 2),
(8, 'Tomato', 'Vegetable', 'Topping', 22, 1),
(9, 'Feta Cheese', 'Dairy', 'Topping', 75, 4),
(10, 'Jalapeno', 'Vegetable', 'Topping', 4, 0),
(11, 'Chicken', 'Meat', 'Protein', 335, 25),
(12, 'Tofu', 'Soy', 'Protein', 70, 8);


INSERT INTO FoodOrder (OrderID, DateTime, Weekday, Base, Top1, Top2, Top3, Protein, Cost)
VALUES 
(1, '2024-09-09 12:45:00', 'Monday', 1, 5, 7, 9, 12, 10.50),
(2, '2024-09-09 14:30:00', 'Monday', 2, 3, 6, 8, 11, 12.75),
(3, '2024-09-09 16:20:00', 'Monday', 1, 4, 7, 10, 11, 9.90),
(4, '2024-09-09 18:10:00', 'Monday', 2, 5, 6, 9, 12, 13.25),
(5, '2024-09-10 13:15:00', 'Tuesday', 1, 6, 8, 10, 11, 11.00),
(6, '2024-09-10 15:50:00', 'Tuesday', 2, 4, 7, 9, 12, 10.25),
(7, '2024-09-10 17:40:00', 'Tuesday', 1, 3, 5, 8, 11, 8.75),
(8, '2024-09-10 19:00:00', 'Tuesday', 2, 7, 9, 10, 12, 13.00);

INSERT INTO InventoryOrder (InventOrdID, Date, FoodID, Quantity, Cost)
VALUES 
(1, '2024-09-09', 1, 5, 27.50),
(2, '2024-09-09', 2, 7, 33.80),
(3, '2024-09-09', 3, 10, 45.00),
(4, '2024-09-09', 4, 8, 36.00),
(5, '2024-09-10', 5, 12, 55.00),
(6, '2024-09-10', 6, 6, 28.20),
(7, '2024-09-10', 7, 15, 68.00),
(8, '2024-09-10', 8, 4, 18.00),
(9, '2024-09-11', 9, 9, 41.00),
(10, '2024-09-11', 10, 3, 14.00),
(11, '2024-09-11', 11, 11, 48.50),
(12, '2024-09-11', 12, 5, 23.00);

# QUERIES

SELECT * from FoodOrder WHERE Base = 1;

SELECT AVG(Cost) from InventoryOrder;

SELECT * from FoodStats WHERE CaloriesPerServe >= 50 AND ProteinPerServe >=10;
