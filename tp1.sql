
 Create table STUDENT(
    Student_number  INT ,
    Name VARCHAR(30) NOT NULL                          ,
    Class  INT                        ,
    Major VARCHAR(30),
    CONSTRAINT PK_STUDENT
     PRIMARY KEY (Student_number)
    );
Create table COURSE(
    Course_number varchar(20) ,
  Course_name VARCHAR(40) NOT NULL                          ,
    Credit_hours INT ,
                    
   Department VARCHAR(30),
    CONSTRAINT CHK_CREDIT_HOURS 
    CHECK (Credit_hours > 0),
   CONSTRAINT PK_COURSE
     PRIMARY KEY (Course_number)
    );
    Create table PREREQUISITE(
    Course_number varchar(20)  ,
  Prerequisite_number VARCHAR(20),
   CONSTRAINT PK_PREREQUISITE
       PRIMARY key (Prerequisite_number,Course_number) ,   
    CONSTRAINT FK_CPRE_COURSE
  foreign key ( Course_number )  references COURSE( Course_number )   ,
  CONSTRAINT FK_PRE_PREREQUISITE
FOREIGN KEY (Prerequisite_number)
REFERENCES COURSE(Course_number)                  
    ON delete CASCADE
    );
    Create table SECTION(
   Section_identifier int ,
  Course_number VARCHAR(20)                          ,
   Semester varchar(10) ,                   
  Year  int ,
  Instructor varchar(25),
  CONSTRAINT PK_SECTION
     PRIMARY KEY (Section_identifier),
     CONSTRAINT FK_SEC_COURSE
  foreign key (Course_number) references COURSE( Course_number )   
    );
     Create table GRADE_REPORT(
    Student_number int ,
    Section_identifier int   ,   
     Grade char(1),
    CONSTRAINT PK_GRADE_REPORT
    PRIMARY KEY (Student_number, Section_identifier) ,                         
      
      CONSTRAINT CHK_GRADE
    CHECK (Grade IN ('A', 'B', 'C', 'D', 'F', 'I')),
     
    CONSTRAINT FK_STUDENT
       foreign key (Student_number) references STUDENT( Student_number),
  CONSTRAINT FK_SECTION
       foreign key (Section_identifier) references SECTION( Section_identifier)     

    );
    INSERT INTO STUDENT (Student_number,Name, Class ,Major)
    VALUES (17, 'Belkacemi' ,1 ,'SE');
    INSERT INTO STUDENT (Student_number,Name, Class ,Major)
    VALUES (8 ,'Meziane', 2 ,'AI');
 INSERT INTO COURSE (Course_number,Course_name, Credit_hours ,Department)
    VALUES ('CS1310 ','Algorithms & Data Structures 1', 4,' Computer Science');
    INSERT INTO COURSE (Course_number,Course_name, Credit_hours ,Department)
    VALUES ('CS3320',' Advanced Data Structures', 4,' Computer Science');
    INSERT INTO COURSE (Course_number,Course_name, Credit_hours ,Department)
    VALUES ('CS3380', 'Advanced Databases', 3, 'Computer Science');
    INSERT INTO COURSE (Course_number,Course_name, Credit_hours ,Department)
    VALUES ('MATH2410', 'Discrete Mathematics', 3 ,'Mathematics');
    
     INSERT INTO  PREREQUISITE (Course_number,Prerequisite_number )
    VALUES ('CS3320', 'CS1310');
     INSERT INTO  PREREQUISITE (Course_number,Prerequisite_number )
    VALUES ('CS3380 ','CS3320');
     INSERT INTO  PREREQUISITE (Course_number,Prerequisite_number )
    VALUES ('CS3380' ,'MATH2410');
    
    INSERT INTO  SECTION (Section_identifier,Course_number, Semester ,Year, Instructor )
    VALUES (85, 'CS1310' ,'Fall', 2024 ,'Dr. Mansouri');
    INSERT INTO  SECTION (Section_identifier,Course_number, Semester ,Year, Instructor )
    VALUES (92 ,'CS1310', 'Spring', 2025 ,'Dr. Benali');
     INSERT INTO  SECTION (Section_identifier,Course_number, Semester ,Year, Instructor )
    VALUES (102 ,'CS3320', 'Spring', 2025 ,'Dr. Belkheir');
    INSERT INTO  SECTION (Section_identifier,Course_number, Semester ,Year, Instructor )
    VALUES (112, 'MATH2410', 'Fall', 2024 ,'Pr. Cherif');
     INSERT INTO  SECTION (Section_identifier,Course_number, Semester ,Year, Instructor )
    VALUES (119, 'CS3380' ,'Fall' ,2025,'Dr. Talbi');
     
      INSERT INTO  GRADE_REPORT(Student_number ,Section_identifier, Grade )
    VALUES (17, 112,'B');
      INSERT INTO  GRADE_REPORT(Student_number ,Section_identifier, Grade )
    VALUES (17, 119, 'A');
    INSERT INTO  GRADE_REPORT(Student_number ,Section_identifier, Grade )
    VALUES (8 ,85 ,'A');
     INSERT INTO  GRADE_REPORT(Student_number ,Section_identifier, Grade )
    VALUES (8 ,102 ,'B');
    INSERT INTO  GRADE_REPORT(Student_number ,Section_identifier, Grade )
    VALUES (8, 119, 'A');
    
   
  commit;
  