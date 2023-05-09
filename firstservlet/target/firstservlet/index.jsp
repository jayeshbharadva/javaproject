<html>
<body>
<h2>Hello World!</h2>
    <form action="add" method="get">
        id: <input type ="text" name="id"><br>
        pass:<input type = "text" name = "pass"><br>
        <input type="submit">
    </form>
<%
    response.sendRedirect("login.jsp");
%>
</body>
</html>
