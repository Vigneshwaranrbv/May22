<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Manage Customers</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #f5f8fa;
      margin: 0;
      padding: 20px;
    }

    h2 {
      text-align: center;
      color: #004d66;
    }

    .container {
      width: 90%;
      margin: 0 auto;
    }

    .btn-add {
      display: inline-block;
      background-color: #00849b;
      color: white;
      padding: 8px 15px;
      text-decoration: none;
      border-radius: 5px;
      float: right;
      margin-bottom: 10px;
    }

    .search-bar {
      width: 30%;
      padding: 8px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background: white;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    th {
      background-color: #00849b;
      color: white;
      text-align: left;
      padding: 12px;
    }

    td {
      padding: 12px;
      border-bottom: 1px solid #ddd;
    }

    tr:hover {
      background-color: #f1f1f1;
    }

    .action-links a {
      text-decoration: none;
      color: #007bff;
      margin: 0 5px;
      font-weight: bold;
    }

    .action-links a:hover {
      color: #0056b3;
    }
  </style>

  <script>
    function filterByIdOrPhone() {
      var input = document.getElementById("searchId");
      var filter = input.value.toUpperCase();
      var table = document.getElementById("customerTable");
      var tr = table.getElementsByTagName("tr");

      for (var i = 1; i < tr.length; i++) {
        var idTd = tr[i].getElementsByTagName("td")[0]; // ID
        var phoneTd = tr[i].getElementsByTagName("td")[5]; // Phone
        var idText = idTd ? idTd.textContent || idTd.innerText : "";
        var phoneText = phoneTd ? phoneTd.textContent || phoneTd.innerText : "";

        if (
          idText.toUpperCase().indexOf(filter) > -1 ||
          phoneText.toUpperCase().indexOf(filter) > -1
        ) {
          tr[i].style.display = "";
        } else {
          tr[i].style.display = "none";
        }
      }
    }
  </script>
</head>

<body>
  <div class="container">
    <h2>Customer List</h2>

    <a href="/s/admin_home" class="btn-add">Back</a>

    <input type="text" id="searchId" onkeyup="filterByIdOrPhone()" class="search-bar" placeholder="Search by ID or Phone">

    <table id="customerTable">
      <thead>
        <tr>
          <th>ID</th>
          <th>First Name</th>
          <th>Last Name</th>
          <th>Email</th>
          <th>Password</th>
          <th>Phone</th>
          <th>Role</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="viewcustomer" items="${viewcustomers}">
          <tr>
            <td>${viewcustomer.id}</td>
            <td>${viewcustomer.firstname}</td>
            <td>${viewcustomer.lastname}</td>
            <td>${viewcustomer.email}</td>
            <td>${viewcustomer.password}</td>
            <td>${viewcustomer.phone}</td>
            <td>${viewcustomer.role}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</body>
</html>
 
 