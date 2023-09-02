/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package backend;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author dell
 */
public class UploadResume extends HttpServlet
{
       String file_name=null;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        HttpSession session = req.getSession();
        String email = (String) session.getAttribute("session_email");
        try
        {
            DiskFileItemFactory factory  =new DiskFileItemFactory();
        ServletFileUpload sfu  = new ServletFileUpload(factory);
        
        List<FileItem> items = sfu.parseRequest(req);
        FileItem item=items.get(0);
        String file_path = item.getName();
        File file = new File(file_path);
        file_name=file.getName();
        
        File f1= new File(ProfilePath.Resume_Path+file_name);
        item.write(f1);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
            PreparedStatement ps1 = con.prepareStatement("select * from resume where email=? ");
            ps1.setString(1, email);
            
            ResultSet rs1  =ps1.executeQuery();
            
            if(rs1.next())
            {
                //update
                PreparedStatement ps2 = con.prepareStatement("update resume set path=? where email=?");
                ps2.setString(1, file_name);
                ps2.setString(2, email);
                
                int i1 = ps2.executeUpdate();
                
                if(i1>0)
                {
                    resp.sendRedirect("profile.jsp");
                }
                else
                {
                    
                RequestDispatcher rd1  =req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                  RequestDispatcher rd2  =req.getRequestDispatcher("UploadResume.jsp");
                rd1.include(req, resp);
                }
            }
            else
            {
                //insert
                 PreparedStatement ps3 = con.prepareStatement("insert into resume(email,path) values(?,?)");
                ps3.setString(1, email);
                ps3.setString(2, file_name);
                
                int i2 = ps3.executeUpdate();
                
                if(i2>0)
                {
                    resp.sendRedirect("profile.jsp");
                }
                else
                {
                    
                RequestDispatcher rd1  =req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                  RequestDispatcher rd2  =req.getRequestDispatcher("UploadResume.jsp");
                rd1.include(req, resp);
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
          
    }
    
}
