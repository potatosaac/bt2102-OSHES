CREATE TABLE CUSTOMER(
	CustomerID   VARCHAR(120) NOT NULL,
    fName        VARCHAR(120) NOT NULL,
    Gender       VARCHAR(120) CONSTRAINT CHECK(Gender IN ('M', 'F')),
    eMail        VARCHAR(120),
    phoneNo      VARCHAR(120),
    custAddress  VARCHAR(120),
    custPassword VARCHAR(120) NOT NULL,
    PRIMARY KEY (CustomerID));

CREATE TABLE ADMINISTRATOR(
	AdminID       VARCHAR(120) NOT NULL,
    fName         VARCHAR(120) NOT NULL,
    Gender        VARCHAR(120) CONSTRAINT CHECK(Gender IN ('M', 'F')),
    phoneNo       VARCHAR(120),
    adminPassword VARCHAR(120) NOT NULL,
    PRIMARY KEY (AdminID));																		
																			 
CREATE TABLE ITEMS(
	ItemID		VARCHAR(120) NOT NULL,
	Model		VARCHAR(120) NOT NULL CONSTRAINT CHECK(Model IN ('Light1', 'Light2', 'Safe1', 'Safe2', 'Safe3', 'SmartHome1')),
	Category	VARCHAR(120) NOT NULL CONSTRAINT CHECK(Category IN ('Lights', 'Locks')),
	Color		VARCHAR(120) NOT NULL,
	Factory		VARCHAR(120) NOT NULL,
	PowerSupply	VARCHAR(120) NOT NULL,  
	PurchaseStatus	VARCHAR(120) NOT NULL CONSTRAINT purchaseStatusType CHECK(purchaseStatus IN ('Sold', 'Unsold')),
	ProductionYear	INT NOT NULL,
	ServiceStatus	VARCHAR(120),
	PRIMARY KEY (ItemID));
    
CREATE TABLE PRODUCTS (
  `Category` text NOT NULL,
  `Cost ($)` int NOT NULL,
  `Model` text NOT NULL,
  `Price ($)` int NOT NULL,
  `ProductID` int NOT NULL,
  `Warranty (months)` int NOT NULL,
  PRIMARY KEY (`ProductID`));
