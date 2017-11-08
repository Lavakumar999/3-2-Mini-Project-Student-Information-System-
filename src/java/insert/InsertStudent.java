/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package insert;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Lava Kumar
 */
@MultipartConfig
public class InsertStudent extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
                    String sname=request.getParameter("sname");
           String fname=request.getParameter("fname");
           String mname=request.getParameter("mname");
           String foccuption=request.getParameter("foccuption");
           String gender=request.getParameter("gender");
           String dob=request.getParameter("dob");
           String sdpt=request.getParameter("branch");
           String sadmitbatch=request.getParameter("adm");
           String saddress=request.getParameter("address");
           String semail=request.getParameter("email");
           String scity=request.getParameter("scity");
           String sstate=request.getParameter("sstate");
          int szipcode=Integer.parseInt(request.getParameter("szipcode"));
          double sphone=Double.parseDouble(request.getParameter("phonenum1"));
        double sid=Double.parseDouble(request.getParameter("sid"));
         double fphone=Double.parseDouble(request.getParameter("phonenum2"));
           Part part = request.getPart("simage");
         try{
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
            st.setInt(14,szipcode);
            st.setString(15, foccuption);
            st.setString(16, gender);
             InputStream is = part.getInputStream();
            st.setBlob(17, is);
            int i=st.executeUpdate();
            if(i>0){
                response.sendRedirect("csvfiles_db/Insert_single_student.jsp");
            }
         }catch(Exception e){}
         
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
