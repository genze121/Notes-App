create database e_notes_app;
use e_notes_app;

create table user_
(id int primary key not null auto_increment,
firstname varchar(30),
lastname varchar(30),
username varchar(20),
password varchar(10));

drop table user_;
select * from user_;

create table notes
(id int primary key not null auto_increment,
title varchar(300),
content varchar(5000),
date datetime default now(),
userid int);

select * from notes;
