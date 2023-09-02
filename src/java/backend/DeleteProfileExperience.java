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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class DeleteProfileExperience extends HttpServlet
{
        
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        
        PrintWriter out  =resp.getWriter();
       String id3  =req.getParameter("id2");
       
       try
       {
            Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
            PreparedStatement ps = con.prepareStatement("delete from add_experience where id=?");
            
              ps.setString(1, id3);
            
            int i=ps.executeUpdate();
            
            if(i>0)
            {
                resp.sendRedirect("profile.jsp");
            }
            else
            {
                out.print("error");
            }
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
          
    }
    
}
