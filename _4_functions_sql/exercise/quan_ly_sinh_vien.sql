CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;
CREATE TABLE Class
(
 id_class  INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
  start_date DATETIME    NOT NULL,
    Status    BIT
);
CREATE TABLE Student
(
    id_student   INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
   id_class   INT NOT NULL,
    FOREIGN KEY (id_class) REFERENCES Class (id_class)
);
CREATE TABLE Subject
(
    id_sub  INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
   sub_name VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);

CREATE TABLE Mark
(
 id_mark    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_sub    INT NOT NULL,
  id_student INT NOT NULL,
  mark    FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
   exam_times TINYINT DEFAULT 1,
    UNIQUE (id_sub, id_student),
    FOREIGN KEY (id_sub) REFERENCES Subject (id_sub),
    FOREIGN KEY (id_student) REFERENCES Student (id_student)
);