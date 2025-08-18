<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Policy</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f8f9;
      padding: 40px;
    }

    h2 {
      text-align: center;
      color: #007b8a;
    }

    .form-container {
      background-color: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      max-width: 800px;
      margin: 0 auto;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      font-weight: bold;
      margin-bottom: 8px;
      color: #007b8a;
    }

    input[type="text"],
    input[type="number"],
    textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 6px;
      box-sizing: border-box;
      font-size: 16px;
    }

    textarea {
      resize: vertical;
      height: 80px;
    }

    .button-group {
      text-align: center;
      margin-top: 20px;
    }

    button {
      background-color: #007b8a;
      color: white;
      padding: 12px 25px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 16px;
      margin: 0 5px;
    }

    button:hover {
      background-color: #005f6e;
    }

    .back-button {
      display: block;
      margin: 0 auto 30px auto;
      background-color: #007b8a;
      color: white;
      padding: 10px 20px;
      font-size: 16px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
    }

    .back-button:hover {
      background-color: #005f6e;
    }
  </style>
</head>
<body>

  <button class="back-button" onclick="goBack()">Back</button>

  <h2>${adminpolicy.id == null ? 'Create Policy' : 'Edit Policy'}</h2>

  <div class="form-container">
    <form action="/aa/updatepolicy" method="post">
      <input type="hidden" name="id" value="${adminpolicy.id}" />

      <div class="form-group">
        <label>Policy Name</label>
        <input type="text" name="policyname" value="${adminpolicy.policyname}" required />
      </div>

      <div class="form-group">
        <label>Policy Type</label>
        <input type="text" name="policytype" value="${adminpolicy.policytype}" required />
      </div>

      <div class="form-group">
        <label>Sum Insured</label>
        <input type="number" name="suminsured" value="${adminpolicy.suminsured}" required />
      </div>

      <div class="form-group">
        <label>Premium Amount</label>
        <input type="number" name="premiumamount" value="${adminpolicy.premiumamount}" required />
      </div>

      <div class="form-group">
        <label>Duration</label>
        <input type="text" name="duration" value="${adminpolicy.duration}" required />
      </div>

      <div class="form-group">
        <label>Description</label>
        <textarea name="description" required>${adminpolicy.description}</textarea>
      </div>

      <div class="form-group">
        <label>Eligibility</label>
        <textarea name="eligibility" required>${adminpolicy.eligibility}</textarea>
      </div>

      <div class="form-group">
        <label>Terms & Conditions</label>
        <textarea name="termsconditions" required>${adminpolicy.termsconditions}</textarea>
      </div>

      <div class="button-group">
        <button type="submit">${adminpolicy.id == null ? 'Create' : 'Update'} Policy</button>
      </div>
    </form>
  </div>

  <script>
    function goBack() {
      window.history.back(); 
    }
  </script>

</body>
</html>
 