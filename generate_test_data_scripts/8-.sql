
declare
v_AGREEDDATE date;
v_repaydate date;
cursor c_l is select * from loansystem.loan;

begin

for r_l in c_l loop


insert into loansystem.deadline (agreed_date) values (r_l.deadline_agreed_date);

insert into loansystem.repayment (Repayment_date) values (r_l.repayment_date);


end loop;

end;