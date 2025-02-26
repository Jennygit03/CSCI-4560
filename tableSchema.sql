-- Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    password VARCHAR(30) NOT NULL,
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Categories Table (for expense categorization)
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(20) NOT NULL
);

-- Transactions Table (for tracking expenses)
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    user_id INT,
    category_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    date DATE NOT NULL
);

-- Savings Goals Table (with total contributions stored in the same table)
CREATE TABLE Savings_Goals (
    goal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    goal_name VARCHAR(30) NOT NULL,
    target_amount DECIMAL(10, 2) NOT NULL,
    current_amount DECIMAL(10, 2) DEFAULT 0.00,
    total_contributions DECIMAL(10, 2) DEFAULT 0.00,  -- Tracks total contributions
    due_date DATE,
    category_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Bills Table (for bill reminders and payment scheduling)
CREATE TABLE Bills (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    bill_name VARCHAR(30) NOT NULL,
    amount_due DECIMAL(10, 2) NOT NULL,
    due_date DATE NOT NULL,
    payment_date DATE,
    paid_status BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
