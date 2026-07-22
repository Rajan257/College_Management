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

@WebServlet("/faculty_upload_notice")
public class faculty_upload_notice extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public faculty_upload_notice() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("facultyUID") == null) {
            response.sendRedirect("faculty.jsp");
            return;
        }

        String facultyName = (String) session.getAttribute("facultyName");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        if (title == null || title.trim().isEmpty() || content == null || content.trim().isEmpty()) {
            out.println("<h2 style='color:red;'>Title and Content are required.</h2>");
            out.println("<a href='faculty_upload_notice.jsp'>Go Back</a>");
            return;
        }

        if (facultyName == null || facultyName.trim().isEmpty()) {
            facultyName = (String) session.getAttribute("facultyUID");
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
                    "INSERT INTO notices(title, content, posted_by) VALUES(?,?,?)");

            ps.setString(1, title.trim());
            ps.setString(2, content.trim());
            ps.setString(3, facultyName);

            ps.executeUpdate();
            ps.close();
            con.close();

            response.sendRedirect("faculty_home.jsp?msg=Notice+uploaded+successfully");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2 style='color:red;'>Error: " + e.getMessage() + "</h2>");
            out.println("<a href='faculty_upload_notice.jsp'>Go Back</a>");
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
