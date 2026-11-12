CREATE DATABASE IF NOT EXISTS CookFusionDB; 
USE CookFusionDB;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Recipes (
    recipe_id INT AUTO_INCREMENT PRIMARY KEY,
    mealdb_id VARCHAR(20) UNIQUE,
    title VARCHAR(150) NOT NULL,
    category VARCHAR(80),
    cuisine VARCHAR(80),
    instructions TEXT,
    image_url VARCHAR(500),
    prep_minutes INT,
    cook_minutes INT,
    servings INT DEFAULT 1,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CHECK (prep_minutes IS NULL OR prep_minutes >= 0),
    CHECK (cook_minutes IS NULL OR cook_minutes >= 0),
    CHECK (servings IS NULL OR servings > 0)
);

CREATE TABLE Ingredients (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE RecipeIngredients (
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    quantity DECIMAL(8,2),
    unit VARCHAR(30),
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id)
        ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
        ON DELETE RESTRICT,
    CHECK (quantity IS NULL OR quantity > 0)
);


CREATE TABLE Favorites (
    user_id INT NOT NULL,
    recipe_id INT NOT NULL,
    saved_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, recipe_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id)
        ON DELETE CASCADE
);

CREATE TABLE MealPlans (
    meal_plan_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    recipe_id INT NOT NULL,
    plan_date DATE NOT NULL,
    meal_type ENUM('Breakfast', 'Lunch', 'Dinner') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id)
        ON DELETE CASCADE,
    UNIQUE (user_id, plan_date, meal_type)
);

CREATE TABLE ShoppingListItems (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    ingredient_id INT,
    item_name VARCHAR(100) NOT NULL,
    quantity DECIMAL(8,2),
    unit VARCHAR(30),
    is_checked BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
        ON DELETE SET NULL,
    CHECK (quantity IS NULL OR quantity > 0)
);

CREATE TABLE LoginHistory (
    login_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    login_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE CASCADE
);