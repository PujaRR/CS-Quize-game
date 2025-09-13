<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="static/view.css">
    <script>
        function showSuccess(message){
            alert(message);
            window.location.href = "add_question.jsp";
        }
    </script>
</head>
<body style="background:url('TYA26/bg7.png'); background-size:cover; background-position:center; color: wheat;"></body>
<header>
    <div id="nav">
        <a href="ADdashboard.jsp" style="position:fixed; left:180px; color:white; font-size:20px; border:2px solid white; padding:2px;">Home</a>
    </div>
    <div class="left_area">
        <h3>CS QuizLet</h3>
    </div>
    <div class="right_area">
        <a href="home.jsp" class="logout_btn">Logout</a>
    </div>
</header>
<br><br><br><br><br>
<div class="section">
    <fieldset>
        <center>
            <legend><h1 style="text-align:center; color:blue;">ADD Question</h1></legend>
            <form method="POST" autocomplete="off" style="margin:100px; margin-top:0px;" action="">
                <br><br>
                <label for="course_name">Select Quiz Name:-</label><br><br>
                <select name="level" required>
                    <option>html1</option>
                    <option>html2</option>
                    <option>html3</option>
                    <option>css1</option>
                    <option>css2</option>
                    <option>css3</option>
                    <option>js1</option>
                    <option>js2</option>
                    <option>js3</option>
					<option>c1</option>
                    <option>c2</option>
                    <option>c3</option>
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
                <br><br>
                <label for="question">Enter Question:-</label><br><br>
                <textarea name="question" required></textarea><br><br>
                <label for="points">Points:-</label><br><br>
                <input type="number" name="points" required><br><br>
                <label for="option1">Option 1 (a):-</label><br><br>
                <textarea name="option1" required></textarea><br><br>
                <label for="option2">Option 2 (b):-</label><br><br>
                <textarea name="option2" required></textarea><br><br>
                <label for="option3">Option 3 (c):-</label><br><br>
                <textarea name="option3" required></textarea><br><br>
                <label for="option4">Option 4 (d):-</label><br><br>
                <textarea name="option4" required></textarea><br><br>
                <label for="Correct_Ans">Correct answer:-</label><br><br>
                <select name="Correct_Ans" required>
                    <option>a</option>
                    <option>b</option>
                    <option>c</option>
                    <option>d</option>
                </select><br><br>
                <label for="ques_type">Question type:-</label><br><br>
                <select name="ques_type" required>
                    <option>analytical</option>
                    <option>logical</option>
                    <option>knowledge</option>
                </select><br><br>
                <br><br>
                <button type="submit" class="logout_btn">ADD</button>
            </form>
        </center>
    </fieldset>
</div>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection("jdbc:postgresql://192.168.16.1/tya26", "tya26", "");
            
            String question = request.getParameter("question");
            int points = Integer.parseInt(request.getParameter("points"));
            String option1 = request.getParameter("option1");
            String option2 = request.getParameter("option2");
            String option3 = request.getParameter("option3");
            String option4 = request.getParameter("option4");
            String Correct_Ans = request.getParameter("Correct_Ans");
            String ques_type = request.getParameter("ques_type");
            String level = request.getParameter("level");
        
            String insert = "INSERT INTO "+level+" (Question, Points, a, b, c, d, Correct_Ans, Ques_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(insert);
            ps.setString(1, question);
            ps.setInt(2, points);
            ps.setString(3, option1);
            ps.setString(4, option2);
            ps.setString(5, option3);
            ps.setString(6, option4);
            ps.setString(7, Correct_Ans);
            ps.setString(8, ques_type);
            
            ps.executeUpdate();
            out.println("<script> showSuccess('Question added successfully!');</script>");
            
            conn.close();
        } catch (Exception e) {
            out.println("Error during adding: " + e.getMessage());
        }
    }
%>

</body>
</html>
