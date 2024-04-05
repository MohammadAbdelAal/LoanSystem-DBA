CREATE SEQUENCE LoanSystem.seq_Addressee;
CREATE SEQUENCE LoanSystem.seq_Borrower;
CREATE SEQUENCE LoanSystem.seq_Lender;
CREATE SEQUENCE LoanSystem.seq_Intermediary;
CREATE SEQUENCE LoanSystem.seq_Loan_Request;
CREATE TABLE LoanSystem.Addressee (
  Addressee_ID      number(10), 
  Name    varchar2(255), 
  Address varchar2(255), 
  PRIMARY KEY (Addressee_ID));
CREATE TABLE LoanSystem.Borrower (
  Borrower_ID          number(10), 
  Addressee_ID number(10) , 
  PRIMARY KEY (Borrower_ID));
CREATE TABLE LoanSystem.Lender (
  Lender_ID          number(10) , 
  Addressee_ID number(10) , 
  PRIMARY KEY (Lender_ID));
CREATE TABLE LoanSystem.Intermediary (
  Intermediary_ID          number(10) , 
  Addressee_ID number(10) , 
  Loan_Date    date , 
  PRIMARY KEY (Intermediary_ID));
CREATE TABLE LoanSystem.Loan_Request (
  Loan_Request_ID          number(10) , 
  Borrower_ID  number(10), 
  Loan_Request_Date      date , 
  Deadline    date, 
  Loan_Request_Amount      number(19), 
  Description varchar2(255), 
  Payday      date, 
  PRIMARY KEY (Loan_Request_ID));
CREATE TABLE LoanSystem.Loan (
  Loan_Date              date , 
  Loan_Request_ID    number(10) , 
  Deadline_Agreed_Date date , 
  Repayment_Date       date , 
  PRIMARY KEY (Loan_Date));
CREATE TABLE LoanSystem.Repayment (
  Repayment_Date date , 
  Repayment_Amount number(19), 
  PRIMARY KEY (Repayment_Date));
CREATE TABLE LoanSystem.Deadline (
  Agreed_Date date NOT NULL, 
  PRIMARY KEY (Agreed_Date));
CREATE TABLE LoanSystem.Lender_Borrower (
  Borrower_ID           number(10) , 
  Lender_ID             number(10) , 
  Loan_Date             date , 
  Percentage           number(10),  
  PRIMARY KEY (Borrower_ID, 
  Lender_ID));
CREATE TABLE LoanSystem.Loan_Request_Lender (
  Lender_ID         number(10), 
  Loan_Request_ID number(10) , 
  Lender_Amount           number(19), 
  PRIMARY KEY (Lender_ID, 
  Loan_Request_ID));
--ALTER TABLE LoanSystem.Borrower ADD CONSTRAINT FK_Borrower FOREIGN KEY (Addressee_ID) REFERENCES LoanSystem.Addressee (Addressee_ID);
--ALTER TABLE LoanSystem.Lender ADD CONSTRAINT FK_Lender FOREIGN KEY (Addressee_ID) REFERENCES LoanSystem.Addressee (Addressee_ID);
--ALTER TABLE LoanSystem.Intermediary ADD CONSTRAINT FK_Intermediary FOREIGN KEY (Addressee_ID) REFERENCES LoanSystem.Addressee (Addressee_ID);
--ALTER TABLE LoanSystem.Intermediary ADD CONSTRAINT FK_Intermediary_Loan_Date FOREIGN KEY (Loan_Date) REFERENCES LoanSystem.Loan (Loan_Date);
--ALTER TABLE LoanSystem.Loan_Request ADD CONSTRAINT FKLoan_Req_borrower FOREIGN KEY (Borrower_ID) REFERENCES LoanSystem.Borrower (Borrower_ID);
--ALTER TABLE LoanSystem.Lender_Borrower ADD CONSTRAINT FKLender_Borrower_lender FOREIGN KEY (Lender_ID) REFERENCES LoanSystem.Lender (Lender_ID);
--ALTER TABLE LoanSystem.Lender_Borrower ADD CONSTRAINT FKLender_Borrower_borrower FOREIGN KEY (Borrower_ID) REFERENCES LoanSystem.Borrower (Borrower_ID);
--ALTER TABLE LoanSystem.Lender_Borrower ADD CONSTRAINT FKLender_Borrower_loandate FOREIGN KEY (Loan_Date) REFERENCES LoanSystem.Loan (Loan_Date);
--ALTER TABLE LoanSystem.Loan ADD CONSTRAINT FKLoan_Deadline FOREIGN KEY (Deadline_Agreed_Date) REFERENCES LoanSystem.Deadline (Agreed_Date);
--ALTER TABLE LoanSystem.Loan ADD CONSTRAINT FKLoan_Repayment_date FOREIGN KEY (Repayment_Date) REFERENCES LoanSystem.Repayment (Repayment_Date);
--ALTER TABLE LoanSystem.Loan ADD CONSTRAINT FKLoan_loan_Request_ID FOREIGN KEY (Loan_Request_ID) REFERENCES LoanSystem.Loan_Request (Loan_Request_ID);
--ALTER TABLE LoanSystem.Loan_Request_Lender ADD CONSTRAINT FKLoan_Request_Lender_l_ID FOREIGN KEY (Lender_ID) REFERENCES LoanSystem.Lender (Lender_ID);
--ALTER TABLE LoanSystem.Loan_Request_Lender ADD CONSTRAINT FKLoan_Req_Lender_l_Request FOREIGN KEY (Loan_Request_ID) REFERENCES LoanSystem.Loan_Request (Loan_Request_ID);
--
