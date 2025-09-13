<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("org.postgresql.Driver");
        connection = DriverManager.getConnection("jdbc:postgresql://192.168.16.1/tya26", "tya26", "");
        
        // Query to get total users
        String query = "SELECT COUNT(*) AS totalUsers FROM users";
        preparedStatement = connection.prepareStatement(query);
        resultSet = preparedStatement.executeQuery();

        int totalUsers = 0;
        if (resultSet.next()) {
            totalUsers = resultSet.getInt("totalUsers");
        }
        request.setAttribute("totalUsers", totalUsers);

        // Query to get total questions
        String[] categories = {"c1", "c2", "c3", "html1", "html2", "html3", "css1", "css2", "css3", "js1", "js2", "js3", "java1", "java2", "java3", "python1", "python2", "python3", "dsa1", "dsa2", "dsa3", "dbms1", "dbms2", "dbms3"};
        int totalQuestions = 0;

        for (String category : categories) {
            String countQuery = "SELECT COUNT(*) AS total FROM " + category;
            preparedStatement = connection.prepareStatement(countQuery);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                totalQuestions += resultSet.getInt("total");
            }
        }

        request.setAttribute("totalQuestions", totalQuestions);
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
    <link rel="stylesheet" href="static/ADdashboard.css">
</head>
<body style="background-image: url('TYA26/dash.jpg');">
<%
    String adminname = (String) session.getAttribute("adminname");
    if (adminname != null && !adminname.isEmpty()) {
%>
    <header>
        <div class="left_area">
            <h3>CSQuizLet</h3>
        </div>
        <div class="right_area">
            <a href="view_feedback.jsp" class="feedback_btn">See Feedbacks</a>
            <a href="home.jsp" class="logout_btn">Logout</a>
        </div>
    </header>
    <br><br><br><br><br>
    <center>
        <h1 style="font-size:400%;">WELCOME, <%= adminname %>!</h1>
        <br><br><br><br>
        <div class="section">
            <div class="layer">
                <div class="box1" style="background-image: url('TYA26/admin.jpg');">
                    <div class="boxcontent">
                        <h2>Users</h2>
                        <div class="info">
                            <p>Total number of users</p><br>
                            <div class="Total"><p><%= request.getAttribute("totalUsers") %></p></div><br>
                            <button><a href="view_user.jsp" class="btn">See all users</a></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="layer">
                <div class="box2" style="background-image: url('TYA26/Question.jpg');">
                    <div class="boxcontent">
                        <h2>Questions</h2>
                        <div class="info1">
                            <p>Total questions</p><br>
                            <div class="Total1"><p><%= request.getAttribute("totalQuestions") %></p></div><br>
                            <button><a href="add_QB.jsp">Add a question bank</a></button><br>
                            <button><a href="add_question.jsp" class="btn">Add a question</a></button><br>
                            <button><a href="view_question.jsp" class="btn">View questions</a></button><br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </center>
<%
    } else {
%>
    <p>Error: Admin not authenticated. Please Log in.</p>
<%
    }
%>
</body>
</html>
