/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package backend;

import java.io.IOException;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class ApplyJob extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        HttpSession session=req.getSession();
        String email=(String) session.getAttribute("session_email");
        
        String id=req.getParameter("jid");
        
        Date d=new Date();
        SimpleDateFormat sdf1 =  new SimpleDateFormat("dd-MM-yyyy");
        String date1  =sdf1.format(d);
        
        SimpleDateFormat sdf2  =new SimpleDateFormat("HH:mm:ss");
        String time1=sdf2.format(d);
        
        
        try
        {
             Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
            PreparedStatement ps = con.prepareStatement("insert into applied_jobs(email,job_id,date1,time1) values(?,?,?,?)");
            ps.setString(1, email);
             ps.setString(2, id);
              ps.setString(3, date1);
               ps.setString(4, time1);
               
               int i=ps.executeUpdate();
               if(i>0)
               {
                   RequestDispatcher rd1 = req.getRequestDispatcher("job-full-details.jsp?jobid="+id);
                   rd1.include(req, resp);
//                   resp.sendRedirect("job-full-details.jsp?id="+id);
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
