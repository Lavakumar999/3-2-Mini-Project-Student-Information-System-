<%-- 
    Document   : edit_student
    Created on : Feb 27, 2017, 10:02:04 PM
    Author     : Lava Kumar
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Update Record</title>
        <style type="text/css">
            body{
                background-color: #fff;
                margin:0;
                padding:0;
            }
            #table_id{
                background-color: #cccccc;
            }
            input{
                border-radius: 5px;
                border-top: none;
                height:24px;
            }
            input:focus{
                border-bottom-color: #99ff99;
            }
            #update{
                    margin-top: 0.5%;
                    margin-bottom: 0.5%;
                   background-color: #4cAF50;
                   border: none;
                   color:white;
                   text-align: center;
                   text-decoration: none;
                   display: inline-block;
                   font-size: 18px;
                   font-weight: bold;
                   border-radius:5%;
                   height:40px;
            }
            #update:hover{
                background-color: #3e8e41;
            }
             #backbtn{
                    font-weight: bold;
                    position: fixed;
                    bottom: 0px;
                    right: 0px; 
                    margin-right: 2%;
                    margin-bottom: 1%;
                    height: 40px;
                    color:#fff;
                    background-color: #31708f;
               }
               #backbtn:hover{
                   background-color: #122b40;
               } 
        </style>
    </head>
    <body>

           <% 
            try{
                 Blob image = null;

                byte[ ] imgData = null ;
                String name=request.getParameter("stuname");
                Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information","root","");
            String sql="select * from student_per_info where s_name=?";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            st.setString(1,name);
            ResultSet resultSet=st.executeQuery();
            while(resultSet.next()){
         
          %>
        
        
    <form action="update.jsp" method="post">    
   <table border="1" id="table_id" align="center" cellspacing="5" cellpadding="5" width="70%">
    <tr>
        <th colspan="3" style="color:darkblue;font-size:20pt;"> Student Profile: <input class="form-control input-lg" type="number" size="25" name="rollno" style=" pointer-events: none; opacity: 0.4;" value="<%=resultSet.getDouble(1)%>"/></th>
    </tr>
     <tr> 
    <th width="25%"> Student Name </th> 
    <td width="75%"> <input type="text" size="40" name="sname" value="<%=resultSet.getString(2)%>"/> </td>
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
    <td valign=middle><input type="text" name="fname" size="40" value="<%=resultSet.getString(3)%>"/> </td>
    </tr>
    <tr>
    <th>Mother Name </th>
    <td valign=middle><input type="text" name="mname" size="40"  value="<%=resultSet.getString(4)%>"/> </td>
    </tr>
    <tr>
        <th  class="fcbold"> Father Occuption</th><td colspan="2" style="color:darkblue;" id="bold"><input type="text" name="foccuption" size="40"  value="<%=resultSet.getString("s_father_occuption")%>"/> </td>
    </tr>
    <tr>
        <th  class="fcbold"> Gender</th><td colspan="2" style="color:darkblue;" id="bold"><input type="text" name="gender" size="40"  value="<%=resultSet.getString("s_gender")%>"/> </td>
    </tr>
    <tr>
        <th  class="fcbold"> Department </th><td colspan="2" style="color:darkblue;" id="bold"><input type="text" name="sdept" size="40"  value="<%=resultSet.getString("s_dept")%>"/> </td>
    </tr>
    <tr>
        <th class="fcbold" > Date of Birth </th> <td colspan="2"><input type="text" name="sdob" size="40"  value="<%=resultSet.getString("s_dob")%>"/> </td>
    </tr>
    <tr>
        <th class="fcbold" > Email Id </th> <td colspan="2" id="bold"><input type="text" name="semail" size="40" value="<%=resultSet.getString("s_email")%>"/>,lavakumar.14.it@anits.edu.in</td>
    </tr>
    <tr>
        <th class="fcbold" > Admitted Batch</th> <td colspan="2"><input type="number" name="sbatch" size="40"  value="<%=resultSet.getString("s_admit_batch")%>"/> </td> </tr>
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
        <td class="fcbold" > Student Phone Number</td> <td colspan="2" id="bold" ><input type="number" name="spno" size="40"  value="<%=resultSet.getString("s_phone_no")%>"/></td>
    </tr>
    <tr>
        <td class="fcbold"> Parents Phone Number </td> <td colspan="2" id="bold"><input type="number" size="40" name="fpno"  value="<%=resultSet.getString("s_father_phno")%>"/>
    </td>
    </tr>
    <tr>
        <th colspan=3>ADDRESS</th>
    </tr>
    <tr>
        <td>Street</td><td class="fcbold" colspan="2"> <input type="text" size="40" name="saddress" value="<%=resultSet.getString("s_address")%>"/></td>
    </tr>
    <tr>
        <td  class="fcbold"> City </td> <td colspan="2"><input type="text" size="40" name="scity" value="<%=resultSet.getString("s_city")%>"/></td>
    </tr>
    <tr>
        <td class="fcbold"> State</td> <td colspan="2"><input type="text" size="40" name="sstate" value="<%=resultSet.getString("s_state")%>"/></td>
    </tr>
    <tr>
        <td class="fcbold"> Pincode</td> <td colspan="2"> <input type="text" size="40" name="szipcode" value="<%=resultSet.getString("s_zipcode")%>"/> </td>
    </tr>
</table>
    
   
        <center><input id="update"  type="submit" value="update"/> </center>
        
        </form>  
            <%       
            } 
            }catch(Exception e){} 
            %>
        <button type="button" id="backbtn" class="btn btn-primary btn-sm" onclick="window.location.href='Edit_students_page.jsp'">
          Step Backward
        </button>
    </body>
</html>
