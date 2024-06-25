-- Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    UserName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PasswordHash VARCHAR(255) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    CategoryName VARCHAR(100) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Labels table
CREATE TABLE Labels (
    LabelID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    LabelName VARCHAR(100) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Transactions table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    TransactionDate DATE NOT NULL,
    Description VARCHAR(255),
    Amount DECIMAL(15, 2) NOT NULL,
    CategoryID INT,
    LabelID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (LabelID) REFERENCES Labels(LabelID)
);

-- Reports table
CREATE TABLE Reports (
    ReportID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ReportType VARCHAR(50) NOT NULL,
    ReportData JSON NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Indexes for optimization
CREATE INDEX idx_user_transactions ON Transactions (UserID);
CREATE INDEX idx_category_transactions ON Transactions (CategoryID);
CREATE INDEX idx_date_transactions ON Transactions (TransactionDate);