<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Policy Form</title>
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

    form {
      background-color: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      max-width: 800px;
      margin: auto;
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
    }

    textarea {
      resize: vertical;
      height: 80px;
    }

    button {
      background-color: #007b8a;
      color: white;
      padding: 12px 25px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 16px;
    }

    button:hover {
      background-color: #005f6e;
    }
  </style>
</head>
<body>

  <h2>Create Policy</h2>
  <div class="form-group" style="text-align: center; margin-top: 10px;">
      <button type="button" onclick="window.location.href='/aa/policy'">Back</button>
    </div>
  <form action="/aa/addpolicy" method="post">
 
      <div class="form-group">
      <label for="policyName">Policy Name</label>
      <input type="text" id="policyName" name="policyname" required>
    </div>

    <div class="form-group">
      <label for="policyType">Policy Type</label>
      <input type="text" id="policyType" name="policytype" required>
    </div>

    <div class="form-group">
      <label for="sumInsured">Sum Insured</label>
      <input type="number" id="sumInsured" name="suminsured" required>
    </div>

    <div class="form-group">
      <label for="premiumAmount">Premium Amount</label>
      <input type="number" id="premiumAmount" name="premiumamount" required>
    </div>

    <div class="form-group">
      <label for="duration">Duration (months/years)</label>
      <input type="text" id="duration" name="duration" required>
    </div>

    <div class="form-group">
      <label for="description">Description</label>
      <textarea id="description" name="description" required></textarea>
    </div>

    <div class="form-group">
      <label for="eligibility">Eligibility</label>
      <textarea id="eligibility" name="eligibility" required></textarea>
    </div>

    <div class="form-group">
      <label for="terms">Terms & Conditions</label>
      <textarea id="terms" name="termsconditions" required></textarea>
    </div>

    <div class="form-group" style="text-align: center;">
      <button type="submit">Submit Policy</button>
    </div>
  </form>
<script>
    function goBack() {
      window.history.back(); // or: window.location.href = 'admin-dashboard.jsp';
    }
  </script>
</body>
</html>
