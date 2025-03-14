SELECT ContainerId, CurrentWeight, CurrentVolume
FROM Containers
WHERE (CurrentWeight / MaxWeight) > 0.8 OR (CurrentVolume / MaxVolume) > 0.8;

SELECT c.CargoId, c.Name, c.Weight, c.Volume
FROM Cargos c
JOIN DistributionLog d ON c.CargoId = d.CargoId
WHERE d.ContainerId = 347;

SELECT d.ContainerId, COUNT(d.CargoId) AS CargoCount
FROM DistributionLog d
GROUP BY d.ContainerId;

