<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("adminUID") == null) {
        response.sendRedirect("admin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Faculty</title>
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
    background-color: #28a745;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
}
.btn-submit:hover {
    background-color: #1e7e34;
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
    <h1>Add New Faculty</h1>
</div>

<div class="nav">
    <a href="admin_home.jsp">Dashboard</a>
    <a href="faculty_details.jsp">Faculty List</a>
    <a href="logout">Logout</a>
</div>

<div class="form-box">
    <h2>Faculty Registration</h2>
    <form action="admin_add_faculty" method="post">

        <div class="form-row">
            <label>Faculty ID</label>
            <input type="text" name="uid" required>
        </div>

        <div class="form-row">
            <label>Name</label>
            <input type="text" name="Name" required>
        </div>

        <div class="form-row">
            <label>Email</label>
            <input type="email" name="Email" required>
        </div>

        <div class="form-row">
            <label>Contact No</label>
            <input type="text" name="contact" required>
        </div>

        <div class="form-row">
            <label>Password (Numeric)</label>
            <input type="password" name="password" required>
        </div>

        <input type="submit" class="btn-submit" value="Add Faculty">
    </form>
    <a class="back-link" href="faculty_details.jsp">Back to Faculty List</a>
</div>

</body>
</html>
