<%-- 
    Document   : student_db_info
    Created on : Feb 20, 2017, 11:15:50 PM
    Author     : Lava Kumar
--%>

<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Personal Information</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-route.js"></script>
        <!-- Chart js files //-->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js" type="text/javascript"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.min.js" type="text/javascript"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js" type="text/javascript"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js" type="text/javascript"></script>
        <link href="../css/stuent_db_css.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="body">
    <center><h1>Student personal Information CSV file is uploaded here</h1></center>
        <h4 style="font-weight:bold;"><u>Precautions</u></h4>
        <ul><li> <span style="font-weight: bold;" class="glyphicon glyphicon-hand-right"></span> Only once should upload the csv file to database</li>
            <li> <span style="font-weight: bold;" class="glyphicon glyphicon-hand-right"></span> Redundancy may causes so not to allow two same records on single table</li>
            <li> <span style="font-weight: bold;" class="glyphicon glyphicon-hand-right"></span> If you want to truncate the table and insert a new csv file the click below <strong>(Truncate Table)</strong></li>
        </ul>
        <hr>
   <div class="container_div">
     <div class="row">
        <form action="upload_page.jsp" method="post" enctype="multipart/form-data">
        <div class="col-xs-12 col-md-4 ">  
            <!-- image-preview-filename input [CUT FROM HERE]-->
            <div class="input-group image-preview">
                <input type="text" class="form-control image-preview-filename"> <!-- don't give a name === doesn't send on POST/GET -->
                <span class="input-group-btn">
                    <!-- image-preview-clear button -->
                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                        <span class="glyphicon glyphicon-remove"></span> Clear
                    </button>
                    <!-- image-preview-input -->
                    <div class="btn btn-default image-preview-input">
                        <span class="glyphicon glyphicon-folder-open"></span>
                        <span class="image-preview-input-title">Choose File(CSV Only)</span>
                        <input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview"/> <!-- rename it -->
                    </div>
                </span>         
            </div><!-- /input-group image-preview [TO HERE]--> 
            <center><button  id="upload" type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-file"></span> Upload File</button></center>
         </div>
        </form>
      </div>
    </div>
            <script>
             $(function() {
                    // Create the close button
                    var closebtn = $('<button/>', {
                        type:"button",
                        text: 'x',
                        id: 'close-preview',
                        style: 'font-size: initial;',
                    });
                    closebtn.attr("class","close pull-right");

                    // Clear event
                    $('.image-preview-clear').click(function(){
                        $('.image-preview').attr("data-content","").popover('hide');
                        $('.image-preview-filename').val("");
                        $('.image-preview-clear').hide();
                        $('.image-preview-input input:file').val("");
                        $(".image-preview-input-title").text("Browse"); 
                    }); 
                    // Create the preview image
                    $(".image-preview-input input:file").change(function (){     
                        var img = $('<img/>', {
                            id: 'dynamic',
                            width:250,
                            height:200
                        });      
                        var file = this.files[0];
                        var reader = new FileReader();
                        // Set preview image into the popover data-content
                        reader.onload = function (e) {
                            $(".image-preview-input-title").text("Change");
                            $(".image-preview-clear").show();
                            $(".image-preview-filename").val(file.name);
                        }        
                        reader.readAsDataURL(file);
                    });  
                });
            </script>
            <%
                String sql="select * from student_per_info";
             %>
             <center><form class="form-inline">
             <div class="form-group">
                <label for="inputsm">Search Here </label>
                <input class="form-control input-sm" type="text" id="myInput" name="searchinput">
                <input name="search" type="submit" value="search" class="btn btn-info">
             </div>
             </form></center>
             <!--            <script type="text/javascript">
                function SearchFunc(){
                    var value=document.getElementById("myInput").value;
                    window.location.href="student_db_perinfo.jsp?search=search&value="+value;
                }
            </script>-->
            <%       
                if(request.getParameter("search")!=null){
                  String valueLike=request.getParameter("searchinput");
                      sql="select * from student_per_info where CONCAT(`s_id`, `s_name`, `s_dept`, `s_admit_batch`) Like '%"+valueLike+"%'";  
                }
             %>
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
            Statement st= con.createStatement();
            
            ResultSet resultSet=st.executeQuery(sql);
            
            while (resultSet.next()) {
        %>
            <tr>
            <td><%=Double.parseDouble(""+resultSet.getDouble(1))%></td>
            <td><%=resultSet.getString(2)%></td>
            <td><%=resultSet.getString(5)%></td>
            <td><%=resultSet.getString(8)%></td>
            <% String name=resultSet.getString(2); %>
            <td><% out.println("<a href='Student_profile.jsp?stuname="+name+"'><b>More <span class='glyphicon glyphicon-chevron-right'></span></b></a>");%></td>
            </tr>
            <%
            }
            %>
            </table>
            
            
            
             <%
            String sql_gender="Select s_gender,count(*) as number from student_per_info GROUP BY s_gender";
            PreparedStatement stmt=con.prepareStatement(sql_gender);
            ResultSet rs=stmt.executeQuery();
            int arr[]=new int[2];
            int i=0;
            while(rs.next()){
                arr[i]=Integer.parseInt(rs.getString("number"));
                i++;
            }
            %>
            <style>
                #graph{
                  width:37%;
                  float:left;
                  height:50%;
                  margin-left: 12%;
                }
                #graph-content{
                    width:100%;
                    float:none;
                }
                .btn-danger{
                    width:100%;
                    float:none;
                    margin-bottom: 1%;
                }
                body{
                    overflow-x: hidden;
                }
            </style>
<div id="graph-content">            
    <div id="graph">
        <center><h2>Bar Graph Representation</h2></center>
           <canvas id="myChart" height="400"></canvas>
    </div>         
    <div id="graph">
           <center><h2>Pie-chart Representation</h2></center>
           <canvas id="pie-chart" height="450"></canvas>
    </div>
</div>
<script>
var ctx = document.getElementById("myChart").getContext('2d');
ctx.height =50;
ctx.width=50;
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["Male", "Female"],
        datasets: [{
            label: 'Predicted of male and female in class rooms',
            data: [<% out.println(arr[1]); %>, <% out.println(arr[0]); %>],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
    
        scales: {
        
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }],
            xAxes: [{
                // Change here
            	barPercentage: 0.4
            }]
        },
        responsive: true
    }
});
</script>
<script>
 var ctx = document.getElementById("pie-chart");
ctx.height =50;
ctx.width=50;
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: ["Male", "Female"],
      datasets: [{
        label: "Population (millions)",
        backgroundColor: ["#3e95cd", "#8e5ea2"],
        data: [<% out.println(arr[1]); %>, <% out.println(arr[0]); %>]
      }]
    },

    options: {
      title: {
        display: true,
        text: 'Predicted of male and female in class rooms'
      },
      responsive: true
    }
});
</script>
 
        <hr>
        <div id="truncate">
        <form action="../TruncateStuPerInfo" method="post">
            <input type="submit"  class="btn btn-danger" value="Truncate Table"/>
        </form>
        </div>
        </center>
    </body>
</html>
