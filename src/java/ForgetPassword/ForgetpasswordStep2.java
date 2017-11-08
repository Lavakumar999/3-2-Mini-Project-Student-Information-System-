
package ForgetPassword;

import database.DatabaseFunctionality;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ForgetpasswordStep2 extends HttpServlet {
    DatabaseFunctionality db=new DatabaseFunctionality();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String password=request.getParameter("password");
        String cpassword=request.getParameter("cpassword");
        String email=request.getParameter("emailid");
        String sqlselect="select * from admintable where emailid=?";
        int flag=0;

        try{
            PreparedStatement psmt=db.database().prepareStatement(sqlselect);
            psmt.setString(1,email);
           ResultSet resultSet=psmt.executeQuery();
          
           if(resultSet.next()){
                  if(password.equals(cpassword)){
                        String sql="update admintable set password=?  where emailid=?";
                           try{
                                psmt=db.database().prepareStatement(sql);
                               psmt.setString(1,password);
                               psmt.setString(2,email);
                               int i= psmt.executeUpdate();
                               if(i>0){
                                   request.setAttribute("passwordscuccess",true);
                                   request.getRequestDispatcher("index.jsp").forward(request, response);  
                               }
                           }catch(Exception e){}

                   }else{
                  
                   }
           }else{
                request.setAttribute("EmailCheck",true);
                request.setAttribute("passwordfailStep2",true);
                request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
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
