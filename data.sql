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

UPDATE animals SET owner_id = 1 WHERE name='Agumon';
UPDATE animals SET owner_id = 2 WHERE name='Gabumon' OR name='Pikachu';
UPDATE animals SET owner_id = 3 WHERE name='Devimon' OR name='Plantmon';
UPDATE animals SET owner_id = 4 WHERE name='Charmander' OR name='Squirtle' OR name='Blossom';
UPDATE animals SET owner_id = 5 WHERE name='Angemon' OR name='Boarmon';


---------------------------------------------------------------------------
 -- DAY 4 
 -- DAY 4 
 -- DAY 4 
 -- DAY 4 
 -- DAY 4 

-- INSERT INTO VETS TABLE
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Vet William Tatcher', 45, 'April 23, 2000'), ('Vet Maisy Smith', 26, 'January 17, 2019'), ('Vet Stephanie Mendez', 64, 'May 4, 1981'), ('Vet Jack Harkness', 38, 'June 8, 2008') ;

-- INSERT INTO SPECIALIZATIONS TABLE
INSERT INTO specializations VALUES (1, 1), (1,3), (2,3), (2,4);

-- INSERT INTO VISITS TABLE

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES 
(1,1,'2020-05-24'), (1,3,'2020-07-22'), (2,4,'2021-02-02'), (3,2,'2020-01-05'),
(3,2,'2020-03-08'), (3,2,'2020-05-14'), (4,3,'2021-05-04'), (5,4,'2021-02-24'),
(6,2,'2029-12-21'), (6,1,'2020-08-10'), (6,2,'2021-04-07'), (7,3,'2019-09-29'),
(8,4,'2020-10-03'), (8,4,'2020-11-04'), (9,2,'2019-01-24'), (9,2,'2019-05-15'),
(9,2,'2020-02-27'), (9,2,'2020-08-03'), (10,3,'2020-05-24'), (10,1,'2021-01-11');

--------------------------------------

-- Vet clinic database: database performance audit (MOST RECENT WORK)

INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
