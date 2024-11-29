-- 1
SELECT DISTINCT b.customerName
FROM restBill b
JOIN restStaff w ON b.waiterID = w.staffID
WHERE b.amount > 450.00 AND w.headwaiterID = (
    SELECT s.staffID
    FROM restStaff s
    WHERE s.firstName = 'Charles'
);

-- 2
SELECT h.firstName, h.lastName
FROM restStaff h
WHERE h.staffID = (
    SELECT w.headwaiterID
    FROM restStaff w
    WHERE w.staffID = (
        SELECT b.waiterID
        FROM restBill b
        WHERE b.customerName = 'Nerida' AND b.date = '160111'
    )
);

-- 3
SELECT DISTINCT b.customerName
FROM restBill b
WHERE b.amount = (
    SELECT MIN(amount)
    FROM restBill
);

-- 4
SELECT DISTINCT w.firstName, w.lastName
FROM restStaff w
WHERE w.staffID NOT IN (
    SELECT b.waiterID
    FROM restBill b
);

-- 5
SELECT b.customerName, h.firstName AS headwaiterFirstName, h.lastName AS headwaiterLastName, rm.roomName
FROM restBill b
JOIN restRest_table t ON b.tableID = t.tableID
JOIN restRoom_management rm ON t.roomName = rm.roomName
JOIN restStaff h ON rm.headwaiterID = h.staffID
WHERE b.amount = (
    SELECT MAX(amount)
    FROM restBill
);
