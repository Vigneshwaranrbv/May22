<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Medical Insurance - Health Insurance</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', sans-serif;
    }
    body {
      background-color: #f4f8fc;
      color: #333;
    }
    header {
      background-color: #007acc;
      padding: 20px;
      color: white;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .logo {
      font-size: 24px;
      font-weight: bold;
    }
    nav {
      position: relative;
    }
    nav a {
      color: white;
      text-decoration: none;
      margin-left: 20px;
      font-weight: 500;
    }
    nav a:hover {
      text-decoration: underline;
    }
    .dropdown {
      position: relative;
      display: inline-block;
    }
    .dropdown-btn {
      background-color: #007acc;
      color: white;
      border: none;
      font-size: 16px;
      cursor: pointer;
      padding: 10px;
    }
    .dropdown-content {
      display: none;
      position: absolute;
      background-color: white;
      min-width: 160px;
      box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
      z-index: 1;
      right: 0;
    }
    .dropdown-content a {
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
    }
    .dropdown-content a:hover {
      background-color: #f1f1f1;
    }
    .dropdown:hover .dropdown-content {
      display: block;
    }
    .hero {
      text-align: center;
      padding: 100px 20px;
      background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.4)),
        url('https://img.freepik.com/free-photo/health-insurance-concept-with-clipboard_23-2148576645.jpg') no-repeat center center/cover;
      color: white;
    }
    .hero h1 {
      font-size: 48px;
      margin-bottom: 20px;
    }
    .hero p {
      font-size: 20px;
      margin-bottom: 40px;
    }
    .hero .btn {
      padding: 15px 30px;
      margin: 10px;
      background-color: #007acc;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      text-decoration: none;
      cursor: pointer;
    }
    .hero .btn:hover {
      background-color: #005e99;
    }
    footer {
      background-color: #007acc;
      color: white;
      text-align: center;
      padding: 10px;
      margin-top: 30px;
    }
  </style>
</head>
<body>

  <header>
    <div class="logo">Insurance</div>
    <nav>
      <a href="#">Home</a>
      <a href="#about">About</a>
      <a href="#services">Services</a>

      <!-- Login Dropdown -->
      <div class="dropdown">
        <button class="dropdown-btn">Login</button>
        <div class="dropdown-content">
          <a href="/sss/Adminlogin">Admin</a>
          <a href="/s/Customerlogin">Customer</a>
          <a href="/ss/Surveyorlogin">Surveyor</a>
        </div>
      </div>

      <!-- <a href="/register">SignUp</a> -->
    </nav>
  </header>

  <section class="hero">
    <h1>Your Health, Our Priority</h1>
    <p>Protect your family with the best medical insurance plans</p>
    <a href="/register" class="btn">------</a>
  </section>

  <footer>
    <p>© 2025 MedicSure Insurance. All rights reserved.</p>
  </footer>

</body>
</html>
 