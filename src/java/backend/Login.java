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
public class Login extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String email2 = req.getParameter("email1");
        String pass2 = req.getParameter("pass1");
        String rememberme2  =req.getParameter("remember1");
        String name , gender,city,field ;
      try
      {
          Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
          PreparedStatement ps = con.prepareStatement("select * from register where email=? and pass=? ");
           
            ps.setString(1, email2);
            ps.setString(2, pass2);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                name=rs.getString("name");
                gender = rs.getString("gender");
                field = rs.getString("field");
                city = rs.getString("city");
                
                HttpSession session = req.getSession();
                session.setAttribute("session_name", name);
                session.setAttribute("session_gender", gender);
                session.setAttribute("session_field", field);
                session.setAttribute("session_city", city);
                session.setAttribute("session_email", email2);
                
                String about="";
                        String skill="";
              PreparedStatement ps2  =con.prepareStatement("select * from about_users where email=?");
              
              ps2.setString(1, email2);
              ResultSet rs2  =ps2.executeQuery();
              
              while(rs2.next())
              {
                  about=rs2.getString("about");
                  skill  =rs2.getString("skills");
              }
              session.setAttribute("session_about", about);
              session.setAttribute("session_skill", skill);
              
              String filename="";
              PreparedStatement ps3=con.prepareStatement("select * from profile_pics where email=?");
              ps3.setString(1, email2);
              
              ResultSet rs3  =ps3.executeQuery();
              
              while(rs3.next())
              {
                  filename=rs3.getString("path");
              }
              session.setAttribute("session_profilepic", filename);
               resp.sendRedirect("profile.jsp");
            }
            else
            {
                RequestDispatcher rd1= req.getRequestDispatcher("header.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2 = req.getRequestDispatcher("navbar.jsp");
                rd2.include(req, resp);
                
                RequestDispatcher rd3 = req.getRequestDispatcher("loginerror.jsp");
                rd3.include(req, resp);
                
                RequestDispatcher rd4= req.getRequestDispatcher("logindiv.jsp");
                rd4.include(req, resp);
                
                RequestDispatcher rd5= req.getRequestDispatcher("footer.jsp");
                rd5.include(req, resp);
                
                
            
                
                
                
            }
               
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
}
