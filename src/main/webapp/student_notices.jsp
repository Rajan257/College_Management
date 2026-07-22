<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("studentUID") == null) {
        response.sendRedirect("student.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notices</title>
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
.container {
    width: 80%;
    margin: 30px auto;
}
.notice-card {
    background-color: white;
    border: 1px solid #ddd;
    border-left: 5px solid #003366;
    border-radius: 4px;
    padding: 15px 20px;
    margin-bottom: 15px;
}
.notice-title {
    font-size: 17px;
    font-weight: bold;
    color: #003366;
    margin-bottom: 8px;
}
.notice-content {
    color: #333;
    margin-bottom: 10px;
    line-height: 1.6;
}
.notice-meta {
    font-size: 12px;
    color: #888;
}
.no-notices {
    text-align: center;
    color: #555;
    padding: 40px;
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 4px;
}
</style>
</head>
<body>

<div class="header">
    <h1>Notice Board</h1>
</div>

<div class="nav">
    <a href="student_home.jsp">Dashboard</a>
    <a href="student_profile.jsp">Profile</a>
    <a href="logout">Logout</a>
</div>

<div class="container">
    <h2>All Notices</h2>
<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    boolean hasNotices = false;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Rajan@123");
        ps = con.prepareStatement("SELECT * FROM notices ORDER BY posted_date DESC");
        rs = ps.executeQuery();
        while (rs.next()) {
            hasNotices = true;
%>
    <div class="notice-card">
        <div class="notice-title"><%= rs.getString("title") %></div>
        <div class="notice-content"><%= rs.getString("content") %></div>
        <div class="notice-meta">Posted by: <b><%= rs.getString("posted_by") %></b> &nbsp;|&nbsp; Date: <%= rs.getTimestamp("posted_date") %></div>
    </div>
<%
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error loading notices: " + e.getMessage() + "</p>");
    }
    if (!hasNotices) {
%>
    <div class="no-notices">
        <p>No notices available at this time.</p>
    </div>
<%
    }
%>
</div>

</body>
</html>
