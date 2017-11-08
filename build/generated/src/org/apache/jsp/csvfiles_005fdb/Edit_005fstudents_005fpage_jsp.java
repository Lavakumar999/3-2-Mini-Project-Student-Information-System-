package org.apache.jsp.csvfiles_005fdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;

public final class Edit_005fstudents_005fpage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("         <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            #body{\n");
      out.write("                background-color: #fff;\n");
      out.write("            }\n");
      out.write("            #headtr:hover{\n");
      out.write("                background-color: grey;\n");
      out.write("                color:white;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body id=\"body\">\n");
      out.write("    <center><h1><b>List of students</b></h1></center>\n");
      out.write("    <center>\n");
      out.write("        <table class=\"table table-hover\">\n");
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
            java.sql.Statement st= con.createStatement();
            String sql="select * from student_per_info";
            ResultSet resultSet=st.executeQuery(sql);
            
            while (resultSet.next()) {
        
      out.write("\n");
      out.write("            <tr>\n");
      out.write("                <td>");
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
 out.println("<a href='edit_student.jsp?stuname="+name+"'><span style='font-size:16px;' class='glyphicon glyphicon-edit'></span> Edit</a>");
      out.write("</td>\n");
      out.write("            </tr>\n");
      out.write("            ");

            }
            
      out.write("\n");
      out.write("            </table>\n");
      out.write("    </center>\n");
      out.write("        \n");
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
