
-- *************************************************
-- SQL Script for Cognizant Deep Skilling: Exercise 3 - Stored Procedures
-- *************************************************

-- SET SERVER OUTPUT ON
SET SERVEROUTPUT ON;

-- Create Tables 
CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    AccountType VARCHAR2(20),
    Balance NUMBER,
    LastModified DATE
);

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Position VARCHAR2(50),
    Salary NUMBER,
    Department VARCHAR2(50),
    HireDate DATE
);

-- Insert Sample Data
INSERT INTO Accounts VALUES (1, 1, 'Savings', 1000, SYSDATE);
INSERT INTO Accounts VALUES (2, 2, 'Checking', 1500, SYSDATE);

INSERT INTO Employees VALUES (1, 'Alice', 'Manager', 50000, 'HR', SYSDATE);
INSERT INTO Employees VALUES (2, 'Bob', 'Developer', 60000, 'IT', SYSDATE);

COMMIT;

-- Procedure 1: Monthly Interest Process
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    FOR acc_rec IN (
        SELECT AccountID, Balance
        FROM Accounts
        WHERE AccountType = 'Savings'
    ) LOOP
        UPDATE Accounts
        SET Balance = Balance + (Balance * 0.01)
        WHERE AccountID = acc_rec.AccountID;
    END LOOP;
    COMMIT;
END;
/

-- Procedure 2: Update Employee Bonus
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    dept_name IN VARCHAR2,
    bonus_percent IN NUMBER
) IS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * bonus_percent / 100)
    WHERE Department = dept_name;
    COMMIT;
END;
/

-- Procedure 3: Transfer Funds Between Accounts
CREATE OR REPLACE PROCEDURE TransferFunds(
    from_account IN NUMBER,
    to_account IN NUMBER,
    amount IN NUMBER
) IS
    source_balance NUMBER;
BEGIN
    SELECT Balance INTO source_balance FROM Accounts WHERE AccountID = from_account;

    IF source_balance >= amount THEN
        UPDATE Accounts
        SET Balance = Balance - amount
        WHERE AccountID = from_account;

        UPDATE Accounts
        SET Balance = Balance + amount
        WHERE AccountID = to_account;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Transfer successful');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient balance');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Account not found');
END;
/

EXEC ProcessMonthlyInterest;
SELECT * FROM Accounts;



EXEC UpdateEmployeeBonus('HR', 10);
SELECT * FROM Employees;



SET SERVEROUTPUT ON;
EXEC TransferFunds(1, 2, 500);
SELECT * FROM Accounts;
