<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Policies</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f4f8;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #004466;
            margin-bottom: 30px;
        }
        table {
            width: 90%;
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
            background-color: none;
        }
        .btn {
            padding: 6px 14px;
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            font-weight: bold;
        }
        .btn-add {
      display: inline-block;
      background-color: #00849b;
      color: white;
      padding: 8px 15px;
      text-decoration: none;
      border-radius: 2px;
      float: right;
      margin-bottom: 8px;
      margin-right: 25px;
    }
        /* .approve-btn {
            background-color: #28a745;
        }
        .decline-btn {
            background-color: #dc3545;
        } */.btn {
    padding: 6px 12px;
    margin: 5px;
    border: none;
    border-radius: 4px;
    color: white;
    cursor: pointer;
  }
  .highlight-header {
        background-color: #4CAF50; /* green background */
        color: white;
    }
.approve-btn {
    background-color: #28a745;
}
.decline-btn {
    background-color: #dc3545;
}
.btn-primary {
    background-color: #007bff;
}
        
        .btn:hover {
            opacity: 0.9;
        }
    </style>
</head>
<body>

<h2>My Policy Applications</h2>
<a href="/s/admin_home" class="btn-add">Back</a>
<table>
    <thead>
        <tr>
            <th>Customer ID</th>
            <th>Policy Name</th>
            <th>Policy Type</th>
            <th>Premium (₹)</th>
            <th>Policy ID</th>
            <th>Customer Name</th>
            <th>Email</th>
            <th>Mobile Number</th>
            <th>Duration</th>
            <th>Start Date</th>
            <th>Nominee</th>
            <th>File Data</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="appliedpolicies" items="${appliedpolicies}">
            <tr>
                <td>${appliedpolicies.customerid}</td>
                <td>${appliedpolicies.policyname}</td>
                <td>${appliedpolicies.policytype}</td>
                <td>${appliedpolicies.premiumamount}</td>
                <td>${appliedpolicies.policyId}</td>
                <td>${appliedpolicies.customername}</td>
                <td>${appliedpolicies.email}</td>
                <td>${appliedpolicies.mobilenumber}</td>
                <td>${appliedpolicies.duration}</td>
                <td>${appliedpolicies.startdate}</td>
                <td>${appliedpolicies.nominee}</td>
                <td>
                <c:choose>
                <c:when test="${not empty appliedpolicies.filedata}">
                <a href="/aas/downloadfile?customerid=${appliedpolicies.customerid}">Download File</a>
                </c:when>
                <c:otherwise>
                 No File Uploaded
                </c:otherwise>
                </c:choose>
                </td>
                <td>${appliedpolicies.status}</td>
                <td>
                <c:choose>
  <c:when test="${appliedpolicies.status eq 'Claim Request'}">
  <form action="/aas/show_surveyor" method="get">
  <input type="hidden" name="customerid" value="${appliedpolicies.customerid}"/>
  <input type="hidden" name="policyId" value="${appliedpolicies.policyId}" />
  <input type="hidden" name="customername" value="${appliedpolicies.customername}" /> 
  <button type="submit" class="btn btn-primary">Sent Surveyor</button>
  </form>
  </c:when>
  <c:when test="${appliedpolicies.status eq 'Pending Surveyor Review'}">
      <button class="btn btn-secondary" disabled>Sent Surveyor</button>
    </c:when>
  <c:when test="${appliedpolicies.status eq 'Approved' || appliedpolicies.status eq 'Declined'}">
    <!-- Already decided, disable buttons -->
    <button class="btn approve-btn" disabled>Approve</button>
    <button class="btn decline-btn" disabled>Declined</button>
  </c:when>
  
  <c:otherwise>
    <!-- Show active buttons for approval/decline -->
    <form action="/ap/approvePolicy" method="post" style="display:inline;">
      <input type="hidden" name="customerid" value="${appliedpolicies.customerid}" />
      <button type="submit" name="status" value="Approved" class="btn approve-btn">Approve</button>
    </form>

    <form action="/ap/approvePolicy" method="post" style="display:inline;">
      <input type="hidden" name="customerid" value="${appliedpolicies.customerid}" />
      <button type="submit" name="status" value="Declined" class="btn decline-btn">Declined</button>
    </form>
  </c:otherwise>

</c:choose>
</td>
                
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>