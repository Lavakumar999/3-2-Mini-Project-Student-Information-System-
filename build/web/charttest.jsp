<%--
    Document   : charttest
    Created on : Aug 13, 2017, 12:36:55 AM
    Author     : Lava Kumar
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
             <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js" type="text/javascript"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.min.js" type="text/javascript"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js" type="text/javascript"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js" type="text/javascript"></script>
    </head>
    <body>
             <%
                 Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information","root","");
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
                  width:35%;
                  float:left;
                  height:50%;
                  margin-left: 8%;
                }
            </style>
<div id="graph">
       <canvas id="myChart" height="400"></canvas>
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
            label: '# of Votes',
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

<div id="graph">
<canvas id="pie-chart" height="450"></canvas>
</div>
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

    </body>
</html>
