create database records;
use records;
create table student_details(
studentId int,
studentName varchar(20),
primary key(studentId)
);
insert into student_details (studentId, studentName)  values(1001, "Mary"),(1002, "Jane"),(1003, "Daniel"),
(1004,"Jack"),(1005,"Haroid");

create table course_details(
courseId int,
courseName varchar(20),
studentId int,
primary key(courseId)
);
insert into course_details(courseId, courseName, studentId) values(5001,"PHP",1004),(5002,"JAVA",1001),
(5003,"ASP.NET",1001),(5004,"RUBY",1002);

create table teacher_details(
teacherId int,
teacherName varchar(20),
courseId int,
primary key(teacherId)
);
insert into teacher_details(teacherId, teacherName, courseId) values(3001, "JILL", 5003),
(3002, "Greul",5002),(3003,"Jemkins", 5001),(3004, "Polo",5004);

   -- set the respective primary key and foreign keys --

alter table course_details ADD foreign key (studentId) references student_details(studentId);
alter table teacher_details ADD foreign key (courseId) references course_details(courseId);

   -- Fetch all column's details by using join. --
   
select * from student_details inner join course_details ON
student_details.studentId = course_details.studentId inner join teacher_details ON course_details.courseId =
teacher_details.courseId;

  -- Fetch the details of students who appeared in asp.net --

select student_details.studentId, student_details.studentName from student_details join course_details on
student_details.studentId = course_details.studentId join teacher_details on course_details.courseId = 
teacher_details.courseId where course_details.courseName = "ASP.NET";

  -- practice all joins which are covered in the class --
          -- Like --
  
select * from student_details where studentName Like "J%";
select * from student_details where studentName Like "%J";
select * from student_details where studentName Like "%A%";

    -- left join --
    
select * from student_details left join course_details ON student_details.studentId = course_details.courseId;

    -- right join --
    
select * from student_details right join course_details ON student_details.studentId = course_details.courseId;

    -- cross join --
    
select * from student_details cross join course_details;

    -- inner join --
    
 select * from student_details inner join course_details ON student_details.studentId =course_details.courseId;
 

