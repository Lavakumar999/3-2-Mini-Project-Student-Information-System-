package org.apache.jsp.csvfiles_005fdb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Insert_005fsingle_005fstudent_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Student Registration Form</title>\n");
      out.write("        <link href=\"../css/cssFile.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<style type=\"text/css\">\n");
      out.write(".branch{\n");
      out.write("margin-left:22px;\n");
      out.write("}\n");
      out.write("#branch{\n");
      out.write("margin-left:200px;\n");
      out.write("}\n");
      out.write("font,.form-photo{\n");
      out.write("font-family:\"Times New Roman\", Times, serif;\n");
      out.write(" color:#999999;\n");
      out.write("}\n");
      out.write("h1{\n");
      out.write("    color:#000099;\n");
      out.write("}\n");
      out.write("select{\n");
      out.write("    border: 1px solid #999999;\n");
      out.write("    border-radius: 5px;\n");
      out.write("}\n");
      out.write("#border{\n");
      out.write("    border: 1px solid #999999;\n");
      out.write("    border-radius: 5px;\n");
      out.write("}\n");
      out.write("select:hover,select:visited,#border:hover,#border:visited{\n");
      out.write("    border-color:#4f93ce; \n");
      out.write("}\n");
      out.write("#photo{\n");
      out.write("    display: inline;\n");
      out.write("    border-radius: 5px;\n");
      out.write("}\n");
      out.write("#fontcolor{\n");
      out.write("    color:#666;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\t<!--\n");
      out.write("\tfunction validator(){\n");
      out.write("\tvar sname = document.getElementById(\"sname\").value;\n");
      out.write("\tvar fname = document.getElementById(\"fname\").value;\n");
      out.write("\tvar email = document.getElementById(\"email\").value;\n");
      out.write("\tvar address = document.getElementById(\"address\").value;\n");
      out.write("\tvar phone1 = document.getElementById(\"phone1\").value;\n");
      out.write("\tvar phone2= document.getElementById(\"phone2\").value;\n");
      out.write("\tvar radio_1 = document.getElementById(\"radio_male\").value;\n");
      out.write("\t\n");
      out.write("\tif(fname==\"\"&&sname==\"\"&&email==\"\"&&address==\"\"&&phone1==\"\")\n");
      out.write("\t\t\talert(\"Fill all required areas.\");\n");
      out.write("\telse\n");
      out.write("\t\t\talert(\"Thanks for the submission!\");\n");
      out.write("}\n");
      out.write("\t-->\n");
      out.write("\t</script>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("<div class=\"container\">\n");
      out.write("    <form action=\"../InsertStudent\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("        <div class=\"form-group\">\n");
      out.write("          <input  name=\"sid\" id=\"sid\" size=\"40\" type=\"number\" required=\"required\"/>\n");
      out.write("          <label for=\"input\" class=\"control-label\">Enter Your RegId</label><i class=\"bar\"></i>\n");
      out.write("      </div>\n");
      out.write("       <div class=\"form-group\">\n");
      out.write("      <input  name=\"sname\" id=\"sname\" type=\"text\" required=\"required\"/>\n");
      out.write("      <label for=\"input\" class=\"control-label\">Enter Your Name</label><i class=\"bar\"></i>\n");
      out.write("    </div>\n");
      out.write("           <div class=\"form-group\">\n");
      out.write("      <input name=\"fname\" id=\"fname\" type=\"text\" required=\"required\"/>\n");
      out.write("      <label for=\"input\" class=\"control-label\">Father Name</label><i class=\"bar\"></i>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("\t<div class=\"form-group\">\n");
      out.write("      <input name=\"mname\" id=\"fname\" type=\"text\" required=\"required\"/>\n");
      out.write("      <label for=\"input\" class=\"control-label\">Mother Name</label><i class=\"bar\"></i>\n");
      out.write("    </div>\n");
      out.write("\t<div class=\"form-group\">\n");
      out.write("     <input name=\"foccuption\" type=\"text\"  id=\"foccupation\" required=\"required\"/>\n");
      out.write("      <label for=\"input\" class=\"control-label\">Your Father Occuption</label><i class=\"bar\"></i>\n");
      out.write("    </div>\n");
      out.write("\t\n");
      out.write("\t <div class=\"form-radio\">\n");
      out.write("\t <font style=\"font-size:20px;\">Gender:</font><br/><br/>\n");
      out.write("      <div class=\"radio\">\n");
      out.write("        <label>\n");
      out.write("          <input id=\"radio_male\" type=\"radio\" name=\"gender\" value=\"male\" /><i class=\"helper\"></i>Male\n");
      out.write("        </label>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"radio\">\n");
      out.write("        <label>\n");
      out.write("          <input id=\"radio_female\" type=\"radio\" name=\"gender\" value=\"female\"/><i class=\"helper\"></i>Female\n");
      out.write("        </label>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("     <input name=\"dob\" type=\"date\"  id=\"dob\" required=\"required\"/>\n");
      out.write("      <label for=\"input\" class=\"control-label\">Date Of Birth:</label><i class=\"bar\"></i>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("                  <font size=\"+1\">Choose Branch:</font>\n");
      out.write("\t\t  <SELECT NAME=\"branch\" SINGLE id=\"fontcolor\">\n");
      out.write("                      <OPTION>Select Branch</option>\n");
      out.write("                      <OPTION>IT</option>\n");
      out.write("                      <OPTION>CSE</option>\n");
      out.write("                      <OPTION>Civil</option>\n");
      out.write("                      <OPTION>ECE</option>\n");
      out.write("                      <OPTION>EEE</option>\n");
      out.write("                      <OPTION>MECH</option>\n");
      out.write("                      <option>CHEM</option>\n");
      out.write("                  </SELECT>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"batch\" class=\"form-group\">\n");
      out.write("                    <br/>\n");
      out.write("                    <font size=\"+1\">Admitted Batch:</font>\n");
      out.write("                    <SELECT NAME=\"adm\" id=\"fontcolor\" SINGLE>\n");
      out.write("                        <OPTION>Select Batch</option>\n");
      out.write("                        <OPTION>2007-2011</option>\n");
      out.write("                        <OPTION>2008-2012</option>\n");
      out.write("                        <OPTION>2009-2013</option>\n");
      out.write("                        <OPTION>2010-2014</option>\n");
      out.write("                        <OPTION>2011-2015</option>\n");
      out.write("                        <OPTION>2012-2016</option>\n");
      out.write("                        <OPTION>2013-2017</option>\n");
      out.write("                        <option>2014-2018</option>\n");
      out.write("                        <option>2015-2019</option>\n");
      out.write("                        <option>2016-2020</option>\n");
      out.write("                   </SELECT>\t\t<br/><br/>\n");
      out.write("                </div>\n");
      out.write("                 <div>\n");
      out.write("\t\t<font>Educational Qualifications: </font><b><font>SSC\n");
      out.write("<INPUT id=\"border\" TYPE=\"text\" SIZE=\"3\" NAME=\"ssc\" maxlength=\"5\">% Intermediate\n");
      out.write("<INPUT  id=\"border\" TYPE=\"text\" SIZE=\"3\" NAME=\"inter\" maxlength=\"5\">%</font></b><br/>\n");
      out.write("\t\t\n");
      out.write("\t\t</div>\n");
      out.write("\t\n");
      out.write("\t <div class=\"form-group\">\n");
      out.write("      <textarea id=\"address\" name=\"address\" required=\"required\"></textarea>\n");
      out.write("      <label for=\"textarea\" class=\"control-label\">Address</label><i class=\"bar\"></i>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("     <input name=\"scity\" type=\"text\"  id=\"fcity\" required=\"required\"/>\n");
      out.write("      <label for=\"input\" class=\"control-label\">Your city</label><i class=\"bar\"></i>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("     <input name=\"sstate\" type=\"text\"  id=\"state\" required=\"required\"/>\n");
      out.write("      <label for=\"input\" class=\"control-label\">Your State</label><i class=\"bar\"></i>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"form-group\">\n");
      out.write("     <input  type=\"number\"   name=\"szipcode\" size=\"10\" id=\"zipcode\" required=\"required\"/>\n");
      out.write("      <label for=\"input\" class=\"control-label\">Pin code</label><i class=\"bar\"></i>\n");
      out.write("    </div>\n");
      out.write("\t<div class=\"form-group\">\n");
      out.write("\t<input type=\"number\" size=\"40\" id=\"sphone\" name=\"phonenum1\" required=\"required\" /><br/>\n");
      out.write("\t<label for=\"input\" class=\"control-label\">Your Phone number</label><i class=\"bar\"></i>\n");
      out.write("\t</div>\n");
      out.write("\t<div class=\"form-group\">\n");
      out.write("\t<input type=\"number\" size=\"40\" id=\"fphone\"  name=\"phonenum2\" required=\"required\"/><br/>\n");
      out.write("\t<label for=\"input\" class=\"control-label\">your Father Phone number</label><i class=\"bar\"></i>\n");
      out.write("\t</div>\n");
      out.write("\t\t<div class=\"form-group\">\n");
      out.write("      <input name=\"email\" id=\"semail\" type=\"text\" required=\"required\"/>\n");
      out.write("      <label for=\"input\" class=\"control-label\">Enter Your Email ID</label><i class=\"bar\"></i>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"form-photo\">\n");
      out.write("                <label for=\"input\">Upload Your Photo</label><i class=\"bar\"></i> \n");
      out.write("\t\t<INPUT TYPE=\"file\" id=\"sphoto\"  name=\"simage\" required=\"required\"/>\n");
      out.write("\t </div>\n");
      out.write("         <input type=\"submit\" onClick=\"validator(this)\" class=\"button\" value=\"submit\">\n");
      out.write("    </form>\n");
      out.write("</div>\n");
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
