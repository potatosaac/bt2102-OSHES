CREATE TABLE CUSTOMER(
	CustomerID   VARCHAR(120) NOT NULL,
    fName        VARCHAR(120) NOT NULL,
    Gender       VARCHAR(120) CONSTRAINT GenderType CHECK(Gender IN ('M', 'F')),
    eMail        VARCHAR(120),
    phoneNo      VARCHAR(120),
    custAddress  VARCHAR(120),
    custPassword VARCHAR(120) NOT NULL,
    PRIMARY KEY (CustomerID));

CREATE TABLE ADMINISTRATOR(
	AdminID       VARCHAR(120) NOT NULL,
    fName         VARCHAR(120) NOT NULL,
    Gender        VARCHAR(120) CONSTRAINT GenderType CHECK(Gender IN ('M', 'F')),
    phoneNo       VARCHAR(120),
    adminPassword VARCHAR(120) NOT NULL,
    PRIMARY KEY (AdminID));

CREATE TABLE MODEL(
	modelName     VARCHAR(120) NOT NULL CONSTRAINT modelNameType CHECK(modelName IN ('Light1', 'Light2', 'Safe1', 'Safe2', 'Safe3', 'SmartHome1')),
    category      VARCHAR(120) NOT NULL CONSTRAINT categoryType CHECK(category IN ('Lights', 'Locks')),
    price         DECIMAL(6,2) NOT NULL,
    cost          DECIMAL(6,2) NOT NULL,
    warranty      SMALLINT,
    PRIMARY KEY (modelName, category));
    
CREATE TABLE PRODUCT(
	ProductID         VARCHAR(120) NOT NULL,
    modelName         VARCHAR(120) CONSTRAINT modelNameType CHECK(modelName IN ('Light1', 'Light2', 'Safe1', 'Safe2', 'Safe3', 'SmartHome1')),
    purchaseStatus    VARCHAR(120) NOT NULL CONSTRAINT purchaseStatusType CHECK(purchaseStatus IN ('Sold', 'Unsold')),
    specificInfo      VARCHAR(120) NOT NULL,
    PRIMARY KEY (ProductID),
    FOREIGN KEY (modelName, category) REFERENCES MODEL(modelName, category) ON DELETE SET NULL
																			
																			 
CREATE TABLE ITEMS(
	ItemID		VARCHAR(120) NOT NULL,
	Model		VARCHAR(120) NOT NULL CONSTRAINT ModelType CHECK(Model IN ('Light1', 'Light2', 'Safe1', 'Safe2', 'Safe3', 'SmartHome1')),
    	Category	VARCHAR(120) NOT NULL CONSTRAINT CategoryType CHECK(Category IN ('Lights', 'Locks')),
    	Color		VARCHAR(120) NOT NULL,
    	Factory		VARCHAR(120) NOT NULL,
	PowerSupply	VARCHAR(120) NOT NULL,  
	PurchaseStatus	VARCHAR(120) NOT NULL CONSTRAINT purchaseStatusType CHECK(purchaseStatus IN ('Sold', 'Unsold')),
	ProductionYear	INT NOT NULL,
	Model		VARCHAR(120) NOT NULL,	
	ServiceStatus	VARCHAR(120),
    	PRIMARY KEY (ItemID),
	FOREIGN KEY (Model));
    
CREATE TABLE PRODUCT(
	ProductID	VARCHAR(120) NOT NULL,
	Cost		INT NOT NULL,
    	Model		VARCHAR(120) CONSTRAINT ModelType CHECK(Model IN ('Light1', 'Light2', 'Safe1', 'Safe2', 'Safe3', 'SmartHome1')),
    	Price		INT NOT NULL, 
    	Category	VARCHAR(120) NOT NULL,
	Warrenty(months)SMALLINT NOT NULL,
    	PRIMARY KEY (ProductID),
    	FOREIGN KEY (Model) REFERENCES ITEMS(Model) ON DELETE SET NULL

																	ON UPDATE CASCADE);
