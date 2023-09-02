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
public class DeleteApplicationForm extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        PrintWriter out = resp.getWriter();
        HttpSession session=req.getSession();
        String email = (String) session.getAttribute("session_email");
      String id=req.getParameter("jid");
      
      try
      {
           Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
          PreparedStatement ps = con.prepareStatement("delete from applied_jobs where email=? and job_id=?");
          ps.setString(1, email);
          ps.setString(2,id);
          int i=ps.executeUpdate();
          if(i>0)
          {
              resp.sendRedirect("my-applied-jobs.jsp");
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
