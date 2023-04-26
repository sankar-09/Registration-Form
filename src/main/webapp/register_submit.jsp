<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone");
	String course = request.getParameter("course");
	String batch = request.getParameter("batch");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","SSR2002#cc99");
		PreparedStatement ps=con.prepareStatement("insert into students(name,email,password,phone,course,batch) values(?,?,?,?,?,?)");
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,password);
		ps.setString(4,phone);
		ps.setString(5,course);
		ps.setString(6,batch);
		int count = ps.executeUpdate();
		if (count > 0) {
			out.println("<h2>Registration Successful! Please click <a href='login.html'>here</a> to login.</h2>");
		} else {
			out.println("<h2>Registration Failed!</h2>");
			response.sendRedirect("register.html");
		}
	}catch(Exception e){
		out.println(e);
	}
%>
</body>
</html>
