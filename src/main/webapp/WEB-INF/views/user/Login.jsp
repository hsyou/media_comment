<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<!DOCTYPE html>

<html lang="ko" class="no-js">
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="/resources/assets/reset.css">
    <link rel="stylesheet" href="/resources/assets/supersized.css">
    <link rel="stylesheet" href="/resources/assets/style.css">
</head>
<body>

<div class="page-container">
    <h1>Commentube</h1>
    <form action="" method="post">
        <input type="text" name="ID" class="username" placeholder="ID">
        <input type="password" name="password" class="password" placeholder="Password">
        <button type="submit" onclick="location.href='main.html'">Login</button>
        <button type="button" onclick="location.href='Sign_in.html'">Sign in</button>
        <div class="error"><span>+</span></div>
    </form>
</div>
<div class="page-container">
    <form action="" method="post">
        <button type="submit" onclick="location.href='main.html'">facebook 으로 인증하기</button>
    </form>
</div>
    <div id="footer" style="border :0px solid transparent;height:50px;margin-top:350px;background-color : transparent; background:linear-gradient(10deg, rgba(0,0,0,0.15), rgba(0,0,0,0)); text-shadow:0 3px 0 black;">
    <p style="color : white; font-weight:600;"></p>
</div>
</body>
</html>