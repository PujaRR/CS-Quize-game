<%@ page language="java" contentType="Text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Feedback</title>
        <link rel="stylesheet" href="static/feedback.css">
    </head>
	<body style="background-image:url('TYA26/bg5.jpg');
    -webkit-background-size:cover;
     background-size:cover;font-family: poppins; ">
		<%
		String username = (String) session.getAttribute("username");
		if(username != null && !username.isEmpty()){
		%>
        <header>
            <div id="nav">
             <a href="dashboard.jsp" style="position:fixed; left:10px;" >Home</a>
           <a href="home.jsp" style="position:fixed; right:10px;" >logout</a>
            </div>
           </header>
        
           <center>
             <h1>Hey, <%= username %> add your feedback here....!!!</h1><br><br>
             <div id="Feedback">
             <form action="response.jsp" method="post" id="feedback">
             <h2>Feedback</h2>
                 <textarea cols="60" rows="10" name="Feedback"></textarea><br><br>
                 <button type="submit" form="feedback" value="Send Feedback">Send Feedback</button>
           </div>
           </center>
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