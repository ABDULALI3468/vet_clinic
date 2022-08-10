/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%'; 
SELECT name from animals WHERE date_of_birth BETWEEN 'January 1, 2016' AND 'December 31, 2019';
SELECT name from animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth from animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered =  true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


UPDATE animals 
SET species = 'unspecified';

UPDATE animals SET species = 'digimon'
WHERE name like '%mon';

UPDATE animals SET species = 'pokemon'
WHERE species = 'unspecified';

BEGIN;

SAVEPOINT SP1;

DELETE FROM animals;
ROLLBACK TO SP1 ;

COMMIT;


-- AGGREGATIONS AND GROUP BY

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts  = 0;
SELECT AVG(weight_kg) AS AVERAGE_WEIGHT FROM animals;
SELECT neutered, count(*) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, ROUND(AVG(escape_attempts), 0) AS "average number of escape attempts" FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;