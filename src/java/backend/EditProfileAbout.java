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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class EditProfileAbout extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter() ;
        
        HttpSession session =  req.getSession();
        String email2 = (String)session.getAttribute("session_email");
       
        
        String name2 = req.getParameter("name1");
        String gender2= req.getParameter("gender1");
        String city2 = req.getParameter("city1");
        String about2 = req.getParameter("about1");
        String skill2 = req.getParameter("skill1");
        
        try
        {
             Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
            PreparedStatement ps1= con.prepareStatement("update register set name=? ,gender=? ,city=? where email=?");
            
            ps1.setString(1, name2);
            ps1.setString(2, gender2);
            ps1.setString(3, city2);
            ps1.setString(4, email2);
            
           int i1  = ps1.executeUpdate();
           
           PreparedStatement ps2  = con.prepareStatement("update about_users set about=? ,skills=? where email=?");
           ps2.setString(1, about2);
           ps2.setString(2, skill2);
           ps2.setString(3, email2);
           
           int i2  = ps2.executeUpdate();
           
           if(i1>0 && i2>0)
           {
               session.setAttribute("session_name", name2);
               session.setAttribute("session_email", email2);
               session.setAttribute("session_gender", gender2);
               session.setAttribute("session_city", city2);
               session.setAttribute("session_about", about2);
               session.setAttribute("session_skill", skill2);
              resp.sendRedirect("profile.jsp");
           }
           else
           {
                RequestDispatcher rd3 =req.getRequestDispatcher("error.jsp");
            rd3.include(req, resp);
            
            RequestDispatcher rd4 =req.getRequestDispatcher("edit-profile-about.jsp");
            rd4.include(req, resp);
           }
        }
        catch(Exception e)
        {
          
            
           out.print(e);
           
            
        }
    }
    
}
