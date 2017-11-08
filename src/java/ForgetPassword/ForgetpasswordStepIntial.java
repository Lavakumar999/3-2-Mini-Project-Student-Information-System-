/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ForgetPassword;

import database.DatabaseFunctionality;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author Lava Kumar
 */
public class ForgetpasswordStepIntial extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           DatabaseFunctionality db=new DatabaseFunctionality();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String to = request.getParameter("emailid");
            Random randomGenerator=new Random();
            int hashcode=0;
            try{
                int randomNumber=randomGenerator.nextInt(1000);
                hashcode=Math.abs(to.hashCode()*randomNumber%1000000);
                String sql="update admintable set secrectCode=?  where emailid=?";
                 PreparedStatement psmt=db.database().prepareStatement(sql);
                 psmt.setString(1,hashcode+"");
                 psmt.setString(2,to);
                 int i= psmt.executeUpdate();
                 if(i>0){
                     request.setAttribute("EmailCheck",true);
                    final String from = "lavakumarfire999@gmail.com";//change accordingly
                    final String username = "lava kumar";//change accordingly
                    final String password = "lavakumarjailavakusha";//change accordingly

                    // Assuming you are sending email through relay.jangosmtp.net
                    String host = "smtp.gmail.com";

                    Properties props = new Properties();
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.starttls.enable", "true");
                    props.put("mail.smtp.host", host);
                    props.put("mail.smtp.port", "587");

                    // Get the Session object.
                    Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                       protected PasswordAuthentication getPasswordAuthentication() {
                          return new PasswordAuthentication(from, password);
                       }
                    });

                    try {

                       // Create a default MimeMessage object.
                       Message message = new MimeMessage(session);
                       // Set From: header field of the header.
                       message.setFrom(new InternetAddress(from));
                       message.setRecipients(Message.RecipientType.TO,
                       InternetAddress.parse(to));
                       message.setSubject("Reset password code");
                       message.setText("Here is Your 6-digit code . Enter this code to reset youur password"
                          +"--6-digit code ="+hashcode);

                       // Send message
                       Transport.send(message);

                       System.out.println("Sent message successfully....");

                        } catch (MessagingException e) {
                              throw new RuntimeException(e);
                        }
//                    JOptionPane.showMessageDialog(null,"Email Sucessfully verfied","Check you mail for code",JOptionPane.INFORMATION_MESSAGE);
                     request.getRequestDispatcher("forgetPassword.jsp").forward(request, response);  
                 }
                 else{
                     
                     request.setAttribute("EmailFail",true);
                     request.getRequestDispatcher("forgetPassword.jsp").forward(request, response); 
                 }
            }catch(Exception e){}
            // Sender's email ID needs to be mentioned
           
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
