<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*,utils.DatabaseConnection" %>
<%
    HttpSession session = request.getSession(false);
    if (session == null || !"Manager".equals(session.getAttribute("role"))) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head><title>Pending Requests</title></head>
<body>
<h2>Pending Access Requests</h2>
<table border="1">
<tr><th>Employee</th><th>Software</th><th>Access Type</th><th>Reason</th><th>Action</th></tr>
<% try (Connection conn = DatabaseConnection.getConnection()) {
    String sql = "SELECT r.id, u.username, s.name, r.access_type, r.reason " +
                 "FROM requests r JOIN users u ON r.user_id=u.id JOIN software s ON r.software_id=s.id WHERE r.status='Pending'";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    while(rs.next()) { %>
<tr>
<td><%= rs.getString("username") %></td>
<td><%= rs.getString("name") %></td>
<td><%= rs.getString("access_type") %></td>
<td><%= rs.getString("reason") %></td>
<td>
    <form action="ApprovalServlet" method="post" style="display:inline;">
        <input type="hidden" name="request_id" value="<%= rs.getInt("id") %>">
        <input type="hidden" name="action" value="Approved">
        <input type="submit" value="Approve">
    </form>
    <form action="ApprovalServlet" method="post" style="display:inline;">
        <input type="hidden" name="request_id" value="<%= rs.getInt("id") %>">
        <input type="hidden" name="action" value="Rejected">
        <input type="submit" value="Reject">
    </form>
</td>
</tr>
<% } } %>
</table>
</body>
</html>
