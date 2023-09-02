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
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class EditProfileExperience extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        PrintWriter out  = resp.getWriter();
        HttpSession session = req.getSession();
        String email2 = (String) session.getAttribute("session_email");

        String id3 =req.getParameter("id2");
        String company2 = req.getParameter("company1");
        String location2 = req.getParameter("location1");
        String year2 = req.getParameter("year1");
        String jobtitle2 = req.getParameter("jobtitle1");
        String desc2 = req.getParameter("desc1");

            try
            {
                Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
                PreparedStatement ps  =con.prepareStatement("update add_experience set company=? , location=? , year=? ,job_title=? , description=? where id=?");
                
                ps.setString(1, company2);
                ps.setString(2, location2);
                ps.setString(3, year2);
                ps.setString(4, jobtitle2);
                ps.setString(5, desc2);
                ps.setString(6, id3);
                
                int i = ps.executeUpdate();
                
                if(i>0)
                {
                    resp.sendRedirect("profile.jsp");
                }
                else
                {
                    out.print("failed");
                }
          
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
    }
    
}




