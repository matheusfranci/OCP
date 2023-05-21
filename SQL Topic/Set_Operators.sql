The following query is valid:

SELECT 3 FROM DUAL
   INTERSECT
SELECT 3f FROM DUAL;
This is implicitly converted to the following compound query:

SELECT TO_BINARY_FLOAT(3) FROM DUAL
   INTERSECT
SELECT 3f FROM DUAL;
The following query returns an error:

SELECT '3' FROM DUAL
   INTERSECT
SELECT 3f FROM DUAL;
Restrictions on the Set Operators

The set operators are subject to the following restrictions:

The set operators are not valid on columns of type BLOB, CLOB, BFILE, VARRAY, or nested table.

The UNION, INTERSECT, and MINUS operators are not valid on LONG columns.

If the select list preceding the set operator contains an expression, then you must provide a column alias for the expression in order to refer to it in the order_by_clause.

You cannot also specify the for_update_clause with the set operators.

You cannot specify the order_by_clause in the subquery of these operators.

You cannot use these operators in SELECT statements containing TABLE collection expressions.

Note:To comply with emerging SQL standards, a future release of Oracle will give the INTERSECT operator greater precedence than the other set operators. Therefore, you should use parentheses to specify order of evaluation in queries that use the INTERSECT operator with other set operators.
UNION Example

The following statement combines the results of two queries with the UNION operator, which eliminates duplicate selected rows. This statement shows that you must match data type (using the TO_CHAR function) when columns do not exist in one or the other table:

SELECT location_id, department_name "Department", 
   TO_CHAR(NULL) "Warehouse"  FROM departments
   UNION
   SELECT location_id, TO_CHAR(NULL) "Department", warehouse_name 
   FROM warehouses;

LOCATION_ID Department                     Warehouse
----------- ------------------------------ ---------------------------
       1400 IT
       1400                                Southlake, Texas
       1500 Shipping
       1500                                San Francisco
       1600                                New Jersey
       1700 Accounting
       1700 Administration
       1700 Benefits
       1700 Construction
       1700 Contracting
       1700 Control And Credit
...
UNION ALL Example

The UNION operator returns only distinct rows that appear in either result, while the UNION ALL operator returns all rows. The UNION ALL operator does not eliminate duplicate selected rows:

SELECT product_id FROM order_items
UNION
SELECT product_id FROM inventories
ORDER BY product_id;

SELECT location_id  FROM locations 
UNION ALL 
SELECT location_id  FROM departments
ORDER BY location_id;
A location_id value that appears multiple times in either or both queries (such as '1700') is returned only once by the UNION operator, but multiple times by the UNION ALL operator.

INTERSECT Example

The following statement combines the results with the INTERSECT operator, which returns only those unique rows returned by both queries:

SELECT product_id FROM inventories
INTERSECT
SELECT product_id FROM order_items
ORDER BY product_id;
MINUS Example

The following statement combines results with the MINUS operator, which returns only unique rows returned by the first query but not by the second:

SELECT product_id FROM inventories
MINUS
SELECT product_id FROM order_items
ORDER BY product_id;
