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

@WebServlet("/admin_delete_student")
public class admin_delete_student extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public admin_delete_student() {
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

            Connection con = DBUtil.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM student_signup WHERE uid=?");

            ps.setString(1, uid);
            ps.executeUpdate();
            ps.close();
            con.close();

            response.sendRedirect("student_details.jsp?msg=Student+deleted+successfully");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2 style='color:red;'>Error: " + e.getMessage() + "</h2>");
            out.println("<a href='student_details.jsp'>Go Back</a>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
