
-- Users Table: stores personal infomation
CREATE TABLE Users(
    user_id INT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    date_joined TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Income Table: track income source for financial analysis
CREATE TABLE Income(
    income_id INT PRIMARY KEY,
    user_id INT,
    income_source VARCHAR(50) NOT NULL,
    income_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Categories Table: group categories in to food, electric, transportation etc
CREATE TABLE Categories(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);


-- Savings Goals Table: tracks user's saving goals
CREATE TABLE Savings_goals (
    goal_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    goal_name VARCHAR(50) NOT NULL,
    target_amount DECIMAL(10, 2) NOT NULL,
    current_amount DECIMAL(10, 2) DEFAULT 0,
    category_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Transactions Table: tracks user's spending activity
CREATE TABLE Transactions(
    user_id INT,
    transaction_id INT PRIMARY KEY,
    transaction_amount DECIMAL(10, 2) NOT NULL,
    category_id INT,
    transaction_date DATE NOT NULL,
    transaction_location VARCHAR(50),
	FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Bills Table: stores expenses like rent, utilities, etc
CREATE TABLE Bills(
    bill_id INT PRIMARY KEY,
    user_id INT,
    bill_name VARCHAR(30) NOT NULL,
    bill_amount DECIMAL(10, 2) NOT NULL,
    due_date DATE NOT NULL,
    payment_date DATE,
    paid_status BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

 -- Report table: to generate a monthly report to let users know about 
 -- their purchases and whether they're over or under budget
CREATE TABLE Report(
    report_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    report_month DATE NOT NULL,
    total_income DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    total_expenses DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    budget_status ENUM('under budget', 'on budget', 'over budget') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

