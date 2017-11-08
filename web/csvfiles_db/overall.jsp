<%-- 
    Document   : overall
    Created on : Feb 21, 2017, 10:25:31 PM
    Author     : Rohith13
--%>

<%@page import="java.lang.String"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Overall Analysis</title>
    </head>
    
    <style>
    h1 { 
        color: tomato;
	padding-left:10px;
	text-align: left;
	font-size: 35px;
        }
        p{
	padding-left:10px;
	text-align: justify;
        font-size: 20px;
	
        }    
        p1{
            font-size: 20px;
        }
        #submit{
            margin-top:1%;
        }
        #thead:hover{
            background-color: grey;
        }
        #backbtn{
             font-weight: bold;
             position: fixed;
             bottom: 0px;
             right: 0px; 
             margin-right: 2%;
             margin-bottom: 1%;
             height: 40px;
        }
    </style>
    
    <body style="background: antiquewhite">  
    <h1>OverALl Result Analysis</h1>
    <hr NOSHADE>
    <br>
    <br>
    <div class="container">
     <form  method =" post">
        <label for="sel1">Select Batch (select one):</label>
        <select class="form-control" id="sel1" name="batches">
                  <option value="selbatch">----</option>
                  <option value="2015">2015-2019</option> 
        </select>
        <label for="sel1">Select Semester(select one):</label>
        <select class="form-control" id="sel1" name="sem" >
            <option value="selsem">----</option>
            <option value="11">1-1</option>
            <option value="12">1-2</option>
            <option value="21">2-1</option>
            <option value="22">2-2</option>
        </select>
         <label for="sel1">Select Section (select one):</label>
          <select class="form-control" id="sel1" name="sec" >
            <option value="selsec">----</option>
            <option value="1">A</option>
            <option value="2">B</option>
         </select>
         <input type="submit" class="btn btn-success" id="submit" value="Submit"/>  
    </form>
    </div>
    <button type="button" id="backbtn" class="btn btn-primary btn-sm" onclick="window.location.href='res.jsp'">
          <span class="glyphicon glyphicon-step-backward"></span> Step Backward
    </button>
    <%
       
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information","root","");
            int batch = Integer.parseInt(request.getParameter("batches"));
            int sem = Integer.parseInt(request.getParameter("sem"));
            int sec = Integer.parseInt(request.getParameter("sec"));
            
            if(batch == 2015 && sem == 21 && sec == 1 )
            {
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                ResultSet rs = stmt.executeQuery();                
        %>
      <TABLE class="table table-hover">
                <TR  id="thead" style="background-color:grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>  
                </TR>
                <TR>
     <%   while(rs.next()){      %>
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>     
                </TR>
    <%   }             } // if closed..       %>
     </TABLE>
    <% 
        if(batch == 2015 && sem == 21 && sec == 2 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR>
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
    <%    
            }
       }
      catch(Exception e){  }
    %>
    
    </body>
</html>
