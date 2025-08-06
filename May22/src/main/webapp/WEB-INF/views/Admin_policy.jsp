 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Policy List</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f8f9;
      padding: 20px;
    }

    h2 {
      text-align: center;
      color: #333;
    }

    .top-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 15px;
    }

    .search-box {
      width: 250px;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .btn {
      padding: 10px 20px;
      background-color: teal;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .btn:hover {
      background-color: #005f5f;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
    }

    th, td {
      padding: 12px;
      border: 1px solid #ddd;
      text-align: left;
    }

    th {
      background-color: teal;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    .actions {
      display: flex;
      gap: 10px;
    }

    .action-btn {
      padding: 5px 10px;
      font-size: 14px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    .edit-btn {
      background-color: #4CAF50;
      color: white;
    }

    .delete-btn {
      background-color: #f44336;
      color: white;
      text-decoration: none;
    }

    .action-btn:hover {
      opacity: 0.9;
    }
     .btn-add {
      display: inline-block;
      background-color: #00849b;
      color: white;
      padding: 8px 15px;
      text-decoration: none;
      border-radius: 5px;
      float: right;
      margin-bottom: 2px;
    }
  </style>
</head>
<body>

  <h2>Policy List</h2>

  <div class="top-bar">
    <input type="text" class="search-box" placeholder="Search by ID or Name" id="searchInput" onkeyup="filterTable()" />
    <button class="btn" onclick="window.location.href='/aa/addpolicy'">+ Add Policy</button><br>
    <a href="/s/admin_home" class="btn-add">Back</a>
  </div>

  <table id="policyTable">
    <thead>
      <tr>
        <th>ID</th>
        <th>Policy Name</th>
        <th>Policy Type</th>
        <th>Sum Insured</th>
        <th>Premium Amount</th>
        <th>Duration</th>
        <th>Description</th>
        <th>Eligibility</th>
        <th>Terms & Conditions</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="policy" items="${policyList}">
        <tr>
          <td>${policy.id}</td>
          <td>${policy.policyname}</td>
          <td>${policy.policytype}</td>
          <td>${policy.suminsured}</td>
          <td>${policy.premiumamount}</td>
          <td>${policy.duration}</td>
          <td>${policy.description}</td>
          <td>${policy.eligibility}</td>
          <td>${policy.termsconditions}</td>
          <td class="actions">
            <button class="action-btn edit-btn" onclick="window.location.href='/aa/editpolicy?id=${policy.id}'">Edit</button>
           <%-- <button class="action-btn delete-btn" onclick="window.location.href='/aa/deletepolicy?id=${policy.id}'">Delete</button> --%>
 <a class="action-btn delete-btn" href="/aa/deletepolicy?id=${policy.id}" onclick="return confirm('Are you sure you want to delete this policy?');">Delete</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <script>
    function filterTable() {
      const input = document.getElementById("searchInput").value.toLowerCase();
      const rows = document.querySelectorAll("#policyTable tbody tr");

      rows.forEach(row => {
        const id = row.children[0].textContent.toLowerCase();
        const name = row.children[1].textContent.toLowerCase();
        row.style.display = (id.includes(input) || name.includes(input)) ? "" : "none";
      });
    }

    function confirmDelete(id) {
      if (confirm("Are you sure you want to delete this policy?")) {
        window.location.href = 'delete-policy?id=' + id;
      }
    }
  </script>

</body>
</html>
 