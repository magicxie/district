
SELECT 
    d.name, t.*,CONCAT('{name:"',d.name,'",areaCodes:[',t.a,']}') dat
FROM
    district d,
    (SELECT 
        parentid, GROUP_CONCAT(distinct area_Code) a
    FROM
        mirror.district
    WHERE
        parentid > 0 and area_code <> ''
    GROUP BY parentid) t
WHERE
    t.parentid = d.id and d.parentid = 0;
