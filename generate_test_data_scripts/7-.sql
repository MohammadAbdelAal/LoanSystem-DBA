set serveroutput on size 1000000
declare
t_seed NUMBER(20);

cursor c_lr is select Loan_request_id from loansystem.loan_request; 

begin
 -- Initialize Random Number Generator
  SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'MMDDHH24MISS'))
    INTO t_seed
  FROM Dual;
 DBMS_RANDOM.INITIALIZE(t_seed);
 
for r_lr in c_lr loop
insert into loansystem.loan_request_lender (lender_id,Loan_request_id) values 
(
(SELECT lender_id FROM (SELECT lender_ID FROM loansystem.LENDER ORDER BY DBMS_RANDOM.VALUE) WHERE rownum = 1),r_lr.Loan_Request_id);
insert into loansystem.loan_request_lender (lender_id,Loan_request_id) values 
(
(SELECT lender_id FROM (SELECT lender_ID FROM loansystem.LENDER ORDER BY DBMS_RANDOM.VALUE) WHERE rownum = 1),r_lr.Loan_request_id);
insert into loansystem.loan_request_lender (lender_id,Loan_request_id) values 
(
(SELECT lender_id FROM (SELECT lender_ID FROM loansystem.LENDER ORDER BY DBMS_RANDOM.VALUE) WHERE rownum = 1),r_lr.Loan_request_id);
end loop;

  DBMS_RANDOM.TERMINATE;
end;

declare 
v_count number;

v_lender_amount number;

cursor c_loan_request is select * from loansystem.LOAN_REQUEST;
begin 

for r_loan_request in c_loan_request loop
select count(lrl.lender_id) into v_count from loansystem.loan_request_lender lrl where lrl.LOAN_REQUEST_id=r_loan_request.LOAN_REQUEST_id;
dbms_output.put_line(v_count);
v_lender_amount:=r_loan_request.loan_request_amount/v_count;
dbms_output.put_line(v_lender_amount);
update loansystem.loan_request_lender
set lender_amount=v_lender_amount where loan_request_id=r_loan_request.loan_request_id;
end loop;
end;
