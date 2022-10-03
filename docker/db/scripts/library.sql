CREATE SCHEMA IF NOT EXISTS library;

CREATE TABLE library.Publisher(
    id serial primary key,
    address text,
    name text
);

CREATE TABLE library.Category(
    name text primary key
);

CREATE TABLE library.CategoryTree(
    category_parent text,
    category_child text,

    foreign key (category_parent) references library.Category(name),
    foreign key (category_child) references library.Category(name)
);

CREATE TABLE library.Book
(
    ISBN text primary key,
    author text,
    page_count int,
    title text,
    year date,

    publisher_id serial,
    foreign key (publisher_id) references library.Publisher(id),

    category text,
    foreign key (category) references library.Category(name)
);

CREATE TABLE library.Reader(
    id serial primary key,
    name text,
    surname text,
    birthday date,
    address text
);


CREATE TABLE library.Copy(
    id serial primary key,
    place text,
    ISBN text,
    foreign key (ISBN) references library.Book(ISBN)
);

CREATE TABLE library.Borrows
(
    reader_id serial,
    copy_number serial,
    end_date date,

    foreign key (reader_id) references library.Reader(id),
    foreign key (copy_number) references library.Copy(id)
);