USE [master]
CREATE DATABASE [CAT_ADOPTION]
GO

USE [CAT_ADOPTION]
GO

CREATE TABLE [Adopters](
    adopt_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    adopt_FName varchar(50) NOT NULL,
    adopt_LName varchar(50) NOT NULL,
    adopt_Addr1 varchar(50) NOT NULL,
    adopt_Addr2 varchar(50) NOT NULL,
    adopt_Email varchar(50) NOT NULL,
    adopt_PhoneNum varchar(50) NOT NULL,
    news_Name_FK varchar(50) NOT NULL,
    adopt_Em_PhoneNum varchar(50) NOT NULL,
    adopt_Em_FName varchar(50) NOT NULL,
    adopt_Em_LName varchar(50) NOT NULL
);

CREATE TABLE [Newsletters](
    news_Name varchar(50) NOT NULL PRIMARY KEY,
    news_ID int NOT NULL IDENTITY(1,1),
    news_Email varchar(50) NOT NULL,
    news_Frequency int NOT NULL,
    news_Telemetry bit
);

CREATE TABLE [Adoption](
    ad_ID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    adopt_ID_FK int NOT NULL,
    cat_Name_FK varchar(50) NOT NULL,
    ad_Date date NOT NULL,
    shelter_Name_FK varchar(50) NOT NULL
);

CREATE TABLE [Cat](
    cat_Name varchar(50) NOT NULL PRIMARY KEY,
    cat_FurLength varchar(50) NOT NULL,
    cat_FurColour varchar(50) NOT NULL,
    cat_Age int NOT NULL,
    cat_FriendlyKids bit,
    cat_FriendlyAnimals bit,
    cat_Healthy bit
);

CREATE TABLE [Shelters](
    shelter_Name varchar(50) NOT NULL PRIMARY KEY,
    shelter_Address varchar(50) NOT NULL
);

ALTER TABLE [Adopters]
ADD FOREIGN KEY (news_Name_FK) REFERENCES Newsletters(news_Name);

ALTER TABLE [Adoption]
ADD FOREIGN KEY (adopt_ID_FK) REFERENCES Adopters(adopt_ID);

ALTER TABLE [Adoption]
ADD FOREIGN KEY (cat_Name_FK) REFERENCES Cat(cat_Name);

ALTER TABLE [Adoption]
ADD FOREIGN KEY (shelter_Name_FK) REFERENCES Shelters(shelter_Name);

INSERT INTO Cat(cat_Name,cat_FurLength,cat_FurColour,cat_Age,cat_FriendlyKids,cat_FriendlyAnimals,cat_Healthy)
VALUES
('Stewart','Long','Orange','1','1','1','1'),
('Fluffy','Long','Grey','4','1','0','1'),
('Whiskers','Short','Brown','2','0','1','1'),
('Mr. Meow','Medium','Black','7','1','0','0'),
('Jazzy','Short','White','2','1','1','1'),
('Berry','Medium','Grey','1','1','1','0'),
('Quiet','Short','Black','4','1','0','1');

INSERT INTO Newsletters(news_Name,news_Email,news_Frequency,news_Telemetry)
VALUES
('Catatonic over Cats','catatonic@cat.li','7','0'),
('Dogged about Dogs','bigdogofficial@hotmail.com','1','1'),
('Doggedly Catatonic about Cats and Dogs','legalizedogbiscuits@gmail.com','3','1');

INSERT INTO Shelters(shelter_Name,shelter_Address)
VALUES
('Halifax','466 Halifax St'),
('Dartmouth','889 Industry St'),
('Truro','461 Park St');

INSERT INTO Adopters(adopt_FName,adopt_LName,adopt_Addr1,adopt_Addr2,adopt_Email,adopt_PhoneNum,news_Name_FK,adopt_Em_PhoneNum,adopt_Em_FName,adopt_Em_LName)
VALUES
('Abby','Smith','1 Park St','427 Boat Ln','AbbySmith@gmail.com','999-888-1010','Catatonic over Cats','888-999-1010','Ethan','Parker'),
('Ethan','Wilson','2 Park St','428 Sunflower Ln','EthanWilson@gmail.com','999-888-1011','Dogged about Dogs','888-999-1011','Beatrice','Kent'),
('Beatrice','Parker','3 Park St','429 Boat Ln','BeatriceParker@gmail.com','999-888-1100','Catatonic over Cats','888-999-1012','William','Grayson'),
('William','Kent','4 Park St','430 Leeds Ln','WilliamKent@gmail.com','999-888-1101','Doggedly Catatonic about Cats and Dogs','888-999-1013','Richard','Smith'),
('Richard','Grayson','5 Park St','431 Boat Ln','RichardGrayson@gmail.com','999-888-1111','Catatonic over Cats','888-999-1014','Abby','Wilson');

INSERT INTO Adoption(adopt_ID_FK,cat_Name_FK,ad_Date,shelter_Name_FK)
VALUES
('1','Stewart','2023-11-28','Halifax'),
('2','Jazzy','2023-10-01','Dartmouth'),
('3','Whiskers','2023-11-11','Truro'),
('4','Stewart','2023-11-30','Halifax'),
('5','Berry','2023-12-01','Truro');
