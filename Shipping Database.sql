go
CREATE DATABASE shipping_project;
go
USE shipping_project;
GO

CREATE TABLE people (
    id_people INT IDENTITY(1,1) PRIMARY KEY,
    cccd VARCHAR(12) CHECK (cccd LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    name NVARCHAR(500) NOT NULL CHECK (name NOT LIKE '%[^a-zA-Zà-ạăằẳẵặâấầẩẫậè-ệêềếểễệì-ịò-ọô-ộơ-ợù-ụưứừửữựỳỹỷỵ ]%'),
    DateOfBirth DATE CHECK (DateOfBirth <= DATEADD(YEAR, -18, GETDATE())),
    sex CHAR(1),
    email NVARCHAR(500) CHECK (email LIKE '[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,4}$'),
    delivery_address NVARCHAR(500) NOT NULL,
    image_selfie NVARCHAR(500),
    image_cccd_front NVARCHAR(500),
    image_cccd_back NVARCHAR(500),
    order_number INT DEFAULT 0,
    spending NVARCHAR(500) DEFAULT '0' CHECK (spending LIKE '[0-9]+')
);
go
CREATE TABLE address (
    id_address INT IDENTITY(1,1) PRIMARY KEY,
    name_address NVARCHAR(500),
    address NVARCHAR(500),
    id_people INT UNIQUE NOT NULL,
    FOREIGN KEY (id_people) REFERENCES people(id_people)
);
go
CREATE TABLE account (
    phone_number VARCHAR(11) CHECK (phone_number LIKE '[0-9]{10,11}') PRIMARY KEY,
    password NVARCHAR(500) CHECK (password NOT LIKE '%[^!-~]%'),
    permission NVARCHAR(500),
    joining_date DATETIME DEFAULT GETDATE(),
    id_people INT UNIQUE NOT NULL,
    FOREIGN KEY (id_people) REFERENCES people(id_people)
);
go
CREATE TABLE Shipper (
    id_shipper INT IDENTITY(1,1) PRIMARY KEY,
    license_plates VARCHAR(9) NOT NULL,
    image_driver_license NVARCHAR(500) NOT NULL,
    image_vehicle_registration NVARCHAR(500) NOT NULL,
    image_Curriculum_Vitae NVARCHAR(500) NOT NULL,
    image_Civil_Guarantee_Letter NVARCHAR(500) NOT NULL,
    image_Certificate_of_No_Criminal_Record NVARCHAR(500) NOT NULL,
    image_Birth_Certificate NVARCHAR(500) NOT NULL,
    image_Household_Registration NVARCHAR(500) NOT NULL,
    image_Health_Examination_Certificate NVARCHAR(500) NOT NULL,
    status BIT,
    id_account VARCHAR(11) UNIQUE NOT NULL,
    id_post_office INT NOT NULL,
    FOREIGN KEY (id_account) REFERENCES account(phone_number),
);
go
CREATE TABLE package (
    id_package INT IDENTITY(1,1) PRIMARY KEY,
    name_Item NVARCHAR(500),
    Volume INT NOT NULL,
    weight INT NOT NULL,
    image_1 NVARCHAR(500) NOT NULL,
    image_2 NVARCHAR(500) NOT NULL,
    image_3 NVARCHAR(500) NOT NULL,
    image_4 NVARCHAR(500) NOT NULL
);
go
CREATE TABLE Order_Shipping (
    id_order INT IDENTITY(1,1) PRIMARY KEY,
    note_for_shipper NVARCHAR(500),
    check_package BIT,
    collection_money INT DEFAULT 0,
    transportation_cost INT DEFAULT 0,
    order_date DATETIME DEFAULT GETDATE(),
    status_order BIT,
    id_sender VARCHAR(11) NOT NULL,
    id_receiver VARCHAR(11) NOT NULL,
    id_package INT UNIQUE NOT NULL,
    id_shipper INT,
    FOREIGN KEY (id_sender) REFERENCES account(phone_number),
    FOREIGN KEY (id_receiver) REFERENCES account(phone_number),
    FOREIGN KEY (id_package) REFERENCES package(id_package),
    FOREIGN KEY (id_shipper) REFERENCES Shipper(id_shipper),
    CONSTRAINT CheckSenderReceiverDifferent CHECK (id_sender <> id_receiver)
);


go
CREATE TABLE transit_vehicle (
    id_transit_vehicle INT IDENTITY(1,1) PRIMARY KEY,
    car_company NVARCHAR(500) NOT NULL,
    type NVARCHAR(500) NOT NULL,
    license_plate VARCHAR(9),
    tank_volume INT NOT NULL,
    maximum_storage_volume INT NOT NULL,
    id_post_office INT,
    CONSTRAINT CheckLicensePlatePostOfficeIsNull CHECK ((license_plate IS NULL AND id_post_office IS NULL) OR (license_plate IS NOT NULL AND id_post_office IS NOT NULL)),
    
);
go
CREATE TABLE driver_transit_vehicle (
    id_driver INT IDENTITY(1,1) PRIMARY KEY,
    image_driver_license NVARCHAR(500) NOT NULL,
    image_Curriculum_Vitae NVARCHAR(500) NOT NULL,
    image_Civil_Guarantee_Letter NVARCHAR(500) NOT NULL,
    image_Certificate_of_No_Criminal_Record NVARCHAR(500) NOT NULL,
    image_Birth_Certificate NVARCHAR(500) NOT NULL,
    image_Household_Registration NVARCHAR(500) NOT NULL,
    image_Health_Examination_Certificate NVARCHAR(500) NOT NULL,
    timetable VARCHAR(8),
    status BIT,
    CONSTRAINT ChecktimetablestatusIsNull CHECK ((timetable IS NULL AND status IS NULL) OR (timetable IS NOT NULL AND status IS NOT NULL)),
    id_account VARCHAR(11) UNIQUE NOT NULL,
    id_transit_vehicle INT,
    FOREIGN KEY (id_account) REFERENCES account(phone_number),
    FOREIGN KEY (id_transit_vehicle) REFERENCES transit_vehicle(id_transit_vehicle)
);
go
CREATE TABLE image_order (
    id_image_order INT IDENTITY(1,1) PRIMARY KEY,
    shooting_date DATETIME DEFAULT GETDATE(),
    image_1 NVARCHAR(500) NOT NULL,
    image_2 NVARCHAR(500) NOT NULL,
    image_3 NVARCHAR(500) NOT NULL,
    image_4 NVARCHAR(500) NOT NULL
);
go
CREATE TABLE current_location (
    id_current_location INT IDENTITY(1,1) PRIMARY KEY,
    current_location_date DATETIME DEFAULT GETDATE(),
    id_order INT,
    id_post_office INT,
    id_transit_vehicle INT,
    id_image_order INT UNIQUE NOT NULL,
    FOREIGN KEY (id_order) REFERENCES Order_Shipping(id_order),
    FOREIGN KEY (id_transit_vehicle) REFERENCES transit_vehicle(id_transit_vehicle),
    FOREIGN KEY (id_image_order) REFERENCES image_order(id_image_order),
    CONSTRAINT CheckPostOfficeTransitVehicleIsNull CHECK ((id_post_office IS NULL AND id_transit_vehicle IS NOT NULL) OR (id_post_office IS NOT NULL AND id_transit_vehicle IS NULL))
);

