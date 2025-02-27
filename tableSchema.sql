-- Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(20) NOT NULL
);

-- Transactions Table (for tracking expenses)
CREATE TABLE Transactions (
    user_id INT,
    transaction_id INT PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    category_id INT,
    date DATE NOT NULL
);

-- Savings Goals Table
CREATE TABLE Savings_Goals (
    goal_id INT PRIMARY KEY,
    user_id INT,
    goal_name VARCHAR(30) NOT NULL,
    target_amount DECIMAL(10, 2) NOT NULL,
    current_amount DECIMAL(10, 2),
    category_id INT,
    income INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
