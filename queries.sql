-- Insert a new user
INSERT INTO Users (UserName, Email, PasswordHash) VALUES ('John Doe', 'john.doe@example.com', 'hashedpassword');

-- Insert a new category
INSERT INTO Categories (UserID, CategoryName) VALUES (1, 'Groceries');

-- Insert a new label
INSERT INTO Labels (UserID, LabelName) VALUES (1, 'Supermarket');

-- Insert a new transaction
INSERT INTO Transactions (UserID, TransactionDate, Description, Amount, CategoryID, LabelID) 
VALUES (1, '2024-06-25', 'Bought groceries', -50.00, 1, 1);

-- Generate a monthly report for a user
SELECT 
    MONTH(TransactionDate) AS Month, 
    SUM(Amount) AS TotalSpent, 
    CategoryName 
FROM Transactions 
JOIN Categories ON Transactions.CategoryID = Categories.CategoryID 
WHERE UserID = 1 AND YEAR(TransactionDate) = 2024 
GROUP BY MONTH(TransactionDate), CategoryName;

-- Update a transaction's category
UPDATE Transactions 
SET CategoryID = 2 
WHERE TransactionID = 1;

-- Delete a transaction
DELETE FROM Transactions 
WHERE TransactionID = 1;