import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
@WebServlet("/signup")
public class signup extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        String sql = "INSERT INTO admin (username,email,password) VALUES (?,? ,?) ";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amit","root","jayesh");
            PreparedStatement p =  con.prepareStatement(sql);
            p.setString(1,username);
            p.setString(2,email);
            p.setString(3,password);
            int count = p.executeUpdate();
            if(count>=1) {
                resp.sendRedirect("login.jsp");
            }
            else {
                out.println("entered wrong data");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
