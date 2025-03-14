CREATE TABLE Containers (
    ContainerId SERIAL PRIMARY KEY,  
    MaxWeight DECIMAL(10, 2) NOT NULL CHECK (MaxWeight > 0),  
    MaxVolume DECIMAL(10, 2) NOT NULL CHECK (MaxVolume > 0),  
    CurrentWeight DECIMAL(10, 2) DEFAULT 0 CHECK (CurrentWeight >= 0),  
    CurrentVolume DECIMAL(10, 2) DEFAULT 0 CHECK (CurrentVolume >= 0), 
    CONSTRAINT chk_weight_volume CHECK (CurrentWeight <= MaxWeight AND CurrentVolume <= MaxVolume)  
);


CREATE TABLE Cargos (
    CargoId SERIAL PRIMARY KEY, 
    Name VARCHAR(255) NOT NULL,  
    Weight DECIMAL(10, 2) NOT NULL CHECK (Weight > 0),  
    Volume DECIMAL(10, 2) NOT NULL CHECK (Volume > 0)
);

CREATE TABLE Warehouse (
    WarehouseId SERIAL PRIMARY KEY,  
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL 
);

CREATE TABLE DistributionLog (
    LogId SERIAL PRIMARY KEY,  
    CargoId INT NOT NULL, 
    ContainerId INT NOT NULL,  
    WarehouseId INT NOT NULL,
    CONSTRAINT fk_distributionlog_cargos FOREIGN KEY (CargoId) REFERENCES Cargos(CargoId) ON DELETE CASCADE, 
    CONSTRAINT fk_distributionlog_containers FOREIGN KEY (ContainerId) REFERENCES Containers(ContainerId) ON DELETE CASCADE,
    CONSTRAINT fk_distributionlog_warehouse FOREIGN KEY (WarehouseId) REFERENCES Warehouse(WarehouseId) ON DELETE SET NULL
);


