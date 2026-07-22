<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faculty Login</title>
<style>
body {
    background-size: cover;
    background-attachment: fixed;
    height: 100vh;
    font-family: Arial, sans-serif;
}
.form-container {
    background-color: rgba(255, 255, 255, 0.88);
    width: 340px;
    margin: 80px auto;
    padding: 30px 40px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.3);
    text-align: center;
}
.form-container h2 {
    color: #003366;
    margin-top: 0;
}
.form-row {
    margin-bottom: 14px;
    text-align: left;
}
.form-row label {
    display: block;
    font-weight: bold;
    margin-bottom: 4px;
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
    padding: 9px 28px;
    background-color: #003366;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
}
.btn-submit:hover {
    background-color: #002244;
}
.btn-reset {
    padding: 9px 20px;
    background-color: #888;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 15px;
    margin-left: 10px;
}
.btn-reset:hover {
    background-color: #555;
}
.signup-link {
    display: block;
    margin-top: 14px;
    color: #007BFF;
    text-decoration: none;
    font-size: 14px;
}
.signup-link:hover {
    text-decoration: underline;
}
.msg-success {
    color: green;
    font-weight: bold;
    margin-bottom: 12px;
}
.note {
    font-size: 12px;
    color: #888;
    margin-bottom: 12px;
}
</style>
</head>
<body background="Image/faculty.jpeg">

<div class="form-container">
    <h2>Faculty Login</h2>
    <% if (msg != null && !msg.isEmpty()) { %>
        <p class="msg-success"><%= msg %></p>
    <% } %>
    <p class="note">Password is numeric only.</p>
    <form action="faculty_login" method="post">

        <div class="form-row">
            <label>Faculty ID</label>
            <input type="text" name="uid" required>
        </div>

        <div class="form-row">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <input type="submit" class="btn-submit" value="Login">
        <input type="reset" class="btn-reset" value="Cancel">
    </form>
    <a class="signup-link" href="faculty_signUp.jsp">New Faculty? Sign Up</a>
</div>

</body>
</html>