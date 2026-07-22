<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("studentUID") == null) {
        response.sendRedirect("student.jsp");
        return;
    }
    String uid = (String) session.getAttribute("studentUID");
    String msg = request.getParameter("msg");
    String dbName = "";
    String dbEmail = "";
    long dbContact = 0;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Rajan@123");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM student_signup WHERE uid=?");
        ps.setString(1, uid);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            dbName = rs.getString("Name");
            dbEmail = rs.getString("Email");
            dbContact = rs.getLong("contact");
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading profile: " + e.getMessage() + "</p>");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Profile</title>
<style>
body {
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
    font-family: Arial, sans-serif;
}
.header {
    background-color: #003366;
    color: white;
    text-align: center;
    padding: 15px;
}
.nav {
    background-color: #004080;
    padding: 8px;
    text-align: left;
}
.nav a {
    color: white;
    text-decoration: none;
    margin: 0 10px;
    font-size: 14px;
}
.nav a:hover {
    text-decoration: underline;
}
.profile-box {
    background-color: white;
    width: 450px;
    margin: 40px auto;
    border: 1px solid #ccc;
    border-radius: 6px;
    padding: 30px 40px;
}
.profile-box h2 {
    text-align: center;
    color: #003366;
    margin-top: 0;
}
.profile-row {
    display: flex;
    border-bottom: 1px solid #eee;
    padding: 10px 0;
}
.profile-row:last-child {
    border-bottom: none;
}
.profile-label {
    font-weight: bold;
    width: 140px;
    color: #555;
    flex-shrink: 0;
}
.profile-value {
    color: #333;
}
.msg {
    color: green;
    font-weight: bold;
    text-align: center;
    margin-bottom: 10px;
}
.action-link {
    display: block;
    text-align: center;
    margin-top: 20px;
    color: #007BFF;
    text-decoration: none;
    font-size: 14px;
}
.action-link:hover {
    text-decoration: underline;
}
</style>
</head>
<body>

<div class="header">
    <h1>My Profile</h1>
</div>

<div class="nav">
    <a href="student_home.jsp">Dashboard</a>
    <a href="student_update_profile.jsp">Update Profile</a>
    <a href="student_notices.jsp">Notices</a>
    <a href="student_change_password.jsp">Change Password</a>
    <a href="logout">Logout</a>
</div>

<div class="profile-box">
    <h2>Student Profile</h2>
<% if (msg != null && !msg.isEmpty()) { %>
    <p class="msg"><%= msg %></p>
<% } %>
    <div class="profile-row">
        <span class="profile-label">User ID</span>
        <span class="profile-value"><%= uid %></span>
    </div>
    <div class="profile-row">
        <span class="profile-label">Name</span>
        <span class="profile-value"><%= dbName %></span>
    </div>
    <div class="profile-row">
        <span class="profile-label">Email</span>
        <span class="profile-value"><%= dbEmail %></span>
    </div>
    <div class="profile-row">
        <span class="profile-label">Contact No</span>
        <span class="profile-value"><%= dbContact %></span>
    </div>
    <a class="action-link" href="student_update_profile.jsp">Update Profile</a>
</div>

</body>
</html>
