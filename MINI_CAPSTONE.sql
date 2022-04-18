/* ANS1. table is not normalized as:
1. it does not follow 1st form as it has 2 values in 1 row - lat long
2. it is not in 2nd normal form as it has partial dependencies- customerId,City --> Zip_code
3. it is not in 3ed normal form as it has taransitive dependencies- country->state-->city
*/

-- ANS2,3,4,5 BELOW




CREATE DATABASE minicap;
USE minicap;


DROP TABLE country;
DROP TABLE city;
DROP TABLE zip;
DROP TABLE customer;
DROP TABLE services;

CREATE TABLE country(
id INT PRIMARY KEY AUTO_INCREMENT,
customer_id VARCHAR(100) NOT NULL UNIQUE,
country VARCHAR(100) NOT NULL DEFAULT 'United States',
state VARCHAR(100) NOT NULL DEFAULT 'California'
);

CREATE TABLE city(
id INT PRIMARY KEY AUTO_INCREMENT,
city VARCHAR(100) NOT NULL,
country_id INT NOT NULL,
FOREIGN KEY (country_id) REFERENCES country(id)
ON DELETE CASCADE
);


CREATE TABLE zip(
country_id INT NOT NULL,
city_id INT NOT NULL,
zip_code INT NOT NULL,
latitude DECIMAL(9,6) NOT NULL,
longitude DECIMAL(9,6) NOT NULL,
FOREIGN KEY (country_id) REFERENCES country(id),
FOREIGN KEY (city_id) REFERENCES city(id)
ON DELETE CASCADE,
PRIMARY KEY(country_id,city_id)
);


CREATE TABLE customer(
id VARCHAR(100) PRIMARY KEY,
gender VARCHAR(10) NOT NULL,
senior_citizen VARCHAR(10) NOT NULL,
partner VARCHAR(10) NOT NULL,
dependents VARCHAR(10) NOT NULL,
city_id INT NOT NULL,
FOREIGN KEY (city_id) REFERENCES city(id)
ON DELETE CASCADE
);

CREATE TABLE services(
id INT PRIMARY KEY AUTO_INCREMENT,
tenure_months INT NOT NULL,
phone_service VARCHAR(10) NOT NULL,
multiple_lines VARCHAR(10) NOT NULL,
internet_service VARCHAR(50) NOT NULL,
online_security VARCHAR(10) NOT NULL,
online_backup VARCHAR(10) NOT NULL,
device_protection VARCHAR(10) NOT NULL,
tech_support VARCHAR(10) NOT NULL,
streaming_tv VARCHAR(10) NOT NULL,
streaming_movies VARCHAR(10) NOT NULL,
contract VARCHAR(50) NOT NULL,
paper_less_billing VARCHAR(10) NOT NULL,
payment_method VARCHAR(50) NOT NULL,
country_id INT NOT NULL,
FOREIGN KEY (country_id) REFERENCES country(id)
ON DELETE CASCADE
);


CREATE TABLE charges(
monthly_charges DECIMAL(7,2),
total_charges DECIMAL(7,2),
country_id INT NOT NULL,
services_id INT NOT NULL,
FOREIGN KEY (country_id) REFERENCES country(id)
ON DELETE CASCADE,
FOREIGN KEY (services_id) REFERENCES services(id)
ON DELETE CASCADE,
PRIMARY KEY (country_id,services_id)
);

CREATE TABLE churn(
churn_lable VARCHAR(10) NOT NULL,
churn_value INT NOT NULL,
churn_score INT NOT NULL,
cltv INT NOT NULL,
churn_reason VARCHAR(100) NOT NULL,
country_id INT NOT NULL,
services_id INT NOT NULL,
FOREIGN KEY (country_id) REFERENCES country(id)
ON DELETE CASCADE,
FOREIGN KEY (services_id) REFERENCES services(id)
ON DELETE CASCADE,
PRIMARY KEY (country_id,services_id)
);

/* I WAS NOT ABLE TO SOLVE AND COMPLETE THIS QUESTION , I TRIED MY BEST */
