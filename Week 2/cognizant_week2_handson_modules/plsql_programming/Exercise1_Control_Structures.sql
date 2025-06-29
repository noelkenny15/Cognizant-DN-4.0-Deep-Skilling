
-- *************************************************
-- SQL Script for Cognizant Deep Skilling: Exercise 1 - Control Structures
-- *************************************************

-- SET SERVER OUTPUT ON
SET SERVEROUTPUT ON;

-- Create Tables (If not already created)
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    DOB DATE,
    Balance NUMBER,
    LastModified DATE,
    IsVIP VARCHAR2(10)
);

CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    LoanAmount NUMBER,
    InterestRate NUMBER,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert Sample Data
INSERT INTO Customers VALUES (1, 'John Doe', TO_DATE('1960-01-01', 'YYYY-MM-DD'), 12000, SYSDATE, 'FALSE');
INSERT INTO Customers VALUES (2, 'Jane Smith', TO_DATE('1980-05-10', 'YYYY-MM-DD'), 8000, SYSDATE, 'FALSE');

INSERT INTO Loans VALUES (1, 1, 5000, 10, SYSDATE, SYSDATE + 20);

COMMIT;

-- Scenario 1: Senior Citizen Loan Discount
BEGIN
    FOR loan_rec IN (SELECT LoanID, InterestRate, CustomerID FROM Loans) LOOP
        DECLARE
            customer_age NUMBER;
        BEGIN
            SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, DOB)/12)
            INTO customer_age
            FROM Customers
            WHERE CustomerID = loan_rec.CustomerID;

            IF customer_age > 60 THEN
                UPDATE Loans
                SET InterestRate = InterestRate - 1
                WHERE LoanID = loan_rec.LoanID;
            END IF;
        END;
    END LOOP;
    COMMIT;
    END;
    /

-- Scenario 2: Promote VIP Customers
BEGIN
    FOR cust_rec IN (SELECT CustomerID, Balance FROM Customers) LOOP
        IF cust_rec.Balance > 10000 THEN
            UPDATE Customers
            SET IsVIP = 'TRUE'
            WHERE CustomerID = cust_rec.CustomerID;
        END IF;
    END LOOP;
    COMMIT;
END;
/

-- Scenario 3: Loan Due Reminder
BEGIN
    FOR loan_rec IN (
        SELECT LoanID, CustomerID, EndDate
        FROM Loans
        WHERE EndDate BETWEEN SYSDATE AND SYSDATE + 30
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Reminder: Loan ' || loan_rec.LoanID || ' for Customer ' || loan_rec.CustomerID || ' due on ' || TO_CHAR(loan_rec.EndDate, 'DD-MON-YYYY'));
    END LOOP;
END;
/



SELECT * FROM Loans; 

SELECT * FROM Customers;
SET SERVEROUTPUT ON;


