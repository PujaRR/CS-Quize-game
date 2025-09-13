<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*, java.io.*, javax.servlet.http.Part" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="static/view.css">
    <script>
        function showSuccess(message){
        alert(message);
        window.location.href = "add_QB.jsp";
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
            <legend><h1 style="text-align:center; color:blue;">ADD Question Bank</h1></legend>
            <form action="" method="post" enctype="multipart/form-data" style="margin:100px; margin-top:0px;">
                <br><br>
                <label for="course_name">Select Quiz Level:-</label><br><br>
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
                <h2>Upload CSV File</h2>
                <input type="file" name="file" accept=".csv"><br><br>
                <button type="submit" value="Upload" class="logout_btn">Upload</button>
            </form>
        </center>
    </fieldset>
</div>

<%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        Connection conn = null;
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection("jdbc:postgresql://192.168.16.1/tya26", "tya26", "");
            conn.setAutoCommit(false);

            Part filePart = request.getPart("file");
            String level = request.getParameter("level");
            InputStream fileContent = filePart.getInputStream();
            BufferedReader br = new BufferedReader(new InputStreamReader(fileContent));
            String line;
            String sql = "INSERT INTO "+level+" (Question, Points, a, b, c, d, Correct_Ans, Ques_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);

            while ((line = br.readLine()) != null) {
                String[] data = line.split(",");
                statement.setString(1, data[1]);
                statement.setInt(2, Integer.parseInt(data[2]));
                statement.setString(3, data[3]);
                statement.setString(4, data[4]);
                statement.setString(5, data[5]);
                statement.setString(6, data[6]);
                statement.setString(7, data[7]);
                statement.setString(8, data[8]);
                statement.addBatch();
            }

            statement.executeBatch();
            conn.commit();
            out.println("<script> showSuccess('File added successfully!');</script>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script> showSuccess('Unable to Upload!');</script>");
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } finally {
            try {
                if (conn != null) {
                    conn.setAutoCommit(true); // Reset auto-commit mode
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
</body>
</html>
