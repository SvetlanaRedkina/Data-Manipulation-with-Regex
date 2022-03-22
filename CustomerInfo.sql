CREATE TABLE CustomerInfo (
	 CustomerId INTEGER NOT NULL AUTO_INCREMENT,
         FirstName VARCHAR(255),
	 LastName VARCHAR(255),
	 Address TEXT,
	 City VARCHAR(255),
	 Country VARCHAR(255),
	 PostalCode VARCHAR(12),
	 Phone VARCHAR(20),
	 Email TEXT,
	 PRIMARY KEY (CustomerId)
	);

SELECT *
FROM CustomerInfo;

/* Task 1: Extract a list of all customers whose first name starts with 'He' */
/* Solution 1 */
SELECT *
FROM CustomerInfo
WHERE FirstName REGEXP '^He';

/* Solution 2 */
SELECT *
FROM CustomerInfo
WHERE FirstName LIKE 'He%';

/* Task 2: Extract a list of all customers whose last name ends with 's' */
/* Solution 1 */
SELECT *
FROM CustomerInfo
WHERE LastName REGEXP 's$';

/* Solution 2 */
SELECT *
FROM CustomerInfo
WHERE LastName LIKE '%s';

/* Task 3: Extract a list of all customers whose first name has 'ar' in any position */
/* Solution 1 */
SELECT *
FROM CustomerInfo
WHERE FirstName REGEXP 'ar';

/* Solution 2 */
SELECT *
FROM CustomerInfo
WHERE FirstName LIKE '%ar%';

/* Task 4: Retrieve a list of all customers whose city starts with s */
/* Solution 1 */
SELECT *
FROM CustomerInfo
WHERE City REGEXP '^S';

/* Solution 2 */
SELECT *
FROM CustomerInfo
WHERE City LIKE 'S%';

/* Task 5: Retrieve a list of all customers whose city starts with a, b, c, or d */
/* Solution 1 */
SELECT *
FROM CustomerInfo
WHERE City REGEXP '^a|^b|^c|^d';

/* Solution 2 */
SELECT *
FROM CustomerInfo
WHERE City LIKE 'a%'
	OR City LIKE 'b%'
	OR City LIKE 'c%'
	OR City LIKE 'd%';

/* Solution 3 */
SELECT *
FROM CustomerInfo
WHERE LEFT(City, 1) REGEXP 'a|b|c|d';/* A more sophisticated version of Solution 1 */

/* Task 6: Retrieve the first name, last name, phone number and email of all customers with a gmail account */
/* Solution 1 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email REGEXP 'gmail.com$';

/* Solution 2 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email LIKE '%gmail.com';

/* Task 7: Retrieve the first name, last name, phone number and email of all customers whose email starts with t */
/* Solution 1 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email REGEXP '^t';

/* Solution 2 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email LIKE 't%';

/* Task 8: Retrieve the first name, last name, phone number and email of all customers whose email ends with com */
/* Solution 1 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email REGEXP 'com$';

/* Solution 2 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email LIKE '%com';

/* Task 9: Retrieve the first name, last name, phone number and email of all customers whose email starts with a, b, or t */
/* Solution 1 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email REGEXP '^a|^b|^t';

/* Solution 2 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email LIKE 'a%'
	OR Email LIKE 'b%'
	OR Email LIKE 't%';

/* Task 10: Retrieve the first name, last name, phone number and email of all customers whose email contain a number */
/* Solution 1 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email REGEXP '0|1|2|3|4|5|6|7|8|9';

/* Solution 2 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email REGEXP '[:digit:]';

/* Solution 3 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email REGEXP '[0-9]';

/* Task 11: Retrieve the first name, last name, phone number and email of all customers whose email contain two-digit numbers */
/* Solution 1 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email REGEXP '[0-9]{2}';

/* Solution 2 */
SELECT FirstName,
	 LastName,
	 Phone,
	 Email
FROM CustomerInfo
WHERE Email REGEXP '[0-9][0-9]';

/* Task 12: Retrieve the city, country, postalcode and original digits of the postal codes for Brazil */
/* Solution 1 */
/* SUBSTRING(string, starting position, length) */
SELECT City,
	 Country,
	 PostalCode,
	 SUBSTRING(PostalCode, 1, 5) AS OldPostalCode
FROM CustomerInfo
WHERE Country = 'Brazil';

/* Solution 2 */
/* SUBSTRING(a string FROM starting position FOR length) */
SELECT City,
	 Country,
	 PostalCode,
	 SUBSTRING(PostalCode FROM 1 FOR 5) AS OldPostalCode
FROM CustomerInfo
WHERE Country = 'Brazil';

/* Solution 3 */
/* SUBSTRING_INDEX(string, delimiter, number of times to search for the delimiter) */
SELECT City,
	 Country,
	 PostalCode,
	 SUBSTRING_INDEX(PostalCode, '-', 1) AS OldPostalCode
FROM CustomerInfo
WHERE Country = 'Brazil';

/* Task 13: Retrieve the first name, last name, city, country, postalcode, and the new digits of the postal codes for Brazil */
/* Solution 1 */
SELECT City,
	 Country,
	 PostalCode,
	 SUBSTRING(PostalCode, - 3, 3) AS NewPostalCode
FROM CustomerInfo
WHERE Country = 'Brazil';

/* Solution 2 */
SELECT City,
	 Country,
	 PostalCode,
	 SUBSTRING(PostalCode FROM - 3 FOR 3) AS NewPostalCode
FROM CustomerInfo
WHERE Country = 'Brazil';

/* Solution 3 */
SELECT City,
	 Country,
	 PostalCode,
	 SUBSTRING_INDEX(PostalCode, '-', - 1) AS NewPostalCode
FROM CustomerInfo
WHERE Country = 'Brazil';

/* Task 14: Retrieve the distinct domain names in the email addresses of customers */
SELECT DISTINCT SUBSTRING_INDEX(Email, '@', - 1) AS DomainName
FROM CustomerInfo;

/* Task 15: Retrieve the domain names and count of the domain names in the email addresses of customers */
SELECT DISTINCT SUBSTRING_INDEX(Email, '@', - 1) AS DomainName,
	 COUNT(*) AS Count
FROM CustomerInfo
GROUP BY SUBSTRING_INDEX(Email, '@', - 1);

/* Task 16: Retrieve the first name, last name, country and emails of all customers whose email domain name is gmail.com */
/* Solution 1 */
SELECT FirstName,
	 LastName,
	 Country,
	 Email
FROM CustomerInfo
WHERE Email LIKE '%gmail.com%';

/* Solution 2 */
SELECT FirstName,
	 LastName,
	 Country,
	 Email
FROM CustomerInfo
WHERE Email REGEXP 'gmail?';
