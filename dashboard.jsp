<%@ page language="java" contentType="Text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Dashboard</title>
        <link rel="stylesheet" href="static/dashboard.css">
        <style>
            .btn{
	width: 250px;
	height: 50px;
	border: 3px solid black;
    border-radius: 20px;
	background: transparent;
}
        </style>
    </head>
	<body>
		<%
    String username = (String) session.getAttribute("username");
    if(username != null && !username.isEmpty()){
        HttpSession sessionObj = request.getSession(false); // Retrieve existing session
        if (sessionObj != null) {
            // Retain the username and invalidate other session objects
            String existingUsername = (String) sessionObj.getAttribute("username");
            sessionObj.invalidate();
            sessionObj = request.getSession(true); // Create a new session
            sessionObj.setAttribute("username", existingUsername);
        }
%>
        <span><div class="logo" style="background-image: url('TYA26/logo.png');"></div></span>
			<header>
		        <nav class="navigation">
			    <a href="Feedback.jsp">Feedback</a>
			    <a href="home.jsp" class="logout_btn">Logout</a>
			    </nav>
			</header>
			    <br><br>
                <center>
                    <h1 style="color:#f8f8ff; font-size:400%;">WELCOME, <%= username %>!</h1>
                 </center>
                 <div class="section">
                    <div class="box1" style="background-image:url('TYA26/C.png');">
                <div class="boxcontent">
                     <h2>C</h2><br>
                    <button class="btn"><a href="quiz.jsp?level=c1" style="color:black; font-weight:700; font-size:30px;" > Play Level 1</a></button><br>
                    <button class="btn"><a href="quiz.jsp?level=c2" style="color:black; font-weight:700; font-size:30px;" > Play Level 2</a></button><br>
                    <button class="btn"><a href="quiz.jsp?level=c3" style="color:black; font-weight:700; font-size:30px;" > Play Level 3</a></button><br>
                    
                </div>
                </div>
                    <div class="box1" style="background-image:url('TYA26/JAVA.png');">
                    <div class="boxcontent">
                     <h2>Java</h2><br>
                     <button class="btn"><a href="quiz.jsp?level=java1" style="color:black; font-weight:700; font-size:30px;" > Play Level 1</a></button><br>
                     <button class="btn"><a href="quiz.jsp?level=java2" style="color:black; font-weight:700; font-size:30px;" > Play Level 2</a></button><br>
                     <button class="btn"><a href="quiz.jsp?level=java3" style="color:black; font-weight:700; font-size:30px;" > Play Level 3</a></button><br>
                </div>
                </div>
                <div class="box1" style="background-image:url('TYA26/Python.png');">
                                <div class="boxcontent">
                                     <h2>Python</h2><br>
                                     <button class="btn"><a href="quiz.jsp?level=python1" style="color:black; font-weight:700; font-size:30px;" > Play Level 1</a></button><br>
                                     <button class="btn"><a href="quiz.jsp?level=python2" style="color:black; font-weight:700; font-size:30px;" > Play Level 2</a></button><br>
                                     <button class="btn"><a href="quiz.jsp?level=python3" style="color:black; font-weight:700; font-size:30px;" > Play Level 3</a></button><br>
                                </div>
                                </div>
                              <div class="box1" style="background-image:url('TYA26/HTML5.png');">
                                <div class="boxcontent">
                                     <h2>HTML</h2><br>
                                     <button class="btn"><a href="quiz.jsp?level=html1" style="color:black; font-weight:700; font-size:30px;" > Play Level 1</a></button><br>
                                     <button class="btn"><a href="quiz.jsp?level=html2" style="color:black; font-weight:700; font-size:30px;" > Play Level 2</a></button><br>
                                     <button class="btn"><a href="quiz.jsp?level=html3" style="color:black; font-weight:700; font-size:30px;" > Play Level 3</a></button><br>
                                    </div>
                                </div>
              <div class="box1" style="background-image:url('TYA26/CSS.png');">
                                <div class="boxcontent">
                                     <h2>CSS 3</h2><br>
                                     <button class="btn"><a href="quiz.jsp?level=css1" style="color:black; font-weight:700; font-size:30px;" > Play Level 1</a></button><br>
                                     <button class="btn"><a href="quiz.jsp?level=css2" style="color:black; font-weight:700; font-size:30px;" > Play Level 2</a></button><br>
                                     <button class="btn"><a href="quiz.jsp?level=css3" style="color:black; font-weight:700; font-size:30px;" > Play Level 3</a></button><br>
                                </div>
                                </div>
                <div class="box1"  style="background-image:url('TYA26/JAVASCRIPT.jpg');">
                                <div class="boxcontent">
                                     <h2>JavaScript</h2><br>
                                     <button class="btn"><a href="quiz.jsp?level=js1" style="color:black; font-weight:700; font-size:30px;" > Play Level 1</a></button><br>
                                     <button class="btn"><a href="quiz.jsp?level=js2" style="color:black; font-weight:700; font-size:30px;" > Play Level 2</a></button><br>
                                     <button class="btn"><a href="quiz.jsp?level=js3" style="color:black; font-weight:700; font-size:30px;" > Play Level 3</a></button><br>
                                </div>
                                </div>
                <div class="box1"  style="background-image:url('TYA26/DSA.jpg');">
                                <div class="boxcontent">
                                     <h2>DSA</h2><br>
                                     <button class="btn"><a href="quiz.jsp?level=dsa1" style="color:black; font-weight:700; font-size:30px;" > Play Level 1</a></button><br>
                                     <button class="btn"><a href="quiz.jsp?level=dsa2" style="color:black; font-weight:700; font-size:30px;" > Play Level 2</a></button><br>
                                     <button class="btn"><a href="quiz.jsp?level=dsa3" style="color:black; font-weight:700; font-size:30px;" > Play Level 3</a></button><br>
                                </div>
                </div>
                <div class="box1"  style="background-image:url('TYA26/DBMS.jpeg');">
                                <div class="boxcontent">
                                     <h2>DBMS</h2><br>
                                     <button class="btn"><a href="quiz.jsp?level=dbms1" style="color:black; font-weight:700; font-size:30px;" > Play Level 1</a></button><br>
                                     <button class="btn"><a href="quiz.jsp?level=dbms2" style="color:black; font-weight:700; font-size:30px;" > Play Level 2</a></button><br>
                                     <button class="btn"><a href="quiz.jsp?level=dbms3" style="color:black; font-weight:700; font-size:30px;" > Play Level 3</a></button><br>
                                </div>
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