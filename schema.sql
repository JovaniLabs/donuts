--Ingredients
--We certainly need to keep track of our ingredients.
--Some of the typical ingredients we use include flour, yeast, oil, butter, and several different types of sugar.
--Moreover, we would love to keep track of the price we pay per unit of ingredient (whether it’s pounds, grams, etc.).

CREATE TABLE ingredients(
    "id" INT PRIMARY KEY,
    "name" TEXT NOT NULL CHECK("name" IN ('flour', 'yeast', 'oil', 'butter', 'other')),
    "price_per_unit" FLOAT NOT NULL,
    "unit_measurement" TEXT NOT NULL CHECK("unit_measurement" IN ('pounds', 'grams', 'other'))
);

--Donuts
--We’ll need to include our selection of donuts, past and present! For each donut on the menu, we’d love to include three things:

--The name of the donut
--Whether the donut is gluten-free
--The price per donut

CREATE TABLE donuts(
    "id" INT PRIMARY KEY,
    "name" TEXT NOT NULL,
    "selection" TEXT NOT NULL CHECK ("selection" IN ('past', 'present')),
    "gluten_free_status" TEXT NOT NULL,
    "price_per_donut" FLOAT NOT NULL
);

----Oh, and it’s important that we be able to look up the ingredients for each of the donuts!

CREATE TABLE donut_ingredients(
    "donut_id" INT NOT NULL,
    "ingredient_id" INT NOT NULL,
    PRIMARY KEY ("donut_id", "ingredient_id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id")
);

--link order with donuts;many to many relationship

CREATE TABLE donut_order(
    "order_id" INT NOT NULL,
    "donut_id" INT NOT NULL,
    "quantity" INT NOT NULL,
    PRIMARY KEY ("order_id", "donut_id"),
    FOREIGN KEY ("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts"("id")
);

--Orders
--We love to see customers in person, though we realize a good number of people might order online nowadays.
--We’d love to be able to keep track of those online orders. We think we would need to store:

--An order number, to keep track of each order internally
--All the donuts in the order
--The customer who placed the order. We suppose we could assume only one customer places any given order.

CREATE TABLE orders(
    "id" INT PRIMARY KEY,
    "order_num" INT NOT NULL,
    "customer_id" INT NOT NULL,
    "order_date" DATE NOT NULL,
    FOREIGN KEY ("customer_id") REFERENCES "customers"("id")
);

--Customers
--Oh, and we realize it would be lovely to keep track of some information about each of our customers.
--We’d love to remember the history of the orders they’ve made. In that case, we think we should store:

--A customer’s first and last name
--A history of their orders

CREATE TABLE customers(
    "id" INT PRIMARY KEY,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);
