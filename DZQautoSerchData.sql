SELECT u.id, u.email, p.name, p.lastName
FROM users u
JOIN user_profiles p ON u.id = p.userId
WHERE p.name LIKE '%am%';

SELECT MAX(e.totalCost) AS max_cost
FROM expenses e
JOIN cars c ON e.carId = c.id
JOIN car_models m ON c.carModelId = m.id
JOIN car_brands b ON m.carBrandId = b.id
WHERE b.title = 'Audi';

SELECT b.title AS car_brand, COUNT(m.id) AS count_models
FROM car_brands b
JOIN car_models m ON b.id = m.carBrandId
WHERE b.title IN ('Audi', 'BMW')
GROUP BY b.title;

SELECT b.title AS car_brand, m.title AS car_model, COUNT(DISTINCT c.userId) AS user_count
FROM cars c
JOIN car_models m ON c.carModelId = m.id
JOIN car_brands b ON m.carBrandId = b.id
GROUP BY b.title, m.title;

SELECT DISTINCT p.name, p.lastName
FROM users u
JOIN user_profiles p ON u.id = p.userId
JOIN cars c ON u.id = c.userId;