EXPLAIN ANALYZE
SELECT w.Name
FROM warehouse w
JOIN DistributionLog d ON w.warehouseid = d.warehouseid
WHERE d.warehouseid = 174;

EXPLAIN ANALYZE
SELECT w.Name
FROM warehouse w
JOIN DistributionLog d ON w.warehouseid = d.warehouseid
WHERE d.warehouseid = 175;

