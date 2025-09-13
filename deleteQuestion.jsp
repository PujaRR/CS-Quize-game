<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view_question</title>
    <script>
        function showAlert(message){
        alert(message);
        window.location.href = "view_question.jsp";
        }
  </script>
</head>
<body>
    
</body>
</html>

<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    String selectedLevel = request.getParameter("level");
    int que_no = Integer.parseInt(request.getParameter("que_no"));

    try {
        Class.forName("org.postgresql.Driver");
        connection = DriverManager.getConnection("jdbc:postgresql://192.168.16.1/tya26", "tya26", "");

        // Delete the question from the specified level
        String query = "DELETE FROM " + selectedLevel + " WHERE que_no = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, que_no);
        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            out.println("<script>showAlert('Question Deleted Successfully!')</script>");
        } else {
            out.println("<script>showAlert('Failed to delete Question!')</script>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>showAlert('Error Occured!')</script>");
    } finally {
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
