<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("studentUID") == null) {
        response.sendRedirect("student.jsp");
        return;
    }
    String uid = (String) session.getAttribute("studentUID");
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
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile</title>
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
.form-box {
    background-color: white;
    padding: 30px 40px;
    width: 420px;
    margin: 40px auto;
    border: 1px solid #ccc;
    border-radius: 6px;
}
.form-box h2 {
    text-align: center;
    color: #003366;
    margin-top: 0;
}
.form-row {
    margin-bottom: 15px;
}
.form-row label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
    color: #333;
}
.form-row input {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
}
.btn-submit {
    width: 100%;
    padding: 10px;
    background-color: #007BFF;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
}
.btn-submit:hover {
    background-color: #0056b3;
}
.back-link {
    display: block;
    text-align: center;
    margin-top: 12px;
    color: #007BFF;
    text-decoration: none;
    font-size: 14px;
}
.back-link:hover {
    text-decoration: underline;
}
</style>
</head>
<body>

<div class="header">
    <h1>Update Profile</h1>
</div>

<div class="nav">
    <a href="student_home.jsp">Dashboard</a>
    <a href="student_profile.jsp">View Profile</a>
    <a href="logout">Logout</a>
</div>

<div class="form-box">
    <h2>Update Your Details</h2>
    <form action="student_update_profile" method="post">

        <div class="form-row">
            <label>Name</label>
            <input type="text" name="Name" value="<%= dbName %>" required>
        </div>

        <div class="form-row">
            <label>Email</label>
            <input type="email" name="Email" value="<%= dbEmail %>" required>
        </div>

        <div class="form-row">
            <label>Contact No</label>
            <input type="text" name="contact" value="<%= dbContact %>" required>
        </div>

        <input type="submit" class="btn-submit" value="Update Profile">
    </form>
    <a class="back-link" href="student_home.jsp">Back to Dashboard</a>
</div>

</body>
</html>
