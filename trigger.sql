CREATE OR REPLACE FUNCTION update_container_capacity() RETURNS TRIGGER AS $$
BEGIN
    UPDATE Containers
    SET CurrentWeight = CurrentWeight + (SELECT Weight FROM Cargos WHERE CargoId = NEW.CargoId),
        CurrentVolume = CurrentVolume + (SELECT Volume FROM Cargos WHERE CargoId = NEW.CargoId)
    WHERE ContainerId = NEW.ContainerId;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_container_capacity
AFTER INSERT ON DistributionLog
FOR EACH ROW EXECUTE FUNCTION update_container_capacity();