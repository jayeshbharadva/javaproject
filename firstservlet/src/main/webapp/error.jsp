<%@ page isErrorPage="true" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
<h1>Error:</h1>
<p><%= request.getAttribute("javax.servlet.error.message") %></p>
</body>
</html>
