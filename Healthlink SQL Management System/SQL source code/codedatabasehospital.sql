create table patient(
        patientAMKA bigint primary key not null,
        userid varchar(40) not null,
        password varchar(20) not null,
        name varchar(20) not null,
        surname varchar(20) not null,
        gender varchar (6) not null
        );




create table departments(
        id int primary key not null,
        name text not null
        );


create table drugs(
        id int not null,
        name text not null,
        description text not null,
        primary key (id)
        );

create table doctor(
        doctorAMKA bigint primary key not null,
        username varchar(40) not null,
        password varchar(20) not null,
        name varchar (20) not null,
        surname varchar(20) not null,
        speciality int not null,
        foreign key (speciality) references departments (id)
                on delete set null

        );



create table appointments(
        id varchar(5) not null,
        t timestamp with time zone not null,
        patientAMKA bigint not null,
        doctorAMKA bigint not null,
        diagnosis varchar(10) null,
        primary key (id),
        foreign key (patientAMKA) references patient (patientAMKA)
                on delete set null,
        foreign key (doctorAMKA) references doctor (doctorAMKA)
                on delete set null
        );





create table medical_folder(
        id int not null,
        patientAMKA bigint not null,
        cure text not null,
        drug_id int not null,
        primary key (id),
        foreign key (patientAMKA) references patient (patientAMKA),
        foreign key (drug_id) references drugs (id)
                on delete set null

        );