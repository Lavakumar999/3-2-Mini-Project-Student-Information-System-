<%-- 
    Document   : select_perinfo
    Created on : Feb 22, 2017, 12:41:41 AM
    Author     : Lava Kumar
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            table{
                background-color: #ccccff;
            }
            caption{
                color:#ccccff;
                font-weight: bold;
                font-size: 18px;
            }
            body{
                background-color: #fff;
            }
        </style>
    </head>
    <body>
        
         <% 
              Blob image = null;

                byte[ ] imgData = null ;
            Double id=Double.parseDouble(request.getParameter("rollno"));
            try{
             Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information","root","");
            String sql="select * from student_per_info where s_id=?";
            PreparedStatement st=con.prepareStatement(sql);

           st.setDouble(1,id);
            ResultSet resultSet=st.executeQuery();
            
            
            while(resultSet.next()){
        %>   
 <table border="1" id="table-id" align="center" cellspacing="4" cellpadding="4" width="80%">
    <tr>
        <th colspan="3" style="color:darkblue;font-size:20pt;"> Student Profile: <%=resultSet.getDouble(1)%></th>
    </tr>
    <tr> 
    <th width="25%"> Student Name </th> 
    <td width="75%">  <%=resultSet.getString(2)%> </td>
    <td rowspan=3 style="border-style:none;" align="center">
      <% 
            image = resultSet.getBlob(17);
            imgData = image.getBytes(1,(int)image.length());
            String imgDataBase64=new String(Base64.getEncoder().encode(imgData));
        %>
        <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="images Here" width="240px" height="150px"/>
    </td>
    </tr> 
    <tr>
    <th> Father Name </th>
    <td valign=middle><%=resultSet.getString(3)%> </td>
    </tr>
    <tr>
    <th>Mother Name </th>
    <td valign=middle><%=resultSet.getString(4)%> </td>
    </tr>
    <tr>
        <th  class="fcbold"> Father Occuption</th><td colspan="2" style="color:darkblue;" id="bold"><%=resultSet.getString("s_father_occuption")%> </td>
    </tr>
    <tr>
        <th  class="fcbold"> Gender</th><td colspan="2" style="color:darkblue;" id="bold"><%=resultSet.getString("s_gender")%> </td>
    </tr>
    <tr>
        <th  class="fcbold"> Department </th><td colspan="2" style="color:darkblue;" id="bold"><%=resultSet.getString("s_dept")%> </td>
    </tr>
    <tr>
        <th class="fcbold" > Date of Birth </th> <td colspan="2"> <%=resultSet.getString("s_dob")%> </td>
    </tr>
<tr>
    <th class="fcbold" > Email Id </th> <td colspan="2" id="bold"><%=resultSet.getString("s_email")%>,lavakumar.14.it@anits.edu.in</td>
</tr>
<tr>
<th class="fcbold" > Admitted Batch</th> <td colspan="2"><%=resultSet.getString("s_admit_batch")%> </td> </tr>
<tr>
<th class="fcbold" > Acheviments </th> <td colspan="2" id="bold">Topper of IT Dept in 2nd year</td>
</tr>
<tr>
<td class="fcbold" > Current Year</td> <td colspan="2">3/4 IT </td>
</tr>
<tr>
        <td class="fcbold" > CGPA</td> <td colspan="2">8.59 </td>
</tr>
<tr>
    <td  class="fcbold">No of Backlogs </td> <td colspan="2" id="bold"> 0</td>
</tr>
<tr>
    <td class="fcbold" > Student Phone Number</td> <td colspan="2" id="bold" ><%=resultSet.getString("s_phone_no")%></td>
</tr>
<tr>
<td class="fcbold"> Parents Phone Number </td> <td colspan="2" id="bold"><%=resultSet.getString("s_father_phno")%>
</td>
</tr>
<tr>
<th colspan=3>ADDRESS</th>
</tr>
<tr>
    <td>Street</td><td class="fcbold" colspan="2"> <%=resultSet.getString("s_address")%></td>
</tr>
<tr>
<td  class="fcbold"> City </td> <td colspan="2"><%=resultSet.getString("s_city")%></td>
</tr>
<tr>
<td class="fcbold"> State</td> <td colspan="2"> <%=resultSet.getString("s_state")%> </td>
</tr>
<tr>
<td class="fcbold"> Pincode</td> <td colspan="2"> <%=resultSet.getString("s_zipcode")%> </td>
</tr>
</table>
             
 
            <%       
            } 
            }catch(Exception e){} 
            %>
    </body>
</html>
