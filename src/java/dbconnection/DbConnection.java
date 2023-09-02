/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection
{
    static Connection con;
   public static Connection getConnect()
   {
    
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            con  =DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
            System.out.println("connection sussecful");
        } 
        catch (ClassNotFoundException | SQLException e) 
        {
            e.printStackTrace();
        }
        return con ;
       
    }
    
}
   

