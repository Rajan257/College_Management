<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>College Management System - Excellence in Education</title>
<style>
* {
    box-sizing: border-box;
}
body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f8f9fa;
    color: #333;
}

/* 1. Top Contact Utility Bar */
.top-utility-bar {
    background-color: #3d001a;
    color: #ffffff;
    padding: 8px 30px;
    font-size: 13px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid rgba(255,255,255,0.1);
}
.top-utility-left span {
    margin-right: 20px;
}
.top-utility-right a {
    color: #ffffff;
    text-decoration: none;
    margin-left: 12px;
    background-color: #007bff;
    padding: 3px 10px;
    border-radius: 3px;
    font-size: 12px;
    font-weight: 600;
}
.top-utility-right a.btn-fee {
    background-color: #28a745;
}

/* 2. Main Brand Header */
.main-header {
    background-color: #ffffff;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
}
.brand-logo {
    display: flex;
    align-items: center;
    text-decoration: none;
}
.logo-icon {
    width: 45px;
    height: 45px;
    background: #cc0000;
    color: white;
    font-weight: bold;
    font-size: 24px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    margin-right: 12px;
    border: 3px solid #ffcc00;
}
.brand-text h1 {
    margin: 0;
    font-size: 22px;
    color: #002244;
    letter-spacing: 0.5px;
    font-weight: 800;
}
.brand-text p {
    margin: 2px 0 0;
    font-size: 12px;
    color: #666;
    letter-spacing: 1px;
    text-transform: uppercase;
}

/* 3. Navigation Bar - Hover effect only (No fixed red color) */
.main-nav {
    background-color: #002244;
    padding: 0 30px;
    display: flex;
    align-items: center;
    box-shadow: 0 3px 8px rgba(0,0,0,0.15);
}
.main-nav a {
    color: #ffffff;
    text-decoration: none;
    padding: 14px 18px;
    font-weight: 600;
    font-size: 14px;
    display: inline-block;
    transition: background 0.2s, color 0.2s;
}
.main-nav a:hover {
    background-color: #cc0000;
    color: #ffffff;
}

/* 4. Hero Section with Side Admission Form */
.hero-wrapper {
    background: linear-gradient(rgba(0, 34, 68, 0.75), rgba(0, 34, 68, 0.75)), url('Image/bbd image.jpg');
    background-size: cover;
    background-position: center;
    padding: 50px 30px 60px;
    min-height: 480px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.hero-content {
    max-width: 580px;
    color: #ffffff;
}
.hero-content h2 {
    font-size: 40px;
    margin: 0 0 15px;
    line-height: 1.2;
    font-weight: 800;
    color: #ffffff;
}
.hero-content p {
    font-size: 17px;
    line-height: 1.6;
    margin-bottom: 25px;
    color: #e0e6ed;
}
.hero-buttons a {
    display: inline-block;
    padding: 12px 28px;
    text-decoration: none;
    font-weight: 700;
    border-radius: 4px;
    font-size: 15px;
    margin-right: 12px;
}
.btn-primary-hero {
    background-color: #cc0000;
    color: white;
}
.btn-primary-hero:hover {
    background-color: #a00000;
}
.btn-secondary-hero {
    background-color: #007bff;
    color: white;
}
.btn-secondary-hero:hover {
    background-color: #0056b3;
}

/* Admission Card (BBD Style Right Box) */
.admission-card {
    background: rgba(255, 255, 255, 0.95);
    width: 360px;
    padding: 25px 30px;
    border-radius: 8px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.3);
    border-top: 4px solid #cc0000;
}
.admission-card h3 {
    margin: 0 0 5px;
    color: #002244;
    font-size: 18px;
    text-align: center;
    text-transform: uppercase;
}
.admission-card h4 {
    margin: 0 0 15px;
    color: #cc0000;
    font-size: 16px;
    text-align: center;
}
.form-group {
    margin-bottom: 12px;
}
.form-group input, .form-group select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 13px;
}
.btn-submit-admission {
    width: 100%;
    padding: 12px;
    background-color: #cc0000;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 15px;
    font-weight: bold;
    cursor: pointer;
}
.btn-submit-admission:hover {
    background-color: #a00000;
}

/* 5. Movable Notification Ticker Bar */
.ticker-bar {
    background-color: #001a33;
    color: #ffffff;
    display: flex;
    align-items: center;
    padding: 8px 20px;
    border-top: 2px solid #cc0000;
    border-bottom: 2px solid #002244;
}
.ticker-tag {
    background-color: #cc0000;
    color: white;
    padding: 4px 12px;
    border-radius: 3px;
    font-size: 12px;
    font-weight: bold;
    margin-right: 15px;
    white-space: nowrap;
}
.ticker-text {
    flex-grow: 1;
    font-size: 14px;
    color: #ffcc00;
}

/* 6. Portals Grid Section */
.portals-section {
    padding: 60px 30px;
    max-width: 1100px;
    margin: 0 auto;
}
.section-title {
    text-align: center;
    margin-bottom: 40px;
}
.section-title h2 {
    color: #002244;
    font-size: 28px;
    margin: 0 0 10px;
    font-weight: 800;
}
.section-title p {
    color: #666;
    font-size: 15px;
    margin: 0;
}
.portal-grid {
    display: flex;
    gap: 30px;
}
.portal-box {
    background: white;
    flex: 1;
    padding: 30px 25px;
    border-radius: 8px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    text-align: center;
    border-top: 4px solid #007bff;
    transition: transform 0.2s;
}
.portal-box:hover {
    transform: translateY(-6px);
}
.portal-box.faculty {
    border-top-color: #17a2b8;
}
.portal-box.admin {
    border-top-color: #28a745;
}
.portal-icon {
    font-size: 36px;
    margin-bottom: 15px;
}
.portal-box h3 {
    color: #002244;
    margin: 0 0 10px;
    font-size: 20px;
}
.portal-box p {
    color: #666;
    font-size: 14px;
    line-height: 1.5;
    margin-bottom: 20px;
}
.btn-portal {
    display: inline-block;
    padding: 10px 22px;
    background-color: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    font-weight: bold;
    font-size: 14px;
}
.btn-portal:hover {
    background-color: #0056b3;
}
.btn-portal.faculty {
    background-color: #17a2b8;
}
.btn-portal.faculty:hover {
    background-color: #117a8b;
}
.btn-portal.admin {
    background-color: #28a745;
}
.btn-portal.admin:hover {
    background-color: #1e7e34;
}

/* 7. Stats Counter Bar */
.stats-bar {
    background-color: #002244;
    color: white;
    padding: 35px 30px;
    display: flex;
    justify-content: space-around;
    text-align: center;
}
.stat-item h3 {
    margin: 0;
    font-size: 32px;
    color: #ffcc00;
}
.stat-item p {
    margin: 5px 0 0;
    font-size: 14px;
    color: #d0dce5;
}

/* 8. Footer */
.footer {
    background-color: #001a33;
    color: #a0b0c0;
    padding: 40px 30px 20px;
    font-size: 13px;
}
.footer-grid {
    display: flex;
    justify-content: space-between;
    max-width: 1100px;
    margin: 0 auto 30px;
}
.footer-col h4 {
    color: white;
    margin: 0 0 15px;
    font-size: 15px;
}
.footer-col p, .footer-col a {
    color: #a0b0c0;
    text-decoration: none;
    display: block;
    margin-bottom: 8px;
    line-height: 1.6;
}
.footer-col a:hover {
    color: #ffcc00;
}
.footer-bottom {
    text-align: center;
    border-top: 1px solid rgba(255,255,255,0.1);
    padding-top: 20px;
    color: #708090;
}
</style>
</head>
<body>

<!-- 1. Top Contact Utility Bar -->
<div class="top-utility-bar">
    <div class="top-utility-left">
        <span>📧 rajanbhatt@257</span>
        <span>📍 Lucknow, Uttar Pradesh</span>
        <span>☎ +91-9580811395</span>
    </div>
    <div class="top-utility-right">
        <a href="student_signUp.jsp">APPLY NOW</a>
        <a href="student.jsp" class="btn-fee">STUDENT LOGIN</a>
        <a href="admin.jsp">ADMIN PORTAL</a>
    </div>
</div>

<!-- 2. Main Brand Header -->
<div class="main-header">
    <a href="index.jsp" class="brand-logo">
        <div class="logo-icon">C</div>
        <div class="brand-text">
            <h1>COLLEGE MANAGEMENT SYSTEM</h1>
            <p>Approved by UGC & Ministry of Education</p>
        </div>
    </a>
</div>

<!-- 3. Main Navigation Bar - Cursor Hover Effect Only -->
<div class="main-nav">
    <a href="index.jsp">HOME</a>
    <a href="About.jsp">ABOUT US</a>
    <a href="student_notices.jsp">NOTICE BOARD</a>
    <a href="Contact.jsp">CONTACT US</a>
    <a href="login.jsp">LOGIN PORTAL</a>
    <a href="student_signUp.jsp">STUDENT SIGNUP</a>
    <a href="faculty_signUp.jsp">FACULTY SIGNUP</a>
</div>

<!-- 4. Hero Section with Side Admission Box -->
<div class="hero-wrapper">
    <div class="hero-content">
        <h2>Leading Excellence in Higher Education</h2>
        <p>Providing world-class academic management, interactive student portals, faculty communication systems, and streamlined campus administration.</p>
        <div class="hero-buttons">
            <a href="student_signUp.jsp" class="btn-primary-hero">APPLY TODAY →</a>
            <a href="login.jsp" class="btn-secondary-hero">ACCESS PORTAL</a>
        </div>
    </div>

    <!-- Quick Enquiry / Registration Box -->
    <div class="admission-card">
        <h3>APPLY TODAY FOR</h3>
        <h4>Admissions 2026-27</h4>
        <form action="student_signUp.jsp" method="get">
            <div class="form-group">
                <input type="text" placeholder="Student Name" required>
            </div>
            <div class="form-group">
                <input type="email" placeholder="Email Address" required>
            </div>
            <div class="form-group">
                <input type="text" placeholder="Mobile Number" required>
            </div>
            <div class="form-group">
                <select required>
                    <option value="">Select Department / Stream</option>
                    <option value="CSE">Computer Science & Engg</option>
                    <option value="ECE">Electronics & Comm Engg</option>
                    <option value="ME">Mechanical Engineering</option>
                    <option value="BBA">Business Administration</option>
                    <option value="BCA">Computer Applications</option>
                </select>
            </div>
            <button type="submit" class="btn-submit-admission">REGISTER NOW</button>
        </form>
    </div>
</div>

<!-- 5. Movable Notification Marquee Ticker -->
<div class="ticker-bar">
    <span class="ticker-tag">OFFICIAL ANNOUNCEMENTS</span>
    <marquee class="ticker-text" behavior="scroll" direction="left" scrollamount="6" onmouseover="this.stop();" onmouseout="this.start();">
        🌟 Student Notice-01: Result of Even Semester 2025-26 Released | 🎓 Phase-I Admissions Open for Academic Session 2026-27 | 📋 Faculty Upload Notice Module Active | 💡 Helpdesk Contact: rajanbhatt@257 | ☎ Call: +91-9580811395
    </marquee>
</div>

<!-- 6. Role-Based Portals Section -->
<div class="portals-section">
    <div class="section-title">
        <h2>ACADEMIC PORTALS</h2>
        <p>Access specialized portals designed for Students, Faculty Members, and Administration</p>
    </div>

    <div class="portal-grid">
        <div class="portal-box">
            <div class="portal-icon">🎓</div>
            <h3>Student Portal</h3>
            <p>Access your personal profile, view campus notices, update contact information, and change passwords securely.</p>
            <a href="student.jsp" class="btn-portal">Student Sign In</a>
        </div>

        <div class="portal-box faculty">
            <div class="portal-icon">👨‍🏫</div>
            <h3>Faculty Portal</h3>
            <p>View registered student lists, upload official notices, update profile, and manage course announcements.</p>
            <a href="faculty.jsp" class="btn-portal faculty">Faculty Sign In</a>
        </div>

        <div class="portal-box admin">
            <div class="portal-icon">⚙</div>
            <h3>Admin Portal</h3>
            <p>Manage student and faculty records, search entries, perform additions, edits, and deletions with database integration.</p>
            <a href="admin.jsp" class="btn-portal admin">Admin Sign In</a>
        </div>
    </div>
</div>

<!-- 7. Key Statistics Bar -->
<div class="stats-bar">
    <div class="stat-item">
        <h3>25+</h3>
        <p>Years of Academic Excellence</p>
    </div>
    <div class="stat-item">
        <h3>50,000+</h3>
        <p>Graduated Alumni</p>
    </div>
    <div class="stat-item">
        <h3>100+</h3>
        <p>Degree Programs</p>
    </div>
    <div class="stat-item">
        <h3>95%</h3>
        <p>Campus Placement Rate</p>
    </div>
</div>

<!-- 8. Footer -->
<div class="footer">
    <div class="footer-grid">
        <div class="footer-col">
            <h4>College Management System</h4>
            <p>123 Education Campus Road,<br>Knowledge Park, City - 226028</p>
            <p>Phone: +91-9580811395</p>
            <p>Email: rajanbhatt@257</p>
        </div>
        <div class="footer-col">
            <h4>Quick Links</h4>
            <a href="index.jsp">Home</a>
            <a href="About.jsp">About Us</a>
            <a href="Contact.jsp">Contact Support</a>
            <a href="login.jsp">Login Hub</a>
        </div>
        <div class="footer-col">
            <h4>Portals & SignUp</h4>
            <a href="student.jsp">Student Login</a>
            <a href="faculty.jsp">Faculty Login</a>
            <a href="admin.jsp">Admin Portal</a>
            <a href="student_signUp.jsp">New Student Registration</a>
        </div>
    </div>
    <div class="footer-bottom">
        &copy; 2026 College Management System. All Rights Reserved. Designed for Eclipse & Apache Tomcat.
    </div>
</div>

</body>
</html>