<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us - College Management System</title>
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
}
.nav a:hover {
    color: #ffcc00;
}
.container {
    max-width: 750px;
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
.contact-info {
    margin: 20px 0;
    line-height: 1.8;
    font-size: 15px;
}
.contact-info b {
    color: #003366;
    display: inline-block;
    width: 150px;
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
    <h2>Contact Information</h2>
    <div class="contact-info">
        <p><b>Address:</b> 123 Education Campus Road, Knowledge Park, City</p>
        <p><b>Email Support:</b> rajanbhatt@257</p>
        <p><b>Helpdesk Phone:</b> +91-9580811395</p>
        <p><b>Working Hours:</b> Monday - Saturday, 9:00 AM to 5:00 PM</p>
    </div>
</div>

<div class="footer">
    &copy; 2026 College Management System. All Rights Reserved.
</div>

</body>
</html>