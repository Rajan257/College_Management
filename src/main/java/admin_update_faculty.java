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

@WebServlet("/admin_update_faculty")
public class admin_update_faculty extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public admin_update_faculty() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminUID") == null) {
            response.sendRedirect("admin.jsp");
            return;
        }

        String uid = request.getParameter("uid");

        if (uid == null || uid.trim().isEmpty()) {
            response.sendRedirect("faculty_details.jsp");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/project",
                    "root",
                    "Rajan@123");

            ps = con.prepareStatement(
                    "SELECT * FROM faculty_signup WHERE uid=?");

            ps.setString(1, uid.trim());
            rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("uid", rs.getString("uid"));
                request.setAttribute("Name", rs.getString("Name"));
                request.setAttribute("Email", rs.getString("Email"));
                request.setAttribute("contact", String.valueOf(rs.getLong("contact")));
            } else {
                rs.close();
                ps.close();
                con.close();
                response.sendRedirect("faculty_details.jsp?msg=Faculty+not+found");
                return;
            }

            rs.close();
            ps.close();
            con.close();

            request.getRequestDispatcher("admin_edit_faculty.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2 style='color:red;'>Error: " + e.getMessage() + "</h2>");
            out.println("<a href='faculty_details.jsp'>Go Back</a>");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignore) {}
            try { if (ps != null) ps.close(); } catch (Exception ignore) {}
            try { if (con != null) con.close(); } catch (Exception ignore) {}
        }
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

        if (uid == null || uid.trim().isEmpty() || name == null || name.trim().isEmpty()
                || contactStr == null || contactStr.trim().isEmpty()) {
            out.println("<h2 style='color:red;'>All fields are required.</h2>");
            out.println("<a href='faculty_details.jsp'>Go Back</a>");
            return;
        }

        long contact;
        try {
            contact = Long.parseLong(contactStr.trim());
        } catch (NumberFormatException e) {
            out.println("<h2 style='color:red;'>Contact must be a valid number.</h2>");
            out.println("<a href='faculty_details.jsp'>Go Back</a>");
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
                    "UPDATE faculty_signup SET Name=?, Email=?, contact=? WHERE uid=?");

            ps.setString(1, name.trim());
            ps.setString(2, email);
            ps.setLong(3, contact);
            ps.setString(4, uid.trim());

            ps.executeUpdate();
            ps.close();
            con.close();

            response.sendRedirect("faculty_details.jsp?msg=Faculty+updated+successfully");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2 style='color:red;'>Error: " + e.getMessage() + "</h2>");
            out.println("<a href='faculty_details.jsp'>Go Back</a>");
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception ignore) {}
            try { if (con != null) con.close(); } catch (Exception ignore) {}
        }
    }
}
