<%@ page language="java" contentType="Text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width,initial-scale=1.0">
 <title>Login and registration</title>
 <link rel="stylesheet" href="static/style.css"/>
<script>
   function  validateform()
   {
     let pw1=document.forms["login1"]["password"].value;
     let pw2=document.forms["login1"]["password2"].value;

     if(pw1!=pw2)
     {
       alert("Password didn't match");
     }
     else
      {
         alert("Account created succesfully!!");
      }
   }
 </script>
 </head>
<body style="background:url('TYA26/bg1.png') no-repeat;">
  <header>
  <h2 class="logo">CSQUIZLET</h2>
   <nav class="navigation">
	   <a href="home.jsp" style="font-size:30px; margin-right:1px; margin-top:100px;">HOME</a>
   </nav>
  </header>
   <div class="wrapper2" style="border: 2px solid black; color:wheat; padding:30px; border-radius:30px; ">
    <div class="form-box forgot">
    <h2>Update Password</h2>
    <form action="update.jsp" method="post">
	   <div class="input-box">
	   <input type="text" name="Username" required>
	   <label>User Name</label>
	   </div>
	   <div class="input-box">
           <input type="text" name="security_answer" required>
           <label>Your favourite movie name</label>
           </div>

	  <div class="input-box">
           <input type="password" required name="password">
           <label>Password</label>
           </div>
           <div class="input-box">
           <input type="password" required name="password1">
           <label>Confirm Password</label>
           </div>
	   <button type="submit" class="btn" onclick="validateform()">Update Password</button>
    </form>
    </div>
 </div>
</body>
</html>

