<%@ page language="java" contentType="Text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj != null) {
        sessionObj.invalidate();
    }
%>
<!doctype html>
<html lang="en">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width,initial-scale=1.0">
 <title>Login and registration</title>
 <link rel="stylesheet" href="static/style.css">

 <script>
   function  validateform()
   {
     let pw1=document.forms["login1"]["password"].value;
     let pw2=document.forms["login1"]["password1"].value;

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
    <button class="btnLogin-popup1">Admin</button>
    <button class="btnLogin-popup">Login</button>
    <a href="AboutUs.html">About Us</a>
   </nav>
  </header>

   <div class="wrapper">
    <span class="icon-close">
    <img src="TYA26/close.png" height="30px" width="30px">	    
    </span>
    <div class="form-box login">
    <h2>Login</h2>
    <form action="loginValidation.jsp" method="post">
	   <div class="input-box">
	   <input type="text" name="username" required>
	   <label>User Name</label>
	   </div>
	  <div class="input-box">
          <input type="password" name="password" required>
           <label>Password</label>
           </div><br>
	   <div class="remember-forgot"> 
		   <label><input type="checkbox">Remember me</label>
		   <a href="Forgot.jsp">Forgot Password?</a>
	  </div>
	  <button type="submit" class="btn">Login</button>
	  <div class="login-register">
	  <p>Don't have an account?
	  <a href="#" class="register-link">Register</a></p>
	  </div>
    </form>
    </div>
    <div class="form-box register">
      <h2>Registration</h2>
      <form action="register.jsp" method="post">
	 <div class="input-box">
		 
	<input type="text" name="username" required>
	<label>User Name</label>
         </div>
          <div class="input-box">
           <input type="password" required name="password">
           <label>Password</label>
           </div>
           <div class="input-box">
           <input type="password" required name="password1">
           <label>Confirm Password</label>
           </div>
	    <div class="input-box">
           <input type="text" name="security_answer" required>
           <label>Your favourite movie name</label>
           </div>


	  <div class="remember-forgot">
          <label><input type="checkbox">I agree with the terms and conditions.</label>
                  
          </div>
          <button type="submit" class="btn" onclick="validateform()">Register</button>
          <div class="login-register">
          <p>Already have an account?
          <a href="#" class="login-link">Login</a></p>
          </div>
      </form>
    </div>
   </div>
<div class="wrapper1">
    <span class="icon-close1">
    <img src="TYA26/close.png" height="30px" width="30px">	    
    </span>
    <div class="form-box adlogin">
    <h2>Admin Login</h2>
    <form action="AdminValid.jsp" method="post">
	   <div class="input-box">
	   <input type="text" name="adminname" required>
	   <label>Admin Name</label>
	   </div>
	  <div class="input-box">
          <input type="password" name="password" required>
           <label>Password</label>
           </div><br>
	   <div class="remember-forgot"> 
		   <label><input type="checkbox">Remember me</label>
	  </div>
	  <button type="submit" class="btn">Login</button>
    </form>
    </div>
</div>

   <script src="static/script.js"></script>
</body>
</html>








