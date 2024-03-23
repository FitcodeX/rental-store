create database rental_db;

\connect rental_db

create table AccountType (
    id SERIAL PRIMARY KEY,
    acct_type VARCHAR
);

CREATE TABLE Customer (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR,
	account_type int REFERENCES AccountType(id)
);

create table Rentals (
	id SERIAL primary key,
	title VARCHAR,
	copies_available int
);

create table CustomerRentals (
	id SERIAL primary key,
	customer_id int references Customer(id),
	rental_id int references Rentals(id)
);

INSERT INTO AccountType (acct_type) VALUES ('Basic');
INSERT INTO AccountType (acct_type) VALUES ('Premium');
INSERT INTO AccountType (acct_type) VALUES ('VIP');

insert into Customer (first_name, last_name, account_type) values ('Halley', 'Crosbie', 3);
insert into Customer (first_name, last_name, account_type) values ('Shaun', 'Emblin', 2);
insert into Customer (first_name, last_name, account_type) values ('Philippe', 'Melbury', 1);
insert into Customer (first_name, last_name, account_type) values ('Brianna', 'Escreet', 1);
insert into Customer (first_name, last_name, account_type) values ('Raleigh', 'Lumber', 3);
insert into Customer (first_name, last_name, account_type) values ('Any', 'Moggach', 2);
insert into Customer (first_name, last_name, account_type) values ('Ashli', 'Astridge', 2);
insert into Customer (first_name, last_name, account_type) values ('Pier', 'Dackombe', 3);
insert into Customer (first_name, last_name, account_type) values ('Lorenzo', 'Greener', 1);
insert into Customer (first_name, last_name, account_type) values ('Jourdain', 'Marskell', 2);
insert into Customer (first_name, last_name, account_type) values ('Diann', 'Barkway', 1);
insert into Customer (first_name, last_name, account_type) values ('Warren', 'MacSharry', 2);
insert into Customer (first_name, last_name, account_type) values ('Miner', 'Cahan', 3);
insert into Customer (first_name, last_name, account_type) values ('Chrisse', 'Brealey', 3);
insert into Customer (first_name, last_name, account_type) values ('Joellen', 'Dwelling', 2);
insert into Customer (first_name, last_name, account_type) values ('Hugibert', 'Lambshine', 3);
insert into Customer (first_name, last_name, account_type) values ('Kassey', 'Branton', 2);
insert into Customer (first_name, last_name, account_type) values ('Lisha', 'Avramovic', 2);
insert into Customer (first_name, last_name, account_type) values ('Eudora', 'Barabisch', 2);
insert into Customer (first_name, last_name, account_type) values ('Solly', 'Skirvin', 3);

insert into Rentals (title, copies_available) values ('The Secret Garden', 1);
insert into Rentals (title, copies_available) values ('Midnight in Paris', 3);
insert into Rentals (title, copies_available) values ('The Great Gatsby', 2);
insert into Rentals (title, copies_available) values ('Eternal Sunshine of the Spotless Mind', 0);
insert into Rentals (title, copies_available) values ('The Shawshank Redemption', 0);
insert into Rentals (title, copies_available) values ('Pulp Fiction', 3);
insert into Rentals (title, copies_available) values ('Inception', 5);
insert into Rentals (title, copies_available) values ('The Matrix', 2);
insert into Rentals (title, copies_available) values ('The Lion King', 3);
insert into Rentals (title, copies_available) values ('Frozen', 5);
insert into Rentals (title, copies_available) values ('The Avengers', 4);
insert into Rentals (title, copies_available) values ('Jurassic Park', 3);
insert into Rentals (title, copies_available) values ('Titanic', 4);
insert into Rentals (title, copies_available) values ('The Godfather', 3);
insert into Rentals (title, copies_available) values ('Harry Potter and the Sorcerer''s Stone', 4);
insert into Rentals (title, copies_available) values ('The Lord of the Rings: The Fellowship of the Ring', 1);
insert into Rentals (title, copies_available) values ('Black Panther', 3);
insert into Rentals (title, copies_available) values ('Wonder Woman', 2);
insert into Rentals (title, copies_available) values ('La La Land', 0);
insert into Rentals (title, copies_available) values ('The Princess Bride', 1);

insert into CustomerRentals (customer_id, rental_id) values (9, 13);
insert into CustomerRentals (customer_id, rental_id) values (6, 8);
insert into CustomerRentals (customer_id, rental_id) values (4, 20);
insert into CustomerRentals (customer_id, rental_id) values (12, 8);
insert into CustomerRentals (customer_id, rental_id) values (16, 16);
insert into CustomerRentals (customer_id, rental_id) values (6, 9);
insert into CustomerRentals (customer_id, rental_id) values (18, 11);
insert into CustomerRentals (customer_id, rental_id) values (16, 9);
insert into CustomerRentals (customer_id, rental_id) values (12, 18);
insert into CustomerRentals (customer_id, rental_id) values (12, 12);
insert into CustomerRentals (customer_id, rental_id) values (19, 10);
insert into CustomerRentals (customer_id, rental_id) values (4, 3);
insert into CustomerRentals (customer_id, rental_id) values (1, 16);
insert into CustomerRentals (customer_id, rental_id) values (4, 3);
insert into CustomerRentals (customer_id, rental_id) values (18, 10);
insert into CustomerRentals (customer_id, rental_id) values (2, 13);
insert into CustomerRentals (customer_id, rental_id) values (4, 2);
insert into CustomerRentals (customer_id, rental_id) values (17, 8);
insert into CustomerRentals (customer_id, rental_id) values (18, 4);
insert into CustomerRentals (customer_id, rental_id) values (16, 18);
insert into CustomerRentals (customer_id, rental_id) values (16, 5);
insert into CustomerRentals (customer_id, rental_id) values (5, 9);
insert into CustomerRentals (customer_id, rental_id) values (7, 16);
insert into CustomerRentals (customer_id, rental_id) values (7, 9);
insert into CustomerRentals (customer_id, rental_id) values (19, 10);
insert into CustomerRentals (customer_id, rental_id) values (7, 18);
insert into CustomerRentals (customer_id, rental_id) values (9, 8);
insert into CustomerRentals (customer_id, rental_id) values (3, 9);
insert into CustomerRentals (customer_id, rental_id) values (12, 9);
insert into CustomerRentals (customer_id, rental_id) values (1, 8);
insert into CustomerRentals (customer_id, rental_id) values (2, 2);
insert into CustomerRentals (customer_id, rental_id) values (8, 7);
insert into CustomerRentals (customer_id, rental_id) values (14, 10);
insert into CustomerRentals (customer_id, rental_id) values (12, 2);
insert into CustomerRentals (customer_id, rental_id) values (12, 6);
insert into CustomerRentals (customer_id, rental_id) values (13, 14);
insert into CustomerRentals (customer_id, rental_id) values (10, 3);
insert into CustomerRentals (customer_id, rental_id) values (6, 12);
insert into CustomerRentals (customer_id, rental_id) values (16, 3);
insert into CustomerRentals (customer_id, rental_id) values (12, 16);