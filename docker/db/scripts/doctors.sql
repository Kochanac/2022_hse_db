CREATE SCHEMA IF NOT EXISTS doctors;

CREATE TABLE doctors.Station(
    station_id serial primary key,
    name text
);

CREATE TABLE doctors.Room(
    room_id serial primary key,
    beds int,

    station_id serial,
    foreign key (station_id) references doctors.Station
);

CREATE TABLE doctors.StationPersonnel(
    personnel_id serial primary key,
    name text,

    works_for serial,
    foreign key (works_for) references doctors.Station
);

CREATE TABLE doctors.Doctor(
    personnel_id serial primary key,
    area text,
    rank serial
);

CREATE TABLE doctors.Caregiver(
    personnel_id serial primary key,
    qualification text
);

CREATE TABLE doctors.Patient(
    patient_id serial primary key,
    name text,
    disease text,

    is_treated_by serial,
    foreign key (is_treated_by) references doctors.Doctor
);

CREATE TABLE doctors.Admission(
    admission_from date,
    admission_to date,
    room_id serial,
    patient_id serial,
    foreign key (room_id) references doctors.Room,
    foreign key (patient_id) references doctors.Patient
)