<?php
try {
    $pdo = new PDO("mysql:host=127.0.0.1;port=3308;dbname=finalproject", "root", "");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("DB connection failed: " . $e->getMessage());
}
