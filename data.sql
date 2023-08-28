-- Users
use stockMarketDB1
INSERT INTO Users VALUES ( 'jiya', 'jiya@gmail.com', 5000.00)
INSERT INTO Users VALUES ( 'riya',  'riya@gmail.com', 7500.00);
select * from Users

-- Stocks
INSERT INTO Stocks VALUES('AAPL', 'Apple Inc.', 'Technology', 'Consumer Electronics')
INSERT INTO Stocks VALUES    ( 'MSFT', 'Microsoft Corporation',  'Technology', 'Software')
select * from Stocks
-- Orders
use stockMarketDB1
select * from Trades
 INSERT INTO Orders VALUES   ( 1, 1, 'Buy', 10, 150.25, getdate(),  'Completed')
INSERT INTO Orders VALUES     ( 2, 2, 'Sell', 5, 100.50,getdate() ,  'Completed')

-- Trades
INSERT INTO Trades VALUES ( 1, 2, 1, 5, 150.55,getdate())
INSERT INTO Trades VALUES ( 1, 1, 2, 10, 310.25, getdate())
select * from Portfolio
-- Balances
INSERT INTO Balances VALUES( 1, 4000.00, getdate())
 INSERT INTO Balances values ( 2, 7000.00, getdate())

-- Transactions
INSERT INTO Transactions VALUES ( 1, 1, 'Buy', 10, 150.25, getdate())
INSERT INTO Transactions VALUES ( 2, 2, 'Sell', 5, 300.50, getdate())



-- Portfolio
INSERT INTO Portfolio VALUES ( 1, 1, 150,'panding')
INSERT INTO Portfolio VALUES ( 2, 2, 75)

-- Watchlist
INSERT INTO Watchlist VALUES ( 1, 2)
INSERT INTO Watchlist VALUES ( 2, 1)

INSERT INTO PriceHistory VALUES ( 1, 145.00, 155.00, 142.50, 152.75, 10000, getdate())
INSERT INTO PriceHistory VALUES ( 1, 153.00, 158.50, 150.25, 157.50, 12000, getdate())


INSERT INTO Exchange VALUES (1, 'AAPL', 'Apple Inc.',  157.50, 120000, 'NSE',getdate())
INSERT INTO Exchange VALUES (2, 'MSFT', 'Microsoft Corporation', 310.25, 85000, 'BSE',getdate())
    (3, 'RELIANCE', 'Reliance Industries Ltd.', 2500.75, 50000, 'NSE'),
    (4, 'TCS', 'Tata Consultancy Services Ltd.', 3500.25, 60000, 'BSE');


Introduction
The Stock Market System is a software application that provides a platform for investors to buy and sell stocks. It aims to facilitate efficient trading, provide real-time market data, and enable investors to make informed decisions. This document serves as the Software Requirements Specification (SRS) for the Stock Market System.

2. Functional Requirements
2.1 User Registration
   - The system shall allow users to register by providing their personal information.
   - The system shall validate user information and ensure unique usernames.

2.2 User Authentication
   - The system shall provide a login mechanism for registered users.
   - The system shall authenticate users based on their login credentials.

2.3 Stock Listings
   - The system shall provide a list of available stocks with their current prices.
   - The system shall display detailed information about each stock, including historical data and company information.

2.4 Buying/Selling Stocks
   - The system shall allow users to place buy or sell orders for stocks.
   - The system shall validate the availability of stocks and user account balances before executing orders.
   - The system shall update user account balances and stock quantities based on successful transactions.

2.5 Portfolio Management
   - The system shall maintain a portfolio for each user, displaying their current holdings and their market value.
   - The system shall provide a summary of the user's portfolio performance, including profit/loss calculations.

2.6 Real-time Market Data
   - The system shall provide real-time stock market data, including prices, volumes, and trends.
   - The system shall display real-time updates to users, ensuring accurate and timely information.

2.7 Transaction History
   - The system shall maintain a transaction history for each user, recording all buy/sell orders and their outcomes.
   - The system shall allow users to view their transaction history, including details such as date, time, stock, quantity, and price.

3. Non-Functional Requirements
3.1 Performance
   - The system shall handle a large number of concurrent users without significant performance degradation.
   - The system shall provide real-time updates with minimal latency.

3.2 Security
   - The system shall ensure secure transmission of user information and financial data.
   - The system shall implement appropriate authentication and authorization mechanisms to protect user accounts.
