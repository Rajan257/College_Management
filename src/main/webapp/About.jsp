<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - College Management System</title>
<style>
body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Arial, sans-serif;
    background-color: #f4f6f9;
    color: #333;
}
.ticker-bar {
    background-color: #002244;
    color: #ffcc00;
    display: flex;
    align-items: center;
    padding: 6px 15px;
    font-size: 14px;
    font-weight: 500;
    border-bottom: 2px solid #004080;
}
.ticker-tag {
    background-color: #dc3545;
    color: white;
    padding: 3px 10px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: bold;
    margin-right: 12px;
    white-space: nowrap;
}
.ticker-text {
    flex-grow: 1;
    color: #ffffff;
}
.header {
    background: linear-gradient(135deg, #003366, #001a33);
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
    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
}
.nav a {
    color: white;
    text-decoration: none;
    margin: 0 15px;
    font-weight: bold;
    font-size: 15px;
    transition: background 0.2s, color 0.2s;
}
.nav a:hover {
    color: #ffcc00;
}
.container {
    max-width: 800px;
    margin: 40px auto;
    background: white;
    padding: 35px 45px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}
.container h2 {
    color: #003366;
    border-bottom: 2px solid #003366;
    padding-bottom: 8px;
}
.container p {
    line-height: 1.7;
    font-size: 15px;
    color: #555;
}
.feature-list {
    margin-top: 20px;
}
.feature-item {
    margin-bottom: 12px;
    padding-left: 20px;
    position: relative;
    line-height: 1.5;
}
.feature-item::before {
    content: "✔";
    position: absolute;
    left: 0;
    color: #28a745;
    font-weight: bold;
}
.footer {
    text-align: center;
    padding: 20px;
    color: #666;
    font-size: 13px;
    background-color: #e9ecef;
    margin-top: 50px;
}
</style>
</head>
<body>

<div class="ticker-bar">
    <span class="ticker-tag">NOTICES & INSTRUCTIONS</span>
    <marquee class="ticker-text" behavior="scroll" direction="left" scrollamount="6" onmouseover="this.stop();" onmouseout="this.start();">
        🌟 Welcome to College Management System | 🎓 Admissions open for Session 2026-27 | 📋 Semester Examination Results Released | 💡 Support Email: rajanbhatt@257 | ☎ Helpline: +91-9580811395
    </marquee>
</div>

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
    <h2>About Our Institution</h2>
    <p>
        Welcome to the College Management System. Our institution is dedicated to providing high-quality education, fostering academic excellence, and nurturing future leaders in science, technology, engineering, and management.
    </p>

    <h2>System Overview</h2>
    <p>
        This portal provides a unified digital platform for Students, Faculty members, and Administrators to streamline academic operations:
    </p>

    <div class="feature-list">
        <div class="feature-item"><b>Student Portal:</b> View personal profile, update contact information, view campus notices, and change password securely.</div>
        <div class="feature-item"><b>Faculty Portal:</b> Manage student directories, publish official notices, update profile details, and maintain course communication.</div>
        <div class="feature-item"><b>Admin Portal:</b> Comprehensive student and faculty management including add, edit, search, and delete records.</div>
    </div>
</div>

<div class="footer">
    &copy; 2026 College Management System. All Rights Reserved.
</div>

</body>
</html>