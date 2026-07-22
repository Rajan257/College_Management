<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Login Portal - College Management System</title>
<style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f4f6f9;
}
.header {
    background-color: #003366;
    color: white;
    text-align: center;
    padding: 25px;
}
.header h1 {
    margin: 0;
    font-size: 28px;
}
.nav {
    background-color: #004080;
    padding: 12px;
    text-align: center;
}
.nav a {
    color: white;
    text-decoration: none;
    margin: 0 15px;
    font-weight: bold;
    font-size: 15px;
}
.nav a:hover {
    color: #ffcc00;
}
.container {
    max-width: 600px;
    margin: 50px auto;
    background: white;
    padding: 40px;
    border-radius: 8px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    text-align: center;
}
.container h2 {
    color: #003366;
    margin-top: 0;
    margin-bottom: 30px;
}
.portal-btn {
    display: block;
    width: 250px;
    margin: 15px auto;
    padding: 14px;
    background-color: #007BFF;
    color: white;
    text-decoration: none;
    font-weight: bold;
    font-size: 16px;
    border-radius: 6px;
}
.portal-btn:hover {
    background-color: #0056b3;
}
.portal-btn.admin {
    background-color: #28a745;
}
.portal-btn.admin:hover {
    background-color: #1e7e34;
}
.footer {
    text-align: center;
    padding: 20px;
    color: #777;
    font-size: 13px;
    margin-top: 50px;
}
</style>
</head>
<body>

<div class="header">
    <h1>College Management System</h1>
</div>

<div class="nav">
    <a href="index.jsp">Home</a>
    <a href="About.jsp">About Us</a>
    <a href="Contact.jsp">Contact Us</a>
    <a href="login.jsp">Login Portal</a>
</div>

<div class="container">
    <h2>Select Your Login Role</h2>
    <a class="portal-btn" href="student.jsp">Student Login</a>
    <a class="portal-btn" href="faculty.jsp">Faculty Login</a>
    <a class="portal-btn admin" href="admin.jsp">Admin Login</a>
</div>

<div class="footer">
    &copy; 2026 College Management System. All Rights Reserved.
</div>

</body>
</html>