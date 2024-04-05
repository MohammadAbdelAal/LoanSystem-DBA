/************************************************************
** Table: TEST5.BORROWER
** Number of Records: 100
************************************************************/

DECLARE
 -- t_seed NUMBER(20);
 cursor c_add is select addressee_id from LoanSystem.addressee where addressee_id >200 and addressee_id <301;
BEGIN
--  -- Initialize Random Number Generator
--  SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'MMDDHH24MISS'))
--    INTO t_seed
--  FROM Dual;
--
--  DBMS_RANDOM.INITIALIZE(t_seed);

  -- Generate Random Data
  FOR r_add IN c_add LOOP
    INSERT INTO LoanSystem.intermediary (
      intermediary_ID, ADDRESSEE_ID
    ) VALUES (
      LoanSystem.SEQ_intermediary.NextVal, r_add.addressee_id
    );
  END LOOP;

 -- DBMS_RANDOM.TERMINATE;
END;
/



