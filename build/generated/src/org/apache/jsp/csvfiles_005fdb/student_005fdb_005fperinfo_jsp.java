package org.apache.jsp.csvfiles_005fdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.io.*;
import java.sql.*;

public final class student_005fdb_005fperinfo_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Student Personal Information</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js\"></script>\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-route.js\"></script>\n");
      out.write("        <!-- Chart js files //-->\n");
      out.write("            <script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.js\" type=\"text/javascript\"></script>\n");
      out.write("            <script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.bundle.min.js\" type=\"text/javascript\"></script>\n");
      out.write("            <script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js\" type=\"text/javascript\"></script>\n");
      out.write("            <script src=\"https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <link href=\"../css/stuent_db_css.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body id=\"body\">\n");
      out.write("    <center><h1>Student personal Information CSV file is uploaded here</h1></center>\n");
      out.write("        <h4 style=\"font-weight:bold;\"><u>Precautions</u></h4>\n");
      out.write("        <ul><li> <span style=\"font-weight: bold;\" class=\"glyphicon glyphicon-hand-right\"></span> Only once should upload the csv file to database</li>\n");
      out.write("            <li> <span style=\"font-weight: bold;\" class=\"glyphicon glyphicon-hand-right\"></span> Redundancy may causes so not to allow two same records on single table</li>\n");
      out.write("            <li> <span style=\"font-weight: bold;\" class=\"glyphicon glyphicon-hand-right\"></span> If you want to truncate the table and insert a new csv file the click below <strong>(Truncate Table)</strong></li>\n");
      out.write("        </ul>\n");
      out.write("        <hr>\n");
      out.write("   <div class=\"container_div\">\n");
      out.write("     <div class=\"row\">\n");
      out.write("        <form action=\"upload_page.jsp\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("        <div class=\"col-xs-12 col-md-4 \">  \n");
      out.write("            <!-- image-preview-filename input [CUT FROM HERE]-->\n");
      out.write("            <div class=\"input-group image-preview\">\n");
      out.write("                <input type=\"text\" class=\"form-control image-preview-filename\"> <!-- don't give a name === doesn't send on POST/GET -->\n");
      out.write("                <span class=\"input-group-btn\">\n");
      out.write("                    <!-- image-preview-clear button -->\n");
      out.write("                    <button type=\"button\" class=\"btn btn-default image-preview-clear\" style=\"display:none;\">\n");
      out.write("                        <span class=\"glyphicon glyphicon-remove\"></span> Clear\n");
      out.write("                    </button>\n");
      out.write("                    <!-- image-preview-input -->\n");
      out.write("                    <div class=\"btn btn-default image-preview-input\">\n");
      out.write("                        <span class=\"glyphicon glyphicon-folder-open\"></span>\n");
      out.write("                        <span class=\"image-preview-input-title\">Choose File(CSV Only)</span>\n");
      out.write("                        <input type=\"file\" accept=\"image/png, image/jpeg, image/gif\" name=\"input-file-preview\"/> <!-- rename it -->\n");
      out.write("                    </div>\n");
      out.write("                </span>         \n");
      out.write("            </div><!-- /input-group image-preview [TO HERE]--> \n");
      out.write("            <center><button  id=\"upload\" type=\"submit\" class=\"btn btn-primary\"><span class=\"glyphicon glyphicon-file\"></span> Upload File</button></center>\n");
      out.write("         </div>\n");
      out.write("        </form>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("            <script>\n");
      out.write("             $(function() {\n");
      out.write("                    // Create the close button\n");
      out.write("                    var closebtn = $('<button/>', {\n");
      out.write("                        type:\"button\",\n");
      out.write("                        text: 'x',\n");
      out.write("                        id: 'close-preview',\n");
      out.write("                        style: 'font-size: initial;',\n");
      out.write("                    });\n");
      out.write("                    closebtn.attr(\"class\",\"close pull-right\");\n");
      out.write("\n");
      out.write("                    // Clear event\n");
      out.write("                    $('.image-preview-clear').click(function(){\n");
      out.write("                        $('.image-preview').attr(\"data-content\",\"\").popover('hide');\n");
      out.write("                        $('.image-preview-filename').val(\"\");\n");
      out.write("                        $('.image-preview-clear').hide();\n");
      out.write("                        $('.image-preview-input input:file').val(\"\");\n");
      out.write("                        $(\".image-preview-input-title\").text(\"Browse\"); \n");
      out.write("                    }); \n");
      out.write("                    // Create the preview image\n");
      out.write("                    $(\".image-preview-input input:file\").change(function (){     \n");
      out.write("                        var img = $('<img/>', {\n");
      out.write("                            id: 'dynamic',\n");
      out.write("                            width:250,\n");
      out.write("                            height:200\n");
      out.write("                        });      \n");
      out.write("                        var file = this.files[0];\n");
      out.write("                        var reader = new FileReader();\n");
      out.write("                        // Set preview image into the popover data-content\n");
      out.write("                        reader.onload = function (e) {\n");
      out.write("                            $(\".image-preview-input-title\").text(\"Change\");\n");
      out.write("                            $(\".image-preview-clear\").show();\n");
      out.write("                            $(\".image-preview-filename\").val(file.name);\n");
      out.write("                        }        \n");
      out.write("                        reader.readAsDataURL(file);\n");
      out.write("                    });  \n");
      out.write("                });\n");
      out.write("            </script>\n");
      out.write("            ");

                String sql="select * from student_per_info";
             
      out.write("\n");
      out.write("             <center><form class=\"form-inline\">\n");
      out.write("             <div class=\"form-group\">\n");
      out.write("                <label for=\"inputsm\">Search Here </label>\n");
      out.write("                <input class=\"form-control input-sm\" type=\"text\" id=\"myInput\" name=\"searchinput\">\n");
      out.write("                <input name=\"search\" type=\"submit\" value=\"search\" class=\"btn btn-info\">\n");
      out.write("             </div>\n");
      out.write("             </form></center>\n");
      out.write("             <!--            <script type=\"text/javascript\">\n");
      out.write("                function SearchFunc(){\n");
      out.write("                    var value=document.getElementById(\"myInput\").value;\n");
      out.write("                    window.location.href=\"student_db_perinfo.jsp?search=search&value=\"+value;\n");
      out.write("                }\n");
      out.write("            </script>-->\n");
      out.write("            ");
       
                if(request.getParameter("search")!=null){
                  String valueLike=request.getParameter("searchinput");
                      sql="select * from student_per_info where CONCAT(`s_id`, `s_name`, `s_dept`, `s_admit_batch`) Like '%"+valueLike+"%'";  
                }
             
      out.write("\n");
      out.write("      <center>        \n");
      out.write("            <table class=\"table table-hover\">\n");
      out.write("                <tr bgcolor=\"grey\" id=\"headtr\">\n");
      out.write("                <th>Stu Id</th>\n");
      out.write("                <th>Student Name</th>\n");
      out.write("                <th>Department</th>\n");
      out.write("                <th>Batch</th>\n");
      out.write("                <th>More</th>\n");
      out.write("                </tr>\n");
      out.write("            ");

            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information","root","");
            Statement st= con.createStatement();
            
            ResultSet resultSet=st.executeQuery(sql);
            
            while (resultSet.next()) {
        
      out.write("\n");
      out.write("            <tr>\n");
      out.write("            <td>");
      out.print(Double.parseDouble(""+resultSet.getDouble(1)));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(resultSet.getString(2));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(resultSet.getString(5));
      out.write("</td>\n");
      out.write("            <td>");
      out.print(resultSet.getString(8));
      out.write("</td>\n");
      out.write("            ");
 String name=resultSet.getString(2); 
      out.write("\n");
      out.write("            <td>");
 out.println("<a href='Student_profile.jsp?stuname="+name+"'><b>More <span class='glyphicon glyphicon-chevron-right'></span></b></a>");
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("            ");

            }
            
      out.write("\n");
      out.write("            </table>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("             ");

            String sql_gender="Select s_gender,count(*) as number from student_per_info GROUP BY s_gender";
            PreparedStatement stmt=con.prepareStatement(sql_gender);
            ResultSet rs=stmt.executeQuery();
            int arr[]=new int[2];
            int i=0;
            while(rs.next()){
                arr[i]=Integer.parseInt(rs.getString("number"));
                i++;
            }
            
      out.write("\n");
      out.write("            <style>\n");
      out.write("                #graph{\n");
      out.write("                  width:37%;\n");
      out.write("                  float:left;\n");
      out.write("                  height:50%;\n");
      out.write("                  margin-left: 12%;\n");
      out.write("                }\n");
      out.write("                #graph-content{\n");
      out.write("                    width:100%;\n");
      out.write("                    float:none;\n");
      out.write("                }\n");
      out.write("                .btn-danger{\n");
      out.write("                    width:100%;\n");
      out.write("                    float:none;\n");
      out.write("                    margin-bottom: 1%;\n");
      out.write("                }\n");
      out.write("                body{\n");
      out.write("                    overflow-x: hidden;\n");
      out.write("                }\n");
      out.write("            </style>\n");
      out.write("<div id=\"graph-content\">            \n");
      out.write("    <div id=\"graph\">\n");
      out.write("        <center><h2>Bar Graph Representation</h2></center>\n");
      out.write("           <canvas id=\"myChart\" height=\"400\"></canvas>\n");
      out.write("    </div>         \n");
      out.write("    <div id=\"graph\">\n");
      out.write("           <center><h2>Pie-chart Representation</h2></center>\n");
      out.write("           <canvas id=\"pie-chart\" height=\"450\"></canvas>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("<script>\n");
      out.write("var ctx = document.getElementById(\"myChart\").getContext('2d');\n");
      out.write("ctx.height =50;\n");
      out.write("ctx.width=50;\n");
      out.write("var myChart = new Chart(ctx, {\n");
      out.write("    type: 'bar',\n");
      out.write("    data: {\n");
      out.write("        labels: [\"Male\", \"Female\"],\n");
      out.write("        datasets: [{\n");
      out.write("            label: 'Predicted of male and female in class rooms',\n");
      out.write("            data: [");
 out.println(arr[1]); 
      out.write(',');
      out.write(' ');
 out.println(arr[0]); 
      out.write("],\n");
      out.write("            backgroundColor: [\n");
      out.write("                'rgba(255, 99, 132, 0.2)',\n");
      out.write("                'rgba(54, 162, 235, 0.2)',\n");
      out.write("                'rgba(255, 206, 86, 0.2)',\n");
      out.write("                'rgba(75, 192, 192, 0.2)',\n");
      out.write("                'rgba(153, 102, 255, 0.2)',\n");
      out.write("                'rgba(255, 159, 64, 0.2)'\n");
      out.write("            ],\n");
      out.write("            borderColor: [\n");
      out.write("                'rgba(255,99,132,1)',\n");
      out.write("                'rgba(54, 162, 235, 1)',\n");
      out.write("                'rgba(255, 206, 86, 1)',\n");
      out.write("                'rgba(75, 192, 192, 1)',\n");
      out.write("                'rgba(153, 102, 255, 1)',\n");
      out.write("                'rgba(255, 159, 64, 1)'\n");
      out.write("            ],\n");
      out.write("            borderWidth: 1\n");
      out.write("        }]\n");
      out.write("    },\n");
      out.write("    options: {\n");
      out.write("    \n");
      out.write("        scales: {\n");
      out.write("        \n");
      out.write("            yAxes: [{\n");
      out.write("                ticks: {\n");
      out.write("                    beginAtZero:true\n");
      out.write("                }\n");
      out.write("            }],\n");
      out.write("            xAxes: [{\n");
      out.write("                // Change here\n");
      out.write("            \tbarPercentage: 0.4\n");
      out.write("            }]\n");
      out.write("        },\n");
      out.write("        responsive: true\n");
      out.write("    }\n");
      out.write("});\n");
      out.write("</script>\n");
      out.write("<script>\n");
      out.write(" var ctx = document.getElementById(\"pie-chart\");\n");
      out.write("ctx.height =50;\n");
      out.write("ctx.width=50;\n");
      out.write("var myChart = new Chart(ctx, {\n");
      out.write("    type: 'pie',\n");
      out.write("    data: {\n");
      out.write("      labels: [\"Male\", \"Female\"],\n");
      out.write("      datasets: [{\n");
      out.write("        label: \"Population (millions)\",\n");
      out.write("        backgroundColor: [\"#3e95cd\", \"#8e5ea2\"],\n");
      out.write("        data: [");
 out.println(arr[1]); 
      out.write(',');
      out.write(' ');
 out.println(arr[0]); 
      out.write("]\n");
      out.write("      }]\n");
      out.write("    },\n");
      out.write("\n");
      out.write("    options: {\n");
      out.write("      title: {\n");
      out.write("        display: true,\n");
      out.write("        text: 'Predicted of male and female in class rooms'\n");
      out.write("      },\n");
      out.write("      responsive: true\n");
      out.write("    }\n");
      out.write("});\n");
      out.write("</script>\n");
      out.write(" \n");
      out.write("        <hr>\n");
      out.write("        <div id=\"truncate\">\n");
      out.write("        <form action=\"../TruncateStuPerInfo\" method=\"post\">\n");
      out.write("            <input type=\"submit\"  class=\"btn btn-danger\" value=\"Truncate Table\"/>\n");
      out.write("        </form>\n");
      out.write("        </div>\n");
      out.write("        </center>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
