CREATE SCHEMA IF NOT EXISTS trains;


CREATE TABLE trains.City(
    region text,
    name text,

    primary key (region, name)
);


CREATE TABLE trains.Station(
    name text primary key,
    tracks int,

    city_region text,
    city_name text,
    foreign key (city_region, city_name) references trains.City
);

CREATE TABLE trains.Train(
    train_id serial primary key,
    length int,

    station_start_name text,
    station_end_name text,

    foreign key (station_start_name) references trains.Station,
    foreign key (station_end_name) references trains.Station
);

CREATE TABLE trains.StationConnections(
    departure date,
    arrival date,

    station_name_from text,
    station_name_to text,
    train_id serial,

    foreign key (station_name_from) references trains.Station,
    foreign key (station_name_to) references trains.Station,
    foreign key (train_id) references trains.Train
)