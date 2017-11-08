/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import database.DatabaseFunctionality;
import java.io.Console;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.ConsoleHandler;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 *
 * @author Lava Kumar
 */
public class LoginServlet extends HttpServlet {
     DatabaseFunctionality db=new DatabaseFunctionality();
     int flag=0;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
        String username=request.getParameter("username");  
        String password=request.getParameter("password"); 
//       // if(!(username.equals("group1")&&password.equals("itbillgates"))){
//             request.setAttribute("loginResult",true);
//             request.getRequestDispatcher("index.jsp").forward(request, response);      
//       // }
        String sql="select username,password from admintable where username=? and password=?";
        PreparedStatement st=db.database().prepareStatement(sql);
        st.setString(1,username);
        st.setString(2,password);
        ResultSet resultSet=st.executeQuery();
        while(resultSet.next()){
             if(username.equals(resultSet.getString("username"))&&password.equals(resultSet.getString("password"))){
                 flag=1;
                HttpSession session =request.getSession();
                session.setAttribute("username",username); 
                response.sendRedirect("loginadmin.jsp");
            }
            else{
                request.setAttribute("loginResult",true);
                request.getRequestDispatcher("index.jsp").forward(request, response);        
            }
        }   
            if(flag==0){
                request.setAttribute("loginResult",true);
               request.getRequestDispatcher("index.jsp").forward(request, response);   
            }
        }
        catch(Exception e){
           request.setAttribute("loginResult",true);
           request.getRequestDispatcher("index.jsp").forward(request, response);        
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
