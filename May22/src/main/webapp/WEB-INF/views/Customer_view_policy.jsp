<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Policy List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            padding: 20px;
        }

        .container {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            max-width: 900px;
            margin: auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        #searchInput {
            width: 50%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn-add {
      display: inline-block;
      background-color: #007BFF;
      color: white;
      padding: 8px 15px;
      text-decoration: none;
      border-radius: 5px;
      float: right;
      margin-bottom: 10px;
       }
        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #007BFF;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .no-data {
            text-align: center;
            color: red;
            font-style: italic;
        }
    </style>

    <script>
        function filterTable() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            let rows = document.querySelectorAll("#policyTable tbody tr");

            let anyVisible = false;

            rows.forEach(row => {
                let policyName = row.cells[1].innerText.toLowerCase();
                if (policyName.includes(input)) {
                    row.style.display = "";
                    anyVisible = true;
                } else {
                    row.style.display = "none";
                }
            });

            document.getElementById("noDataRow").style.display = anyVisible ? "none" : "";
        }
    </script>
</head>
<body>
<div class="container">
    <h2>Policy List</h2>
    <input type="text" id="searchInput" onkeyup="filterTable()" placeholder="Search by Policy Name..." />
    <a href="/s/customer_home" class="btn-add">HOME</a>
    <table id="policyTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Policies List</th>
                <th>Policies Type</th>
                <th>Sum Insurence</th>
                <th>Premium Amount</th>
                <th>Duration</th>
                <th>Description</th>
                <th>Eligibility</th>
                <th>Terms condition</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
    <c:forEach var="policies" items="${customerapply}">
        <tr>
            <td>${policies.id}</td>
            <td>${policies.policyname}</td>
            <td>${policies.policytype}</td>
            <td>${policies.suminsured}</td>
            <td>${policies.premiumamount}</td>
            <td>${policies.duration}</td>
            <td>${policies.description}</td>
            <td>${policies.eligibility}</td>
            <td>${policies.termsconditions}</td>
            <td>
                <a href="/ap/application?policyId=${policies.id}">Apply</a> <!-- you can replace this with action -->
            </td>
        </tr>
    </c:forEach>

    <!-- No data row -->
    <c:if test="${empty customerapply}">
        <tr>
            <td colspan="10" class="no-data">No policies available</td>
        </tr>
    </c:if>
</tbody>

    </table>
</div>
</body>
</html>
