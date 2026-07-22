<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("facultyUID") == null) {
        response.sendRedirect("faculty.jsp");
        return;
    }
    String facultyName = (String) session.getAttribute("facultyName");
    String msg = request.getParameter("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faculty Dashboard</title>
<style>
body {
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    font-family: Arial, sans-serif;
}
.ticker-bar {
    background-color: #002244;
    color: #ffcc00;
    display: flex;
    align-items: center;
    padding: 6px 15px;
    font-size: 14px;
    font-weight: 500;
    border-bottom: 2px solid #004080;
}
.ticker-tag {
    background-color: #dc3545;
    color: white;
    padding: 3px 10px;
    border-radius: 4px;
    font-size: 12px;
    font-weight: bold;
    margin-right: 12px;
    white-space: nowrap;
}
.ticker-text {
    flex-grow: 1;
    color: #ffffff;
}
.header {
    background-color: #003366;
    color: white;
    padding: 20px;
    text-align: center;
}
.header h1 {
    margin: 0;
}
.header p {
    margin: 5px 0 0;
    font-size: 15px;
    color: #ffcc00;
}
.nav {
    background-color: #004080;
    padding: 10px;
    text-align: center;
}
.nav a {
    color: white;
    text-decoration: none;
    margin: 0 12px;
    font-size: 14px;
    font-weight: bold;
}
.nav a:hover {
    color: #ffcc00;
}
.container {
    margin-top: 40px;
    text-align: center;
}
.msg {
    color: green;
    font-weight: bold;
    margin-bottom: 15px;
}
.button {
    display: inline-block;
    width: 220px;
    padding: 15px;
    margin: 10px;
    background-color: #007BFF;
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-size: 16px;
    font-weight: bold;
}
.button:hover {
    background-color: #0056b3;
}
.logout {
    background-color: #dc3545;
}
.logout:hover {
    background-color: #a71d2a;
}
</style>
</head>
<body>

<div class="ticker-bar">
    <span class="ticker-tag">FACULTY ANNOUNCEMENTS</span>
    <marquee class="ticker-text" behavior="scroll" direction="left" scrollamount="6" onmouseover="this.stop();" onmouseout="this.start();">
        📢 Welcome Prof. <%= facultyName %> | 📝 Upload notices to communicate with students | 🎓 Academic committee meeting scheduled for Thursday | 📋 Keep student records updated
    </marquee>
</div>

<div class="header">
    <h1>Faculty Dashboard</h1>
    <p>Welcome, <%= facultyName %></p>
</div>

<div class="nav">
    <a href="faculty_home.jsp">Dashboard</a>
    <a href="faculty_profile.jsp">View Profile</a>
    <a href="faculty_update_profile.jsp">Update Profile</a>
    <a href="faculty_view_students.jsp">View Students</a>
    <a href="faculty_upload_notice.jsp">Upload Notice</a>
    <a href="faculty_change_password.jsp">Change Password</a>
    <a href="logout">Logout</a>
</div>

<div class="container">

<% if (msg != null && !msg.isEmpty()) { %>
    <p class="msg"><%= msg %></p>
<% } %>

    <a class="button" href="faculty_profile.jsp">View Profile</a>
    <a class="button" href="faculty_update_profile.jsp">Update Profile</a><br>

    <a class="button" href="faculty_view_students.jsp">View Students</a>
    <a class="button" href="faculty_upload_notice.jsp">Upload Notice</a><br>

    <a class="button" href="faculty_change_password.jsp">Change Password</a><br>

    <a class="button logout" href="logout">Logout</a>

</div>

</body>
</html>