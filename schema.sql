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

CREATE TABLE species (id int GENERATED ALWAYS AS IDENTITY,full_name VARCHAR(255));

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INTEGER;

ALTER TABLE animals ADD COLUMN owner_id INTEGER;

ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species (id);

ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners (id);