<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("adminUID") == null) {
        response.sendRedirect("admin.jsp");
        return;
    }
    String uid = (String) request.getAttribute("uid");
    String name = (String) request.getAttribute("Name");
    String email = (String) request.getAttribute("Email");
    String contact = (String) request.getAttribute("contact");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>
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
.form-row input[readonly] {
    background-color: #e9ecef;
    color: #555;
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
    <h1>Edit Student</h1>
</div>

<div class="nav">
    <a href="admin_home.jsp">Dashboard</a>
    <a href="student_details.jsp">Student List</a>
    <a href="logout">Logout</a>
</div>

<div class="form-box">
    <h2>Update Student Details</h2>
    <form action="admin_update_student" method="post">

        <div class="form-row">
            <label>User ID (cannot be changed)</label>
            <input type="text" name="uid" value="<%= uid %>" readonly>
        </div>

        <div class="form-row">
            <label>Name</label>
            <input type="text" name="Name" value="<%= name %>" required>
        </div>

        <div class="form-row">
            <label>Email</label>
            <input type="email" name="Email" value="<%= email %>" required>
        </div>

        <div class="form-row">
            <label>Contact No</label>
            <input type="text" name="contact" value="<%= contact %>" required>
        </div>

        <input type="submit" class="btn-submit" value="Update Student">
    </form>
    <a class="back-link" href="student_details.jsp">Back to Student List</a>
</div>

</body>
</html>
