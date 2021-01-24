-- array for return
create or replace type varray_number_type is varray(100) of number;
/
-- as usual
CREATE OR REPLACE FUNCTION BIL_ADMIN.fibo (n number) 
  RETURN varray_number_type 
IS
  i INTEGER;
  tmp_var_varray varray_number_type := varray_number_type(1);
BEGIN

   IF n = 1 THEN
      RETURN tmp_var_varray;
   END IF;
   
   tmp_var_varray.extend(1,1);
--   tmp_var_varray(tmp_var_varray.last) :=1;
   FOR i in 3 .. n 
   LOOP
      tmp_var_varray.extend();
      tmp_var_varray(tmp_var_varray.last) := tmp_var_varray(i-1) + tmp_var_varray(i-2);
   END LOOP;
   
   RETURN tmp_var_varray;

END fibo;
/
-- get results
select * from table( fibo(10))
/


-- pipeline function 
CREATE OR REPLACE FUNCTION fibo_pipe (n number) 
  RETURN varray_number_type 
  PIPELINED 
IS
  i               INTEGER;
  tmp_current     INTEGER;
  tmp_prev        INTEGER := 1;
  tmp_before_prev INTEGER := 1;  
 
BEGIN

   PIPE ROW(1);
   IF n = 1  THEN   
      RETURN ;
   END IF;

   PIPE ROW(1);
   IF n = 2 THEN
      RETURN ;
   END IF;
   
   FOR i in 3 .. n 
   LOOP
      tmp_current :=  tmp_prev +   tmp_before_prev;  
      pipe row(tmp_current);
      tmp_before_prev := tmp_prev;
      tmp_prev := tmp_current;
   END LOOP;
   
   RETURN ;

END fibo_pipe;
/

-- get results
select * from table( fibo_pipe(10))
/