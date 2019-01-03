DROP TABLE transactions;
DROP TABLE budgets;
DROP TABLE tags;
DROP TABLE merchants;

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

CREATE TABLE budgets
(
  id IN8 PRIMARY KEY,
  name VARCHAR(255),
  amount INT8
);

CREATE TABLE transactions
(
  id SERIAL8 PRIMARY KEY,
  amount INT8,
  merchant_id INT8 REFERENCES merchants(id) ON DELETE SET NULL,
  tag_id INT8 REFERENCES tags(id) ON DELETE SET NULL,
  trans_date DATE NOT NULL DEFAULT CURRENT_DATE,
  budget_id INT8 REFERENCES budgets(id) ON DELETE SET NULL
);
