<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Surveyor Home - MedicSure</title>
    <link rel="stylesheet" type="text/css" href="styles/surveyor_home.css">
</head>
<style>
/* Reset default browser styles */
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
    background-color: #34495e;
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
    color: #34495e;
    margin-bottom: 1rem;
}

.welcome-section p {
    font-size: 1.1rem;
    margin-bottom: 1.5rem;
}

.surveyor-actions {
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
    color: #34495e;
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
    background-color: #34495e;
    color: #fff;
    text-align: center;
    padding: 1rem;
}

</style>
<body>
    <header>
        <div class="logo">MedicSure - Surveyor Panel</div>
        <nav>
            <ul>
                <li><a href="SurveyorHome.jsp">Dashboard</a></li>
                <li><a href="/sr/viewrequest">Assigned Claims</a></li>
                <li><a href="VerifyDocuments.jsp">Verify Documents</a></li>
                <li><a href="SurveyReports.jsp">Survey Reports</a></li>
                <li><a href="/s/index">Logout</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section class="welcome-section">
            <h1>Welcome Surveyor, <%= session.getAttribute("surveyorName") != null ? session.getAttribute("surveyorName") : "Surveyor" %>!</h1>
            <p>Manage your assigned claims and submit your survey reports.</p>
        </section>

        <section class="surveyor-actions">
            <div class="action-card">
                <h2>Assigned Claims</h2>
                <p>View and update the status of claims assigned to you.</p>
                <a href="AssignedClaims.jsp" class="button">Go</a>
            </div>
            <div class="action-card">
                <h2>Verify Documents</h2>
                <p>Verify uploaded documents related to claims and policies.</p>
                <a href="VerifyDocuments.jsp" class="button">Go</a>
            </div>
            <div class="action-card">
                <h2>Submit Survey Reports</h2>
                <p>Create and submit detailed reports for each verified claim.</p>
                <a href="SurveyReports.jsp" class="button">Go</a>
            </div>
        </section>
    </main>

    <footer>
        &copy; 2025 MedicSure Surveyor Panel. All rights reserved.
    </footer>
</body>
</html>
