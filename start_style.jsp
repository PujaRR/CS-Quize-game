<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz</title>
    <link rel="stylesheet" href="static/start_style.css">
    <style>
        .quiz_box header .time_line{
            position: absolute;
            bottom: 0px;
            left: 0px;
            height: 3px;
            background: #007bff;
            width: 0; /* Initially set to zero */
        }
        .quiz_box header .timer #timer1{
            font-size: 18px;
            font-weight: 500;
            height: 30px;
            width: 45px;
            color: #fff;
            border-radius: 5px;
            line-height: 30px;
            text-align: center;
            background: #343a40;
            border: 1px solid #343a40;
        }
    </style>
    <script>
        var timeLeft = 15; // Set the time limit for each question in seconds
        var timer;

        function startTimer() {
            timer = setInterval(function() {
                document.getElementById("timer1").innerText = timeLeft;
                timeLeft -= 1;
                if (timeLeft < 0) {
                    clearInterval(timer);
                    document.getElementById("timeLeftInput").value = timeLeft; // Set the timeLeft value in a hidden input field
                    document.getElementById("quizForm").submit(); // Submit the form when time is up
                }
            }, 1000);
        }

        // Timer line function
        function startTimerLine() {
            var time_line = document.querySelector("header .time_line");
            var time = 0;
            var counterLine = setInterval(timer, 29);
            function timer() {
                time += 1; //upgrading time value with 1
                time_line.style.width = time + "px"; //increasing width of time_line with px by time value
                if (time > 549) { //if time value is greater than 549
                    clearInterval(counterLine); //clear counterLine
                }
            }
        }

        // Validate option selection before submitting
        function validateForm() {
            var options = document.getElementsByName("choice");
            var optionSelected = false;
            for (var i = 0; i < options.length; i++) {
                if (options[i].checked) {
                    optionSelected = true;
                    break;
                }
            }
            if (!optionSelected) {
                alert("Please select an option.");
                return false;
            }
            return true;
        }

        // Start both timers on page load
        window.onload = function() {
            startTimer();
            startTimerLine();
        };
    </script>
</head>
<body style="background-image: url('TYA26/bg3.png');">
<%
    String username = (String) session.getAttribute("username");
    if(username != null && !username.isEmpty()){
        // Process quiz only if user is authenticated
        String level = request.getParameter("level");

        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        Random r = new Random();
        int score = 0;
        int knowledge=0;
        int logical=0;
        int analytical=0;
        int currentQuestion = 1; // Track current question number
        String choice = request.getParameter("choice");
        String correct_ans = "";
        String ques_type = "";

        HttpSession sessionObj = request.getSession(true); // Create session if not exists

        // Check if quiz session attributes exist
        if (sessionObj.getAttribute("score") != null) {
            score = (Integer)sessionObj.getAttribute("score");
        }
        if (sessionObj.getAttribute("knowledge") != null) {
            knowledge = (Integer)sessionObj.getAttribute("knowledge");
        }
        if (sessionObj.getAttribute("logical") != null) {
            logical = (Integer)sessionObj.getAttribute("logical");
        }
        if (sessionObj.getAttribute("analytical") != null) {
            analytical = (Integer)sessionObj.getAttribute("analytical");
        }
        if (sessionObj.getAttribute("currentQuestion") != null) {
            currentQuestion = (Integer)sessionObj.getAttribute("currentQuestion");
        }
        if (sessionObj.getAttribute("level") != null) {
            level = (String)sessionObj.getAttribute("level");
        }

        // Process quiz
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://192.168.16.1/", "tya26", "");

            if (currentQuestion <= 10) { // Display only 10 questions
                st = con.createStatement();
                rs = st.executeQuery("SELECT * FROM "+level+" WHERE que_no = " + currentQuestion);

                if (rs.next()) {
%>

<div class="quiz_box">
    <header>
        <div class="title">CSQuizLet</div>
        <div class="timer">
            <div class="time_left_txt">Time Left: <span id="timer1"></span></div>
        </div>
        <div class="time_line"></div>
    </header>
    <form id="quizForm" action="" method="post" onsubmit="return validateForm();"> <!-- Submit to the same page -->
        <section>

            <div class="que_text">
                Q.<%= rs.getString("question")%>
                <!-- Here I've inserted question from JSP -->
            </div>
            <div class="option_list">
                <!-- Here I've inserted options from JSP -->
                <div class="option"><input type="radio" name="choice" value="a"><%= rs.getString("a")%></div>
                <div class="option"><input type="radio" name="choice" value="b"><%= rs.getString("b")%></div>
                <div class="option"><input type="radio" name="choice" value="c"><%= rs.getString("c")%></div>
                <div class="option"><input type="radio" name="choice" value="d"><%= rs.getString("d")%></div>
                <input type="hidden" name="correct_ans" value="<%= rs.getString("correct_ans")%>">
                <input type="hidden" name="ques_type" value="<%= rs.getString("ques_type")%>">
            </div>
        </section>

        <!-- footer of Quiz Box -->
        <footer>
            <div class="total_que">
                <span>
                    <p><%= currentQuestion %> out of 10</p>
                </span>
            </div>
            <button type="submit" value="submit" class="next_btn">Next</button>
        </footer>
        <input type="hidden" id="timeLeftInput" name="timeLeft" value="">
    </form>
</div>
<%
                    correct_ans = rs.getString("correct_ans");
                    ques_type = rs.getString("ques_type");
                }
            } else { // Display score after all questions are answered
                sessionObj.setAttribute("score", score); // Set score attribute in session
                sessionObj.setAttribute("knowledge", knowledge);
                sessionObj.setAttribute("logical", logical);
                sessionObj.setAttribute("analytical", analytical);
                response.sendRedirect("result.jsp"); // Redirect to the final score page
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Process answer submission
        if (choice != null && !choice.isEmpty()) {
            if (choice.equals(correct_ans)) {
                score++;
                if(ques_type.equals("knowledge")){
                    knowledge++;
                }
                else if(ques_type.equals("logical")){
                    logical++;
                }
                else
                {
                    analytical++;
                }
            }
            currentQuestion++;
            sessionObj.setAttribute("score", score);
            sessionObj.setAttribute("knowledge", knowledge);
            sessionObj.setAttribute("analytical", analytical);
            sessionObj.setAttribute("logical", logical);
            sessionObj.setAttribute("currentQuestion", currentQuestion);
            response.sendRedirect(request.getRequestURI() + "?level=" + level); // Redirect to reload the page with level parameter
        }
        else if (request.getParameter("timeLeft") != null && Integer.parseInt(request.getParameter("timeLeft")) < 0) { // If time runs out and no answer is submitted
            sessionObj.setAttribute("score", score); // Set score attribute in session
            sessionObj.setAttribute("knowledge", knowledge);
            sessionObj.setAttribute("logical", logical);
            sessionObj.setAttribute("analytical", analytical);
            response.sendRedirect("result.jsp"); // Redirect to the final score page
        }
    }
    else {
%>
<p> Error: User not authenticated. Please Log in.</p>
<%
    }
%>
</body>
</html>
