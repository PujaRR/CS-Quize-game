<%@ page language="java" contentType="Text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Quiz</title>
        <link rel="stylesheet" href="static/quiz.css">
    </head>
	<body style="background-image: url('TYA26/bg3.png');">
		<%
		String username = (String) session.getAttribute("username");
		if(username != null && !username.isEmpty()){
		%>
        <br><br><br><br><br>
        <center>
            <h1 style="color:#f8f8ff; font-size:400%;">Are you ready <%= username %>?</h1>
         </center>
         <br><br>
         <div class="info_box">
            <div class="info-title"><span>Some Rules of this Quiz</span></div>
            <div class="info-list">
                <div class="info">1.You will have only<span>15 seconds</span> per each question</div>
                <div class="info">2.Once you select your answer,it cant be under</div>
                <div class="info">3.You cant select any option once time goes off</div>
                <div class="info">4.You cant exit from the quiz while you are playing</div>
                <div class="info">5.You will get the points on basis of correct answer</div>
            </div>
            <div class="buttons">
            <a href="dashboard.jsp"><button class="quit">Back to dashboard</button></a>
            <a href="start_style.jsp?level=<%=request.getParameter("level")%>"> <button class="start_btn">Start</button></a>
            </div>
         </div>
        <%
    }
    else
    {
    %>
        <p> Error:User not authenticated. Please Log in.</p>
    <%
    }
    %>
    </body>
</html>