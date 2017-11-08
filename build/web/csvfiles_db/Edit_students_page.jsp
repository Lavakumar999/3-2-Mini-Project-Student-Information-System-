<%-- 
    Document   : Edit_students_page
    Created on : Feb 27, 2017, 9:52:48 PM
    Author     : Lava Kumar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style type="text/css">
            #body{
                background-color: #fff;
            }
            #headtr:hover{
                background-color: grey;
                color:white;
                cursor: pointer;
            }
        </style>
    </head>
    <body id="body">
    <center><h1><b>List of students</b></h1></center>
    <center>
        <table class="table table-hover">
                <tr bgcolor="grey" id="headtr">
                <th>Stu Id</th>
                <th>Student Name</th>
                <th>Department</th>
                <th>Batch</th>
                <th>More</th>
                </tr>
            <%
                Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information","root","");
            java.sql.Statement st= con.createStatement();
            String sql="select * from student_per_info";
            ResultSet resultSet=st.executeQuery(sql);
            
            while (resultSet.next()) {
        %>
            <tr>
                <td><%=Double.parseDouble(""+resultSet.getDouble(1))%></td>
            <td><%=resultSet.getString(2)%></td>
            <td><%=resultSet.getString(5)%></td>
            <td><%=resultSet.getString(8)%></td>
            <% String name=resultSet.getString(2); %>
            <td><% out.println("<a href='edit_student.jsp?stuname="+name+"'><span style='font-size:16px;' class='glyphicon glyphicon-edit'></span> Edit</a>");%></td>
            </tr>
            <%
            }
            %>
            </table>
    </center>
        
    </body>
</html>
