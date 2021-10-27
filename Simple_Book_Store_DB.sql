-- DATABASE CREATED NAME (AmarBookStor)

CREATE DATABASE SimpleBookStoreDB
ON 
(
    NAME = 'SimpleBookStoreDB_Data',
    FILENAME = 'F:\SQL_SERVER_SPACE\Simple_Book_Store\SimpleBookStoreDB_Data.mdf',
    SIZE = 25MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10%
)
LOG ON 
(
    NAME = 'SimpleBookStoreDB_Log',
    FILENAME = 'F:\SQL_SERVER_SPACE\Simple_Book_Store\SimpleBookStoreDB_Log.ldf',
    SIZE = 25MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 10%
)
GO

--====================================================================================



-- TABLE-001 NAME (bookList)

CREATE TABLE bookList
(
    Book_Id INT PRIMARY KEY NOT NULL,
    Book_Name NVARCHAR (75) NOT NULL,
    Book_Category NVARCHAR (75) NOT NULL
)
GO

--====================================================================================

-- TABLE-002 Name (bookAuthor)

CREATE TABLE bookAuthor
(
    Author_Id INT PRIMARY KEY NOT NULL,
    Book_Id INT REFERENCES bookList(Book_Id) NOT NULL,
    Author_Name NVARCHAR (75) NOT NULL,
    Author_Gender NVARCHAR (7) CHECK (Author_Gender IN ('Male', 'Female', 'Others') )
)
GO


--====================================================================================


-- TABLE-003 NAME (bookPrice)

CREATE TABLE bookPrice
(
    Price_Id INT PRIMARY KEY NOT NULL,
    Book_Id INT REFERENCES bookList(Book_Id) NOT NULL,
    Book_Price SMALLMONEY NOT NULL,
    Price_Discount FLOAT NULL,
    Sell_Price AS Book_Price * (1-Price_Discount/100)
)
GO


--====================================================================================

-- TABLE-004 NAME (CUSTOMER)

 CREATE TABLE Customer
 (
     Customer_Id INT PRIMARY KEY NOT NULL,
     Customer_Name NVARCHAR (75) NOT NULL,
     Customer_Gender NVARCHAR (7) CHECK (Customer_Gender IN ('Male', 'Female', 'Others')) NOT NULL,
     Customer_Email NVARCHAR (50) UNIQUE NOT NULL,
     Customer_Phone NCHAR (11),
     Customer_Location NVARCHAR (75) NOT NULL

 )
GO

--====================================================================================

-- TABLE-005 NAME (sellsList)


CREATE TABLE sellsList
 (
     Sell_Id INT PRIMARY KEY NOT NULL,
     Customer_Id INT REFERENCES Customer (Customer_Id) NOT NULL,
     Book_Id INT REFERENCES bookList (Book_Id) NOT NULL,
     Author_Id INT REFERENCES bookAuthor (Author_Id) NOT NULL, 
     Price_Id INT REFERENCES bookPrice (Price_Id ) NOT NULL
 )
 GO


--====================================================================================

-- USE DATABASE 

USE SimpleBookStoreDB
GO
--====================================================================================