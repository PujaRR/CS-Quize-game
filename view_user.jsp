<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("org.postgresql.Driver");
        connection = DriverManager.getConnection("jdbc:postgresql://192.168.16.1/tya26", "tya26", "");

        // Fetch user data
        String query = "SELECT userid, username FROM users";
        preparedStatement = connection.prepareStatement(query);
        resultSet = preparedStatement.executeQuery();

        List<Map<String, Object>> users = new ArrayList<>();
        while (resultSet.next()) {
            Map<String, Object> user = new HashMap<>();
            user.put("userid", resultSet.getInt("userid"));
            user.put("username", resultSet.getString("username"));
            users.add(user);
        }

        request.setAttribute("users", users);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,intial-scale=1.0">
		<title>Admin Dashboard</title>
		<link rel="stylesheet" href="static/view.css"/>
		  </head>
		  <body style="background:url('TYA26/bg7.png'); background-size:cover; background-position:center; color: wheat;">
			  <header>
				<div id="nav">
	   <a href="ADdashboard.jsp" style="position:fixed; left:180px; color:white; font-size:20px; border:2px solid white; padding:4px;" >Home</a>
	 </div>
				  <div class="left_area">
					  <h3>CS QuizLet</h3>
					  </div>
					  <div class="right_area">
					  <a href="home.jsp" class="logout_btn">Logout</a>
				  </div>
				  </header>
				  <br><br><br><br><br>
				  <center>
						 <div class="section">
							<table border="1" width="80%">
							<thead>
							<tr><th colspan="2" id="heading">Users</th></tr>
							<tr>
								<th>Sr.No.</th>
								<th>User Name</th>
							</tr>
							</thead>
							<tbody>
								<% for (Map<String, Object> user : (List<Map<String, Object>>) request.getAttribute("users")) { %>
									<tr>
										<td align="center"><%= user.get("userid") %></td>
										<td align="center"><%= user.get("username") %></td>
									</tr>
								<% } %>
							
							</table>
						</div>
					</center>
		  </body>
		
</html>




















		     

