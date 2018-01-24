ALTER TABLE EMPLOYEE
ADD CONSTRAINT DF_DESIG DEFAULT 'TRAINEE' FOR DESIGNATION;

ALTER TABLE EMPLOYEE
ADD CONSTRAINT DF_AGE DEFAULT 18 FOR AGE;

INSERT INTO EMPLOYEE (EMP_ID, FIRST_NAME, LAST_NAME, SEX, SALARY)
VALUES (13,'AAKASHA','JHA','F', 52000);

UPDATE EMPLOYEE
SET DESIGNATION='PROMOTED'
WHERE AGE>35 AND SALARY>40000;

SELECT *
FROM EMPLOYEE 
WHERE SALARY 
NOT IN(
SELECT MAX(SALARY) 
FROM EMPLOYEE); 

SELECT E.FIRST_NAME, E.SALARY, D.DEPA

SELECT FIRST_NAME 
FROM EMPLOYEE
WHERE FIRST_NAME LIKE '%AKASH%';

SELECT FIRST_NAME,
       SALARY
FROM EMPLOYEE
WHERE SALARY IN(25000,50000);

SELECT FIRST_NAME,
       SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 35000 AND 50000;

SELECT SALARY AS SAL
FROM EMPLOYEE
WHERE SALARY IN(25000,50000);

SELECT E.FIRST_NAME, 
       E.SALARY, 
       D.D_NAME 
FROM EMPLOYEE AS E INNER JOIN DEPARTMENT AS D 
ON E.D_ID=D.D_ID;

SELECT E.FIRST_NAME, 
       E.SALARY, 
       D.D_NAME 
FROM EMPLOYEE AS E LEFT JOIN DEPARTMENT AS D 
ON E.D_ID=D.D_ID;

SELECT E.EMP_ID,
       E.FIRST_NAME, 
       E.SALARY, 
       D.D_NAME 
FROM EMPLOYEE AS E RIGHT JOIN DEPARTMENT AS D 
ON E.D_ID=D.D_ID;

SELECT E.EMP_ID,
       E.FIRST_NAME, 
       E.SALARY, 
       D.D_NAME 
FROM EMPLOYEE AS E FULL JOIN DEPARTMENT AS D 
ON E.D_ID=D.D_ID;

SELECT FIRST_NAME FROM ABC
UNION
SELECT FIRST_NAME FROM PQR
UNION
SELECT FIRST_NAME FROM EMPLOYEE
ORDER BY FIRST_NAME;

SELECT COUNT(*) AS COUNT,
       D.D_NAME
FROM EMPLOYEE AS E 
INNER JOIN 
DEPARTMENT AS D
ON E.D_ID=D.D_ID
GROUP BY D.D_NAME;

SELECT COUNT(*) AS COUNT,
       D.D_NAME
FROM EMPLOYEE AS E 
INNER JOIN 
DEPARTMENT AS D
ON E.D_ID=D.D_ID
GROUP BY D.D_NAME
HAVING COUNT(*)>3;

SELECT * INTO DEPARTMENT_BACKUP 
FROM DEPARTMENT;

SELECT * INTO EMPLOYEE_BACKUP 
FROM EMPLOYEE;

INSERT INTO ABC(FIRST_NAME,LAST_NAME)
SELECT FIRST_NAME,LAST_NAME FROM PQR;

CREATE TABLE Persons (
    ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int CHECK (Age>=18),
	City varchar(255) DEFAULT 'NOIDA',
	PersonWorkID int FOREIGN KEY REFERENCES DEPARTMENT(D_ID),
    PRIMARY KEY (ID)
);

DROP TABLE DEPARTMENT_BACKUP;

ALTER TABLE EMPLOYEE
ALTER COLUMN DESIGNATION INT;


SELECT TOP 5 SALARY
FROM EMPLOYEE
ORDER BY SALARY DESC;

SELECT TOP 5 SALARY
FROM EMPLOYEE
WHERE SALARY 
NOT IN (
SELECT TOP 5 SALARY
FROM EMPLOYEE
)
ORDER BY SALARY DESC ;

SELECT (12.75*SALARY/100) AS RESULT 
FROM EMPLOYEE;

WITH E(NAME,AGE,DEPARTMENT)
AS
(
SELECT E.FIRST_NAME,
       E.AGE,
	   D.D_NAME
FROM EMPLOYEE E 
INNER JOIN
     DEPARTMENT D 
ON E.D_ID=D.D_ID 
)
SELECT * FROM E
WHERE E.AGE>25
ORDER BY E.AGE;


--select username,product_name,orderd_quantity,amount_paid,last_date,
--orderd_quantity * 
--case
--when product_ID='p1' or product_ID='p2' or product_ID='p3'
--then a.cost_per_item 
--   else 1 end - amount_paid as balance 
--from (
--select username,product_name,cost_per_item,t_product_master.product_ID,max(t_transaction.transaction_date) as last_date,
--sum(case 
--         when transaction_type='order' 
-- then transaction_amount 
-- else 0 end) as orderd_quantity,
--sum(case 
--         when transaction_type='payment' 
-- then transaction_amount 
-- else 0 end) as amount_paid
--from t_user_master
--left join t_transaction 
--on t_user_master.userID=t_transaction.userID
--left join t_product_master 
--on t_product_master.product_ID=t_transaction.product_ID
--group by  username,t_product_master.product_ID,cost_per_item,product_name
--);

SELECT * INTO Dept2017 IN TEST FROM DEPARTMENT;
