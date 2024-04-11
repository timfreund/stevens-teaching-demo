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
  account_balance numeric(8,2)
);

create table doctor_patient_relationship (
  id serial primary key,
  doctor_id int references doctor(id),
  patient_id int references patient(id),
  start_date date not null default now(),
  end_date date
);

create table invoice_state(
  invoice_state char(1) primary key,
  description varchar(24)
);

insert into invoice_state(invoice_state, description) values('N', 'New');
insert into invoice_state(invoice_state, description) values('S', 'Sent');
insert into invoice_state(invoice_state, description) values('P', 'Paid');
insert into invoice_state(invoice_state, description) values('W', 'Write off');

create table invoice (
  id serial primary key,
  patient_id int references patient(id),
  invoice_state char(1) default 'N',
  create_date date default now(),
  amount_total numeric(8,2),
  amount_due numeric(8,2)
);

create table invoice_line_item (
  id serial primary key,
  invoice_id int references invoice(id),
  description varchar(255) not null,
  quantity int not null,
  amount numeric(6,2)
);

create table payment_type(
  payment_type varchar(4) primary key,
  description varchar(24)
);

insert into payment_type(payment_type, description) values('ACH', 'ACH / Check');
insert into payment_type(payment_type, description) values('CASH', 'Cash');
insert into payment_type(payment_type, description) values('CC', 'Credit Card');

create table payment (
  id serial primary key,
  amount numeric(6,2),
  payment_type varchar(4) not null references payment_type(payment_type),
  payment_date date not null default now()
);

create table visit (
  id serial primary key,
  doctor_id int references doctor(id),
  patient_id int references patient(id),
  start_time timestamp not null,
  end_time timestamp not null,
  notes text
);

create table diagnosis (
  id serial primary key,
  doctor_id int references doctor(id),
  patient_id int references patient(id),
  diagnosis_name varchar(255) not null,
  notes text
);

create table diagnosis_progress (
  id serial primary key,
  diagnosis_id int references diagnosis(id),
  doctor_id int references doctor(id),
  patient_id int references patient(id),
  notes text
);

create table medication (
  id serial primary key,
  doctor_id int references doctor(id),
  patient_id int references patient(id),
  medication_name varchar(255) not null,
  prescribed_amount varchar(255),
  prescribed_at date not null,
  halted_at date,
  notes text
);
