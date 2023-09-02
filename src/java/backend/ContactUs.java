/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class ContactUs extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        PrintWriter out  =resp.getWriter();
      String name  = req.getParameter("name1");
      String email  = req.getParameter("email1");
      
      String subject= req.getParameter("sub1");
      String message = req.getParameter("msg1");
      
      Date d = new Date();
        SimpleDateFormat sdf1  =new SimpleDateFormat("dd-MM-yyyy");
        String date1  = sdf1.format(d);
        
           SimpleDateFormat sdf2  =new SimpleDateFormat("HH:mm:ss");
        String time1  = sdf2.format(d);
        
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
            PreparedStatement ps = con.prepareStatement("insert into contact_us(name,email,subject,message,date1,time1) values(?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, message);
            ps.setString(5, date1);
            ps.setString(6, time1);
            
            int i=ps.executeUpdate();
            if(i>0) 
            {
                String subject1="Thank You";
                String message1 ="Our team will contact to you as soon as possible!";
                SendConfirmationMail.SendConfirmationMail(email,subject1,message1);
//                resp.sendRedirect("contact-us.jsp");
                RequestDispatcher rd1 = req.getRequestDispatcher("success.jsp");
                rd1.include(req, resp);
                   RequestDispatcher rd2 = req.getRequestDispatcher("contact-us.jsp");
                rd2.include(req, resp);
               
            }
            else
            {
                resp.sendRedirect("profile.jsp");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
               
    }
    
}
