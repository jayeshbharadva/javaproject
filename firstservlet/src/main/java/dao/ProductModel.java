package dao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductModel{
    public static HttpServletRequest request;

    public ProductModel(HttpServletRequest request) {
        this.request = request;
    }

    static HttpSession session = request.getSession();
    private static Connection connection;

    public ProductModel() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/amit";
        String username = "root";
        String password = "jayesh";
        connection = DriverManager.getConnection(url, username, password);
    }

    public static List<Product2> getAllProducts() throws SQLException {
        List<Product2> product2s = new ArrayList<>();
        String query = "select * from product where adminid = ?";
        PreparedStatement st = connection.prepareStatement(query);
        st.setString(1,(String) session.getAttribute("username"));
        ResultSet resultSet = st.executeQuery();
        while (resultSet.next()) {
            Product2 product2 = new Product2();
            product2.setId(resultSet.getInt("pid"));
            product2.setName(resultSet.getString("pname"));
            product2.setCategory(resultSet.getString("pcategory"));
            product2.setPrice(resultSet.getDouble("price"));
            product2.setQuantity(resultSet.getInt("quantity"));
            product2s.add(product2);
        }
        return product2s;
    }

    public static void addProduct(Product2 product2) throws SQLException {
        String query = "INSERT INTO products(name, description, price,quantity,adminid) VALUES (?, ?, ?, ? , ?)";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, product2.getName());
        statement.setString(2, product2.getCategory());
        statement.setDouble(3, product2.getPrice());
        statement.setInt(4, product2.getQuantity());
        statement.setString(5, (String) session.getAttribute("username"));
        statement.executeUpdate();
    }

    public void deleteProduct(int id) throws SQLException {
        String query = "DELETE FROM products WHERE id=?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, id);
        statement.executeUpdate();
    }

    public void close() throws SQLException {
        connection.close();
    }
}
