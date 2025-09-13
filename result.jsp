<%@ page language="java" contentType="Text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Result</title>
        <link rel="stylesheet" href="static/result.css">
    </head>
	<body style="background-image:url('TYA26/bg4.png');">
		<%
		String username = (String) session.getAttribute("username");
		if(username != null && !username.isEmpty()){
		%>
        <% 
                HttpSession sessionObj = request.getSession(false); // Retrieve existing session
                if (sessionObj != null && sessionObj.getAttribute("score") != null) {
                    Integer score = (Integer)sessionObj.getAttribute("score");
                    score= (score*100)/10;
                    Integer knowledge = (Integer)sessionObj.getAttribute("knowledge");
                    knowledge = (knowledge*100)/3;
                    Integer logical = (Integer)sessionObj.getAttribute("logical");
                    logical = (logical*100)/3;
                    Integer analytical = (Integer)sessionObj.getAttribute("analytical");
                    analytical = (analytical*100)/4;
                    
            %>
        <br><br><br><br><br>
        <center>
            <h1 style="color:#f8f8ff; font-size:400%;">Here is Your Result <%= username %>!</h1>
        </center>
        <div class="bodycard" style="padding-top: 100px; padding-bottom: 10px;">
            <div class="container">
                    <div class="card">
                        <div class="percent" style="--clr:#04fc43;--num:<%= score %>;">
                            <div class="dot"></div>
                            <svg>
                                <circle cx="70" cy="70" r="70"></circle>
                                <circle cx="70" cy="70" r="70"></circle>
                            </svg>
                            <div class="number">
                                <h2><%= score %><span>%</span></h2>
                                <p>Progress</p>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                                            <div class="percent" style="--clr:#fee800;--num:<%= analytical %>;">
                                                    <div class="dot"></div>
                                                    <svg>
                                                            <circle cx="70" cy="70" r="70"></circle>
                                                            <circle cx="70" cy="70" r="70"></circle>
                                                    </svg>
                                                    <div class="number">
                                                            <h2><%= analytical %><span>%</span></h2>
                                                            <p>Analysis</p>
                                                    </div>
                                            </div>
                                    </div>
                    <div class="card">
                                            <div class="percent" style="--clr:#ff00be;--num:<%= logical %>;">
                                                    <div class="dot"></div>
                                                    <svg>
                                                            <circle cx="70" cy="70" r="70"></circle>
                                                            <circle cx="70" cy="70" r="70"></circle>
                                                    </svg>
                                                    <div class="number">
                                                            <h2><%= logical %><span>%</span></h2>
                                                            <p>logic</p>
                                                    </div>
                                            </div>
                                    </div>
                    <div class="card">
                                            <div class="percent" style="--clr:#06ccff;--num:<%= knowledge %>;">
                                                    <div class="dot"></div>
                                                    <svg>
                                                            <circle cx="70" cy="70" r="70"></circle>
                                                            <circle cx="70" cy="70" r="70"></circle>
                                                    </svg>
                                                    <div class="number">
                                                            <h2><%= knowledge %><span>%</span></h2>
                                                            <p>knowledge</p>
                                                    </div>
                                            </div>
                                    </div>
                </div>
            </div>
            <div class="btns">
                <a href="dashboard.jsp"><button class="button" style="border-radius: 20px;">Back to dashboard</button></a>
            </div>

        <% 
                } else {
                    out.println("No score available.");
         }
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