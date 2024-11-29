-- 1
SELECT w.firstName, w.lastName
FROM restStaff w
JOIN restBill b ON w.staffID = b.waiterID
WHERE b.customerName = 'Tanya Singh';

-- 2
SELECT rm.date
FROM restRoom_management rm
JOIN restStaff h ON rm.headwaiterID = h.staffID
WHERE h.firstName = 'Charles' AND rm.roomName = 'Green' AND rm.date LIKE '1602%';

-- 3
SELECT DISTINCT w.firstName, w.lastName
FROM restStaff w
JOIN restStaff z ON w.headwaiterID = z.headwaiterID
WHERE z.firstName = 'Zoe' AND z.lastName = 'Ball';

-- 4
SELECT b.customerName, b.amount, w.firstName, w.lastName
FROM restBill b
JOIN restStaff w ON b.waiterID = w.staffID
ORDER BY b.amount DESC;

-- 5
SELECT DISTINCT w.firstName, w.lastName
FROM restStaff w
JOIN restRest_table t ON w.staffID = t.waiterID
WHERE t.teamID IN (
    SELECT DISTINCT t1.teamID
    FROM restRest_table t1
    JOIN restBill b ON t1.tableID = b.tableID
    WHERE b.billID IN ('00014', '00017')
);

-- 6
SELECT DISTINCT s.firstName, s.lastName
FROM restStaff s
JOIN restRoom_management rm ON s.staffID = rm.headwaiterID OR s.headwaiterID = rm.headwaiterID
JOIN restRest_table t ON rm.roomName = t.roomName
WHERE rm.roomName = 'Blue' AND rm.date = '160312';
