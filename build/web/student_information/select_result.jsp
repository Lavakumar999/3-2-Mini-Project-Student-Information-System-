<%-- 
    Document   : select_perinfo
    Created on : Feb 22, 2017, 12:41:41 AM
    Author     : Lava Kumar
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style type="text/css">
            caption{
                color:#ccccff;
                font-weight: bold;
                font-size: 18px;
            }
            #thead:hover{
                background-color: #666;
                color:#fff;
            }
        </style>
    </head>
    <body>
         <% 
             try{
            Double id=Double.parseDouble(request.getParameter("rollno"));
             Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information","root","");           
           PreparedStatement stmt = con.prepareStatement("select sno,reg_no,name,ds,dld,dms,co,dc,dslab,delab,pylab,sgpa,cgpa from secondone_b1 where reg_no=?");
                stmt.setDouble(1,id);
                ResultSet rs = stmt.executeQuery();
          %>
             <TABLE class="table table-hover" width="75%">
                <TR id="thead" style="background-color: #ccc;">
                    <th>Subject</th>
                    <th>Marks</th>
                </TR>
                
                
     <%   while(rs.next()){ 
        %>
                 <TR>
                    <TH>Reg_No</TH>
                    <TD> <%= rs.getInt("REG_NO") %> </TD>
                 </TR>
                 <TR >
                    <TH>Name</TH>
                    <TD> <%= rs.getString("NAME") %> </TD>
                 </TR>
                 <TR>
                    <TH>DS</TH>
                    <TD> <%= rs.getString("DS") %> </TD>
                 </TR>
                 <TR>
                    <TH>DLD</TH>
                    <TD> <%= rs.getString("DLD") %> </TD>
                 </TR>
                 <TR>
                    <TH>DMS</TH>
                    <TD> <%= rs.getString("DMS") %> </TD>
                 </TR>
                 <TR>
                    <TH>CO</TH>
                    <TD> <%= rs.getString("CO") %> </TD>
                 </TR>
                 <TR>
                    <TH>DC</TH>
                    <TD> <%= rs.getString("DC") %> </TD>
                 </TR>
                 <TR>
                    <TH>DSLab</TH>
                     <TD> <%= rs.getString("DSLAB") %> </TD>
                 </TR>
                 <TR>
                    <TH>DELab</TH>
                    <TD> <%= rs.getString("DELAB") %> </TD>
                 </TR>
                 <TR>
                    <TH>PYLab</TH>
                    <TD> <%= rs.getString("PYLAB") %> </TD>
                 </TR>
                 <TR>
                    <TH>SGPA</TH>
                     <TD> <%= rs.getDouble("SGPA") %> </TD>
                 </TR>
                 <TR>
                    <TH>CGPA</TH>   
                    <TD> <%= rs.getDouble("CGPA") %> </TD>
                 </TR>
            
        <% 
            } 
}catch(Exception e){
}%>
     </TABLE>
    </body>
</html>