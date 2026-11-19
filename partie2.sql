DELETE FROM COURSE
WHERE Course_number = 'CS3320';
 /*error ORA-02292: integrity constraint (SYSTEM.SYS_C008663) violated - child  recod founds */
 SELECT constraint_name
FROM user_constraints
WHERE table_name = 'PREREQUISITE'
AND constraint_type = 'R';
ALTER TABLE PREREQUISITE
DROP CONSTRAINT FK_PRE_PREREQUISITE;
ALTER TABLE PREREQUISITE
ADD FOREIGN KEY (Course_number)
REFERENCES COURSE(Course_number)
ON DELETE CASCADE;
UPDATE STUDENT
SET Student_number = 107
WHERE Student_number = 17;
/*A practical solution is to temporarily disable the Foreign Key constraint:, Method 1: Use a DEFERRABLE foreign key*/
