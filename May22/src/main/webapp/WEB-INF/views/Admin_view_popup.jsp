<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Surveyor Popup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
.btn {
      margin-top: 5px;
      padding: 10px 10px 10px 10px;
      background-color: green;
      color: white;
      border: none;
      cursor: pointer;
      box-shadow: none
     }
     .assign-btn:hover {
  background-color: green !important;
  color: white !important;
  cursor: default !important;
  box-shadow: none !important;
}
     </style>
<body>

<div class="container mt-5">
    <h2>Click the button to show Surveyor List</h2>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#surveyorModal">
        Open Surveyor Popup
    </button>
     <h2>Assign Surveyor for Customer</h2>
    <p>Customer ID: ${customerid}</p>
    <p>Policy ID: ${policyId}</p> 
    <p>Customer Name: ${customername}</p>
</div>
<!-- Modal -->
<div class="modal fade" id="surveyorModal" tabindex="-1" aria-labelledby="surveyorModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="surveyorModalLabel">Surveyor List</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table class="table table-bordered table-hover">
          <thead class="table-dark">
            <tr>
              <th>Surveyor ID</th>
              <th>User Name</th>
              <th>Email</th>
              <th>Role</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="surveyor" items="${surveyors}">
              <tr>
                <td>${surveyor.surveyorid}</td>
                <td>${surveyor.username}</td>
                <td>${surveyor.email}</td>
                <td>${surveyor.role}</td>
                <td>
               <form action="/aas/assign" method="post">
               <input type="hidden" name="customerid" value="${customer.customerid}" />
               <input type="hidden" name="surveyorid" value="${surveyor.surveyorid}" />
               <input type="hidden" name="status" value="${customer.status}" />
               <button type="submit" class="btn btn-primary btn-sm">Assigning</button>
                </form>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

    </div>
  </div>
</div>
<script>
function loadSurveyors() {
    fetch('/aas/show_surveyor') // New JSON endpoint
        .then(response => response.json())
        .then(data => {
            let tableBody = document.getElementById("surveyorTableBody");
            tableBody.innerHTML = ""; // Clear old data

            data.forEach(surveyor => {
                let row = `<tr>
                    <td>${surveyor.id}</td>
                    <td>${surveyor.username}</td>
                    <td>${surveyor.email}</td>
                    <td>${surveyor.role}</td>
                </tr>`;
                tableBody.innerHTML += row;
            });
        })
        .catch(error => {
            console.error("Error loading surveyors:", error);
        });
}
</script>

</body>
</html>
