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

@WebServlet("/student_change_password")
public class student_change_password extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public student_change_password() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("studentUID") == null) {
            response.sendRedirect("student.jsp");
            return;
        }

        String uid = (String) session.getAttribute("studentUID");
        String oldPasswordStr = request.getParameter("oldPassword");
        String newPasswordStr = request.getParameter("newPassword");
        String confirmPasswordStr = request.getParameter("confirmPassword");

        if (oldPasswordStr == null || oldPasswordStr.trim().isEmpty()
                || newPasswordStr == null || newPasswordStr.trim().isEmpty()
                || confirmPasswordStr == null || confirmPasswordStr.trim().isEmpty()) {
            out.println("<h2 style='color:red;'>All password fields are required.</h2>");
            out.println("<a href='student_change_password.jsp'>Go Back</a>");
            return;
        }

        int oldPassword, newPassword, confirmPassword;
        try {
            oldPassword = Integer.parseInt(oldPasswordStr.trim());
            newPassword = Integer.parseInt(newPasswordStr.trim());
            confirmPassword = Integer.parseInt(confirmPasswordStr.trim());
        } catch (NumberFormatException e) {
            out.println("<h2 style='color:red;'>All passwords must be numeric.</h2>");
            out.println("<a href='student_change_password.jsp'>Go Back</a>");
            return;
        }

        if (newPassword != confirmPassword) {
            out.println("<h2 style='color:red;'>New password and confirm password do not match.</h2>");
            out.println("<a href='student_change_password.jsp'>Go Back</a>");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/project",
                    "root",
                    "Rajan@123");

            ps = con.prepareStatement(
                    "SELECT * FROM student_signup WHERE uid=? AND password=?");
            ps.setString(1, uid);
            ps.setInt(2, oldPassword);
            rs = ps.executeQuery();

            if (!rs.next()) {
                rs.close();
                ps.close();
                con.close();
                out.println("<h2 style='color:red;'>Old password is incorrect.</h2>");
                out.println("<a href='student_change_password.jsp'>Go Back</a>");
                return;
            }

            rs.close();
            ps.close();

            ps2 = con.prepareStatement(
                    "UPDATE student_signup SET password=? WHERE uid=?");
            ps2.setInt(1, newPassword);
            ps2.setString(2, uid);
            ps2.executeUpdate();
            ps2.close();
            con.close();

            response.sendRedirect("student_home.jsp?msg=Password+changed+successfully");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2 style='color:red;'>Error: " + e.getMessage() + "</h2>");
            out.println("<a href='student_change_password.jsp'>Go Back</a>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignore) {}
            try { if (ps != null) ps.close(); } catch (Exception ignore) {}
            try { if (ps2 != null) ps2.close(); } catch (Exception ignore) {}
            try { if (con != null) con.close(); } catch (Exception ignore) {}
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
