/************************************************************
** Table: TEST5.BORROWER
** Number of Records: 100
************************************************************/

DECLARE
 -- t_seed NUMBER(20);
 cursor c_add is select addressee_id from LoanSystem.addressee where addressee_id <101;
BEGIN
--  -- Initialize Random Number Generator
--  SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'MMDDHH24MISS'))
--    INTO t_seed
--  FROM Dual;
--
--  DBMS_RANDOM.INITIALIZE(t_seed);

  -- Generate Random Data
  FOR r_add IN c_add LOOP
    INSERT INTO LoanSystem.BORROWER (
      borrower_ID, ADDRESSEE_ID
    ) VALUES (
      LoanSystem.SEQ_BORROWER.NextVal, r_add.addressee_id
    );
  END LOOP;

 -- DBMS_RANDOM.TERMINATE;
END;
/



