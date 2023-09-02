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
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class SearchByTechnology extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        PrintWriter out=resp.getWriter();
      String tech1 = req.getParameter("technology");
      
      
       String id ,jobprofile="",company="",experience="",desc="",date2="",time2="";
      
      try
      {
          
             Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
          PreparedStatement ps = con.prepareStatement("select * from jobs where  job_profile LIKE '%"+tech1+"%'");
          
          ResultSet rs=ps.executeQuery();
          
          while(rs.next())
          {
              id = rs.getString("id");
              jobprofile = rs.getString("job_profile");
              company = rs.getString("company");
              experience = rs.getString("experience");
              desc = rs.getString("description");
              date2 = rs.getString("date1");
              time2 = rs.getString("time1");
              
              
//              out.print(id);
//              out.print(jobprofile);
//              out.print(company);
//              out.print(experience);
//              out.print(desc);
//              out.print(date2);
//              out.print(time2);
              
              out.print("  <div class=\"col-md-12 display_job_div\">\n" +"                                  <b>"+jobprofile+"<span style=\"font-size: 10px ; float: right\">("+date2 + " & " +time2 +")</span> </b> <br> <br>\n" +
"                               <span style=\"color:#d0cfcf \">Comapny:</span>   <span>"+company+"</span> <br> <br>\n" +
"                                <span style=\"color:#d0cfcf \">experience:</span>   <span>"+experience +"</span> <br> <br>\n" +
"                                <span style=\"color:#d0cfcf \">Description:</span>   <span>"+desc+"</span> <br> <br>\n" +
"                                <a href=\"job-full-details.jsp?jobid="+id+"\"> see more details</a>\n" +
"                                    \n" +
"                               </div> ");
          }
      }
      catch(Exception e)
      {
          out.print(e);
      }
    }
    
}
