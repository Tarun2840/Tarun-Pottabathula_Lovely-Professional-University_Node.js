<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Sign Up</title></head>
<body>
<h2>Sign Up</h2>
<form action="SignUpServlet" method="post">
    Username: <input type="text" name="username" required><br>
    Password: <input type="password" name="password" required><br>
    <input type="submit" value="Sign Up">
</form>
<a href="login.jsp">Already have an account? Login here.</a>
</body>
</html>
