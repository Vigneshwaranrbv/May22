<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String customerid = request.getParameter("customerid");
    String customername = request.getParameter("customername");
    String surveyorid = request.getParameter("surveyorid");
    String status = request.getParameter("status");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload Report</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .popup-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .popup-box {
            background-color: #fff;
            padding: 30px;
            width: 400px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-top: 6px solid #004466;
        }

        .popup-box h2 {
            margin-top: 0;
            color: #004466;
            text-align: center;
        }

        .popup-box p {
            margin: 10px 0;
            font-size: 15px;
        }

        .popup-box label {
            display: block;
            margin: 15px 0 5px;
            font-weight: bold;
        }

        .popup-box input[type="file"],
        .popup-box select {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .popup-box button {
            margin-top: 20px;
            background-color: #004466;
            color: white;
            border: none;
            padding: 10px 18px;
            font-size: 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .popup-box button:hover {
            background-color: #006699;
        }
    </style>
</head>
<body>

<div class="popup-container">
    <div class="popup-box">
        <h2>Upload Report</h2>

        <p><strong>Customer ID:</strong> <%= customerid %></p>
        <p><strong>Customer Name:</strong> <%= customername %></p>
        <p><strong>Surveyor ID:</strong> <%= surveyorid %></p>
        <p><strong>Admin Claim Request:</strong> <%= status %></p>

        <form action="/cs/upload" method="post" enctype="multipart/form-data">
            <input type="hidden" name="customerid" value="<%= customerid %>">
            <input type="hidden" name="surveyorid" value="<%= surveyorid %>">

            <label for="reportFile">Select Report File:</label>
            <input type="file" name="file" id="reportFile" required>

            <label for="status">Select Status:</label>
            <select name="survstatus" id="status" required>
                <option value="">-- Select --</option>
                <option value="Approved">Approved</option>
                <option value="Rejected">Rejected</option>
                <option value="Hold">Hold</option>
            </select>

            <button type="submit">Submit Report</button>
        </form>
    </div>
</div>
</body>
</html>
