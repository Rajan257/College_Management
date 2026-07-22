<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Change Password</title>
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
.info-note {
    font-size: 12px;
    color: #888;
    margin-bottom: 15px;
    text-align: center;
}
.btn-submit {
    width: 100%;
    padding: 10px;
    background-color: #dc3545;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
}
.btn-submit:hover {
    background-color: #a71d2a;
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
    <h1>Change Password</h1>
</div>

<div class="nav">
    <a href="faculty_home.jsp">Dashboard</a>
    <a href="faculty_profile.jsp">View Profile</a>
    <a href="logout">Logout</a>
</div>

<div class="form-box">
    <h2>Change Password</h2>
    <p class="info-note">Password must be numeric.</p>
    <form action="faculty_change_password" method="post">

        <div class="form-row">
            <label>Old Password</label>
            <input type="password" name="oldPassword" required>
        </div>

        <div class="form-row">
            <label>New Password</label>
            <input type="password" name="newPassword" required>
        </div>

        <div class="form-row">
            <label>Confirm New Password</label>
            <input type="password" name="confirmPassword" required>
        </div>

        <input type="submit" class="btn-submit" value="Change Password">
    </form>
    <a class="back-link" href="faculty_home.jsp">Back to Dashboard</a>
</div>

</body>
</html>
