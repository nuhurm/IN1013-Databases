-- 1
SELECT w.firstName, w.lastName, b.date, COUNT(b.billID) AS billCount
FROM restStaff w
JOIN restBill b ON w.staffID = b.waiterID
GROUP BY w.staffID, b.date
HAVING COUNT(b.billID) >= 2;

-- 2
SELECT t.roomName, COUNT(*) AS largeTableCount
FROM restRest_table t
WHERE t.covers > 6
GROUP BY t.roomName;

-- 3
SELECT rm.roomName, SUM(b.amount) AS totalAmount
FROM restRoom_management rm
JOIN restRest_table t ON rm.roomName = t.roomName
JOIN restBill b ON t.tableID = b.tableID
GROUP BY rm.roomName;

-- 4
SELECT h.firstName, h.lastName, SUM(b.amount) AS totalBillAmount
FROM restStaff h
JOIN restStaff w ON h.staffID = w.headwaiterID
JOIN restBill b ON w.staffID = b.waiterID
GROUP BY h.staffID
ORDER BY totalBillAmount DESC;

-- 5
SELECT b.customerName
FROM restBill b
GROUP BY b.customerName
HAVING AVG(b.amount) > 400;

-- 6
SELECT w.firstName, w.lastName, COUNT(b.billID) AS billCount
FROM restStaff w
JOIN restBill b ON w.staffID = b.waiterID
GROUP BY w.staffID, b.date
HAVING COUNT(b.billID) >= 3;
