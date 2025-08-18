<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Surveyor View Request</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .top-bar {
            width: 80%;
            margin: auto;
            display: flex;
            justify-content: flex-start;
            margin-bottom: 15px;
        }
        .back-button {
            background-color: #004466;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }
        .back-button:hover {
            background-color: #006699;
        }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #004466;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

<div class="top-bar">
    <button class="back-button" onclick="window.location.href='/sr/surveyor'">← Back</button>
</div>

<h2>Claim Request</h2>

<table>
    <thead>
        <tr>
            <th>Customer ID</th>
            <th>Policy Name</th>
            <th>Policy Type</th>
            <th>Premium Amount(₹)</th>
            <th>Policy ID</th>
            <th>Customer Name</th>
            <th>Email</th>
            <th>Mobile Number</th>
            <th>Duration</th>
            <th>Start Date</th>
            <th>Nominee</th>
            <th>Patient Verification Proof</th>
            <th>Surveyor Id</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="viewclaim" items="${viewclaims}">
            <tr>
                <td>${viewclaim.customerid}</td>
                <td>${viewclaim.policyname}</td>
                <td>${viewclaim.policytype}</td>
                <td>${viewclaim.premiumamount}</td>
                <td>${viewclaim.policyId}</td>
                <td>${viewclaim.customername}</td>
                <td>${viewclaim.email}</td>
                <td>${viewclaim.mobilenumber}</td>
                <td>${viewclaim.duration}</td>
                <td>${viewclaim.startdate}</td>
                <td>${viewclaim.nominee}</td>
                <td>
                <c:choose>
                <c:when test="${not empty viewclaim.filedata and viewclaim.status == 'Pending Surveyor Review'}">
                <a href="/aas/downloadfile?customerid=${viewclaim.customerid}" title="Download"><i class="fa fa-download" style="color: blue;"></i></a>
                </c:when>
                <c:when test="${not empty viewclaim.filedata}">
                <i class="fa fa-download" style="color: gray;" title="Disabled Download"></i>
                </c:when>
                </c:choose>
                </td>
                <td>${viewclaim.surveyor.surveyorid}</td>
                <td>${viewclaim.status}</td>                
                <td>            
                    <form action="/sr/viewpopup" method="get">
                      <input type="hidden" name="customerid" value="${viewclaim.customerid}" />
                      <input type="hidden" name="customername" value="${viewclaim.customername}" />
                      <input type="hidden" name="surveyorid" value="${viewclaim.surveyor.surveyorid}" />
                      <input type="hidden" name="status" value="${viewclaim.status}" />
                      <button type="submit" name="survstatus" value=""><i class="fa fa-upload"></i> Upload Report</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
