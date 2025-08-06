<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Admin Home - MedicSure</title>
    <link rel="stylesheet" type="text/css" href="styles/admin_home.css">
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
    background-color: #f9fbfd;
    color: #333;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

header {
    background-color: #2c3e50;
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
    color: #2c3e50;
    margin-bottom: 1rem;
}

.welcome-section p {
    font-size: 1.1rem;
    margin-bottom: 1.5rem;
}

.admin-actions {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 1.5rem;
}

.action-card {
    background-color: #fff;
    border-radius: 8px;
    padding: 1.5rem;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.action-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0,0,0,0.15);
}

.action-card h2 {
    color: #2c3e50;
    margin-bottom: 0.8rem;
}

.action-card p {
    font-size: 1rem;
    flex-grow: 1;
}

.action-card .button {
    margin-top: 1rem;
    background-color: #2980b9;
    color: #fff;
    padding: 0.8rem 1.5rem;
    text-decoration: none;
    border-radius: 5px;
    font-size: 1rem;
    text-align: center;
}

.action-card .button:hover {
    background-color: #1f6391;
}

footer {
    background-color: #2c3e50;
    color: #fff;
    text-align: center;
    padding: 1rem;
}

</style>
<body>
    <header>
        <div class="logo">MedicSure - Admin Panel</div>
        <nav>
            <ul>
                <li><a href="AdminHome.jsp">Dashboard</a></li>
                <li><a href="/aa/view">Manage Customers</a></li>
                <li><a href="/aa/policy">Manage Policies</a></li>
                <li><a href="/aa/appliedlist">Applied List</a></li>
                <li><a href="ManageClaims.jsp">Manage Claims</a></li>
                <li><a href="Reports.jsp">Reports</a></li>
                <li><a href="/s/index">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section class="welcome-section">
            <h1>Welcome Admin, <%= session.getAttribute("adminName") != null ? session.getAttribute("adminName") : "Admin" %>!</h1>
            <p>Manage your insurance portal with ease — customers, policies, claims, and reports.</p>
        </section>

        <section class="admin-actions">
            <div class="action-card">
                <h2>Manage Customers</h2>
                <p>View, add, or remove customer accounts.</p>
                <a href="ManageCustomers.jsp" class="button">Go</a>
            </div>
            <div class="action-card">
                <h2>Manage Policies</h2>
                <p>Create new policies or update existing ones.</p>
                <a href="ManagePolicies.jsp" class="button">Go</a>
            </div>
            <div class="action-card">
                <h2>Manage Claims</h2>
                <p>Approve or reject insurance claims.</p>
                <a href="ManageClaims.jsp" class="button">Go</a>
            </div>
            <div class="action-card">
                <h2>Reports</h2>
                <p>Generate various system reports.</p>
                <a href="Reports.jsp" class="button">Go</a>
            </div>
        </section>
    </main>

    <footer>
        &copy; 2025 MedicSure Admin Panel. All rights reserved.
    </footer>
</body>
</html>
