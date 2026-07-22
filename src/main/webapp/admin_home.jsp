<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("adminUID") == null) {
        response.sendRedirect("admin.jsp");
        return;
    }
    String adminName = (String) session.getAttribute("adminName");
    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
body {
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
    font-family: Arial, sans-serif;
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
    background-color: #003366;
    color: white;
    text-align: center;
    padding: 20px;
}
.header h1 {
    margin: 0;
}
.header p {
    margin: 5px 0 0;
    font-size: 15px;
    color: #ffcc00;
}
.nav {
    background-color: #004080;
    padding: 10px;
    text-align: center;
}
.nav a {
    color: white;
    text-decoration: none;
    margin: 0 12px;
    font-size: 14px;
    font-weight: bold;
}
.nav a:hover {
    color: #ffcc00;
}
.container {
    text-align: center;
    margin-top: 40px;
}
.msg {
    color: green;
    font-weight: bold;
    margin-bottom: 15px;
}
.button {
    display: inline-block;
    width: 220px;
    padding: 15px;
    margin: 10px;
    background-color: #007BFF;
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-size: 16px;
    font-weight: bold;
}
.button:hover {
    background-color: #0056b3;
}
.logout {
    background-color: #dc3545;
}
.logout:hover {
    background-color: #a71d2a;
}
</style>
</head>
<body>

<div class="ticker-bar">
    <span class="ticker-tag">ADMINISTRATIVE NOTICES</span>
    <marquee class="ticker-text" behavior="scroll" direction="left" scrollamount="6" onmouseover="this.stop();" onmouseout="this.start();">
        ⚙ System Administrative Control Portal | 👥 Manage Student & Faculty Records | 🔒 Ensure database integrity and system security
    </marquee>
</div>

<div class="header">
    <h1>Admin Dashboard</h1>
    <p>Welcome, <%= adminName %></p>
</div>

<div class="nav">
    <a href="admin_home.jsp">Dashboard</a>
    <a href="student_details.jsp">Student Records</a>
    <a href="faculty_details.jsp">Faculty Records</a>
    <a href="admin_add_student.jsp">Add Student</a>
    <a href="admin_add_faculty.jsp">Add Faculty</a>
    <a href="logout">Logout</a>
</div>

<div class="container">

<% if (msg != null && !msg.isEmpty()) { %>
    <p class="msg"><%= msg %></p>
<% } %>

    <a class="button" href="student_details.jsp">View All Students</a>
    <a class="button" href="faculty_details.jsp">View All Faculty</a><br>

    <a class="button" href="admin_add_student.jsp">Add Student</a>
    <a class="button" href="admin_add_faculty.jsp">Add Faculty</a><br>

    <a class="button logout" href="logout">Logout</a>

</div>

</body>
</html>