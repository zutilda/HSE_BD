CREATE INDEX idx_distributionlog_cargo_id ON DistributionLog(CargoId);
CREATE INDEX idx_distributionlog_container_id ON DistributionLog(ContainerId);
CREATE INDEX idx_distributionlog_warehouse_id ON DistributionLog(WarehouseId);
create index idx_distributionlog_warehouse_name on warehouse(name) 
