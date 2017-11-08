
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
        <link href="css/forgetPasswordcss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
         <img id="banner" src="images/banner.jpg" />
        <br>
        <center><font id="passwordFontStart">Please Enter a Email that you are given while registration for 6 digit code</font></center>
        <br>
        <center><form id="password_form_step_initial" action="ForgetpasswordStepIntial" method="post">
            <br>
                    <input placeholder="Enter EmailId" type="email" name="emailid" id="emailid" class="form-control input-lg"/>
                    <input type="submit"  id="submit" class="btn btn-primary" value="Submit" id="insert_button"/>   
            </form></center>
        <% if(request.getAttribute("EmailFail")!=null) { %>
        <center><h2 style="font-size:20px;  color:#fff;"><span style="color:#ff0033; font-size:40px;">*</span>Email Does not Exist<span style="color:#ff0033; font-size:40px;">*</span></h2></center>        
        <%  }   %>
        <%              
               if(request.getAttribute("EmailCheck")!=null){  
         %> 
         <style>
             #password_form_step_initial, #passwordFontStart{
                     display: none;
             } 
         </style>
         <script type="text/javascript">
             function forgetStep1(){
                 var username=document.getElementById("username").value;
                 var emailid=document.getElementById("emailid").value;
                 var password=document.getElementById("securitycode").value;
                 if(password<6 || passsword>6){
                     alert("security code is 6 in length");
                     return false;
                 }
                     return true;
             }
         </script>
        <center><font id="passwordFont">Please Enter A Email and 6 digits code that send to your email</font></center>
        <br>
        <center><form id="password_form_step1" action="ForgetpasswordStep1" method="post">
            <br>
                    <input placeholder="Enter a Username" type="text" name="username" id="username" class="form-control input-lg" required/>
                    <input placeholder="Enter EmailId" type="email" name="emailid" id="emailid" class="form-control input-lg" required/>
                    <input placeholder="Enter The 6 didgit code " type="password" name="securitycode" id="securitycode" class="form-control input-lg" required/>
                    <input type="submit"  id="submit" class="btn btn-primary" value="Submit" id="insert_button" onclick="return forgetStep1();"/>   
            </form></center>
        <center>
            <%  if(request.getAttribute("passwordfailStep1")!=null){%>
                 <center><h2 style="font-size:20px;  color:#fff;"><span style="color:#ff0033; font-size:40px;">*</span>Fields You entered is Not In Database<span style="color:#ff0033; font-size:40px;">*</span></h2></center>        
       
            <%} %>
            <div id="passworddiv">
             <%              
               if(request.getAttribute("passwordscuccessStep1")!=null){  
             %>    
             <style>
                 #password_form_step1,#passwordFont{
                     display: none;
                 } 
             </style>
             <script type="text/javascript">
              function checkpassword(){

                  var password=document.getElementById("password").value;
                  var cpassword=document.getElementById("cpassword").value;
                 
                  if(password==cpassword){
                      return true;
                  }else{
                      alert("password and confirm password not matches");
                      document.getElementById("password").value="";
                      document.getElementById("cpassword").value="";
                      return false;
                  }
              }
              </script>
            
             <font id="passwordSetFont">Successfully verified  your account Create New Password Here</font>
            <form id="password_form_step2" action="ForgetpasswordStep2" method="post">
             <br>
                     <input placeholder="Enter EmailId" type="email" name="emailid" id="emailid" class="form-control input-lg required"/>
                     <input placeholder="Enter New password" required type="password"  name="password" id="password" class="form-control input-lg required"/>
                     <input placeholder="Confirm Password" required type="password"  name="cpassword" id="cpassword" class="form-control input-lg required"/>
                    <input type="submit"  id="submit" class="btn btn-primary" value="Change Password" id="insert_button" onclick="return checkpassword();"/>   
            </form>
          <%
          
       }
}
          %> 
           <%  if(request.getAttribute("passwordfailStep2")!=null){%>
                 <center><h2 style="font-size:20px;  color:#fff;"><span style="color:#ff0033; font-size:40px;">*</span>Fields You entered are Wrong re-enter from this phase due to security<span style="color:#ff0033; font-size:40px;">*</span></h2></center>        
       
            <%} %>
            </div>
        </center>
    </body>
</html>
