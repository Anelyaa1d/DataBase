CREATE DATABASE mylab8_1;

CREATE INDEX index1 on countries using hash (name); --1

CREATE INDEX index2 on countries using hash (name, surname); --2

CREATE UNIQUE INDEX index3 on employees (salary); --3

CREATE INDEX index4 on employees (substring(name from 1 to 4)); --4

CREATE INDEX index5 on employees (department_id, salary); --5

CREATE INDEX index6 on departments (department_id, budget); --5

