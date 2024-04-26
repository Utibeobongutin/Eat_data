
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


-- -----------------------------------------------------------------------------

-- Lagos (Corporate I)
INSERT INTO employee VALUES(100, 'Chukwudi', 'Uzoh', '1977-11-17', 'M', 550000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Lagos', 100, '2016-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Melody', 'Essien', '1971-05-11', 'F', 350000, 100, 1);

-- Port_Harcourt (Corporate II)
INSERT INTO employee VALUES(102, 'Tosin', 'Babatunde', '1984-03-15', 'M', 250000, 100, NULL);

INSERT INTO branch VALUES(2, 'Port_Harcourt', 102, '2018-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Okorie', '1971-06-25', 'F', 200000, 102, 2);
INSERT INTO employee VALUES(104, 'Amara', 'Nwoba', '1980-02-05', 'F', 210000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Tunde', '1988-02-19', 'M', 230000, 102, 2);

-- Eket (Fabrication Yard)
INSERT INTO employee VALUES(106, 'Joseph', 'Ubong', '1979-09-05', 'M', 210000, 100, NULL);

INSERT INTO branch VALUES(3, 'Eket', 106, '2020-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Esiri', 'Farouq', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Kobe', 'Douye', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Tork', 'Clamps');
INSERT INTO branch_supplier VALUES(2, 'Nec', 'Compressors');
INSERT INTO branch_supplier VALUES(3, 'CSNRI', 'Composite Materials');
INSERT INTO branch_supplier VALUES(2, 'Skeleton', 'Hand Gloves');
INSERT INTO branch_supplier VALUES(3, 'Nec', 'Compressors');
INSERT INTO branch_supplier VALUES(3, 'Tork', 'Clamps');
INSERT INTO branch_supplier VALUES(3, 'Kong', 'Hand Gloves');

-- CLIENT
INSERT INTO client VALUES(400, 'Exxon Mobil', 2);
INSERT INTO client VALUES(401, 'Total Energy', 2);
INSERT INTO client VALUES(402, 'Universal Energy', 3);
INSERT INTO client VALUES(403, 'Sterling Oil', 3);
INSERT INTO client VALUES(404, 'Frontier Oil', 2);
INSERT INTO client VALUES(405, 'Shell Petroleum', 3);
INSERT INTO client VALUES(406, 'Savannah Energy', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 104346000);
INSERT INTO works_with VALUES(102, 401, 12067000);
INSERT INTO works_with VALUES(108, 402, 7322500);
INSERT INTO works_with VALUES(107, 403, 2134000);
INSERT INTO works_with VALUES(108, 403, 5812000);
INSERT INTO works_with VALUES(105, 404, 3493000);
INSERT INTO works_with VALUES(107, 405, 3926000);
INSERT INTO works_with VALUES(102, 406, 2815000);
INSERT INTO works_with VALUES(105, 406, 3013000);
