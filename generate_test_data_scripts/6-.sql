  
  declare
  
   
  v_LRDATE Date;
 -- v_BORROWERID number;
  v_payday date;
  
  v_loan_date date;
  v_deadline date;
  l_mins_in_day  number := 24*60;
  
  v_AGREEDDATE date;
v_repaydate date;
  
  cursor c_b_id is select borrower_id from loansystem.borrower;
  begin
 



for r_b_id in c_b_id loop
v_LRDATE := TO_DATE(TRUNC(DBMS_RANDOM.VALUE(2457023, 2460260)), 'J')+ (trunc(dbms_random.value(0,1000))/l_mins_in_day);
--dbms_output.put_line(v_DATE);

    v_loan_date:=v_LRDATE+dbms_random.value(1,10);
    --select to_date(trunc(dbms_random.value(to_char(v_loan_date,'J'),to_char(v_loan_date+10,'J'))),'J') into v_payday from dual;
    --dbms_output.put_line(v_loan_date);
    v_payday:=to_date(trunc(dbms_random.value(to_char(v_loan_date+1,'J'),to_char(v_loan_date+20,'J'))),'J')+ (trunc(dbms_random.value(0,1000))/l_mins_in_day);
    --dbms_output.put_line(v_payday);
    v_deadline:=to_date(trunc(dbms_random.value(TO_CHAR(v_payday+1,'J'),TO_CHAR(to_date('31-12-2025','dd-mm-yyyy'),'J'))),'J') + (trunc(dbms_random.value(0,1000))/l_mins_in_day);
    --dbms_output.put_line(dbms_random.value(to_char(v_loan_date,'DD-MON-YYYY HH24:MI:SS'),to_char(sysdate)));
   -- dbms_output.put_line(v_deadline);
   
   v_AGREEDDATE:=v_deadline-dbms_random.value(0,50);
v_repaydate := v_payday + dbms_random.value(1,v_AGREEDDATE-v_payday);


insert into loansystem.loan (Loan_Date,Loan_request_id,deadline_agreed_date, repayment_date) values (v_loan_date,LoanSystem.SEQ_Loan_request.NextVal,v_AGREEDDATE,v_repaydate);

    
    INSERT INTO loansystem.LOAN_REQUEST (
      Loan_request_id,BORROWER_ID,Loan_Request_Date,  DEADLINE, loan_request_AMOUNT, DESCRIPTION, PAYDAY
    ) VALUES (
      LoanSystem.SEQ_Loan_request.CurrVal,
      r_b_id.borrower_id,
      v_LRDATE,
      v_deadline,
      TRUNC(DBMS_RANDOM.VALUE(5000, 1000000)), DBMS_RANDOM.STRING('A', DBMS_RANDOM.VALUE(1, 100)),
      v_payday
    );
    end loop;
    
 end;