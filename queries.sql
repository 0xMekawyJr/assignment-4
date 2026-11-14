
USE company;

SELECT DISTINCT orderNumber
FROM   orderdetails
WHERE  productCode LIKE 'S18%'
  AND  priceEach > 100;

-----------------------------------------------------------------------
USE company;
SELECT *
FROM   payments
WHERE  DAY(paymentDate) IN (5, 6);


-----------------------------------------------------------------------
USE company;
SELECT DISTINCT creditLimit
FROM   customers
WHERE  country = 'USA'
  AND  phone LIKE '%5555%'
ORDER  BY creditLimit DESC
LIMIT  1 OFFSET 4;


-----------------------------------------------------------------------
USE company;
SELECT e.firstName,
       e.lastName,
       o.officeCode AS officeNumber,
       o.city       AS officeCity
FROM   employees e
INNER  JOIN offices o ON o.officeCode = e.officeCode;


-----------------------------------------------------------------------
USE company;
SELECT e.firstName,
       e.lastName,
       o.officeCode AS officeNumber,
       o.city       AS officeCity
FROM   employees e
INNER  JOIN offices o ON o.officeCode = e.officeCode
WHERE  o.officeCode IN ('4', '6');
