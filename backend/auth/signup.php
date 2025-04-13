<?php
session_start();
require_once 'db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);
    $confirm = trim($_POST['confirm-password']);

    if (empty($email) || empty($username) || empty($password) || empty($confirm)) {
        die("Please fill in all fields.");
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        die("Invalid email.");
    }

    if ($password !== $confirm) {
        die("Passwords do not match.");
    }

    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

    try {
        $stmt = $pdo->prepare("INSERT INTO users (email, username, password) VALUES (?, ?, ?)");
        $stmt->execute([$email, $username, $hashedPassword]);

        header("Location: ../frontend/login.html");
        exit;
    } catch (PDOException $e) {
        if ($e->getCode() == 23000) {
            die("Email or username already exists");
        }
        die("Signup failed: " . $e->getMessage());
    }
}
