<%-- 
    Document   : update
    Created on : Feb 27, 2017, 11:07:12 PM
    Author     : Lava Kumar
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           double rollno=Double.parseDouble(request.getParameter("rollno"));
           String sname=request.getParameter("sname");
           String fname=request.getParameter("fname");
           String mname=request.getParameter("mname");
           String foccuption=request.getParameter("foccuption");
           String gender=request.getParameter("gender");
           String sdept=request.getParameter("sdept");
           String sdob=request.getParameter("sdob");
           String semail=request.getParameter("semail");
           String sbatch=request.getParameter("sbatch");
           double spno=Double.parseDouble(request.getParameter("spno"));  
           double fpno=Double.parseDouble(request.getParameter("fpno"));
           String saddress=request.getParameter("saddress");
           String scity=request.getParameter("scity");
           String sstate=request.getParameter("sstate");
           int szipcode=Integer.parseInt(request.getParameter("szipcode"));
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_information","root","");
            String sql="update student_per_info set s_name?,s_father_name=?,s_mother_name=?,s_father_occuption=?,s_gender=?,s_dept=?,s_dob=?,s_email=?,	s_admit_batch=?,s_phone_no=?,s_father_phno=?,s_address=?,s_city=?,s_state=?,s_zipcode=? where s_id=?";
            java.sql.PreparedStatement st=con.prepareStatement(sql);
            st.setString(1,sname);
            st.setString(2,fname);
            st.setString(3, mname);
            st.setString(4,foccuption);
            st.setString(5,gender);
            st.setString(6,sdept);
            st.setString(7,sdob);
            st.setString(8,semail);
            st.setString(9,sbatch);
            st.setDouble(10,spno);
            st.setDouble(11,fpno);
            st.setString(12,saddress);
            st.setString(13,scity);
            st.setString(14,sstate);
            st.setInt(15,szipcode);
            st.setDouble(16,rollno);
            
           int i= st.executeUpdate();
           out.println(fname);
            if(i!=0){
                //response.sendRedirect("edit_student.jsp?stuname="+sname);
                response.sendRedirect("Edit_students_page.jsp");
            }
        %>    
    </body>
</html>
