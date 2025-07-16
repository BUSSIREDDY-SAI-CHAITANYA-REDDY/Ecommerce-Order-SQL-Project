CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(100),
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    Address NVARCHAR(255),
    City NVARCHAR(50),
    Country NVARCHAR(50)
)


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    CategoryName NVARCHAR(100)
)



CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
)



CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)



CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    PaymentDate DATETIME,
    PaymentMode NVARCHAR(50),
    PaymentStatus NVARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
)

CREATE TABLE ShippingDetails (
    ShippingID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    ShippingAddress NVARCHAR(255),
    ShippingDate DATETIME,
    DeliveryStatus NVARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
)

INSERT INTO Categories (CategoryName)
VALUES 
('Electronics'),
('Fashion'),
('Home Appliances'),
('Books'),
('Toys'),
('Sports'),
('Beauty'),
('Groceries');

INSERT INTO Products (ProductName, Price, Stock, CategoryID)
VALUES
('iPhone 14 Pro', 1299.99, 50, 1),
('Samsung TV 55"', 799.99, 30, 1),
('Nike Air Max', 149.99, 100, 2),
('Adidas Hoodie', 89.99, 70, 2),
('Electric Kettle', 39.99, 80, 3),
('Microwave Oven', 199.99, 45, 3),
('The Alchemist', 9.99, 200, 4),
('Harry Potter Box Set', 49.99, 150, 4),
('Lego Creator Set', 59.99, 120, 5),
('Cricket Bat', 79.99, 60, 6),
('Face Cream', 19.99, 80, 7),
('Organic Rice - 5kg', 12.99, 300, 8);


INSERT INTO Customers (FullName, Email, Phone, Address, City, Country)
VALUES
('Rahul Sharma', 'rahul.sharma@email.com', '9876543210', '123 Nehru Street', 'Delhi', 'India'),
('Priya Desai', 'priya.desai@email.com', '8765432109', '45 MG Road', 'Mumbai', 'India'),
('Amit Verma', 'amit.verma@email.com', '7654321098', 'Sector 21', 'Noida', 'India'),
('Sunita Rao', 'sunita.rao@email.com', '6543210987', 'Aundh', 'Pune', 'India'),
('Karan Patel', 'karan.patel@email.com', '5432109876', 'Bopal', 'Ahmedabad', 'India')

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, '2025-07-01', 1499.98),
(2, '2025-07-02', 199.98),
(3, '2025-07-03', 299.97),
(4, '2025-07-04', 89.99),
(5, '2025-07-05', 379.95)

INSERT INTO OrderItems (OrderID, ProductID, Quantity, SubTotal)
VALUES
(1, 1, 1, 1299.99),
(1, 3, 1, 199.99),
(2, 6, 1, 199.98),
(3, 8, 3, 149.97),
(4, 4, 1, 89.99),
(5, 10, 2, 159.98),
(5, 11, 1, 19.99),
(5, 12, 1, 199.98);

INSERT INTO Payments (OrderID, PaymentDate, PaymentMode, PaymentStatus)
VALUES
(1, '2025-07-01', 'Credit Card', 'Completed'),
(2, '2025-07-02', 'UPI', 'Completed'),
(3, '2025-07-03', 'Debit Card', 'Completed'),
(4, '2025-07-04', 'Cash on Delivery', 'Pending'),
(5, '2025-07-05', 'Net Banking', 'Completed');


INSERT INTO ShippingDetails (OrderID, ShippingAddress, ShippingDate, DeliveryStatus)
VALUES
(1, '123 Nehru Street, Delhi, India', '2025-07-03', 'Delivered'),
(2, '45 MG Road, Mumbai, India', '2025-07-04', 'Shipped'),
(3, 'Sector 21, Noida, India', '2025-07-05', 'Delivered'),
(4, 'Aundh, Pune, India', '2025-07-06', 'Pending'),
(5, 'Bopal, Ahmedabad, India', '2025-07-07', 'Delivered');



