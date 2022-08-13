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

-- OTHER TRANSACTION.


BEGIN;
-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > 'January 1, 2022';
-- Create a savepoint for the transaction.
SAVEPOINT ANIMAL_DELETED;
-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;
-- Rollback to the savepoint
ROLLBACK TO SAVEPOINT ANIMAL_DELETED;
-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
-- Commit transaction
COMMIT;


-- AGGREGATIONS AND GROUP BY

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts  = 0;
SELECT AVG(weight_kg) AS AVERAGE_WEIGHT FROM animals;
SELECT neutered, count(*) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, ROUND(AVG(escape_attempts), 0) AS "average number of escape attempts" FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;


-- What animals belong to Melody Pond?
SELECT animals.name FROM animals  JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON animals.owner_id = owners.id;

-- How many animals are there per species?
SELECT COUNT(*) AS "No of animals", species.name FROM animals INNER JOIN species ON animals.species_id = species.id GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT animals.id, animals.name, species.name, owners.full_name FROM animals
  INNER JOIN species ON animals.species_id = species.id
  INNER JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.id, animals.name, owners.full_name FROM animals INNER JOIN owners ON animals.owner_id = owners.id WHERE animals.escape_attempts = 0; AND owners.full_name = 'Dean Winchester';

-- Who owns the most animals?
SELECT owners.full_name, COUNT(*) AS "No of animals" FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name;

-- DAY 4 QUERIES 
-- DAY 4 QUERIES 
-- DAY 4 QUERIES 
-- DAY 4 QUERIES 
-- DAY 4 QUERIES 
-- DAY 4 QUERIES 
-- DAY 4 QUERIES 
-- DAY 4 QUERIES 
-- DAY 4 QUERIES 
-- DAY 4 QUERIES 
-- DAY 4 QUERIES 

-- Who was the last animal seen by William Tatcher?

SELECT animals.name FROM animals JOIN visits ON animals.id  = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Vet William Tatcher' ORDER BY visits.date_of_visit DESC limit 1;

-- How many different animals did Stephanie Mendez see?

SELECT count(*)  FROM animals JOIN visits ON animals.id  = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Vet Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.

SELECT *  FROM species LEFT JOIN specializations ON species.id  = specializations.species_id LEFT JOIN vets ON specializations.vets_id = vets.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT animals.name, vets.name  FROM animals JOIN visits ON animals.id  = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Vet Stephanie Mendez' AND visits.date_of_visit BETWEEN 'April 1, 2020' AND 'August 30, 2020';

-- What animal has the most visits to vets?

SELECT animals.name, COUNT(*) AS "No of times Visited" FROM visits RIGHT JOIN animals ON animals.id = visits.animals_id GROUP BY animals.name  ORDER BY "No of times Visited" DESC LIMIT 1;

-- Who was Maisy Smith's first visit?

SELECT animals.name, vets.name FROM animals JOIN visits ON animals.id  = visits.animals_id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Vet Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.

SELECT vets.name AS VET_NAME, visits.date_of_visit, animals.name AS ANIMAL FROM animals JOIN visits ON animals.id  = visits.animals_id JOIN vets ON visits.vets_id = vets.id ORDER BY visits.date_of_visit desc LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT COUNT(*)  FROM visits JOIN vets ON vets.id = visits.vets_id JOIN animals ON animals.id  = visits.animals_id JOIN specializations ON specializations.species_id = vets.id WHERE specializations.species_id != animals.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT species.name,  COUNT(*) FROM visits JOIN animals ON animals.id = visits.animals_id JOIN vets ON vets.id = visits.vets_id JOIN species ON animals.species_id = species.id WHERE vets.name = 'Vet Maisy Smith' GROUP BY species.name ORDER BY count DESC LIMIT  1;

