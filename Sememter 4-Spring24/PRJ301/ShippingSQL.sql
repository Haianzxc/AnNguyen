CREATE DATABASE ShippingForEveryone;
GO
USE ShippingForEveryone;
GO

CREATE TABLE account (
    id_account INT PRIMARY KEY IDENTITY(1,1),
    phone_number VARCHAR(11) CHECK (phone_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR phone_number LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    password VARCHAR(500) CHECK (password NOT LIKE '%[^!-~]%'),
    permission VARCHAR(500),
    joining_date DATETIME DEFAULT GETDATE(),
    cccd VARCHAR(12) CHECK (cccd LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    name VARCHAR(500) NOT NULL CHECK (name LIKE '%[a-zA-Zà-ạăằẳẵặâấầẩẫậè-ệêềếểễệì-ịò-ọô-ộơ-ợù-ụưứừửữựỳỹỷỵ ]%'),
    DateOfBirth DATE,
    sex CHAR(1),
    email VARCHAR(500) CHECK (email LIKE '[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,4}'),
    delivery_address VARCHAR(500) NOT NULL,
    image_selfie VARCHAR(500),
    image_cccd_front VARCHAR(500),
    image_cccd_back VARCHAR(500),
    address VARCHAR(500),
    list_old_address TEXT
);
GO
CREATE TABLE Shipper (
    id_shipper INT PRIMARY KEY IDENTITY(1,1),
    license_plates VARCHAR(9) NOT NULL,
    image_driver_license VARCHAR(500) NOT NULL,
    image_vehicle_registration VARCHAR(500) NOT NULL,
    image_Curriculum_Vitae VARCHAR(500) NOT NULL,
    image_Civil_Guarantee_Letter VARCHAR(500) NOT NULL,
    image_Certificate_of_No_Criminal_Record VARCHAR(500) NOT NULL,
    image_Birth_Certificate VARCHAR(500) NOT NULL,
    image_Household_Registration VARCHAR(500) NOT NULL,
    image_Health_Examination_Certificate VARCHAR(500) NOT NULL,
    status BIT,
    id_account INT NOT NULL,
    FOREIGN KEY (id_account) REFERENCES account(id_account)
);

GO
CREATE TABLE package (
    id_package INT PRIMARY KEY IDENTITY(1,1),
    name_Item VARCHAR(500),
    Volume INT NOT NULL,
    weight INT NOT NULL,
    image_1 VARCHAR(500) NOT NULL,
    image_2 VARCHAR(500) NOT NULL,
    image_3 VARCHAR(500) NOT NULL,
    image_4 VARCHAR(500) NOT NULL
);
GO
CREATE TABLE Order_Shipping (
    id_order INT PRIMARY KEY IDENTITY(1,1),
    note_for_shipper VARCHAR(500),
    check_package BIT,
    collection_money INT DEFAULT 0,
    transportation_cost INT DEFAULT 0,
    order_date DATETIME DEFAULT GETDATE(),
    status_order BIT,
    id_sender VARCHAR(11) NOT NULL,
    id_receiver VARCHAR(11) NOT NULL,
    id_package INT UNIQUE NOT NULL,
    id_pickup INT,
    id_delivery INT,
    FOREIGN KEY (id_sender) REFERENCES account(phone_number),
    FOREIGN KEY (id_receiver) REFERENCES account(phone_number),
    FOREIGN KEY (id_package) REFERENCES package(id_package),
    FOREIGN KEY (id_pickup) REFERENCES Shipper(id_shipper),
    FOREIGN KEY (id_delivery) REFERENCES Shipper(id_shipper),
    CONSTRAINT CheckSenderReceiverDifferent CHECK (id_sender <> id_receiver),
    CONSTRAINT CheckPickupDeliveryExclusive CHECK (
        (id_pickup IS NULL AND id_delivery IS NULL) OR
        (id_pickup IS NOT NULL AND id_delivery IS NULL) OR
        (id_pickup IS NULL AND id_delivery IS NOT NULL)
    ),
    CONSTRAINT UniquePickupDeliveryPair UNIQUE (id_pickup, id_delivery)
);
GO
CREATE TABLE transit_vehicle (
    id_transit_vehicle INT PRIMARY KEY IDENTITY(1,1),
    name_vehicle VARCHAR(500) NOT NULL,
    type VARCHAR(500) NOT NULL,
    license_plate VARCHAR(9),
    tank_volume INT NOT NULL,
    maximum_storage_volume INT NOT NULL,
    current_position VARCHAR(500)
);
GO
CREATE TABLE driver_transit_vehicle (
    id_driver INT PRIMARY KEY IDENTITY(1,1),
    image_driver_license VARCHAR(500) NOT NULL,
    image_vehicle_registration VARCHAR(500) NOT NULL,
    image_Curriculum_Vitae VARCHAR(500) NOT NULL,
    image_Civil_Guarantee_Letter VARCHAR(500) NOT NULL,
    image_Certificate_of_No_Criminal_Record VARCHAR(500) NOT NULL,
    image_Birth_Certificate VARCHAR(500) NOT NULL,
    image_Household_Registration VARCHAR(500) NOT NULL,
    image_Health_Examination_Certificate VARCHAR(500) NOT NULL,
    id_account INT UNIQUE NOT NULL,
    id_transit_vehicle INT,
    FOREIGN KEY (id_account) REFERENCES account(id_account),
    FOREIGN KEY (id_transit_vehicle) REFERENCES transit_vehicle(id_transit_vehicle)
);
GO
CREATE TABLE image_order (
    id_image_order INT PRIMARY KEY IDENTITY(1,1),
    shooting_date DATETIME DEFAULT GETDATE(),
    image_1 VARCHAR(500) NOT NULL,
    image_2 VARCHAR(500) NOT NULL,
    image_3 VARCHAR(500) NOT NULL,
    image_4 VARCHAR(500) NOT NULL
);
GO
CREATE TABLE current_location (
    id_current_location INT PRIMARY KEY IDENTITY(1,1),
    current_location_date DATETIME DEFAULT GETDATE(),
    id_order INT,
    id_transit_vehicle INT,
    id_image_order INT UNIQUE NOT NULL,
    FOREIGN KEY (id_order) REFERENCES Order_Shipping(id_order),
    FOREIGN KEY (id_transit_vehicle) REFERENCES transit_vehicle(id_transit_vehicle),
    FOREIGN KEY (id_image_order) REFERENCES image_order(id_image_order)
);