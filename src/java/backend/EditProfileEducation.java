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
public class EditProfileEducation extends HttpServlet
{
     @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        PrintWriter out  = resp.getWriter();
        HttpSession session = req.getSession();
        String email2 = (String) session.getAttribute("session_email");

        String id2  =req.getParameter("id1");
        String school2 = req.getParameter("school1");
        String degree2 = req.getParameter("degree1");
        String year2 = req.getParameter("year1");
        String grade2 = req.getParameter("grade1");
        String desc2 = req.getParameter("desc1");

            try
            {
                Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
                PreparedStatement ps  =con.prepareStatement("update add_education set school=? , degree=? , year=? ,grade=? , description=? where id=?");
                
                ps.setString(1, school2);
                ps.setString(2, degree2);
                ps.setString(3, year2);
                ps.setString(4, grade2);
                ps.setString(5, desc2);
                ps.setString(6, id2);
                
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


