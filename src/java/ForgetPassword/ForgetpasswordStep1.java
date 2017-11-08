
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
import javax.servlet.http.HttpSession;

public class ForgetpasswordStep1 extends HttpServlet {

    DatabaseFunctionality db=new DatabaseFunctionality();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String username=request.getParameter("username");
        String Emailid=request.getParameter("emailid");
        String securitycode=request.getParameter("securitycode");
        String sql="select * from admintable where username=? and emailid=? and secrectCode=?";
        out.print(username+"  "+Emailid+"  "+securitycode);
        int flag=0;

        try{
            PreparedStatement psmt=db.database().prepareStatement(sql);
            psmt.setString(1,username);
            psmt.setString(2,Emailid);
            psmt.setString(3,securitycode);
           ResultSet resultSet=psmt.executeQuery();
          
           while(resultSet.next()){
               if(username.equals(resultSet.getString("username"))&&Emailid.equals(resultSet.getString("emailid"))&&securitycode.equals(resultSet.getString("secrectCode"))){
                   flag=1;
                   request.setAttribute("EmailCheck",true);
                   request.setAttribute("passwordscuccessStep1",true);
                   request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);  
               }
           }
          
        }catch(Exception e){
                   request.setAttribute("EmailCheck",true);
                   request.setAttribute("passwordfailStep1",true);
                   request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);
        }
         if(flag==0){
                   request.setAttribute("EmailCheck",true);
                   request.setAttribute("passwordfailStep1",true);
                   request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);  
           }
    
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
