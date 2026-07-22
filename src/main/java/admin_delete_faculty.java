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

@WebServlet("/admin_delete_faculty")
public class admin_delete_faculty extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public admin_delete_faculty() {
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

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/project",
                    "root",
                    "Rajan@123");

            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM faculty_signup WHERE uid=?");

            ps.setString(1, uid);
            ps.executeUpdate();
            ps.close();
            con.close();

            response.sendRedirect("faculty_details.jsp?msg=Faculty+deleted+successfully");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2 style='color:red;'>Error: " + e.getMessage() + "</h2>");
            out.println("<a href='faculty_details.jsp'>Go Back</a>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
