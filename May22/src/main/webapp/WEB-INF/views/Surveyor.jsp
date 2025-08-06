<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            padding: 20px;
        }
        .form-container {
            width: 400px;
            background-color: #f9f9f9;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        input[type="text"], input[type="date"], input[type="email"],input[type="password"],input[type="number"],input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        label {
            font-weight: bold;
        }
        .submit-button {
            background-color: #ffaa3c;
            border: none;
            padding: 12px;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
            border-radius: 6px;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 style="text-align:center;">Surveyor Register</h2>
        <form action="surveyor" method="post">
            <label>UserName</label>
            <input type="text" name="username" placeholder="Name" required />
            <label>Email</label>
            <input type="email" name="email" placeholder="Email" required />
            <label>Password</label>
            <input type="Password" name="password" placeholder="Password" required />
            <input type="hidden" value="surveyor" name="role" />
          <button class="submit-button" type="submit">SUBMIT FORM</button>
          <p><a href="/ss/surveyorlogin">Back</a> </p>
        </form>
    </div>
</body>
</html>
