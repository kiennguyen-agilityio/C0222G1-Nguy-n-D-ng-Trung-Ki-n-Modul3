	create database if not exists c0222g1;
    use c0222g1;
    CREATE TABLE if not exists class (
    id INT,
    `name` VARCHAR(50)
);
 insert into class values (1 , 'kien');
    CREATE TABLE if not exists teacher (
    id INT,
    `name` VARCHAR(50),
    age INT,
    `country` VARCHAR(50)
);
insert into teacher values (1 , 'kien',18,'viet nam');
select * from class ; 
select * from teacher ; 

    