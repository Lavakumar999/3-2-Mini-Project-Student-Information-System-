<%-- 
    Document   : loginadmin
    Created on : Feb 20, 2017, 9:58:28 PM
    Author     : Lava Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Administrator</title> 
        <script src="javascript/javascriptfile.js" type="text/javascript"></script>
        <link href="css/cssadmin.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript">
        function logout(){
                alert("sucessfully logout");
        }
        </script>
        <SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
        </SCRIPT>
    </head>
    <body id="body" onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
        <% 
            HttpSession sessions=request.getSession(false);
            String name=(String)sessions.getAttribute("username");
            if(sessions!=null && name.equals("group1")){
            
        %>
            <font size="+2" style="position: fixed; color: #fff; font-weight: bold; right:1%;">Weclome admin <% out.println(name); %></font>  
        <%    }
        else{
               response.sendRedirect("index.jsp");
         }
        %>
           
<!--<img id="banner" src="images/banner.jpg" style="width:100%; height: 170px;" />-->
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
        <a class="navbar-brand" href="#" style="color:#fff;">Menu</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="csvfiles_db/student_db_perinfo.jsp" target="iframe1" onclick="iframevis1('frames_align1');"><span style="font-size:16px;" class="glyphicon glyphicon-user"></span> View Students Profile</a></li>
        <li><a href="csvfiles_db/student_db_regularity.jsp" target="iframe2" onclick="iframevis2('frames_align2');"><span style="font-size:16px;" class="glyphicon glyphicon-book"></span> View Students in Batch</a></li>
        <li><a href="csvfiles_db/res.jsp" target="iframe3" onclick="iframevis3('frames_align3');"><span style="font-size:16px;" class="glyphicon glyphicon-calendar"></span> Student Results</a></li>
        <li><a href="csvfiles_db/Insert_single_student.jsp" target="iframe4" onclick="iframevis4('frames_align4');"><span style="font-size:16px;" class="glyphicon glyphicon-plus"></span> Add Student</a></li>
        <li><a href="csvfiles_db/Edit_students_page.jsp" target="iframe5" onclick="iframevis5('frames_align5');"><span style="font-size:16px;" class="glyphicon glyphicon-edit"></span> Edit Student</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <form action="LogoutServlet" method="post">
        <input type="submit"  id="submit" class="btn btn-primary navbar-btn" value="Logout"/>   
        </form>
      </ul>
    </div>
  </div>
</nav>
    <center>
     <div id="frames_align1" style="display: none;">
       <font size="+3" style="color:#fff;font-weight: bold; font-family: cursive;">Here is your database access  Administrator!</font>
       <iframe name="iframe1" frameborder="0" allowfullscreen ></iframe>
     </div>
    </center>
    <center>
     <div id="frames_align2" style="display: none;">
       <font size="+3" style="color:#fff;font-weight: bold; font-family: cursive;">Here is your database access  Administrator!</font>
       <iframe name="iframe2" frameborder="0" allowfullscreen ></iframe>
     </div>
    </center> 
    <center>
     <div id="frames_align3" style="display: none;">
       <font size="+3" style="color:#fff;font-weight: bold; font-family: cursive;">Here is your database access  Administrator!</font>
       <iframe name="iframe3" frameborder="0" allowfullscreen ></iframe>
     </div>
    </center>
    <center>
     <div id="frames_align4" style="display: none;">
       <font size="+3" style="color:#fff;font-weight: bold; font-family: cursive;">Here is your database access  Administrator!</font>
       <iframe name="iframe4" frameborder="0" allowfullscreen ></iframe>
     </div>
    </center> 
    <center>
     <div id="frames_align5" style="display: none;">
       <font size="+3" style="color:#fff;font-weight: bold; font-family: cursive;">Here is your database access  Administrator!</font>
       <iframe name="iframe5" frameborder="0" allowfullscreen ></iframe>
     </div>
    </center>
    </body>
</html>
