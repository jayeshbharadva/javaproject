import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.*;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.google.gson.JsonObject;


@WebServlet("/seller")
public class seller extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String adminid = (String) session.getAttribute("username");

        String sid = req.getParameter("sid");
        String spassword = req.getParameter("spassword");
        String sname = req.getParameter("sname");

        String action = req.getParameter("action");
        System.out.println(action);

        String sql = "insert into sellerinfo (sid,spassword,sname,adminid) values (?,?,?,?)";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amit","root","jayesh");
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,sid);
            st.setString(2,spassword);
            st.setString(3,sname);
            st.setString(4,adminid);
            st.executeUpdate();

            resp.sendRedirect("seller.jsp");
//            RequestDispatcher rd = req.getRequestDispatcher("seller.jsp");
//            rd.forward(req,resp);
        }
        catch (Exception e){
            resp.sendError(500,"exception found in sql");
        }
    }
}
