-- Write a SQL query to find all numbers that appear at least three times consecutively.

-- +----+-----+
-- | Id | Num |
-- +----+-----+
-- | 1  |  1  |
-- | 2  |  1  |
-- | 3  |  1  |
-- | 4  |  2  |
-- | 5  |  1  |
-- | 6  |  2  |
-- | 7  |  2  |
-- +----+-----+
-- For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+

SELECT Num as ConsecutiveNums from logs 

Select DISTINCT l1.Num as ConsecutiveNums from Logs l1, Logs l2, Logs l3 
where l1.Id=l2.Id-1 and l2.Id=l3.Id-1 
and l1.Num=l2.Num and l2.Num=l3.Num


SELECT T.Num as ConsecutiveNums
FROM
(SELECT DISTINCT A.Num FROM
Logs A
LEFT JOIN Logs B on A.Id = B.Id-1
LEFT JOIN Logs C on A.Id = C.Id-2
WHERE A.Num = B.Num AND A.Num = C.Num) T

select distinct ConsecutiveNums from (
   select l.Num as ConsecutiveNums 
   from  Logs l 
   join  Logs r 
   on l.Num = r.Num and r.Id < l.Id and l.Id -r.Id <3 
   group by l.Num,l.Id having sum(l.Id-r.Id)=(0+1+2) -- if you want at least four times, here is 6 = (0+1+2+3)
) t;