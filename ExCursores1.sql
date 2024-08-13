CREATE TABLE top_dogs
(name VARCHAR(25),
salary NUMBER(11,2))

SET VERIFY OFF
ACCEPT p_num prompt 'Informe o numero de maior salario'
DECLARE

 cursor cur_Dept is
       select last_name,salary
       from employees
       where rownum <= &p_num
       order by salary desc;
reg_top_sal cur_Dept%rowtype;

BEGIN
 open   cur_Dept;
  fetch cur_Dept into reg_top_sal;
  while cur_Dept%found loop
     dbms_output.put_line (reg_top_sal.last_name|| ' ' || reg_top_sal.salary);
     INSERT INTO top_dogs VALUES (reg_top_sal.last_name,reg_top_sal.salary);
     fetch cur_Dept into reg_top_sal;
     end loop;
     commit;
  close cur_Dept;
end;

