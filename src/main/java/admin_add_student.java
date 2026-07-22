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

@WebServlet("/admin_add_student")
public class admin_add_student extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public admin_add_student() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminUID") == null) {
            response.sendRedirect("admin.jsp");
            return;
        }

        String uid = request.getParameter("uid");
        String name = request.getParameter("Name");
        String email = request.getParameter("Email");
        String contactStr = request.getParameter("contact");
        String passwordStr = request.getParameter("password");

        if (uid == null || uid.trim().isEmpty() || name == null || name.trim().isEmpty()
                || contactStr == null || contactStr.trim().isEmpty()
                || passwordStr == null || passwordStr.trim().isEmpty()) {
            out.println("<h2 style='color:red;'>All fields are required.</h2>");
            out.println("<a href='admin_add_student.jsp'>Go Back</a>");
            return;
        }

        long contact;
        int password;
        try {
            contact = Long.parseLong(contactStr.trim());
            password = Integer.parseInt(passwordStr.trim());
        } catch (NumberFormatException e) {
            out.println("<h2 style='color:red;'>Contact must be a valid number and Password must be numeric.</h2>");
            out.println("<a href='admin_add_student.jsp'>Go Back</a>");
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
                    "INSERT INTO student_signup(uid, Name, Email, contact, password) VALUES(?,?,?,?,?)");

            ps.setString(1, uid.trim());
            ps.setString(2, name.trim());
            ps.setString(3, email);
            ps.setLong(4, contact);
            ps.setInt(5, password);

            ps.executeUpdate();
            ps.close();
            con.close();

            response.sendRedirect("student_details.jsp?msg=Student+added+successfully");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2 style='color:red;'>Error: " + e.getMessage() + "</h2>");
            out.println("<a href='admin_add_student.jsp'>Go Back</a>");
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
