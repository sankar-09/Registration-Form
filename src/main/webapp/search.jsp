<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<!-- Add CSS file -->
<link rel="stylesheet" type="text/css" href="s.css">
<!-- Add JS file -->
<script type="text/javascript" src="s.js"></script>
</head>
<body>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String course = request.getParameter("course");
    String batch = request.getParameter("batch");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","SSR2002#cc99");
        PreparedStatement ps;
        StringBuilder query = new StringBuilder("SELECT * FROM students WHERE 1=1");
        if (id != null && !id.isEmpty()) {
            query.append(" AND id=?");
        }
        if (name != null && !name.isEmpty()) {
            query.append(" AND name LIKE ?");
        }
        if (email != null && !email.isEmpty()) {
            query.append(" AND email LIKE ?");
        }
        if (phone != null && !phone.isEmpty()) {
            query.append(" AND phone LIKE ?");
        }
        if (course != null && !course.isEmpty()) {
            query.append(" AND course LIKE ?");
        }
        if (batch != null && !batch.isEmpty()) {
            query.append(" AND batch LIKE ?");
        }
        ps=con.prepareStatement(query.toString());
        int parameterIndex = 1;
        if (id != null && !id.isEmpty()) {
            ps.setInt(parameterIndex, Integer.parseInt(id));
            parameterIndex++;
        }
        if (name != null && !name.isEmpty()) {
            ps.setString(parameterIndex, "%" + name + "%");
            parameterIndex++;
        }
        if (email != null && !email.isEmpty()) {
            ps.setString(parameterIndex, "%" + email + "%");
            parameterIndex++;
        }
        if (phone != null && !phone.isEmpty()) {
            ps.setString(parameterIndex, "%" + phone + "%");
            parameterIndex++;
        }
        if (course != null && !course.isEmpty()) {
            ps.setString(parameterIndex, "%" + course + "%");
            parameterIndex++;
        }
        if (batch != null && !batch.isEmpty()) {
            ps.setString(parameterIndex, "%" + batch + "%");
            parameterIndex++;
        }
        ResultSet rs=ps.executeQuery();
        boolean found = false;
        out.println("<table border='1'>");
        out.println("<tr><th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Course</th><th>Batch</th></tr>");
        while(rs.next()){
            found = true;
            out.println("<tr><td>"+rs.getInt("id")+"</td><td>"+rs.getString("name")+"</td><td>"+rs.getString("email")+"</td><td>"+rs.getString("phone")+"</td><td>"+rs.getString("course")+"</td><td>"+rs.getString("batch")+"</td></tr>");
        }
        out.println("</table>");


        if(!found){
            if(id == null && name == null && email == null && phone == null && course == null && batch == null) {
                out.println("<h2>Please enter at least one search term.</h2>");
            } else {
                out.println("<h2>No results found.</h2>");
            }
        }
    } catch(Exception e) {
        out.println(e);
    }
%>
<button onclick="location.href='register.html'">Register</button>
<button onclick="location.href='login.html'">Login</button>

</body>
</html>