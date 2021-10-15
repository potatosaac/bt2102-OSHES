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
	AdministratorID       VARCHAR(120) NOT NULL,
    fName         VARCHAR(120) NOT NULL,
    Gender        VARCHAR(120) CONSTRAINT CHECK(Gender IN ("Male", "Female")),
    phoneNo       VARCHAR(120),
    adminPassword VARCHAR(120) NOT NULL,
    PRIMARY KEY (AdministratorID));
																			
																			 
CREATE TABLE ITEMS(
	ItemID		VARCHAR(120) NOT NULL,
	Model		VARCHAR(120) NOT NULL CONSTRAINT CHECK(Model IN ("Light1", "Light", "Safe1", "Safe2", "Safe3", "SmartHome1")),
	Category	VARCHAR(120) NOT NULL CONSTRAINT CHECK(Category IN ("Lights", "Locks")),
	Color		VARCHAR(120) NOT NULL,
	Factory		VARCHAR(120) NOT NULL,
	PowerSupply	VARCHAR(120) NOT NULL,  
	PurchaseStatus	VARCHAR(120) NOT NULL CONSTRAINT CHECK(purchaseStatus IN ("Sold", "Unsold")),
	ProductionYear	INT NOT NULL,
	ServiceStatus	VARCHAR(120),
	PRIMARY KEY (ItemID));
    
CREATE TABLE PRODUCT(
	ProductID	VARCHAR(120) NOT NULL,
	Cost		INT NOT NULL,
	Model		VARCHAR(120) CONSTRAINT CHECK(Model IN ("Light1", "Light", "Safe1", "Safe2", "Safe3", "SmartHome1")),
	Price		INT NOT NULL, 
	Category	VARCHAR(120) NOT NULL,
	`Warrenty(months)`SMALLINT NOT NULL,
	PRIMARY KEY (ProductID));
    
CREATE TABLE REQUEST(
	RequestID       VARCHAR(120) NOT NULL,
	CustomerID      VARCHAR(120) NOT NULL,
	ItemID			VARCHAR(120),
	requestStatus   VARCHAR(120) NOT NULL CONSTRAINT CHECK(requestStatus IN ("Submitted", "Submitted and Waiting for payment", "In Progress", "Approved", "Canceled", "Completed")),
	serviceStatus   VARCHAR(120) NOT NULL CONSTRAINT CHECK(serviceStatus IN ("Waiting for Approval", "In Progress", "Completed")),
	serviceFee      INT NOT NULL,
	feeCreationDate DATE NOT NULL,
	feeSettlementDate DATE NOT NULL,
	requestDate     DATE NOT NULL,
	payDate        	DATE NOT NULL,
	AdministratorID  VARCHAR(120),
	PRIMARY KEY (RequestID, CustomerID),
	FOREIGN KEY (ItemID) REFERENCES ITEMS(ItemID) ON DELETE SET NULL ON UPDATE CASCADE, 
	FOREIGN KEY (AdministratorID) REFERENCES Administrator(AdministratorID) ON DELETE SET NULL
										ON UPDATE CASCADE);												 
