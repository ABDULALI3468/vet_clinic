/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int GENERATED ALWAYS AS IDENTITY  NOT NULL,
    name varchar(100)  NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts int NOT NULL,
    neutered boolean NOT NULL,
    weight_kg decimal NOT NULL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(255);

-- CREATING TABLE SPECIES AND OWNER WITH THEIR IDS ASSIGNED AS THE REFERENCED FOREIGN KEY IN RESPECT OF THE REFERNECE TABLE NAMED AS ANIMAL

CREATE TABLE owners (id int GENERATED ALWAYS AS IDENTITY,full_name VARCHAR(255), age int);

CREATE TABLE species (id int GENERATED ALWAYS AS IDENTITY,name VARCHAR(255));

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INTEGER;

ALTER TABLE animals ADD COLUMN owner_id INTEGER;

ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);

--------------------------------------------------------------------------------------------------------------------------------------------------

-- DAY 4
-- DAY 4
-- DAY 4
-- DAY 4
-- DAY 4
-- DAY 4


-- MANY TO MANY REALTIONSHIP.


CREATE TABLE vets (
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255),
  age int,
  date_of_graduation date
);

CREATE TABLE visits(
  id SERIAL PRIMARY KEY,
  animals_id INT,
  vets_id INT,
  date_of_visit date NOT NULL,
  CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE specializations(
  species_id INT,
  vets_id INT,
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_species_vets PRIMARY KEY (species_id, vets_id)
);


--------------------------------------

-- Vet clinic database: database performance audit (MOST RECENT WORK)

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- BEFORE OPTIMIZATION

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';

-- AFTER OPTIMIZATION

CREATE INDEX for_animals_id ON visits (animals_id); 
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;

CREATE INDEX for_vets_id ON visits ( vets_id );
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;

CREATE INDEX for_email_owners ON owners ( email );
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
