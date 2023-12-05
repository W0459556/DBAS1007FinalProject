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
  adopt_Email varchar(50) NOT NULL, -- email address, cant be null
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
    adopt_ID_FK int NOT NULL, -- adopter id foreign key
    cat_Name_FK varchar(50) NOT NULL, -- name of cat theyre choosing 
    ad_Date date NOT NULL, -- date of adoption, cant be null
    shelter_ID_FK int NOT NULL, --changed this from the framework- makes more sense for there to be information about what shelter the cat is being adopted from here, change if necessary
);

CREATE TABLE [Cat]( -- adopters table
	cat_Name varchar(50) NOT NULL PRIMARY KEY, -- name of cat
    cat_FurLength varchar(50) NOT NULL, -- cats fur length
    cat_FurColour varchar(50) NOT NULL, -- colour of the cat
    cat_Age int NOT NULL, -- adoption id foreign key
    cat_FriendlyKids bit, -- boolean friendly with kids
    cat_FriendlyAnimals bit, -- boolean friendly wih animals
    cat_Healthy bit, -- boolean healthy or not
);

CREATE TABLE [Shelters]( -- adopters table
	shelter_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY, -- the ID, which is the Primary Key, cant be null. duh
    shelter_Name varchar(50) NOT NULL, -- name of the shelter
    shelter_Address varchar(50) NOT NULL, -- address of the shelter, only one- change if necessary
);

ALTER TABLE [Adopters] -- alter Adopters to add fk
ADD FOREIGN KEY (news_ID_FK) REFERENCES Newsletters(news_ID); -- links newsletter foreign key to adopters table

ALTER TABLE [Adoption] -- alter Adoption to add fk
ADD FOREIGN KEY (adopt_ID_FK) REFERENCES Adopters(adopt_ID); -- links adoption table to the id of the adopter

ALTER TABLE [Adoption] -- alter Adoption to add fk
ADD FOREIGN KEY (cat_Name_FK) REFERENCES Cat(cat_Name); -- links adoption table to name of cat being adopted

ALTER TABLE [Adoption] -- alter Adoption to add fk
ADD FOREIGN KEY (shelter_ID_FK) REFERENCES Shelters(shelter_ID); -- links adoption table to location from which the cat is being adopted