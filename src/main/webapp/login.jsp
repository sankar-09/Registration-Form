<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String message = "";
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/login", "root", "SSR2002#cc99");

        stmt = conn.prepareStatement("SELECT * FROM students WHERE email=?");
        stmt.setString(1, email);
        rs = stmt.executeQuery();

        if (rs.next() && rs.getString("password").equals(password)) {
            session.setAttribute("email", email);
            response.sendRedirect("welcome.html");
        } else {
            message = "Invalid email or password.";
            response.sendRedirect("login.html?message=" + message);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>