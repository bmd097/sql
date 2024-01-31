/*
Normalisation ->

Normalization is a database design technique that reduces data redundancy and eliminates undesirable characteristics
like Insertion, Update and Deletion Anomalies. It organizes the fields and tables of a relational database to minimize
duplication and dependency of data.
Normalization involves dividing a database into two or more tables and defining relationships between the tables. 
The objective is to isolate data so that additions, deletions, and modifications of a field can be made in just one 
table and then propagated through the rest of the database via the defined relationships.

Simple explanation of normalization from 1NF to 5NF:
1. **First Normal Form (1NF)**: A table is in 1NF if it contains no repeating groups or arrays. Each cell should contain only
one value, and each record needs to be unique.

   Example: Consider a table `Orders` with columns `OrderID`, `CustomerName`, and `Product`. If a customer orders 
   multiple products, we might be tempted to store it like this:

   | OrderID | CustomerName | Product |
   |---------|--------------|---------|
   | 1       | John Doe     | Apples, Oranges |

   But this is not in 1NF because the `Product` column contains multiple values. To make it 1NF, we'd split up the records like this:

   | OrderID | CustomerName | Product |
   |---------|--------------|---------|
   | 1       | John Doe     | Apples  |
   | 1       | John Doe     | Oranges |

2. **Second Normal Form (2NF)**: A table is in 2NF if it is in 1NF and every non-key attribute is fully functionally dependent on 
the primary key. In other words, if you have a composite primary key, each non-key attribute should be related to the whole key, 
not just part of it.

   Example: Consider a table `OrderDetails` with columns `OrderID`, `ProductID`, `ProductName`, and `Quantity`. Here, `OrderID`
   and `ProductID` together form the primary key. But `ProductName` is only dependent on `ProductID`, not the whole key, so this 
   table is not in 2NF. To make it 2NF, we'd split it into two tables:

   `Orders`:

   | OrderID | ProductID | Quantity |
   |---------|-----------|----------|
   | 1       | 101       | 5        |

   `Products`:

   | ProductID | ProductName |
   |-----------|-------------|
   | 101       | Apples      |

3. **Third Normal Form (3NF)**: A table is in 3NF if it is in 2NF and there are no transitive dependencies. In other words, each 
non-key attribute must depend directly on the primary key, not on other non-key attributes.

   Example: Consider a table `Products` with columns `ProductID`, `ProductName`, and `ProductCategory`. If the category can be determined 
   from the product name, then there is a transitive dependency (`ProductID` -> `ProductName` -> `ProductCategory`), and the table is 
   not in 3NF. To make it 3NF, we'd split it into two tables:

   `Products`:

   | ProductID | ProductName |
   |-----------|-------------|
   | 101       | Apple       |

   `Categories`:

   | ProductName | ProductCategory |
   |-------------|-----------------|
   | Apple       | Fruit           |

4. **Boyce-Codd Normal Form (BCNF)**: A table is in BCNF if it is in 3NF and for every non-trivial functional 
dependency X -> Y, X is a superkey. In other words, the only determinants are candidate keys.

   Example: Consider a table `Rooms` with columns `Building`, `RoomNumber`, and `Capacity`. Here, both `Building` 
   and `RoomNumber` are candidate keys, because you can determine `Capacity` from either of them. 
   But `RoomNumber` -> `Capacity` is a dependency where the determinant is not a superkey, so this table is not in BCNF. 
   To make it BCNF, we'd split it into two tables:

   `Buildings`:

   | Building | RoomNumber |
   |----------|------------|
   | Main     | 101        |

   `Rooms`:

   | RoomNumber | Capacity |
   |------------|----------|
   | 101        | 50       |

5. **Fifth Normal Form (5NF or Project-Join Normal Form)**: A table is in 5NF if it is in 4NF and every join dependency in 
the table is implied by the candidate keys. This is a bit more complex and beyond the scope of a simple explanation, but it 
involves decomposing tables to eliminate redundancy caused by certain types of complex inter-table dependencies.

*/