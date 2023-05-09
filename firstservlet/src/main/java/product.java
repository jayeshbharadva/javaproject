import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@WebServlet("/product")
public class product extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/amit","root","jayesh");
                int qunatity =Integer.parseInt(req.getParameter("quantity"));
                String name= req.getParameter("pname");
                int price =Integer.parseInt(req.getParameter("price"));
                String category= req.getParameter("pcategory");

                String sql = "INSERT INTO product (quantity,pname,price,pcategory,adminid) VALUES (?,?, ?,? ,?) ";

                PreparedStatement pstmt= con.prepareStatement(sql);

                pstmt.setInt(1, qunatity);
                pstmt.setString(2,name);
                pstmt.setInt(3,price);
                pstmt.setString(4, category);
                pstmt.setString(5,(String) session.getAttribute("username"));

                pstmt.executeUpdate();

                req.setAttribute("successmsg", "succes");
                resp.sendRedirect("product.jsp");
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
    }
}
