<%-- 
    Document   : upload_perinfo
    Created on : Feb 21, 2017, 8:15:00 PM
    Author     : Lava Kumar
--%>

<%@page import="com.opencsv.CSVReader"%>
<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %> 
<%@ page import="javax.servlet.http.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String name="";
            final String UPLOAD_DIRECTORY = "C:/Users/Lava Kumar/Documents/NetBeansProjects/Mini_Project/web/uploads";
           
                 if(ServletFileUpload.isMultipartContent(request)){
	            try {

	                       List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
	               	                for(FileItem item : multiparts){
	                    if(!item.isFormField()){
	                        name = new File(item.getName()).getName();
	                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
	                    }
                     }
					 out.println("File Uploaded Successfully  "+UPLOAD_DIRECTORY+File.separator+name);
				}catch(Exception e){
					out.println("File Uploaded failed");
				}
		   }else{
			   out.println("sryy only handled file Uploaded ");
		   }
            
        try {
          
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/client","root","");
           
         
	                System.out.println("Data Successfully Uploaded");
                    String loadQuery = "LOAD DATA LOCAL INFILE '" + name + "' INTO TABLE userdata FIELDS TERMINATED BY ','" + " LINES TERMINATED BY '\n' (message,name) ";
	               		System.out.println(loadQuery);
				        Statement stmt = con.createStatement();
				if(stmt.execute(loadQuery)){
                                   response.sendRedirect("stdent_db_perinfo.jsp");
                                }       
                                
        } finally {
            out.close();
        }
        %>
    </body>
</html>
