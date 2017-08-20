<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel="stylesheet" href="/resources/assets/reset.css">
    <link rel="stylesheet" href="/resources/assets/supersized.css">
    <link rel="stylesheet" href="/resources/assets/style.css">

    <title>Commentube</title>
</head>
<body>
    <div class="page-container">
     <h1>Commentube</h1>
       <br/>
        <h3>Sign up your account</h3>
</div>
<div>
    <form method="post">
        <input type="text" name="user_email" class="username" placeholder="ID">
        <input type="password" name="user_password" class="password" placeholder="Password">
        <input type="password" name="user_password2" class="password" placeholder="Password">

        <button type="submit">Sign up</button>
        <div class="error"><span>+</span></div>
    </form>
</div>
</body>
</html>