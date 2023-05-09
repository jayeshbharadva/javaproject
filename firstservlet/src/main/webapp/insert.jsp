<%--
    Document   : insert
    Created on : 26 Mar, 2023, 5:39:16 PM
    Author     : WELCOME
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
  String url = "jdbc:mysql://localhost:3306/billing_system";
  String username = "root";
  String password = "jayesh";

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try {

    conn = DriverManager.getConnection(url, username, password);
    if(request.getParameter("add_item")!=null) {

      int qunatity =Integer.parseInt(request.getParameter("qunatity"));

      String name= request.getParameter("name");
      int price =Integer.parseInt(request.getParameter("price"));
      String category= request.getParameter("category");

      String sql = "INSERT INTO product2 (qunatity,name,price,category) VALUES (?, ?,? ,?) ";
      pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

      pstmt.setInt(1, qunatity);
      pstmt.setString(2,name);
      pstmt.setInt(3,price);
      pstmt.setString(4, category);

      pstmt.executeUpdate();

      request.setAttribute("successmsg", "succes");
    }


  } catch (SQLException e) {
    e.printStackTrace();
  } finally {
    // Close resources (connection, statement, result set)
    if (rs != null) {
      try {
        rs.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    if (pstmt != null) {
      try {
        pstmt.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }

%>
