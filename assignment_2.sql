CREATE TABLE rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);

CREATE TABLE species(
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    spacies_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR(50),
    notes TEXT
);

INSERT INTO rangers(name, region) VALUES('Alice Green', 'Nothern Hills'), ('Boob White', 'River Delta'), ('Carol King', 'Mountain Range');

INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status)
 VALUES 
 ('Snow Leopard', 'Panthera uncia','1775-01-01', 'Endangered'),
 ('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
 ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
 ('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

 SELECT * FROM species;

 INSERT INTO sightings(spacies_id, ranger_id, location, sighting_time, notes)
 VALUES
 (1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
 (2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
 (3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
 (1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

 SELECT * FROM sightings;

--  * task -- 1
INSERT INTO rangers(name, region) VALUES
('Derek Fox', 'Coastal Plains');

-- * task -- 2
SELECT COUNT(DISTINCT spacies_id) as unique_species_count FROM sightings;

-- * task -- 3
SELECT * FROM sightings WHERE location ILIKE '%Pass%';

-- * task -- 4
SELECT name, count(sighting_id) AS total_sightings FROM rangers JOIN sightings USING(ranger_id) GROUP BY name;

-- * task -- 7
UPDATE species SET conservation_status = 'Historic' WHERE discovery_date < '1800-01-01';



-- !!! task 4, 5, 6 kora hoy nai