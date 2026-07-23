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

@WebServlet("/student_update_profile")
public class student_update_profile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public student_update_profile() {
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
        String name = request.getParameter("Name");
        String email = request.getParameter("Email");
        String contactStr = request.getParameter("contact");

        if (name == null || name.trim().isEmpty() || contactStr == null || contactStr.trim().isEmpty()) {
            out.println("<h2 style='color:red;'>Name and Contact are required.</h2>");
            out.println("<a href='student_update_profile.jsp'>Go Back</a>");
            return;
        }

        long contact;
        try {
            contact = Long.parseLong(contactStr.trim());
        } catch (NumberFormatException e) {
            out.println("<h2 style='color:red;'>Contact must be a valid number.</h2>");
            out.println("<a href='student_update_profile.jsp'>Go Back</a>");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBUtil.getConnection();

            ps = con.prepareStatement(
                    "UPDATE student_signup SET Name=?, Email=?, contact=? WHERE uid=?");

            ps.setString(1, name.trim());
            ps.setString(2, email);
            ps.setLong(3, contact);
            ps.setString(4, uid);

            ps.executeUpdate();
            ps.close();
            con.close();

            session.setAttribute("studentName", name.trim());

            response.sendRedirect("student_profile.jsp?msg=Profile+updated+successfully");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2 style='color:red;'>Error: " + e.getMessage() + "</h2>");
            out.println("<a href='student_update_profile.jsp'>Go Back</a>");
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
