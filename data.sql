/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', 'February 3, 2020', 0, TRUE, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', 'November 15, 2018', 2, TRUE, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', 'January 7, 2021', 1, FALSE, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', 'May 12, 2017', 5, TRUE, 11);


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', 'February 8, 2020', 0, FALSE, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', 'November 15, 2021', 2, TRUE, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', 'April 2, 1993', 3, FALSE, -12.13);

 INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', 'June 12, 2005', 1, TRUE, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', 'June 7, 2005', 7, TRUE, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', 'Oct 13, 1998', 3, TRUE, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', 'May 14, 2022', 4, TRUE, 22);


----- Owners data inserts -----

INSERT INTO owners(full_name,age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name,age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name,age) VALUES('Bob', 45);
INSERT INTO owners(full_name,age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name,age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name,age) VALUES('Jodie Whittaker', 38);

----- Species data inserts -----

INSERT INTO species(name) VALUES('Pokemon');
INSERT INTO species(name) VALUES('Digimon');

----- Update species in animals table -----

UPDATE animals SET species_id=2 WHERE name LIKE '%mon';
UPDATE animals SET species_id=1 WHERE species_id IS NULL;

----- Update owners in animals table -----

UPDATE animals SET owners_id = 1 WHERE name='Agumon';
UPDATE animals SET owners_id = 2 WHERE name='Gabumon' OR name='Pikachu';
UPDATE animals SET owners_id = 3 WHERE name='Devimon' OR name='Plantmon';
UPDATE animals SET owners_id = 4 WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';
UPDATE animals SET owners_id = 5 WHERE name='Angemon' OR name='Boarmon';
