create database stockMarketDB1
use stockMarketDB1

CREATE TABLE Users (
    userID INT PRIMARY KEY identity,
    userName VARCHAR(50) ,
    email VARCHAR(100) ,
    balance DECIMAL(18, 2) 
);

CREATE TABLE Stocks (
    stockID INT PRIMARY KEY identity,
    symbol VARCHAR(10) ,
    stockName VARCHAR(100) ,
    sector VARCHAR(50),
    Industry VARCHAR(50)
);
select * from Portfolio
CREATE TABLE Orders (
    orderID INT PRIMARY KEY identity,
    userID INT ,
    stockID INT,
    orderType VARCHAR(10) ,
    quantity INT ,
    price DECIMAL(18, 2),
    placedDate DATETIME default getdate() ,
    status VARCHAR(20),
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (stockID) REFERENCES Stocks(stockID)
);
select * from Portfolio
select * from Orders
CREATE TABLE Trades (
    tradeID INT PRIMARY KEY identity,
    buyerUserID INT,
    sellerUserID INT,
    stockID INT,
    quantity INT ,
    price DECIMAL(18, 2) ,
    tradeDate DATETIME default getdate(),
    FOREIGN KEY (buyerUserID) REFERENCES Users(userID),
    FOREIGN KEY (sellerUserID) REFERENCES Users(userID),
    FOREIGN KEY (stockID) REFERENCES Stocks(stockID)
);
drop table Balances
select * from Portfolio
CREATE TABLE Balances (
    balanceID INT PRIMARY KEY identity,
    userID INT,
    amount DECIMAL(18, 2) ,
    lastUpdated DATETIME ,
    FOREIGN KEY (userID) REFERENCES Users(userID)
);



CREATE TABLE Transactions (
    transactionID INT PRIMARY KEY identity,
    userID INT,
    stockID INT,
    transactionType VARCHAR(10) ,
    quantity INT,
    price DECIMAL(10, 2),
    transactionDate DATETIME default getdate(),
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (stockID) REFERENCES Stocks(stockID)
);

CREATE TABLE Portfolio (
    portfolioID INT PRIMARY KEY identity,
    userID INT,
    stockID INT,
    quantity INT ,
	profitLossStatus varchar(20),
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (stockID) REFERENCES Stocks(stockID)
);
drop table Portfolio
select * from Portfolio
CREATE TABLE Watchlist (
    watchlistID INT PRIMARY KEY identity,
    userID INT,
    stockID INT,
    FOREIGN KEY (userID) REFERENCES Users(userID),
    FOREIGN KEY (stockID) REFERENCES Stocks(stockID)
);

CREATE TABLE PriceHistory (
    priceHistoryID INT PRIMARY KEY identity,
    stockID INT,
    openPrice DECIMAL(10, 2) ,
    highPrice DECIMAL(10, 2),
    lowPrice DECIMAL(10, 2) ,
    closePrice DECIMAL(10, 2),
    volume INT,
    tradeDate DATETIME ,
    FOREIGN KEY (stockID) REFERENCES Stocks(stockID)
);


drop table Exchange
CREATE TABLE Exchange (
	exchangeId int primary key identity,
    StockID INT,
    symbol VARCHAR(10) ,
    [Name] VARCHAR(10) ,
    LastPrice DECIMAL(10, 2),
    Volume INT,
	exchangeType varchar(10),
	 MarketDate DATETIME default getdate() ,
    FOREIGN KEY (stockID) REFERENCES Stocks(stockID)
);