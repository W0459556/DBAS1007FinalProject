USE [master] -- creates it in master 
CREATE DATABASE [CAT_ADOPTION] -- creates the database
GO -- executes it 

USE [CAT_ADOPTION] -- moves over to new database
GO -- executes it

CREATE TABLE [Adopters]( -- adopters table
	adopt_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY, -- the ID, which is the Primary Key, cant be null. duh
	adopt_FName varchar(50) NOT NULL, -- FIRST NAME, cant be null
	adopt_LName varchar(50) NOT NULL, -- LAST NAME, cant be null
	adopt_Addr1 varchar(50) NOT NULL, -- address 1, cant be null
	adopt_Addr2 varchar(50) NOT NULL, -- address 2, cant be null
	adopt_PhoneNum varchar(50) NOT NULL, -- phone number, cant be null
	news_ID_FK int NOT NULL, -- news foreign key, cant be null
	adopt_Em_PhoneNum date NOT NULL, -- emergency contact phone number, cant be null
	adopt_Em_FName varchar(50) NOT NULL, -- emergency contact FIRST NAME, cant be null
	adopt_Em_LName varchar(50) NOT NULL, -- emergency contact LAST NAME, cant be null
);

CREATE TABLE [Newsletters]( -- adopters table
	news_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY, -- the ID, which is the Primary Key, cant be null. duh
    news_Name varchar(50) NOT NULL, -- name of the newsletter
);

CREATE TABLE [Adoption]( -- adopters table
	ad_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY, -- the ID, which is the Primary Key, cant be null. duh
    adopt_ID_FK int NOT NULL, -- adoption id foreign key
    cat_Name_FK varchar(50) NOT NULL, -- name of cat theyre choosing 
    ad_Date date NOT NULL, -- date of adoption, cant be null
);