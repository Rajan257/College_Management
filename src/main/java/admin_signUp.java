import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/admin_signUp")
public class admin_signUp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public admin_signUp() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("Name");
        String email = request.getParameter("Email");
        String userID = request.getParameter("uid");
        String passwordStr = request.getParameter("password");
        String contactStr = request.getParameter("contact");

        if (name == null || name.trim().isEmpty() || userID == null || userID.trim().isEmpty()
                || passwordStr == null || passwordStr.trim().isEmpty()
                || contactStr == null || contactStr.trim().isEmpty()) {
            out.println("<h2 style='color:red;'>All fields are required.</h2>");
            out.println("<br><a href='admin_signUp.jsp'>Go Back</a>");
            return;
        }

        int password;
        long contact;
        try {
            password = Integer.parseInt(passwordStr.trim());
            contact = Long.parseLong(contactStr.trim());
        } catch (NumberFormatException e) {
            out.println("<h2 style='color:red;'>Password must be numeric and Contact must be a valid number.</h2>");
            out.println("<br><a href='admin_signUp.jsp'>Go Back</a>");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/project",
                    "root",
                    "Rajan@123");

            ps = con.prepareStatement(
                    "INSERT INTO admin_signup(uid, Name, Email, contact, password) VALUES(?,?,?,?,?)");

            ps.setString(1, userID.trim());
            ps.setString(2, name.trim());
            ps.setString(3, email);
            ps.setLong(4, contact);
            ps.setInt(5, password);

            int i = ps.executeUpdate();
            ps.close();
            con.close();

            if (i > 0) {
                response.sendRedirect("admin.jsp?msg=SignUp+successful.+Please+login.");
            } else {
                out.println("<h2 style='color:red;'>Registration failed. Please try again.</h2>");
                out.println("<br><a href='admin_signUp.jsp'>Go Back</a>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2 style='color:red;'>Error: " + e.getMessage() + "</h2>");
            out.println("<br><a href='admin_signUp.jsp'>Go Back</a>");
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception ignore) {}
            try { if (con != null) con.close(); } catch (Exception ignore) {}
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
