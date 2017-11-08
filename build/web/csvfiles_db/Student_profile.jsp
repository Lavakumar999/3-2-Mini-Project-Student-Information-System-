<%-- 
    Document   : Student_profile
    Created on : Feb 24, 2017, 1:47:15 PM
    Author     : Lava Kumar
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Profile</title>
        <script type="text/javascript" src="../javascript/jquery-2.1.3.js"></script>
        <script type="text/javascript" src="../javascript/jspdf.js"></script>
        <script type="text/javascript" src="../javascript/pdfFromHTML.js"></script>
        <script type="text/javascript">
            function tableToJson(table) {
    var data = [];

    // first row needs to be headers
    var headers = [];
    for (var i=0; i<table.rows[0].cells.length; i++) {
        headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi,'');
    }
    data.push(headers);
    // go through cells
    for (var i=1; i<table.rows.length; i++) {

        var tableRow = table.rows[i];
        var rowData = {};

        for (var j=0; j<tableRow.cells.length; j++) {

            rowData[ headers[j] ] = tableRow.cells[j].innerHTML;

        }

        data.push(rowData);
    }       

    return data;
}
function callme(){
var table = tableToJson($('#table-id').get(0));
var doc = new jsPDF('l','pt','letter',true);


$.each(table, function(i, row){
	$.each(row, function(j,cell){
	
		doc.cell(1,40,260,28,cell,i);
	
	
	});
});

doc.save('Safaa.pdf');
}
</script>
<style type="text/css">
    #bold{
        font-weight: bold;
    }
   #download,#printdownload{
                   float:right;
                   background-color: #4cAF50;
                   border: none;
                   color:white;
                   padding: 0.75%;
                   text-align: center;
                   text-decoration: none;
                   display: inline-block;
                   font-size: 14px;
                   font-weight: bold;
                   border-radius:5%;
                   margin-right: 15%;
}
#download:hover,#printdownload:hover{
    background-color: #3e8e41;
}
#download:active,#printdownload:active{
    background-color: #3e8e41;
    box-shadow: 0 5px #666;
    transform:translateY(4px);
}
#download{
       float:none; 
       margin-left: 15%;
       margin-right: 0;
}
#body{
    background-color: white;
}
table{
    background-color: #ccc;
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
    <body id="body">
        <!-- Here is The data Base Connection Code -->
        <% 
            try{
                
                Blob image = null;

                byte[ ] imgData = null ;
                String name=request.getParameter("stuname");
                Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information","root","");
            String sql="select * from student_per_info where s_name=?";
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1,name);
            ResultSet resultSet=st.executeQuery();
            while(resultSet.next()){
         
          %>
        
        
        
        
        
<div id="HTMLtoPDF">
   <table border="1" id="table-id" align="center" cellspacing="5" cellpadding="5" width="70%">
    <tr>
        <th colspan="3" style="color:darkblue;font-size:20pt;"> Student Profile: <%=resultSet.getDouble(1)%></th>
    </tr>
    <tr> 
        <% 
            image = resultSet.getBlob(17);
            imgData = image.getBytes(1,(int)image.length());
        %>
    <th width="25%"> Student Name </th> 
    <td width="75%">  <%=resultSet.getString(2)%> </td>
    <td rowspan=3 style="border-style:none;" align="center">
        <%
           String imgDataBase64=new String(Base64.getEncoder().encode(imgData));
         %>   
         <img src="data:image/gif;base64,<%= imgDataBase64 %>" alt="images Here" width="240px" height="150px"/>
<!--       <img src="" width="250" height="200" border="2" align="absmiddle"  />-->
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
</div>
        
        <a id="download" href="javascript:callme()">Download</a>
        <input id="printdownload" type="button" value="Print PDF" onclick="window.print()"/>
        <button type="button" id="backbtn" class="btn btn-primary btn-sm" onclick="window.location.href='student_db_perinfo.jsp'">
          Step Backward
        </button>
</body>
</html>
