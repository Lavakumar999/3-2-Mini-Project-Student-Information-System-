<%-- 
    Document   : subject
    Created on : Feb 21, 2017, 10:30:51 PM
    Author     : Rohith13
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Subject Analysis</title>
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
        #backbtn{
             font-weight: bold;
             position: fixed;
             bottom: 0px;
             right: 0px; 
             margin-right: 2%;
             margin-bottom: 1%;
             height: 40px;
        }
        #thead:hover{
            background-color: grey;
            color:#fff;
        }
    </style>
    
    
    
    <body style="background: antiquewhite">    
    <h1>Result Analysis</h1>
    <br>
   <div class="container">
    <form  method =" post">
          <label for="sel1">Select Batch (select one):</label>
          <select class="form-control" id="sel1" name="batches" >
                    <option value="selbatch">----</option>
                    <option value="2015">2015-2019</option>
                    
        </select>
        <label for="sel1">Select Semester (select one):</label>
        <select class="form-control" id="sel1" name="sem" >
            <option value="selsem">----</option>
            <option value="11">1-1</option>
            <option value="12">1-2</option>
            <option value="21">2-1</option>
            <option value="22">2-2</option>
        </select>
        
         <label for="sel1">Select Subjects (select one):</label>
         <select class="form-control" id="sel1" name="sub" >
            <option value="selsub">----</option>
            <option value="444">All</option>
            <option value="1">DS</option>
            <option value="2">DLD</option>
            <option value="3">DMS</option>
            <option value="4">CO</option>
            <option value="5">DC</option>
            <option value="6">DSLab</option>
            <option value="7">DELab</option>
            <option value="8">PYLab</option>
            
        </select>
        
         <label for="sel1">Select Section (select one):</label>
         <select class="form-control" id="sel1" name="sec" >
            <option value="selsec">----</option>
            <option value="1">A</option>
            <option value="2">B</option>
        </select>
         <center><input type="submit" class="btn btn-success" id="submit" value="Submit"/></center>
        
    </form>
   </div> 
        <br>
    <button type="button" id="backbtn" class="btn btn-primary btn-sm" onclick="window.location.href='res.jsp'">
          <span class="glyphicon glyphicon-step-backward"></span> Step Backward
    </button>
    <center>
    <%
       
       try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information","root","");
            
            int batch = Integer.parseInt(request.getParameter("batches"));
            int sem = Integer.parseInt(request.getParameter("sem"));
            int sub = Integer.parseInt(request.getParameter("sub"));
            int sec = Integer.parseInt(request.getParameter("sec"));
            if(batch == 2015 && sem == 21 && sec == 1 && sub == 444 )
            {
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,ds,dld,dms,co,dc,dslab,delab,pylab,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                ResultSet rs = stmt.executeQuery();
                %>
             <TABLE class="table table-hover">
                <TR style="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DS</TH>
                    <TH>DLD</TH>
                    <TH>DMS</TH>
                    <TH>CO</TH>
                    <TH>DC</TH>
                    <TH>DSLab</TH>
                    <TH>DELab</TH>
                    <TH>PYLab</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DS") %> </TD>
                    <TD> <%= rs.getString("DLD") %> </TD>
                    <TD> <%= rs.getString("DMS") %> </TD>
                    <TD> <%= rs.getString("CO") %> </TD>
                    <TD> <%= rs.getString("DC") %> </TD>
                    <TD> <%= rs.getString("DSLAB") %> </TD>
                    <TD> <%= rs.getString("DELAB") %> </TD>
                    <TD> <%= rs.getString("PYLAB") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
     
        
            }


     if(batch == 2015 && sem == 21 && sec == 1 && sub == 1 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,ds,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR style="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DS</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DS") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
    }
           
        
          if(batch == 2015 && sem == 21 && sec == 1 && sub == 2 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,dld,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DLD</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DLD") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
     
        
            }if(batch == 2015 && sem == 21 && sec == 1 && sub == 3 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,dms,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DMS</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DMS") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
     
        
            }if(batch == 2015 && sem == 21 && sec == 1 && sub == 4 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,co,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>CO</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("CO") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
     
        
            }if(batch == 2015 && sem == 21 && sec == 1 && sub == 5 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,dc,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DC</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DC") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
     
        
            }if(batch == 2015 && sem == 21 && sec == 1 && sub == 6 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,dslab,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DSLAB</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DSLAB") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
     
        
            }if(batch == 2015 && sem == 21 && sec == 1 && sub == 7 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,delab,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DELAB</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DELAB") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
    }

       if(batch == 2015 && sem == 21 && sec == 1 && sub == 8 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,pylab,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>PYLAB</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("PYLAB") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
    }

      

        if(batch == 2015 && sem == 21 && sec == 2 && sub == 444 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,ds,dld,dms,co,dc,dslab,delab,pylab,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DS</TH>
                    <TH>DLD</TH>
                    <TH>DMS</TH>
                    <TH>CO</TH>
                    <TH>DC</TH>
                    <TH>DSLab</TH>
                    <TH>DELab</TH>
                    <TH>PYLab</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DS") %> </TD>
                    <TD> <%= rs.getString("DLD") %> </TD>
                    <TD> <%= rs.getString("DMS") %> </TD>
                    <TD> <%= rs.getString("CO") %> </TD>
                    <TD> <%= rs.getString("DC") %> </TD>
                    <TD> <%= rs.getString("DSLAB") %> </TD>
                    <TD> <%= rs.getString("DELAB") %> </TD>
                    <TD> <%= rs.getString("PYLAB") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
            }


          
         if(batch == 2015 && sem == 21 && sec == 2 && sub == 1 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,ds,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DS</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DS") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
    }
           
        
          if(batch == 2015 && sem == 21 && sec == 2 && sub == 2 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,dld,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE BORDER="1">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DLD</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DLD") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
     
        
            }if(batch == 2015 && sem == 21 && sec == 2 && sub == 3 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,dms,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DMS</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DMS") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
     
        
            }if(batch == 2015 && sem == 21 && sec == 2 && sub == 4 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,co,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>CO</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("CO") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
     
        
            }if(batch == 2015 && sem == 21 && sec == 2 && sub == 5 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,dc,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DC</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DC") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
     
        
            }if(batch == 2015 && sem == 21 && sec == 2 && sub == 6 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,dslab,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DSLAB</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DSLAB") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
     
        
            }if(batch == 2015 && sem == 21 && sec == 2 && sub == 7 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,delab,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH>
                    <TH>DELAB</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("DELAB") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
    }

       if(batch == 2015 && sem == 21 && sec == 2 && sub == 8 )
            {
                //out.println("try2.....");
                PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,pylab,sgpa,cgpa from secondone_b1 where batch = ? and section = ?");
                //out.println("try3....");
                stmt.setInt(1, batch);
                stmt.setInt(2, sec);
                //out.println("try4......");
                ResultSet rs = stmt.executeQuery();
                //out.println("try5....");
                %>
             <TABLE class="table table-hover">
                <TR id="thead" style="background-color: grey;">
                    <TH>SNo</TH>
                    <TH>Reg_No</TH>
                    <TH>Name</TH> 
                    <TH>PYLAB</TH>
                    <TH>SGPA</TH>
                    <TH>CGPA</TH>
                    
                </TR>
                <TR>
     <%   while(rs.next()){ 
        %>
           
                    <TD> <%= rs.getInt("SNO") %> </TD>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                    <TD> <%= rs.getString("NAME") %> </TD>
                    <TD> <%= rs.getString("PYLAB") %> </TD>
                    <TD> <%= rs.getDouble("SGPA") %> </TD>
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                    
                </TR>
            
        <% 
            }  %>
     </TABLE>
 <% 
                
    }

       
      

        if(batch == 2015 && (sem != 21 || sec > 2 ))
            {
                
               out.println("Sorry Still Building.......");

            }


       }
   
      catch(Exception e)
      {
          
      }
        
    %> 
    
    </center>
    </body>
</html>
