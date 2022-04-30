use hms;

create table patient(
id varchar(20), name_var varchar(20), addr varchar(50), dob date,
primary key (id));

create table dept(
id int, name_var varchar(20), floor int, total_workers int,
primary key(id));

create table doctors(
id varchar(20), name_var varchar(20), addr varchar(50), contact varchar(15), qualifications varchar(50),
primary key(id));

create table workers(
id varchar(20), name_var varchar(20), addr varchar(50), work_type varchar(20),
primary key(id));

create table doc_schedule(
id int, doc_id varchar(20), dept_num int, start_time time, end_time time,
primary key(id),
foreign key(doc_id) references doctors(id),
foreign key(dept_num) references dept(id));

create table worker_schedule(
id int, worker_id varchar(20), dept_num int, start_time time, end_time time,
primary key(id),
foreign key(worker_id) references workers(id),
foreign key(dept_num) references dept(id));

create table admit(
patient_id varchar(20), dept_num int, bed_num int, room_num int,
primary key(patient_id),
foreign key(patient_id) references patient(id),
foreign key(dept_num) references dept(id));

create table appointed_docs(
patient_id varchar(20), senior_doc_id varchar(20), jun_doc_id varchar(20),
primary key(patient_id),
foreign key(patient_id) references admit(patient_id),
foreign key(senior_doc_id) references doctors(id),
foreign key(jun_doc_id) references doctors(id));

create table presc_meds(
patient_id varchar(20), meds varchar(100),
primary key(patient_id),
foreign key(patient_id) references patient(id));

create table out_door_patients(
patient_id varchar(20), dept_num int, doc_id varchar(20),
primary key(patient_id),
foreign key(patient_id) references patient(id),
foreign key(doc_id) references doctors(id),
foreign key(dept_num) references dept(id));

create table date_checkup(
id int, patient_id varchar(20), date_of_checkup date,
primary key(id),
foreign key(patient_id) references out_door_patients(patient_id));

create table emergency_duty(
date_var date, doc_id varchar(20), nurse_id varchar(20),
primary key(date_var),
foreign key(doc_id) references doctors(id),
foreign key(nurse_id) references workers(id));


insert into doctors values 
('S1', 'Abhinav', 'D.no 123, Ameerpet, Vijayawada', '9347997355', 'MBBS'),
('S2', 'Anu', 'D.no 123, Ameerpet, Vijayawada', '9515822215', 'B.Pharm'),
('J1', 'Yaswanth', 'D.no 321, Kanuru, Vijayawada', '9696964545', 'D Pharm'),
('J2', 'Surya Tej', 'D.no 456, Benz circle, Vijayawada', '9898656565', 'BMBS, DCM'),
('S3', 'Yuvraj', 'D.no 785, Ramarappadu, Vijayawada', '9292456456', 'DMSc,
DS');

select * from doctors; 

 


insert into dept values
(1, 'Children Care', 2, 4),
(2, 'General', 1, 5),
(3, 'Surgical dept', 1, 4),
(4,'Gastroenterology', 3, 4),
(5,'Onclogy', 3, 4);
 
select * from dept;

 
 
insert into workers values
('N1', 'Jansi', 'D.no 90, ChittiNagar, Vijayawada', 'Nurse'),
('N2', 'Reshma', 'D.no 856, Jaggaypet, Vijayawada', 'Nurse'),
('A1', 'Pochayya', 'D.no 45, MoghalrajPuram, vijayawada', 'Ambulance Driver'),
('A2', 'Khalil', 'D.no 50, MoghalrajPuram, Vijayawada', 'Ambulance Driver'),
('W1', 'Ameer', 'D.no 654, Aurangabad, Vijayawada', 'WardBoy'),
('W2', 'Bharath', 'D.no 456, Auranagabad, Vijayawada', 'WardBoy');
 
select * from workers;

 
 
 
insert into patient values
('1', 'Ram', 'D.no 4568, Khalil Nagar, Guntur', '1999-02-21'),
('2', 'Sam', 'D.no 568, Benzcircle, Vijayawada', '2000-12-31'),
('3', 'Laila', 'D.no 4578, Gudivada, Vijayawada', '1987-01-05'),
('4', 'Giri', 'D.no 150, Vuyyuru, Vijayawada', '1979-05-04'),
('5', 'Syam', 'D.no 486, AutoNagar, Vijayawada', '2004-06-04');
 
select * from patient;

 
 


insert into doc_schedule values
(1, 'S1', 3, '07:00:00', '14:00:00'),
(2, 'S1', 3, '20:00:00', '22:00:00'),
(3, 'S2', 1, '07:00:00', '09:00:00'),
(4, 'S2', 2, '09:30:00', '13:30:00'),
(5, 'S2', 4, '16:00:00', '20:00:00'),
(6, 'S3', 5, '07:00:00', '13:00:00'),
(7, 'J1', 3, '14:00:00', '20:30:00'),
(8, 'J1', 1, '08:30:00', '12:00:00'),
(9, 'J2', 2, '13:00:00', '16:00:00'),
(10, 'J2', 4, '8:00:00', '12:00:00'),
(11, 'J2', 5, '17:00:00', '22:00:00');
 
select * from doc_schedule;




insert into worker_schedule values
(1, 'A1', 3, '08:00:00', '20:00:00'),
(2, 'A1', 4, '08:00:00', '20:00:00'),
(3, 'A2', 3, '20:00:00', '08:00:00'),
(4, 'A2', 4, '20:00:00', '08:00:00'),
(5, 'N1', 2, '08:00:00', '10:00:00'),
(6, 'N1', 3, '10:00:00', '12:00:00'),
(7, 'N1', 4, '14:00:00', '17:00:00'),
(8, 'N1', 5, '17:00:00', '20:00:00'),
(9, 'N2', 2, '08:00:00', '10:00:00'),
(10, 'N2', 3, '10:00:00', '12:00:00'),
(11, 'N2', 4, '14:00:00', '17:00:00'),
(12, 'N2', 5, '17:00:00', '20:00:00'),
(13, 'W1', 2, '08:00:00', '10:00:00'),
(14, 'W1', 1, '10:00:00', '12:00:00'),
(15, 'W1', 4, '14:00:00', '17:00:00'),
(16, 'W1', 5, '17:00:00', '20:00:00'),
(17, 'W2', 2, '08:00:00', '10:00:00'),
(18, 'W2', 1, '10:00:00', '12:00:00'),
(19, 'W2', 4, '14:00:00', '17:00:00'),
(20, 'W2', 5, '17:00:00', '20:00:00');
 
select * from worker_schedule;

 
 
 
 
insert into admit values
('1', 1, 123, 101),('3', 5, 56, 401), ('4', 2, 10, 205);
 
select * from admit;

 
 
 
insert into appointed_docs values
('1', 'S1', 'J1'), ('4', 'S3', 'J2'), ('3', 'S1', 'J1');
 
select * from appointed_docs;

 
 
 
insert into out_door_patients values
('2', 2, 'S2');

select * from out_door_patients;

 
 
 
 
insert into date_checkup values
(1, '2', '2021-03-28');

select * from date_checkup;