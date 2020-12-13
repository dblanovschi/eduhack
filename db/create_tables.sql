DROP TABLE IF EXISTS resources;

CREATE TABLE resources (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    subject VARCHAR(32) NOT NULL,
    grade INT NOT NULL,
    res_name VARCHAR(128) NOT NULL,
    description VARCHAR(512) NOT NULL,
    markdown TEXT NOT NULL
);

DROP TABLE IF EXISTS exercises;

CREATE TABLE exercises (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    resource_id INT NOT NULL,
    name VARCHAR(32) NOT NULL,
    difficulty_level INT NOT NULL,
    link TEXT NOT NULL
)