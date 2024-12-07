-- 1
CREATE VIEW samsBills
AS 
(SELECT 
    rs.first_name, 
    rs.surname, 
    b.bill_date, 
    b.cust_name, 
    b.bill_total
 FROM 
    restStaff rs
 INNER JOIN 
    restBill b 
 ON 
    rs.staff_id = b.staff_id
 WHERE 
    rs.first_name = 'Sam' AND rs.surname = 'Pitt');

-- 2
SELECT * 
FROM samsBills
WHERE bill_total > 400;

-- 3
CREATE VIEW roomTotals
AS 
(SELECT 
    r.room_name, 
    SUM(b.bill_total) AS total_sum
 FROM 
    restRoom_management r
 INNER JOIN 
    restRest_table t 
 ON 
    r.room_id = t.room_id
 INNER JOIN 
    restBill b 
 ON 
    t.table_no = b.table_no
 GROUP BY 
    r.room_name);

-- 4
CREATE VIEW teamTotals
AS 
(SELECT 
    CONCAT(hw.first_name, ' ', hw.surname) AS headwaiter_name, 
    SUM(b.bill_total) AS total_sum
 FROM 
    restStaff hw
 INNER JOIN 
    restRoom_management r 
 ON 
    hw.staff_id = r.staff_id
 INNER JOIN 
    restRest_table t 
 ON 
    r.room_id = t.room_id
 INNER JOIN 
    restBill b 
 ON 
    t.table_no = b.table_no
 GROUP BY 
    hw.first_name, hw.surname);

-- 5
SELECT * FROM roomTotals;

-- 6
SELECT * FROM teamTotals;
