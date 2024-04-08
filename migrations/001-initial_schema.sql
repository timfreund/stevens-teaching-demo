create table doctor (
  id serial primary key,
  gender varchar(32),
  salary numeric(6,2),
  speciality varchar(128)
);


create table patient (
  id serial primary key,
  gender varchar(32),
  birth_date date,
  account_balance numeric(6,2)
);

create table account (
  id serial primary key
);

create table payment (
  id serial primary key
);

create table visit (
  id serial primary key,
  doctor_id int references doctor(id),
  patient_id int references patient(id)
);

create table medication (
  id serial primary key
);
