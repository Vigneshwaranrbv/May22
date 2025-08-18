<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Customer Home - MedicSure</title>
    <link rel="stylesheet" type="text/css" href="styles/customer_home.css">
</head>
<style>
/* Reset some default browser styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: #f4f8fb;
    color: #333;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

header {
    background-color: #1976d2;
    color: #fff;
    padding: 1rem 2rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

header .logo {
    font-size: 1.8rem;
    font-weight: bold;
}

header nav ul {
    list-style: none;
    display: flex;
    gap: 1.5rem;
}

header nav ul li a {
    color: #fff;
    text-decoration: none;
    font-size: 1rem;
}

header nav ul li a:hover {
    text-decoration: underline;
}

main {
    flex: 1;
    padding: 2rem;
}

.welcome-section {
    text-align: center;
    margin-bottom: 2rem;
}

.welcome-section h1 {
    font-size: 2.5rem;
    color: #1976d2;
    margin-bottom: 1rem;
}

.welcome-section p {
    font-size: 1.1rem;
    margin-bottom: 1.5rem;
}

.welcome-section .button {
    background-color: #1976d2;
    color: #fff;
    padding: 0.8rem 1.5rem;
    text-decoration: none;
    border-radius: 5px;
    font-size: 1rem;
}

.welcome-section .button:hover {
    background-color: #155fa0;
}

.features {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1.5rem;
}

.feature-card {
    background-color: #fff;
    border-radius: 8px;
    padding: 1.5rem;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.feature-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0,0,0,0.15);
}

.feature-card h2 {
    color: #1976d2;
    margin-bottom: 0.8rem;
}

.feature-card p {
    font-size: 1rem;
}

footer {
    background-color: #1976d2;
    color: #fff;
    text-align: center;
    padding: 1rem;
}

</style>
<body>
    <header>
        <div class="logo">MedicSure</div>
        <nav>
            <ul>
                <li><a href="/s/index">Home</a></li>
                <li><a href="/ap/customerapply">Policies List</a></li>
                <li><a href="/ap/appliedpolicy">My Policies</a></li>
                <li><a href="ClaimInsurance.jsp">Claim Insurance</a></li>
                <li><a href="Profile.jsp">Profile</a></li>
                <li><a href="/s/index">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section class="welcome-section">
            <h1>Welcome, <%= session.getAttribute("customerName") != null ? session.getAttribute("customerName") : "Customer" %>!</h1>
            <p>Your trusted partner in health insurance. Explore your policies, manage claims, and update your profile.</p>
            <a href="MyPolicies.jsp" class="button">View My Policies</a>
        </section>

        <section class="features">
            <div class="feature-card">
                <h2>My Policies</h2>
                <p>View and manage all your active health insurance policies in one place.</p>
            </div>
            <div class="feature-card">
                <h2>Claims</h2>
                <p>Submit and track your insurance claims easily and securely.</p>
            </div>
            <div class="feature-card">
                <h2>Profile</h2>
                <p>Update your personal information and contact details anytime.</p>
            </div>
        </section>
    </main>

    <footer>
        &copy; 2025 MedicSure Health Insurance. All rights reserved.
    </footer>
</body>
</html>
