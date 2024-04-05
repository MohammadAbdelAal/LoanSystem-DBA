set serveroutput on size 1000000
declare
cursor c_l is select loan_date,loan_request_id from loansystem.loan;
begin 
for r_l in c_l loop
update loansystem.intermediary
set loan_date= r_l.loan_date where intermediary_id=r_l.loan_request_id;
end loop;
end;

declare
cursor c_4 is select lr.loan_request_amount,lb.loan_date from Loansystem.loan_request lr ,Loansystem.loan l,Loansystem.lender_borrower lb,Loansystem.repayment r 
where lr.loan_request_id=l.loan_request_id and l.loan_date=lb.loan_date and l.repayment_date=r.repayment_date;

v_perc number;
v_repayment_amount number;
begin
for r_4 in c_4 loop

v_perc:=dbms_random.value(3,20);

--dbms_output.put_line(v_perc);

update loansystem.lender_borrower
set percentage=v_perc where loan_date=r_4.loan_date;

--update loansystem.repayment
--set repayment_amount= v_repayment_amount where


end loop;

end;



declare

cursor cc is select distinct lb.borrower_id,lb.PERCENTAGE, l.repayment_date,lr.LOAN_REQUEST_AMOUNT from loansystem.lender_borrower lb, loansystem.loan l, loansystem.loan_request lr where lb.loan_date=l.loan_date and lr.borrower_id=lb.borrower_id;
begin 

for r in cc loop
update loansystem.repayment
set repayment_amount=r.loan_request_amount+r.Percentage/100*r.loan_request_amount where repayment_date=r.repayment_date;

end loop;

end;
--select lr.loan_request_amount,lb.loan_date from Loansystem.loan_request lr ,Loansystem.loan l,Loansystem.lender_borrower lb,Loansystem.repayment r 
--where lr.loan_request_id=l.loan_request_id and l.loan_date=lb.loan_date and l.repayment_date=r.repayment_date;

--select distinct lb.borrower_id,lb.PERCENTAGE, l.repayment_date from loansystem.lender_borrower lb, loansystem.loan l where lb.loan_date=l.loan_date;