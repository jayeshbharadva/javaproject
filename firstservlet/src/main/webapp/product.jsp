<%--
    Document   : product2
    Created on : 19 Mar, 2023, 8:49:21 PM
    Author     : WELCOME
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="com.mysql.cj.Session" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Product</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<script>
  function item_add() {
    var proid = document.getElementById("proid").value;
    var qunatity = document.getElementById("qunatity").value;
    var pname = document.getElementById("pname").value;
    var price =document.getElementById("price").value;
    var p_category =document.getElementById("p_category").value;
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "insert.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
        var response = xhr.responseText;
        var data = JSON.parse(response);
        addRow(data.proid, data.qunatity,data.pname,data.price ,data.p_category);
      }
    };
    var params = "id=" + encodeURIComponent(proid) + "qunatity=" + encodeURIComponent(qunatity) +"pname="+encodeURIComponent(pname)+"price="+encodeURIComponent(price)+"category="+encodeURIComponent(p_category)  ;
    xhr.send(params);
  }

  function addRow(proid,qunatity,pname,price,p_category) {
    var table = document.getElementById("myTable").getElementsByTagName("tbody")[0];
    var row = table.insertRow(-1);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5=row.insertCell(4);
    cell1.innerHTML = proid;
    cell2.innerHTML = qunatity;
    cell3.innerHTML=pname;
    cell4.innerHTML=price;
    cell5.innerHTML=p_category;
  }
</script>

<%
  if(session.getAttribute("username") == null){
    response.sendRedirect("login.jsp");
  };
%>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#"> Billing System</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

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
<h1 class="text-center mt-4">Manage Product</h1>


<form action = "product2" method="post">
  <div class="form-row ml-auto">
    <div class="form-group col-md-6">
      <label >Product Name</label>
      <input type="text" class="form-control" id="pname" placeholder="enter product2  name" name="pname">
    </div>
    <div class="form-group col-md-6">
      <label>Price</label>
      <input type="text" class="form-control" id="price" placeholder="enter product2 price" name="price">
    </div>
  </div>

    <div class="form-group col-md-6 ">
      <label for="inputquntity">Quntity</label>
      <input type="number" class="form-control" id="qunatity"  name="quantity">
    </div>
  <div class="form-group col-md-6">
    <label>category</label>
    <input type="text" class="form-control" id="p_category" placeholder="enter product2 price" name="pcategory">
  </div>
  <span class="border-bottom"></span>
  </div>
  </div>

  <div class="form-row ml-auto">

  <div class="row ml-auto">
    <div class="col">
      <button type="submit" class="btn btn-primary btn-lg" name="add_item" id="add">Add</button>
    </div>
    <div class="col">
      <button type="button" class="btn btn-primary btn-lg" name="edit_item" id="edit">Edit</button>

    </div>
    <div class="col">
      <button type="button" class="btn btn-primary btn-lg" name="delete_item" id="delete" >Delete</button>

    </div><br>
    <div class="col">
      <button type="button" class="btn btn-primary btn-lg" name="clear_item" id="clear">Clear</button>

    </div>
  </div>
</form><br><br>
<h2 class="text-center">Product-List</h2>

  <%
  try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amit", "root", "jayesh");
    String sql = "select * from product2 where adminid = ?";
    PreparedStatement st = con.prepareStatement(sql);
    st.setString(1,(String) session.getAttribute("username"));
    ResultSet rs = st.executeQuery();
    %>

<table class="table table-striped mt-6" id="myTable">
  <thead>
  <tr>
    <th scope="col">Product id</th>
    <th scope="col">Product Quantity</th>
    <th scope="col">Product Name</th>
    <th scope="col">Product Price</th>
    <th scope="col">Product Category</th>
  </tr>
  </thead>

  <%
    while (rs.next()){
  %>
  <tr>
    <td><%=rs.getInt(1)%></td>
    <td><%=rs.getInt(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getInt(4)%></td>
    <td><%=rs.getString(5)%></td>
  </tr>
<%
    }
  }
  catch (Exception e){
    System.out.println(e);
  }
%>
  <tbody>
</table>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
