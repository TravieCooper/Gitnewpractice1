
CREATE DATABASE qaAuto;
USE qaAuto;


CREATE TABLE car_brands (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);


INSERT INTO car_brands (title) VALUES
('BMW'),
('Audi'),
('Ford'),
('Porsche'),
('Fiat');


CREATE TABLE car_models (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carBrandId INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    FOREIGN KEY (carBrandId) REFERENCES car_brands(id)
);


INSERT INTO car_models (carBrandId, title) VALUES
(1, '3'),
(1, '5'),
(1, 'X5'),
(1, 'X6'),
(1, 'Z3'),
(2, 'TT'),
(2, 'R8'),
(2, 'Q7'),
(2, 'A6'),
(2, 'A8'),
(3, 'Fiesta'),
(3, 'Focus'),
(3, 'Fusion'),
(3, 'Mondeo'),
(3, 'Sierra'),
(4, '911'),
(4, 'Cayenne'),
(4, 'Panamera'),
(5, 'Palio'),
(5, 'Ducato'),
(5, 'Panda'),
(5, 'Punto'),
(5, 'Scudo');

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);


INSERT INTO users (firstName, lastName, email, password) VALUES
('John', 'Doe', 'john.doe@example.com', 'password123'),
('Jane', 'Smith', 'jane.smith@example.com', 'securepass'),
('Alice', 'Johnson', 'alice.johnson@example.com', 'qwerty'),
('Bob', 'Brown', 'bob.brown@example.com', '123456'),
('Charlie', 'Taylor', 'charlie.taylor@example.com', 'ilovecars');

CREATE TABLE cars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userId INT NOT NULL,
    carBrandId INT NOT NULL,
    carModelId INT NOT NULL,
    mileage INT NOT NULL,
    initialMileage INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (carBrandId) REFERENCES car_brands(id),
    FOREIGN KEY (carModelId) REFERENCES car_models(id)
);

INSERT INTO cars (userId, carBrandId, carModelId, mileage, initialMileage) VALUES
(1, 1, 1, 50000, 0), -- John Doe має BMW 3
(2, 2, 6, 30000, 1000), -- Jane Smith має Audi TT
(3, 3, 11, 45000, 15000), -- Alice Johnson має Ford Fiesta
(4, 4, 16, 120000, 0), -- Bob Brown має Porsche 911
(5, 5, 20, 25000, 5000); -- Charlie Taylor має Fiat Panda