DROP TABLE hol_dept CASCADE CONSTRAINT;
DROP SEQUENCE   hol_dept_seq;
DROP TABLE hol_emp CASCADE CONSTRAINT;
DROP SEQUENCE hol_emp_seq;
-------------------------------------------

--create table dept, set deptid as primary key, set deptno as unique
CREATE TABLE hol_dept (
    deptid  NUMBER NOT NULL,
    deptno  NUMBER(2) NOT NULL,
    dname   VARCHAR2(50),
    loc     VARCHAR2(50),
    CONSTRAINT deptid_pk PRIMARY KEY (deptid),
    CONSTRAINT deptno_uc UNIQUE (deptno)
);
--end create table dept

CREATE SEQUENCE hol_dept_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER  hol_dept_biu  
  BEFORE INSERT ON hol_dept            
  for each ROW
BEGIN
    IF :NEW.deptid IS NULL THEN 
        :NEW.deptid := hol_dept_seq.NEXTVAL;
    END IF;
END 
hol_dept_biu;
/

CREATE TABLE hol_emp (
    empid     NUMBER ,
    empno     NUMBER NOT NULL,
    ename     VARCHAR2(50),
    job       VARCHAR2(50),
    mgr       NUMBER(4),
    hiredate  DATE,
    sal       NUMBER(9),
    comm      NUMBER(9),
    deptno    NUMBER,
    CONSTRAINT emp1_pk PRIMARY KEY (empid),
    CONSTRAINT empno1_uc UNIQUE (empno),
    CONSTRAINT emp_dept1_fk FOREIGN KEY (deptid) REFERENCES hol_dept (deptid),
    CONSTRAINT emp_mgr1_fk FOREIGN KEY (mgr) REFERENCES hol_emp (empno)
);

CREATE SEQUENCE hol_emp_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER hol_emp_biu  
  BEFORE INSERT ON hol_emp            
  for each ROW
BEGIN
    IF :NEW.empid IS NULL THEN 
        :NEW.empid := hol_emp_seq.NEXTVAL;
    END IF;
END 
hol_emp_biu;
/