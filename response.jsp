<%@ page language="java" contentType="Text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Feedback</title>
		<script>
		      function showSuccess(message){
		      alert(message);
		      window.location.href = "dashboard.jsp";
		      }
		</script>
	</head>
	<body>
		<%
		try{
			Class.forName("org.postgresql.Driver");
			Connection conn=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/tya26", "tya26", "");
		
			String Feedback = request.getParameter("Feedback");
		
			try{
				String insert= "INSERT INTO feedback VALUES (DEFAULT, ?);";
				PreparedStatement ps =conn.prepareStatement(insert);
					ps.setString(1, Feedback);
					ps.executeUpdate();
				out.println("<script> showSuccess('Feedback send successfully!');</script>");
				}
			catch(SQLException e)
            {
			    out.println("Error during registration:"+e.getMessage());
			}
			conn.close();
        }
		catch(Exception e)
        {
		 out.println(e);
		}


		%>
	</body>
</html>

