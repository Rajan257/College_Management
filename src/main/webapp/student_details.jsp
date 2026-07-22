<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("adminUID") == null) {
        response.sendRedirect("admin.jsp");
        return;
    }
    String search = request.getParameter("search");
    if (search == null) search = "";
    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Details</title>
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
    width: 95%;
    margin: 20px auto;
}
.search-bar {
    margin-bottom: 15px;
}
.search-bar input[type="text"] {
    padding: 7px;
    width: 250px;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.search-bar input[type="submit"] {
    padding: 7px 14px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
.search-bar input[type="submit"]:hover {
    background-color: #0056b3;
}
.search-bar a {
    margin-left: 10px;
    color: #555;
    text-decoration: none;
    font-size: 13px;
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
.btn {
    padding: 5px 10px;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 3px;
    text-decoration: none;
    font-size: 12px;
    display: inline-block;
}
.btn-edit {
    background-color: #007BFF;
}
.btn-edit:hover {
    background-color: #0056b3;
}
.btn-delete {
    background-color: #dc3545;
}
.btn-delete:hover {
    background-color: #a71d2a;
}
.top-actions {
    margin-bottom: 12px;
}
.btn-add {
    background-color: #28a745;
    color: white;
    padding: 8px 16px;
    text-decoration: none;
    border-radius: 4px;
    font-size: 14px;
}
.btn-add:hover {
    background-color: #1e7e34;
}
.msg {
    color: green;
    font-weight: bold;
    margin-bottom: 10px;
}
</style>
</head>
<body>

<div class="header">
    <h1>Student Details</h1>
</div>

<div class="nav">
    <a href="admin_home.jsp">Dashboard</a>
    <a href="faculty_details.jsp">Faculty Details</a>
    <a href="logout">Logout</a>
</div>

<div class="container">

<% if (msg != null && !msg.isEmpty()) { %>
    <p class="msg"><%= msg %></p>
<% } %>

<div class="top-actions">
    <a class="btn-add" href="admin_add_student.jsp">+ Add Student</a>
</div>

<div class="search-bar">
    <form action="student_details.jsp" method="get">
        <input type="text" name="search" placeholder="Search by Name or UID" value="<%= search %>">
        <input type="submit" value="Search">
        <a href="student_details.jsp">Clear</a>
    </form>
</div>

<table>
    <tr>
        <th>UID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Contact</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","Rajan@123");
        String sql;
        if (search != null && !search.trim().isEmpty()) {
            sql = "SELECT * FROM student_signup WHERE uid LIKE ? OR Name LIKE ? ORDER BY Name";
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
        } else {
            sql = "SELECT * FROM student_signup ORDER BY Name";
            ps = con.prepareStatement(sql);
        }
        rs = ps.executeQuery();
        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getString("uid") %></td>
        <td><%= rs.getString("Name") %></td>
        <td><%= rs.getString("Email") %></td>
        <td><%= rs.getLong("contact") %></td>
        <td><a class="btn btn-edit" href="admin_update_student?uid=<%= rs.getString("uid") %>">Edit</a></td>
        <td><a class="btn btn-delete" href="admin_delete_student?uid=<%= rs.getString("uid") %>" onclick="return confirm('Delete this student?')">Delete</a></td>
    </tr>
<%
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("<tr><td colspan='6' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
    }
%>
</table>

</div>
</body>
</html>
