<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*,utils.DatabaseConnection" %>
<%
    HttpSession session = request.getSession(false);
    if (session == null || !"Employee".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head><title>Request Access</title></head>
<body>
<h2>Request Access</h2>
<form action="RequestServlet" method="post">
    Software:
    <select name="software_id" required>
        <% try (Connection conn = DatabaseConnection.getConnection()) {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT id, name FROM software");
            while(rs.next()) { %>
        <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
        <% } } %>
    </select><br>
    Access Type:
    <select name="access_type">
        <option value="Read">Read</option>
        <option value="Write">Write</option>
        <option value="Admin">Admin</option>
    </select><br>
    Reason:<br><textarea name="reason"></textarea><br>
    <input type="submit" value="Request Access">
</form>
</body>
</html>
