CREATE DATABASE my2LAB; --1

CREATE TABLE countries( --2
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR(50),
  region_id INT,
  population INT
);

INSERT INTO countries(country_id, country_name, region_id, population) VALUES(DEFAULT, 'KZ', 14, 18000000); --3
SELECT * FROM countries;

INSERT INTO countries (country_id,country_name) VALUES(DEFAULT,'USA'); -- 4

INSERT INTO countries(region_id) VALUES (NULL); -- 5

INSERT INTO countries VALUES(DEFAULT,'KG',16, 170000000), -- 6
(DEFAULT,'USA',17, 200000000),(DEFAULT,'UK',13, 30000000);
SELECT * FROM countries;

INSERT INTO countries(country_name) default VALUE('KAZAKHSTAN');--7

INSERT INTO countries VALUES(DEFAULT, DEFAULT, 02, 10000000); --8

INSERT INTO countries VALUES(DEFAULT); --9

CREATE TABLE IF NOT EXISTS countries_new(
  LIKE countries
); -- 10
SELECT * FROM countries_new;

INSERT INTO countries_new SELECT * FROM countries RETURNING *; --11

UPDATE countries SET region_id = 1 WHERE region_id IS NULL; --12
SELECT * FROM countries_new;

UPDATE countries SET population = population * 1.1 RETURNING country_name, population as "New Population";--13

DELETE FROM countries WHERE population < 100000;--14

DELETE FROM countries_new AS cn USING countries AS ci WHERE cn.country_id = ci.country_id RETURNING *;--15

DELETE FROM countries * RETURNING *;--16


