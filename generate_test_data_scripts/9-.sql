
--select * from test5.loan_request,test5.loan_request_lender where loan_requestdate=lrdate;

--insert into test5.lender_borrower (borrowerid,lenderid) values ((select lr.borrowerid from test5.loan_request lr, TEST5.LOAN_REQUEST_LENDER lrl where
--lrl.loan_requestdate=lr.lrdate),(select lrl.lenderid from test5.loan_request lr, TEST5.LOAN_REQUEST_LENDER lrl where
--lrl.loan_requestdate=lr.lrdate));

declare
--cursor c_b is select id from test5.borrower;
cursor c_2 is select lr.borrower_id,lrl.lender_id,lrl.loan_request_id,l.loan_date from loansystem.loan_request lr,loansystem.loan_request_lender lrl, loansystem.loan l where lrl.loan_request_id=lr.loan_request_id and lrl.loan_request_id=l.LOAN_REQUEST_ID;

begin
for r_2 in c_2 loop
insert into loansystem.lender_borrower (borrower_id,lender_id,loan_date) values (r_2.borrower_id,r_2.lender_id,r_2.loan_date);
end loop;

end;


--declare 
--cursor c_ll is select * from loansystem.loan_request lr , loansystem.loan l where lr.LOAN_REQUEST_ID=l.LOAN_REQUEST_ID;
--begin
--for r_ll in c_11 loop
--
--
--end loop;
--end;




--update test5.lender_borrower
--set loandate=
--insert into test5.lender_borrower (LoanDate) values (v_loan_date);

