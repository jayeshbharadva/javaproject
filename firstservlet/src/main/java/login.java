import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("userName");
        String pass = req.getParameter("password");

        logindao l = new logindao();
        if(l.docheck(id,pass)){
            HttpSession s = req.getSession();
            s.setAttribute("username",id);
            resp.sendRedirect("admin_home.jsp");
        }
        else {
            req.setAttribute("errormsg", "invalid");
            System.out.println("error occured");
            resp.sendRedirect("login.jsp");
        }

    }
}
