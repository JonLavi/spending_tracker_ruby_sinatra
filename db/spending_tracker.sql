DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;
DROP TABLE budgets;


CREATE TABLE merchants
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions
(
  id SERIAL8 PRIMARY KEY,
  amount INT8,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE SET NULL,
  tag_id INT8 REFERENCES tags(id) ON DELETE SET NULL,
  trans_date DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE budgets
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  amount INT8
);
