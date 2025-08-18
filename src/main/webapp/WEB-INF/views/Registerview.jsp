<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Registration Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #cccccc;
            text-align: center;
            padding: 10px;
        }
        th {
            background-color: #008080;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        caption {
            caption-side: top;
            font-size: 1.5em;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <c:if test="${not empty Registerviews}">
   <table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Password</th>
        <th>Phone</th>
        <th>Action</th>
    </tr>
     <c:forEach var="student" items="${Registerviews}"> 
        <tr>
            <td>${student.id}</td>
            <td>${student.firstname}</td>
            <td>${student.lastname}</td>
            <td>${student.email}</td>
            <td>${student.password}</td>
            <td>${student.phone}</td>
            <td>
                <%-- <a href="/students/${Registerview.id}">View</a> --%> |
                <a href="/s/register-edit/${student.id}">Edit</a> |
                <a href="/s/register-delete/${student.id}" onclick="return confirm('Are you sure?');">Delete</a>
            </td>
        </tr>
     </c:forEach>
</table>
</c:if>
<c:if test="${empty Registerviews}">
    <p style="color:red;">${nodata}</p>
</c:if>
</body>
</html>
