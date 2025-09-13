<%@ page language="java" contentType="Text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width,initial-scale=1.0">
 <title>Login and registration</title>
 <link rel="stylesheet" href="static/style.css"/>
<script>
	function showInvalidCredentials(){
		alert("Invalid username or password. Please try again.");
		window.location.href="Forgot.jsp";
	}
	 function updateSuccessful(){
                alert("Password update succesfully!");
                window.location.href="Forgot.jsp";
   

        }
	 function updateFail(){
                alert("Fail to update Password!");
                window.location.href="Forgot.jsp";
        }


  
 </script>
 </head>
<body>
	   <%
		String username=request.getParameter("Username");
		String password=request.getParameter("password");
		String security_answer=request.getParameter("security_answer");
		
		try{
		Class.forName("org.postgresql.Driver");
		Connection conn=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/tya26", "tya26", "");
		PreparedStatement ps=conn.prepareStatement("SELECT * FROM users WHERE username = ? AND security_ans = ?");
		ps.setString(1, username);
		ps.setString(2, security_answer);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
		//out.println("username, security_ans");
		//out.println("Login Successful!");
		
		ps=conn.prepareStatement("UPDATE users SET password = ? WHERE username = ?");
		ps.setString(1, password);
                ps.setString(2,  username);
		int rowsAffected= ps.executeUpdate();
		if(rowsAffected > 0) {
		out.println("<script>updateSuccessful()</script>");
		}
		else
		{
		 out.println("<script>updateFail()</script>");
		}
		
		}
		 else
                {
                out.println("<script>showInvalidCredentials();</script>");
		//out.println("not found");
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
