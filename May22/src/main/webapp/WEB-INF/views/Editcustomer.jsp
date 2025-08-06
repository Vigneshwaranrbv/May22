<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
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
        input[type], .form-input {
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
        <h2 style="text-align:center;">Edit Student</h2>
        
        <form:form method="post" modelAttribute="student" action="/s/update">
            <form:hidden path="id" />

            <label>First Name</label>
            <form:input path="firstname" cssClass="form-input" required="true" />

            <label>Last Name</label>
            <form:input path="lastname" cssClass="form-input" required="true" />

            <label>Email</label>
            <form:input path="email" cssClass="form-input" required="true" />

            <label>Password</label>
            <form:input path="password" cssClass="form-input" required="true" />

            <label>Phone</label>
            <form:input path="phone" cssClass="form-input" required="true" />

            <button class="submit-button" type="submit">Update</button>
        </form:form>
    </div>
</body>
</html>
