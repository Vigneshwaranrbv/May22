<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Policy List</title>
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
    <button class="back-button" onclick="window.location.href='/ap/customer'">← Back</button>
</div>

<h2>Available Policies</h2>

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
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="policy" items="${policylist}">
            <tr>
                <td>${policy.customerid}</td>
                <td>${policy.policyname}</td>
                <td>${policy.policytype}</td>
                <td>${policy.premiumamount}</td>
                <td>${policy.policyId}</td>
                <td>${policy.customername}</td>
                <td>${policy.email}</td>
                <td>${policy.mobilenumber}</td>
                <td>${policy.duration}</td>
                <td>${policy.startdate}</td>
                <td>${policy.nominee}</td>
                <td>${policy.status}</td>
                <td>
                <c:choose>
                <c:when test="${policy.status eq 'Approved'}">
               <form action="/ap/appliedclaim" method="post" enctype="multipart/form-data" onsubmit="return validateFileUpload()">
                <input type="hidden" name="customerid" value="${policy.customerid}" />      
                <input type="file" name="file" id="fileInput" accept=".jpg,.jpeg,.png,.pdf" onchange="checkFileSelected()" required /><br>
                <input type="hidden" name="status" value="${policy.status}" />
              <br><button type="submit" name="status" value="Claim Request" id="applyButton" disabled>Apply Claim</button>
                </form>
                </c:when>
                <c:otherwise>
                    <button type="button" disabled>Apply Claim</button>
                </c:otherwise>
            </c:choose>
        </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<!-- <script>
            function checkFileSelected() {
                const fileInput = document.getElementById('fileInput');
                const applyButton = document.getElementById('applyButton');

                if (fileInput.files.length > 0) {
                    applyButton.disabled = false;
                } else {
                    applyButton.disabled = true;
                }
            }

            // Optional: Final double-check before submitting
            function validateFileUpload() {
                const fileInput = document.getElementById('fileInput');
                if (fileInput.files.length === 0) {
                    alert("Please select a file before applying.");
                    return false;
                }
                return true;
            }
        </script> -->
        <script>
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll("tr").forEach(function (row) {
        const fileInput = row.querySelector('input[type="file"]');
        const button = row.querySelector('button[type="submit"]');
        
        if (fileInput && button) {
            fileInput.addEventListener("change", function () {
                button.disabled = !fileInput.value;
            });
        }
    });
});
</script>
        
</body>
</html>
