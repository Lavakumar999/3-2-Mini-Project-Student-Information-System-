package org.apache.jsp.csvfiles_005fdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.io.*;
import java.sql.*;

public final class Student_005fprofile_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>Student Profile</title>\n");
      out.write("        <script type=\"text/javascript\" src=\"../javascript/jquery-2.1.3.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"../javascript/jspdf.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"../javascript/pdfFromHTML.js\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            function tableToJson(table) {\n");
      out.write("    var data = [];\n");
      out.write("\n");
      out.write("    // first row needs to be headers\n");
      out.write("    var headers = [];\n");
      out.write("    for (var i=0; i<table.rows[0].cells.length; i++) {\n");
      out.write("        headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi,'');\n");
      out.write("    }\n");
      out.write("    data.push(headers);\n");
      out.write("    // go through cells\n");
      out.write("    for (var i=1; i<table.rows.length; i++) {\n");
      out.write("\n");
      out.write("        var tableRow = table.rows[i];\n");
      out.write("        var rowData = {};\n");
      out.write("\n");
      out.write("        for (var j=0; j<tableRow.cells.length; j++) {\n");
      out.write("\n");
      out.write("            rowData[ headers[j] ] = tableRow.cells[j].innerHTML;\n");
      out.write("\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        data.push(rowData);\n");
      out.write("    }       \n");
      out.write("\n");
      out.write("    return data;\n");
      out.write("}\n");
      out.write("function callme(){\n");
      out.write("var table = tableToJson($('#table-id').get(0));\n");
      out.write("var doc = new jsPDF('l','pt','letter',true);\n");
      out.write("\n");
      out.write("\n");
      out.write("$.each(table, function(i, row){\n");
      out.write("\t$.each(row, function(j,cell){\n");
      out.write("\t\n");
      out.write("\t\tdoc.cell(1,40,260,28,cell,i);\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t});\n");
      out.write("});\n");
      out.write("\n");
      out.write("doc.save('Safaa.pdf');\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("<style type=\"text/css\">\n");
      out.write("    #bold{\n");
      out.write("        font-weight: bold;\n");
      out.write("    }\n");
      out.write("   #download,#printdownload{\n");
      out.write("                   float:right;\n");
      out.write("                   background-color: #4cAF50;\n");
      out.write("                   border: none;\n");
      out.write("                   color:white;\n");
      out.write("                   padding: 0.75%;\n");
      out.write("                   text-align: center;\n");
      out.write("                   text-decoration: none;\n");
      out.write("                   display: inline-block;\n");
      out.write("                   font-size: 14px;\n");
      out.write("                   font-weight: bold;\n");
      out.write("                   border-radius:5%;\n");
      out.write("                   margin-right: 15%;\n");
      out.write("}\n");
      out.write("#download:hover,#printdownload:hover{\n");
      out.write("    background-color: #3e8e41;\n");
      out.write("}\n");
      out.write("#download:active,#printdownload:active{\n");
      out.write("    background-color: #3e8e41;\n");
      out.write("    box-shadow: 0 5px #666;\n");
      out.write("    transform:translateY(4px);\n");
      out.write("}\n");
      out.write("#download{\n");
      out.write("       float:none; \n");
      out.write("       margin-left: 15%;\n");
      out.write("       margin-right: 0;\n");
      out.write("}\n");
      out.write("#body{\n");
      out.write("    background-color: white;\n");
      out.write("}\n");
      out.write("table{\n");
      out.write("    background-color: #ccc;\n");
      out.write("}\n");
      out.write("             #backbtn{\n");
      out.write("                    font-weight: bold;\n");
      out.write("                    position: fixed;\n");
      out.write("                    bottom: 0px;\n");
      out.write("                    right: 0px; \n");
      out.write("                    margin-right: 2%;\n");
      out.write("                    margin-bottom: 1%;\n");
      out.write("                    height: 40px;\n");
      out.write("                    color:#fff;\n");
      out.write("                    background-color: #31708f;\n");
      out.write("               }\n");
      out.write("               #backbtn:hover{\n");
      out.write("                   background-color: #122b40;\n");
      out.write("               } \n");
      out.write("\n");
      out.write("    </style>\n");
      out.write("    </head>\n");
      out.write("    <body id=\"body\">\n");
      out.write("        <!-- Here is The data Base Connection Code -->\n");
      out.write("        ");
 
            try{
                String name=request.getParameter("stuname");
                Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information","root","");
            String sql="select * from student_per_info where s_name=?";
            PreparedStatement st=con.prepareStatement(sql);
            st.setString(1,name);
            ResultSet resultSet=st.executeQuery();
            while(resultSet.next()){
         
          
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("<div id=\"HTMLtoPDF\">\n");
      out.write("   <table border=\"1\" id=\"table-id\" align=\"center\" cellspacing=\"5\" cellpadding=\"5\" width=\"70%\">\n");
      out.write("    <tr>\n");
      out.write("        <th colspan=\"3\" style=\"color:darkblue;font-size:20pt;\"> Student Profile: ");
      out.print(resultSet.getDouble(1));
      out.write("</th>\n");
      out.write("    </tr>\n");
      out.write("    <tr> \n");
      out.write("    <th width=\"25%\"> Student Name </th> \n");
      out.write("    <td width=\"75%\">  ");
      out.print(resultSet.getString(2));
      out.write(" </td>\n");
      out.write("    <td rowspan=3 style=\"border-style:none;\" align=\"center\"> <img src=\"data:image/jpeg;base64,'.base64_encode(");
      out.print(resultSet.getBlob(17));
      out.write(").'\" width=\"250\" height=\"200\" border=\"2\" align=\"absmiddle\"  /></td>\n");
      out.write("    </tr> \n");
      out.write("    <tr>\n");
      out.write("    <th> Father Name </th>\n");
      out.write("    <td valign=middle>");
      out.print(resultSet.getString(3));
      out.write(" </td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("    <th>Mother Name </th>\n");
      out.write("    <td valign=middle>");
      out.print(resultSet.getString(4));
      out.write(" </td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("        <th  class=\"fcbold\"> Father Occuption</th><td colspan=\"2\" style=\"color:darkblue;\" id=\"bold\">");
      out.print(resultSet.getString("s_father_occuption"));
      out.write(" </td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("        <th  class=\"fcbold\"> Gender</th><td colspan=\"2\" style=\"color:darkblue;\" id=\"bold\">");
      out.print(resultSet.getString("s_gender"));
      out.write(" </td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("        <th  class=\"fcbold\"> Department </th><td colspan=\"2\" style=\"color:darkblue;\" id=\"bold\">");
      out.print(resultSet.getString("s_dept"));
      out.write(" </td>\n");
      out.write("    </tr>\n");
      out.write("    <tr>\n");
      out.write("        <th class=\"fcbold\" > Date of Birth </th> <td colspan=\"2\"> ");
      out.print(resultSet.getString("s_dob"));
      out.write(" </td>\n");
      out.write("    </tr>\n");
      out.write("<tr>\n");
      out.write("    <th class=\"fcbold\" > Email Id </th> <td colspan=\"2\" id=\"bold\">");
      out.print(resultSet.getString("s_email"));
      out.write(",lavakumar.14.it@anits.edu.in</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<th class=\"fcbold\" > Admitted Batch</th> <td colspan=\"2\">");
      out.print(resultSet.getString("s_admit_batch"));
      out.write(" </td> </tr>\n");
      out.write("<tr>\n");
      out.write("<th class=\"fcbold\" > Acheviments </th> <td colspan=\"2\" id=\"bold\">Topper of IT Dept in 2nd year</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td class=\"fcbold\" > Current Year</td> <td colspan=\"2\">3/4 IT </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("        <td class=\"fcbold\" > CGPA</td> <td colspan=\"2\">8.59 </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("    <td  class=\"fcbold\">No of Backlogs </td> <td colspan=\"2\" id=\"bold\"> 0</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("    <td class=\"fcbold\" > Student Phone Number</td> <td colspan=\"2\" id=\"bold\" >");
      out.print(resultSet.getString("s_phone_no"));
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td class=\"fcbold\"> Parents Phone Number </td> <td colspan=\"2\" id=\"bold\">");
      out.print(resultSet.getString("s_father_phno"));
      out.write("\n");
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<th colspan=3>ADDRESS</th>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("    <td>Street</td><td class=\"fcbold\" colspan=\"2\"> ");
      out.print(resultSet.getString("s_address"));
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td  class=\"fcbold\"> City </td> <td colspan=\"2\">");
      out.print(resultSet.getString("s_city"));
      out.write("</td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td class=\"fcbold\"> State</td> <td colspan=\"2\"> ");
      out.print(resultSet.getString("s_state"));
      out.write(" </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td class=\"fcbold\"> Pincode</td> <td colspan=\"2\"> ");
      out.print(resultSet.getString("s_zipcode"));
      out.write(" </td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("             \n");
      out.write("            \n");
      out.write("            ");
       
            } 
            }catch(Exception e){} 
            
      out.write("\n");
      out.write("</div>\n");
      out.write("        \n");
      out.write("        <a id=\"download\" href=\"javascript:callme()\">Download</a>\n");
      out.write("        <input id=\"printdownload\" type=\"button\" value=\"Print PDF\" onclick=\"window.print()\"/>\n");
      out.write("        <button type=\"button\" id=\"backbtn\" class=\"btn btn-primary btn-sm\" onclick=\"window.location.href='student_db_perinfo.jsp'\">\n");
      out.write("          Step Backward\n");
      out.write("        </button>\n");
      out.write("</body>\n");
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
