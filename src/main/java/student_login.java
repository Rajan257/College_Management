import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/student_login")
public class student_login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public student_login() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String uid = request.getParameter("uid");
        String passwordStr = request.getParameter("password");

        if (uid == null || uid.trim().isEmpty() || passwordStr == null || passwordStr.trim().isEmpty()) {
            out.println("<h2 style='color:red;'>User ID and Password are required.</h2>");
            out.println("<br><a href='student.jsp'>Go Back</a>");
            return;
        }

        int password;
        try {
            password = Integer.parseInt(passwordStr.trim());
        } catch (NumberFormatException e) {
            out.println("<h2 style='color:red;'>Password must be numeric.</h2>");
            out.println("<br><a href='student.jsp'>Go Back</a>");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBUtil.getConnection();

            ps = con.prepareStatement(
                    "SELECT * FROM student_signup WHERE uid=? AND password=?");

            ps.setString(1, uid.trim());
            ps.setInt(2, password);

            rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("studentUID", rs.getString("uid"));
                session.setAttribute("studentName", rs.getString("Name"));
                rs.close();
                ps.close();
                con.close();
                response.sendRedirect("student_home.jsp");
            } else {
                rs.close();
                ps.close();
                con.close();
                out.println("<h2 style='color:red;'>Invalid User ID or Password.</h2>");
                out.println("<br><a href='student.jsp'>Try Again</a>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2 style='color:red;'>Database error: " + e.getMessage() + "</h2>");
            out.println("<br><a href='student.jsp'>Go Back</a>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignore) {}
            try { if (ps != null) ps.close(); } catch (Exception ignore) {}
            try { if (con != null) con.close(); } catch (Exception ignore) {}
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}