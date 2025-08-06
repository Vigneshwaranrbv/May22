<!-- <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #00849b;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .login-container {
      background-color: white;
      padding: 40px;
      border-radius: 10px;
      width: 350px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .login-container h2 {
      text-align: center;
      margin-bottom: 30px;
    }

    label {
      display: block;
      margin-bottom: 5px;
    }

    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 12px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .checkbox-container {
      margin-bottom: 20px;
    }

    button {
      width: 100%;
      padding: 12px;
      background-color: #007495;
      color: white;
      border: none;
      border-radius: 4px;
      font-weight: bold;
      cursor: pointer;
    }

    button:hover {
      background-color: #005f77;
    }

    .login-footer {
      text-align: center;
      margin-top: 15px;
      font-size: 14px;
    }

    .login-footer a {
      color: #007495;
      text-decoration: none;
    }

    .login-footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="login-container">
    <h2>Login</h2>
    <form action="login" method="post">
      <label for="email">Email:</label>
      <input type="email" name="email" id="email" placeholder="Enter email" required />

      <label for="password">Password:</label>
      <input type="password" name="password" id="password" placeholder="Enter password" required />
       <input type="hidden" name="role" value="surveyor" id="role" required />
      <button type="submit">SIGN IN</button>
    </form>

    <div class="login-footer">
      <p>Don't have an account? <a href="/ss/surveyor">Sign up</a></p>
      <p><a href="/">Back</a></p>
    </div>
  </div>

  <script>
    function togglePassword() {
      var pwd = document.getElementById("password");
      pwd.type = pwd.type === "password" ? "text" : "password";
    }
    <script>
    function login() {
      const role = document.getElementById("role").value;

      if (role === "customer") {
        window.location.href = "/s/CustomerLogin";
      } else if (role === "admin") {
        window.location.href = "/s/AdminLogin";
      } else if (role === "surveyor") {
        window.location.href = "/s/SurveyorLogin";
      }
    }
  </script>
  </script>
</body>
</html>
 -->
 
 <!-- <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #00849b;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .login-container {
      background-color: white;
      padding: 40px;
      border-radius: 10px;
      width: 350px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .login-container h2 {
      text-align: center;
      margin-bottom: 30px;
    }

    label {
      display: block;
      margin-bottom: 5px;
    }

    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 12px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .checkbox-container {
      margin-bottom: 20px;
    }

    button {
      width: 100%;
      padding: 12px;
      background-color: #007495;
      color: white;
      border: none;
      border-radius: 4px;
      font-weight: bold;
      cursor: pointer;
    }

    button:hover {
      background-color: #005f77;
    }

    .login-footer {
      text-align: center;
      margin-top: 15px;
      font-size: 14px;
    }

    .login-footer a {
      color: #007495;
      text-decoration: none;
    }

    .login-footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <div class="login-container">
    <h2>Login</h2>
    <form action="login" method="post">
      <label for="email">Email:</label>
      <input type="email" name="email" id="email" placeholder="Enter email" required />
      <label for="password">Password:</label>
      <input type="password" name="password" id="password" placeholder="Enter password" required />
       <input type="hidden" name="role" value="surveyor" id="role" required />
      <button type="submit">SIGN IN</button>
    </form>

    <div class="login-footer">
      <p>Don't have an account? <a href="/ss/surveyor">Sign up</a></p>
      <p><a href="/">Back</a></p>
    </div>
  </div>

  <script>
    function togglePassword() {
      var pwd = document.getElementById("password");
      pwd.type = pwd.type === "password" ? "text" : "password";
    }
    <script>
    function login() {
      const role = document.getElementById("role").value;

      if (role === "customer") {
        window.location.href = "/s/CustomerLogin";
      } else if (role === "admin") {
        window.location.href = "/s/AdminLogin";
      } else if (role === "surveyor") {
        window.location.href = "/s/SurveyorLogin";
      }
    }
  </script>
  </script>
</body>
</html>
 -->
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #00849b;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .login-container {
      background-color: white;
      padding: 40px;
      border-radius: 10px;
      width: 350px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .login-container h2 {
      text-align: center;
      margin-bottom: 30px;
    }

    label {
      display: block;
      margin-bottom: 5px;
    }

    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 12px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .checkbox-container {
      margin-bottom: 20px;
    }

    button {
      width: 100%;
      padding: 12px;
      background-color: #007495;
      color: white;
      border: none;
      border-radius: 4px;
      font-weight: bold;
      cursor: pointer;
    }

    button:hover {
      background-color: #005f77;
    }

    .login-footer {
      text-align: center;
      margin-top: 15px;
      font-size: 14px;
    }

    .login-footer a {
      color: #007495;
      text-decoration: none;
    }

    .login-footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

  <!-- POPUP Success -->
  <c:if test="${not empty message}">
    <script>
      alert("${message}");
      // after success, go to Customer_home
      window.location.href = "/ss/Surveyor_home";
    </script>
  </c:if>

  <!-- POPUP Error -->
  <c:if test="${not empty error}">
    <script>
      alert("${error}");
    </script>
  </c:if>

  <div class="login-container">
    <h2>Login</h2>
    <form action="login" method="post">
      <label for="email">Email:</label>
      <input type="email" name="email" id="email" placeholder="Enter email" required />

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" placeholder="Enter password" required />
      <input type="hidden" id="role" name="role" value="surveyor" required />

      <button type="submit">SIGN IN</button>
    </form>

    <div class="login-footer">
      <p>Don't have an account? <a href="/ss/surveyor">Sign up</a></p>
      <p><a href="/">Back</a></p>
    </div>
  </div>

  <script>
    function togglePassword() {
      var pwd = document.getElementById("password");
      pwd.type = pwd.type === "password" ? "text" : "password";
    }
  </script>
  <c:if test="${not empty message}">
  <script>
    alert("${message}");
    window.location.href = "/ss/Surveyor_home";
  </script>
</c:if>
<c:if test="${not empty error}">
  <script>
    alert("${error}");
  </script>
</c:if>

  

</body>
</html>
 