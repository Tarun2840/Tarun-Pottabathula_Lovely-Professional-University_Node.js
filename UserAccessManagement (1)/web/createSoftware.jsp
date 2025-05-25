<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.*,java.sql.*,utils.DatabaseConnection" %>
<%
    HttpSession session = request.getSession(false);
    if (session == null || !"Admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head><title>Create Software</title></head>
<body>
<h2>Create New Software</h2>
<form action="SoftwareServlet" method="post">
    Name: <input type="text" name="name" required><br>
    Description:<br><textarea name="description"></textarea><br>
    Access Levels:<br>
    <input type="checkbox" name="access_levels" value="Read"> Read
    <input type="checkbox" name="access_levels" value="Write"> Write
    <input type="checkbox" name="access_levels" value="Admin"> Admin<br>
    <input type="submit" value="Add Software">
</form>
</body>
</html>
