package dao;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/dao.ProductController")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductDao productDao;

    public void init() throws ServletException {
//        super.init();
//        try {
////            productDao = new dao.ProductModel();
//        } catch (SQLException e) {
//            throw new ServletException(e);
//        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "display";
        }
        try {
            switch (action) {
                case "display":
                    displayProducts(request, response);
                    break;
                case "add":
                    addProduct(request, response);
                    break;
                case "delete":
                    addProduct(request, response);
                    break;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void displayProducts(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Product2> products = ProductModel.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/views/product-list.jsp").forward(request, response);
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Product2 product2 = new Product2();
        product2.setName(name);
        product2.setCategory(description);
        product2.setPrice(Double.parseDouble(price));
        product2.setQuantity(quantity);
        ProductModel.addProduct(product2);
        response.sendRedirect(request.getContextPath() + "/dao.ProductController?action=display");
    }
}


