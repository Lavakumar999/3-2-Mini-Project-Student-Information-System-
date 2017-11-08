<%-- 
    Document   : index
    Created on : Feb 23, 2017, 10:32:54 PM
    Author     : Lava Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Information System</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/csslogin.css" type="text/css"/>
        <link rel="stylesheet" href="css/cssFile.css" type="text/css"/> 
        <script src="javascript/javascriptfile.js" type="text/javascript"></script>
        <style>
            #fpassword{
                margin-right: 20%;
            }
            #fpassword:hover{
            text-decoration: underline;
         }
        </style>
        
    </head>
    <body id="body">
<!--        <img id="banner" src="images/banner.jpg" />-->
    <center><font size="+4" style="font-weight: bold; font-family: cursive; color:#999999; text-shadow: 2px 2px #FFF;">Welcome To Student Information System</font></center>
    <center><h2 id="h2">Here is the availability of a complete student's information and also availability of individual student information</h2></center>
    <center>
    <div id="box_model">
        <div id="stu_input">
            <img src="images/degree_cer.png"/><br/>
            <input  type="radio" name="chooseone" onclick="document.location.href='Student.html'"/>
            <strong><a href="Student.html">Student Information</a></strong><br/>
        </div>
        <div id="fac_input">
            <img src="images/identitymgmt.png"/><br/>
            <input type="radio" name="chooseone" onClick="visibility('popup-box');"/>
            <strong><a href="javascript:void(0)" onClick="visibility('popup-box');">Administrator</a></strong><br/>
        </div>
    </div>
    </center>
    <div id="popup-box" class="popup-position">
		<div id="popup-wrapper">
        		<div class="container">
                            <a id="close" href="javascript:void(0)" onClick="visibility('popup-box');">X</a>
                     <h1>Login Administrator</h1>
        <form action="LoginServlet" method="post">
            <div class="form-group">
                      <input  name="username" id="sname" type="text" required="required"/>
                       <label for="input" class="control-label">Enter Username</label><i class="bar"></i>
            </div>
            <div class="form-group">
                      <input  name="password" id="sname" type="password" required="required"/>
                       <label for="input" class="control-label">Enter Password</label><i class="bar"></i>
            </div>
             <div class="button-container">
                    <a href="forgetPassword.jsp" id="fpassword">Forget Password</a>
                    <input type="submit" class="button" value="Login" name="login"/>
             </div>
                </form>
        </div>         
    </div>
</div><!--End of Admin pop up box-->
    <% 
     if(request.getAttribute("loginResult")=="true"){
    %>
    <center><h2 style="color:rosybrown;"><% out.println("Login Failed (username and password mis match)"); %></h2></center>
    <%
    }
    else if(request.getAttribute("loginResult")==null){     
    }
    else {
    %>
    <center><h2 style="color:rosybrown;"><% out.println("Login Failed (username and password mis match)"); %></h2></center>  
    <%
    }
    if(request.getAttribute("passwordscuccess")!=null){
    %>
    <center><h2 style="color:rosybrown;"><% out.println("Password Updated Sucessfully"); %></h2></center>  
    <%
    }
    %>
    </body>
</html>
        
        
