<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    String selectedLevel = request.getParameter("level");

    try {
        Class.forName("org.postgresql.Driver");
        connection = DriverManager.getConnection("jdbc:postgresql://192.168.16.1/tya26", "tya26", "");

        if (selectedLevel != null && !selectedLevel.isEmpty()) {
            // Fetch questions for the selected level
            String query = "SELECT que_no, question FROM " + selectedLevel;
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();

            List<Map<String, Object>> questions = new ArrayList<>();
            while (resultSet.next()) {
                Map<String, Object> question = new HashMap<>();
                question.put("que_no", resultSet.getInt("que_no"));
                question.put("question", resultSet.getString("question"));
                questions.add(question);
            }

            request.setAttribute("questions", questions);
        }
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="static/view.css">
	<style>
		.display
		{
			width:150px;
			height:50px;
			color:wheat;
			background-color: #19B3D3;
			border: 2px solid black;
			border-radius:20px;
		}
	</style>
</head>
<body style="background:url('TYA26/bg7.png'); background-size:cover; background-position:center; color: wheat;">
<header>
    <div id="nav">
        <a href="ADdashboard.jsp" style="position:fixed; left:180px; color:white; font-size:20px; border:2px solid white; padding:4px;">Home</a>
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
	<br>
    <form method="get" action="">
       <span style="color:#19B3D3; font-size: 30px;"> <label for="level">Select Quiz Level : &nbsp;&nbsp;</label></span>
        <select name="level" id="level">
            <option>c1</option>
            <option>c2</option>
            <option>c3</option>
			<option>html1</option>
            <option>html2</option>
            <option>html3</option>
            <option>css1</option>
            <option>css2</option>
            <option>css3</option>
            <option>js1</option>
            <option>js2</option>
            <option>js3</option>
			<option>java1</option>
            <option>java2</option>
            <option>java3</option>
			<option>python1</option>
            <option>python2</option>
            <option>python3</option>
            <option>dsa1</option>
            <option>dsa2</option>
            <option>dsa3</option>
            <option>dbms1</option>
            <option>dbms2</option>
            <option>dbms3</option>
           
        </select>
		&nbsp;&nbsp; &nbsp;
        <button type="submit" value="Submit" class="display">Display Questions</button>
    </form>
	<br><br>
    <div class="section">
        <table border="1" width="80%">
            <thead>
            <tr><th colspan="3" id="heading">Questions</th></tr>
            <tr>
                <th>Sr.no.</th>
                <th align="left">Question</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <% if (request.getAttribute("questions") != null) {
                for (Map<String, Object> question : (List<Map<String, Object>>) request.getAttribute("questions")) { %>
                    <tr>
                        <td align="center"><%= question.get("que_no") %></td>
                        <td align="left"><%= question.get("question") %></td>
                        <td align="center">
                            <form method="post" action="deleteQuestion.jsp">
                                <input type="hidden" name="level" value="<%= selectedLevel %>">
                                <input type="hidden" name="que_no" value="<%= question.get("que_no") %>">
                                <button type="submit">Delete</button>
                            </form>
                        </td>
                    </tr>
                <% }
            } %>
            </tbody>
        </table>
    </div>
</center>
</body>
</html>
