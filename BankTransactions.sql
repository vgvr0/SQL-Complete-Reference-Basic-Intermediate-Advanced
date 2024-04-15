CREATE TABLE BankTransactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionType VARCHAR(50),
    Amount DECIMAL(18, 2),
    Currency VARCHAR(3),
    TransactionDate DATETIME,
    MerchantName VARCHAR(255),
    MerchantLocation VARCHAR(255),
    Status VARCHAR(50),
    Category VARCHAR(50),
    Notes TEXT,
    BalanceAfterTransaction DECIMAL(18, 2),
    CreatedBy VARCHAR(255),
    CreatedDate DATETIME,
    ModifiedBy VARCHAR(255),
    ModifiedDate DATETIME,
    -- ... additional columns as needed ...
    FOREIGN KEY (AccountID) REFERENCES BankAccounts(AccountID)
);
