<%@ page language="java" contentType="Text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Registration</title>
		<script>
		      function showAlert(message){
		      alert(message);
		      window.location.href = "home.jsp";
		      }
		      function showSuccess(message){
		      alert(message);
		      window.location.href = "home.jsp";
		      }
		</script>
	</head>
	<body>
		<%
		try{
			Class.forName("org.postgresql.Driver");
			Connection conn=DriverManager.getConnection("jdbc:postgresql://192.168.16.1/tya26", "tya26", "");
		
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String password1 = request.getParameter("password1");
			String security_answer = request.getParameter("security_answer");
			String checkquery="SELECT * FROM users WHERE username=?";

			if(password.equals(password1)){
				try{
					PreparedStatement check = conn.prepareStatement(checkquery);
					check.setString(1, username);
					ResultSet rs = check.executeQuery();
					if(rs.next()){
					out.println("<script>showAlert('Username already taken. Please choose a different username.')</script>");
					}
					else
					{
					/* Statement st=conn.createStatement();
					ResultSet rs1=st.executeQuery("SELECT MAX(userID) FROM users;");
					int max_users=0;
					if(rs1.next())
					{
					max_users=rs1.getInt(1);
					}
					int new_user=max_users+1;
					*/
					String insert= "INSERT INTO users VALUES (DEFAULT, ?, ?, ?);";
					PreparedStatement ps =conn.prepareStatement(insert);
						//ps.setInt(1, new_user);
						ps.setString(1, username);
						ps.setString(2, password);
						ps.setString(3, security_answer);
						ps.executeUpdate();
					out.println("<script> showSuccess('Registration Successful!');</script>");
					}
				}
				catch(SQLException e){
				out.println("Error during registration:"+e.getMessage());
				}
			}
			else{
				out.println("<script>showAlert('Failed to register: Password and Confirm password does not match! Please Enter Correctly!')</script>");
			}
			conn.close();
		}
		catch(Exception e){
		out.println(e);
		}


		%>
	</body>
</html>

