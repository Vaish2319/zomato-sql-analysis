-- =========================================
-- ZOMATO DATA ANALYSIS PROJECT
-- =========================================

USE ZomatoDB;

-- =========================================
-- DATA OVERVIEW
-- =========================================

-- Total number of restaurants
SELECT COUNT(*) AS total_restaurants
FROM Restaurants;

-- Preview dataset
SELECT *
FROM Restaurants
LIMIT 20;

-- =========================================
-- BASIC ANALYSIS
-- =========================================

-- 1. Top 10 highest rated restaurants
SELECT restaurant_name, rating
FROM Restaurants
ORDER BY rating DESC
LIMIT 10;

-- 2. Most popular restaurants (highest ratings count)
SELECT restaurant_name, num_of_ratings
FROM Restaurants
ORDER BY num_of_ratings DESC
LIMIT 10;

-- 3. Average cost for two people
SELECT AVG(avg_cost) AS average_cost
FROM Restaurants;

-- =========================================
-- BUSINESS INSIGHTS
-- =========================================

-- 4. Most common cuisines
SELECT cuisines, COUNT(*) AS total
FROM Restaurants
GROUP BY cuisines
ORDER BY total DESC
LIMIT 10;

-- 5. Areas with highest number of restaurants
SELECT area, COUNT(*) AS total_restaurants
FROM Restaurants
GROUP BY area
ORDER BY total_restaurants DESC;

-- 6. Average rating by area
SELECT area, AVG(rating) AS avg_rating
FROM Restaurants
GROUP BY area
ORDER BY avg_rating DESC;

-- 7. Impact of online ordering on ratings
SELECT online_order, AVG(rating) AS avg_rating
FROM Restaurants
GROUP BY online_order;

-- 8. Impact of table booking on ratings
SELECT table_booking, AVG(rating) AS avg_rating
FROM Restaurants
GROUP BY table_booking;

-- 9. Best value restaurants (high rating & low cost)
SELECT restaurant_name, rating, avg_cost
FROM Restaurants
WHERE rating >= 4 AND avg_cost <= 500
ORDER BY rating DESC;

-- 10. Count of restaurants by type
SELECT restaurant_type, COUNT(*) AS total
FROM Restaurants
GROUP BY restaurant_type
ORDER BY total DESC;

-- 11. Average cost by area
SELECT area, AVG(avg_cost) AS avg_cost
FROM Restaurants
GROUP BY area
ORDER BY avg_cost DESC;

-- 12. Highest cost restaurants
SELECT restaurant_name, avg_cost
FROM Restaurants
ORDER BY avg_cost DESC
LIMIT 10;

-- 13. Low cost but high rating (hidden gems)
SELECT restaurant_name, rating, avg_cost
FROM Restaurants
WHERE rating >= 4.5 AND avg_cost <= 300
ORDER BY rating DESC;

-- 14. Restaurants without online ordering
SELECT COUNT(*) AS no_online_order
FROM Restaurants
WHERE online_order = 'No';

-- 15. Restaurants offering both online order and table booking
SELECT COUNT(*) AS both_services
FROM Restaurants
WHERE online_order = 'Yes' AND table_booking = 'Yes';

-- =========================================
-- ADVANCED ANALYSIS
-- =========================================

-- 16. Top restaurant in each area
SELECT *
FROM (
    SELECT restaurant_name, area, rating,
           RANK() OVER (PARTITION BY area ORDER BY rating DESC) AS rnk
    FROM Restaurants
) t
WHERE rnk = 1;

-- 17. Categorize restaurants by rating
SELECT restaurant_name,
       CASE 
           WHEN rating >= 4.5 THEN 'Excellent'
           WHEN rating >= 4 THEN 'Good'
           WHEN rating >= 3 THEN 'Average'
           ELSE 'Poor'
       END AS rating_category
FROM Restaurants;

-- 18. Top 5 costly restaurants per area
SELECT *
FROM (
    SELECT restaurant_name, area, avg_cost,
           RANK() OVER (PARTITION BY area ORDER BY avg_cost DESC) AS rnk
    FROM Restaurants
) t
WHERE rnk <= 5;

-- 19. Cost category vs average rating
SELECT 
    CASE 
        WHEN avg_cost < 300 THEN 'Low Cost'
        WHEN avg_cost BETWEEN 300 AND 700 THEN 'Medium Cost'
        ELSE 'High Cost'
    END AS cost_category,
    AVG(rating) AS avg_rating
FROM Restaurants
GROUP BY cost_category;

-- 20. Total restaurants by rating category
SELECT 
    CASE 
        WHEN rating >= 4.5 THEN 'Excellent'
        WHEN rating >= 4 THEN 'Good'
        WHEN rating >= 3 THEN 'Average'
        ELSE 'Poor'
    END AS category,
    COUNT(*) AS total
FROM Restaurants
GROUP BY category;