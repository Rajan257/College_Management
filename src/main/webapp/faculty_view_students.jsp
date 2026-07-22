<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("facultyUID") == null) {
        response.sendRedirect("faculty.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>
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
    width: 90%;
    margin: 30px auto;
}
table {
    width: 100%;
    border-collapse: collapse;
    background-color: white;
}
th {
    background-color: #003366;
    color: white;
    padding: 10px;
    text-align: left;
}
td {
    padding: 9px 10px;
    border: 1px solid #ddd;
}
tr:nth-child(even) {
    background-color: #f9f9f9;
}
</style>
</head>
<body>

<div class="header">
    <h1>Student List</h1>
</div>

<div class="nav">
    <a href="faculty_home.jsp">Dashboard</a>
    <a href="faculty_profile.jsp">Profile</a>
    <a href="faculty_upload_notice.jsp">Upload Notice</a>
    <a href="logout">Logout</a>
</div>

<div class="container">
    <h2>All Registered Students</h2>
    <table>
        <tr>
            <th>UID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Contact</th>
        </tr>
<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Rajan@123");
        ps = con.prepareStatement("SELECT * FROM student_signup ORDER BY Name");
        rs = ps.executeQuery();
        while (rs.next()) {
%>
        <tr>
            <td><%= rs.getString("uid") %></td>
            <td><%= rs.getString("Name") %></td>
            <td><%= rs.getString("Email") %></td>
            <td><%= rs.getLong("contact") %></td>
        </tr>
<%
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<tr><td colspan='4' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
    }
%>
    </table>
</div>

</body>
</html>
