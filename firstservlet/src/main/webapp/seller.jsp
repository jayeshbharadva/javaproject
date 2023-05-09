<%@ page import="java.sql.*" %><%--
    Document   : seller
    Created on : 19 Mar, 2023, 8:46:29 PM
    Author     : WELCOME
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>seller</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#"> Billing System</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <%
    if(session.getAttribute("username")==null || session.getAttribute("username")=="")
    {
      response.sendRedirect("login.jsp");
    }
  %>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link font-weight-bold" href="admin_home.jsp" >Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link font-weight-bold" href="seller.jsp">seller</a>
      </li>
      <li class="nav-item">
        <a class="nav-link font-weight-bold" href="product2.jsp">Product</a>
      </li>
      <li class="nav-item">
        <a class="nav-link font-weight-bold" href="category.jsp">category</a>
      </li>
      <li class="nav-item">
        <a class="nav-link font-weight-bold" href="#">Report</a>
      </li>
  </div>
</nav>
<h1 class="text-center mt-4">Manage Seller</h1>


<form method="post" action = "seller">
  <div class="form-row  ml-auto" >
    <div class="form-group col-md-6 ">
      <%--@declare id="inputproductid"--%><label for="inputproductid">Seller Id</label>
      <input type="text" class="form-control" id="sid" placeholder="enter seller id" name="sid">
    </div>
    <div class="form-group col-md-6 ">
      <%--@declare id="inputquntity"--%><label for="inputquntity">password</label>
      <input type="password" class="form-control" id="spassword"  name="spassword">
    </div>
  </div>

    <div class="form-row ml-auto">
      <div class="form-group col-md-6">
        <label >Seller Name</label>
        <input type="text" class="form-control" id="sname" placeholder="enter seller name" name="sname">
      </div>
      <div class="form-group col-md-6">
        <label>Gender</label>
        <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="category">
          <option selected>Male</option>
          <option value="1">Female</option>
          <option value="2">Other</option>

        </select>
      </div>
    </div>

    <div class="row ml-auto">
      <div class="col">
        <button type="submit" class="btn btn-primary btn-lg" name="action" id="add" value="add">Add</button>

      </div>
      <div class="col">
        <button type="button" class="btn btn-primary btn-lg" name="action" id="edit" value="edit">Edit</button>

      </div>
      <div class="col">
        <button type="button" class="btn btn-primary btn-lg" name="action" id="delete" value="delete">Delete</button>

      </div><br>
      <div class="col">
        <button type="button" class="btn btn-primary btn-lg" name="action" id="clear" value = "clear">Clear</button>
      </div>
    </div>
</form>


<%
  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amit", "root", "jayesh");
    String sql = "select * from sellerinfo where adminid = ?";
    PreparedStatement st = con.prepareStatement(sql);
    st.setString(1,(String)session.getAttribute("username"));
    ResultSet rs = st.executeQuery();
%>

    </div><br><br>
    <h2 class="text-center">Seller - List </h2>
    <table class="table table-striped mt-6">
      <thead>
      <tr>
        <th scope="col">Seller id</th>
        <th scope="col">Seller Name</th>
        <th scope="col">Gender </th>
      </tr>
      </thead>

      <%
        while (rs.next()){
      %>

      <tbody>
      <tr>
        <td><%=rs.getInt(1)%></td>
        <td><%=rs.getString(3)%></td>
        <td>Otto</td>
      </tr>

<%
    }
  }
  catch (Exception e){
    System.out.println(e);
  }
%>
      </tbody>
    </table>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
