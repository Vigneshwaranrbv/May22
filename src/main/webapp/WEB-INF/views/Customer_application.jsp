<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Apply for Policy</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background-color: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .card {
            background-color: #e9f0ff;
            padding: 15px;
            margin-bottom: 25px;
            border-radius: 8px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            background-color: #0066cc;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        h2 {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Customer & Policy Details</h2>
    <form action="/ap/applying" method="post">
    <div class="card">
        <input type="hidden" name="policyId" value="${adminpolicy.id}" />
        <p><strong>Policy Name:</strong> ${adminpolicy.policyname}</p>
        <input type="hidden" name="policyname" value="${adminpolicy.policyname}" />
        <p><strong>Policy Type:</strong> ${adminpolicy.policytype}</p>
        <input type="hidden" name="policytype" value="${adminpolicy.policytype}" />
        <p><strong>Premium Amount:</strong> ${adminpolicy.premiumamount}</p>
        <input type="hidden" name="premiumamount" value="${adminpolicy.premiumamount}" />
    </div>
    <h2>Apply for Policy</h2>
    
        <label for="customer name">Customer Name:</label>
        <input type="text" id="customer name" name="customername" required />
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required />
        <label for="mobile number">Mobile Number:</label>
        <input type="text" id="mobile number" name="mobilenumber" required />
       <!--  <label for="startdate">Start Date:</label> -->
       <%
    java.time.LocalDate currentDate = java.time.LocalDate.now();
    request.setAttribute("currentDate", currentDate);
      %>

         <input type="hidden" name="startdate" value="${currentDate}" />

        <label for="duration">Duration (in Years):</label>
        <input type="number" id="duration" name="duration" required min="1" />

        <label for="nominee">Nominee Name:</label>
        <input type="text" id="nominee" name="nominee" required />
        <input type="hidden" id="status" name="status" value="Applied Policy" required />
        <button type="submit">Apply Policy</button> <a href="/ap/application"></a>
    </form>
</div>
</body>
</html>
