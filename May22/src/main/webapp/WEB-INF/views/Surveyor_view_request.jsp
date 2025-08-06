<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Assigned Claims</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 30px;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0px 0px 8px rgba(0,0,0,0.2);
            background-color: #fff;
        }
        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn-back {
            display: block;
            width: 100px;
            margin: 20px auto;
            text-align: center;
            padding: 10px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Assigned Claims</h2>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Customer Name</th>
                <th>Policy Number</th>
                <th>Claim Status</th>
                <th>Assigned Surveyor</th>
                <th>Assigned Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="claim" items="${assignedClaimsList}">
                <tr>
                    <td>${claim.id}</td>
                    <td>${claim.customerName}</td>
                    <td>${claim.policyNumber}</td>
                    <td>${claim.claimStatus}</td>
                    <td>${claim.assignedSurveyor}</td>
                    <td>${claim.assignedDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="/surveyor/home" class="btn-back">Back</a>
</body>
</html>
