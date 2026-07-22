<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faculty Sign Up</title>
<style>
body {
    background-size: cover;
    background-attachment: fixed;
    height: 100vh;
    font-family: Arial, sans-serif;
}
.form-container {
    background-color: rgba(255, 255, 255, 0.88);
    width: 380px;
    margin: 60px auto;
    padding: 30px 40px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.3);
}
.form-container h2 {
    text-align: center;
    color: #003366;
    margin-top: 0;
}
.form-row {
    margin-bottom: 14px;
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
.btn-row {
    text-align: center;
    margin-top: 16px;
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
.back-link {
    display: block;
    text-align: center;
    margin-top: 14px;
    color: #007BFF;
    text-decoration: none;
    font-size: 14px;
}
.back-link:hover {
    text-decoration: underline;
}
.msg-success {
    color: green;
    font-weight: bold;
    text-align: center;
    margin-bottom: 10px;
}
.note {
    font-size: 12px;
    color: #888;
    text-align: center;
    margin-bottom: 14px;
}
</style>
</head>
<body background="Image/faculty.jpeg">

<div class="form-container">
    <h2>Faculty Sign Up</h2>
    <% if (msg != null && !msg.isEmpty()) { %>
        <p class="msg-success"><%= msg %></p>
    <% } %>
    <p class="note">Password must be numeric only.</p>
    <form action="faculty_signUp" method="post">

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
            <label>Create Password (Numeric)</label>
            <input type="password" name="password" required>
        </div>

        <div class="btn-row">
            <input type="submit" class="btn-submit" value="Sign Up">
            <input type="reset" class="btn-reset" value="Cancel">
        </div>
    </form>
    <a class="back-link" href="faculty.jsp">Already have an account? Login</a>
</div>

</body>
</html>
