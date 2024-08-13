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

 
 SET SERVEROUT ON
SET VERIFY OFF
 
accept p_num prompt 'Informe o número de maiores salários'
declare
    cursor top_sal is
        select last_name,salary
        from employees
        where rownum <= &p_num
        order by salary desc;
    reg_top_sal top_sal%rowtype;
begin
    open top_sal;
    fetch top_sal into reg_top_sal;
    loop
       exit when top_sal%notfound;
       dbms_output.put_line(top_sal%rowcount||'-'||reg_top_sal.last_name||' '|| 
                                                   reg_top_sal.salary);

       insert into TOP_DOGS
       values(reg_top_sal.last_name,reg_top_sal.salary);
       fetch top_sal into reg_top_sal;
    end loop;
    commit;
    close top_sal;
end;
/
 
 
 SET SERVEROUT ON
SET VERIFY OFF
 
accept p_num prompt 'Informe o número de maiores salários'
declare
    v_num int := &p_num;
    v_cur_sal  employees.salary%type;
    cursor top_sal is
        select last_name,salary
        from employees
      --  where rownum <= &p_num
        order by salary desc;
    reg_top_sal top_sal%rowtype;
 
begin
    open top_sal;
    fetch top_sal into reg_top_sal;
    while top_sal%found and top_sal%rowcount <= v_num loop
       dbms_output.put_line(top_sal%rowcount||'-'||reg_top_sal.last_name||' '|| 
                                                   reg_top_sal.salary);
       insert into TOP_DOGS
       values(reg_top_sal.last_name,reg_top_sal.salary);
       v_cur_sal := reg_top_sal.salary;
       fetch top_sal into reg_top_sal;
       if reg_top_sal.salary = v_cur_sal then
           v_num := v_num+1;
        end if;
    end loop;
    commit;
    close top_sal;
end;
/

