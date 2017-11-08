<%-- 
    Document   : insert
    Created on : Feb 28, 2017, 12:07:20 AM
    Author     : Lava Kumar
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert</title>
    </head>
    <body>
       <%
           Double sid=Double.parseDouble(request.getParameter("sid"));
           String sname=request.getParameter("sname");
           String fname=request.getParameter("fname");
           String mname=request.getParameter("mname");
           String foccuption=request.getParameter("foccuption");
           String gender=request.getParameter("gender");
           String dob=request.getParameter("dob");
//           String dd=request.getParameter("dd");
//           String mn=request.getParameter("mn");
//           String year=request.getParameter("year");
           String sdpt=request.getParameter("branch");
           String sadmitbatch=request.getParameter("adm");
           String saddress=request.getParameter("address");
           Double sphone=Double.parseDouble(request.getParameter("phonenum1"));
           
           String semail=request.getParameter("email");
           String scity=request.getParameter("scity");
           String sstate=request.getParameter("sstate");
           Integer szipcode=Integer.parseInt(request.getParameter("szipcode"));
           Double fphone=Double.parseDouble(request.getParameter("phonenum2"));
           Part part = request.getPart("simage");
                Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information","root","");
            String sql="insert into student_per_info values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            st.setDouble(1,sid);
            st.setString(2, sname);
            st.setString(3, fname);
            st.setString(4, mname);
            st.setString(5, sdpt);
            st.setString(6, dob);
            st.setString(7, semail);
            st.setString(8, sadmitbatch);
            st.setDouble(9, sphone);
            st.setDouble(10, fphone);
            st.setString(11, saddress);
            st.setString(12, scity);
            st.setString(13, sstate);
            st.setInt(14, szipcode);
            st.setString(15, foccuption);
            st.setString(16, gender);
            InputStream is = part.getInputStream();
            st.setBlob(17, is);
            int i=st.executeUpdate();
            if(i>0){
                response.sendRedirect("Insert_single_student.jsp");
            }
           
        %>    
    </body>
</html>
