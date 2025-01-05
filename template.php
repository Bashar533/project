<?php
    session_name('Website');
    session_start();
    $currentPage = basename($_SERVER['PHP_SELF']);

    $host = "localhost";
    $user = "obakha22"; 
    $pwd = "0DpmxmzsNO"; 
    $db = "obakha22"; 
    $mysqli = new mysqli($host, $user, $pwd, $db);
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Project</title>
        <link rel="stylesheet" href="css/stylesheet.css">
    </head>
    <body>
        <?php
            $navigation = <<<HTML
                <div class="side-nav">
                    <button id="toggle-btn">☰</button>
                    <div class="nav-items">
                        <a href="#" class="nav-item active" data-site-name="Home">
                            <span class="icon">🏠</span>
                            <span class="text">Home</span>
                            <div class="highlight"></div>
                        </a>
                        <a href="#" class="nav-item" data-site-name="Search">
                            <span class="icon">🔍</span>
                            <span class="text">Search</span>
                            <div class="highlight"></div>
                        </a>
                        <a href="#" class="nav-item" data-site-name="Settings">
                            <span class="icon">⚙️</span>
                            <span class="text">Settings</span>
                            <div class="highlight"></div>
                        </a>
                        <a href="#" class="nav-item" data-site-name="Messages">
                            <span class="icon">📩</span>
                            <span class="text">Messages</span>
                            <div class="highlight"></div>
                        </a>
                    </div>
                </div>

                <div class="top-bar">
                    <span id="site-name">Home</span>
                    <span class="user-icon">👤</span>
                </div>
            HTML;
        ?>