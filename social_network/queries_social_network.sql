-- # Selecting comments and users details filtered by the users age using only "WHERE" clause:
SELECT nick, name, age, email_address AS email, text AS comments
FROM profile, users, comment
WHERE age > 30
AND users.fk_profile_id = profile_id AND profile.profile_id = comment.fk_profile_id
GROUP BY name;

--  # Select all comments ordered by the publication time - descending:
SELECT nick, text AS comments, publication_date AS "posted on"
FROM comment
JOIN profile ON comment.fk_profile_id = profile.profile_id
ORDER by publication_date DESC;

-- # Selecting comments and users details filtered by the users age using "LEFT JOIN":
SELECT name, nick, age, email_address AS email, text AS comments
FROM profile
LEFT JOIN comment ON comment.fk_profile_id = profile.profile_id
LEFT JOIN users ON profile.profile_id = users.fk_profile_id
WHERE age > 30
GROUP BY age;

-- # Returns the total users count, average users age and average comments count per one user:
SELECT COUNT(users.user_id) AS "Users count", ROUND(AVG(age), 0) AS "Average user age", 
ROUND((COUNT(comment.comment_id) / COUNT(users.user_id)), 1) AS "Avg. comments per user"
FROM users
JOIN profile ON profile.profile_id = users.fk_profile_id
JOIN comment ON comment.fk_profile_id = profile.profile_id;

-- # Select comments by country with INNER JOIN:
SELECT nick, email_address AS email, country, text AS comments
FROM profile
JOIN comment ON comment.fk_profile_id = profile.profile_id
JOIN users ON profile.profile_id = users.fk_profile_id
WHERE country = "usa"
GROUP BY nick;

-- # Select user details just for users with photos, from the four tables: 
SELECT nick, email_address AS email, country, text AS comments, file_name
FROM photo
JOIN users ON photo.fk_user_id = users.user_id
JOIN profile ON profile.profile_id = users.fk_profile_id
JOIN comment ON comment.fk_profile_id = profile.profile_id
GROUP BY file_name;

-- # Select all users details from two tables  ("FULL OUTER JOIN" equivalent) - using UNION operator:
SELECT name, email_address AS email, age, country, occupation
FROM profile
LEFT JOIN users ON users.fk_profile_id = profile.profile_id
UNION
SELECT name, email_address AS email, age, country, occupation
FROM profile
RIGHT JOIN users ON users.fk_profile_id = profile.profile_id;

-- # Select the basic user data, ordered by users age - descending:
SELECT profile_id, name, email_address, age, country, occupation
FROM profile
LEFT JOIN users ON users.fk_profile_id = profile.profile_id
UNION
SELECT profile_id, name, email_address, age, country, occupation
FROM profile
RIGHT JOIN users ON users.fk_profile_id = profile.profile_id
ORDER BY age DESC;