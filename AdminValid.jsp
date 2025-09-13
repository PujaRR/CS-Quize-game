<%@ page language="java" contentType="Text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login validation</title>
		<script>
		      function showInvalidCredentials(){
		      alert("Invalid username or password. Please try again.");
		      window.location.href="home.jsp";
		      }
		</script>
	</head>
	<body>
		<%
		String adminname=request.getParameter("adminname");
		String password=request.getParameter("password");
		try{
		Class.forName("org.postgresql.Driver");
		Connection conn=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/tya26", "tya26", "");
		PreparedStatement ps=conn.prepareStatement("SELECT adminname, password FROM admin WHERE adminname=? AND password=?");
		ps.setString(1, adminname);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
		session.setAttribute("adminname", adminname);
		response.sendRedirect("ADdashboard.jsp");
		}
		else
		{
		out.println("<script>showInvalidCredentials();</script>");
		}
		conn.close();
		}
		catch(Exception e)
		{
		out.println("Error:"+e.getMessage());
		}
		%>
	</body>
</html>
