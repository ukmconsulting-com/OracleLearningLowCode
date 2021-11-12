--1
/* display date n time from sysdate
if you want to display or save the sysdate for auditing purposes in the field
you can use this syntax
*/


SELECT TO_CHAR(sysdate,'DD.MM.YYYY:HH24:MI:SS') 
FROM dual;

/*
Result:
12.11.2021:06:14:29
*/

--2
/* display next 7 hours from current sysdate
if you want to display or save the next 7 hours sysdate for auditing purposes in the field
you can use this syntax.

-for next 9 hours "sysdate+9/24"
-12 hours before "sysdate-12/24"

this systax is handy when your server timezone is different with your user timezone
*/


SELECT TO_CHAR(sysdate+7/24,'DD.MM.YYYY:HH24:MI:SS') 
FROM dual;

/*
Result:
12.11.2021:13:17:59
*/
