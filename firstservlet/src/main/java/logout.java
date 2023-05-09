import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

//      for the back button login problem prevention
//        resp.setHeader("Cache-Control","np-cache,no-store,must-revalidate");
        resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        resp.setDateHeader("Expires", 0); // Proxies.

//        if not logged in
        if(session.getAttribute("username")==null || session.getAttribute("username")=="")
        {
            resp.sendRedirect("login.jsp");
        }
        else {
            session.removeAttribute("username");
            session.invalidate();
            System.out.println("session destroyed");
            resp.sendRedirect("login.jsp");
        }
    }
}
