<%-- 
    Document   : edit-profile-experience
    Created on : May 25, 2021, 12:09:50 AM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:declaration>
String company="";
String location="";
String year  ="";
String jobtitle  ="";
String desc = "";
</jsp:declaration>
<jsp:scriptlet>
             String name = (String) session.getAttribute("session_name");
                 String name1 = name.toUpperCase();
                  String email = (String) session.getAttribute("session_email");
                 String gender = (String) session.getAttribute("session_gender");
                 String field = (String) session.getAttribute("session_field");
                 String city = (String) session.getAttribute("session_city");
                 String about = (String) session.getAttribute("session_about");
                 String skill  = (String) session.getAttribute("session_skill");
                 
                 if(skill==null || skill.equals(""))
                 {
                     skill="";
                 }
                

                 if (about == null || about.equals("")) {
                     about = "";
                 }

                 if (name1 == null || name1.equals("")) {
                     response.sendRedirect("login.jsp");
                 }
                     
             String id =request.getParameter("edu");
             
             try
             {
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
                 PreparedStatement ps  = con.prepareStatement("select * from add_experience where id=?");
                 ps.setString(1, id);
                 
                 ResultSet rs  =ps.executeQuery();
                 
                 while(rs.next())
                 {
                     company=rs.getString("company");
                     location =rs.getString("location");
                     year =rs.getString("year");
                     jobtitle=rs.getString("job_title");
                     desc=rs.getString("description");
                 }
             }
             catch(Exception e)
             {
                 e.printStackTrace();
             }
             
             </jsp:scriptlet>
  
   
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" >
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" ></script>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        
        <script>
          function selectButton(v)
          {
              if(v==='update')
              {
                  document.expform.action="epe1";
                  document.expform.submit();
              }
              if(v==='delete')
              {
                   document.expform.action="dpe1";
                  document.expform.submit();
              }
                 
          }
        </script>
    </head>
    <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
         <jsp:include page="navbar.jsp"></jsp:include>
         
        
             <div class="row mt-3">
                 <div class="col-md-2"></div>
                 <div class="col-md-8">
                     <div class="row " style="border: 1px solid black">
                     <div class="col-md-2">
                       <img src="images/profilepic.png" style="height: 90px">
                     </div>
                          <div class="col-md8 mt-3" style="text-align: centre">
                              <h3 style="color: black">Experience Details</h3> <br><br>
                         <form name="expform"  method="post" >
                              <table>
                                  <tr>
                                      <td><input type="hidden" value="<jsp:expression>id</jsp:expression>" name="id2"></td>
                                  </tr>
                                  <tr>
                                      <td><span>Company:</span>  </td>
                                      <td><input type="text" name="company1" value="<jsp:expression>company</jsp:expression>"> <br><br></td>
                                  </tr>
                                  
                                   <tr>
                                      <td><span>Location:</span> </td>
                                      <td><input type="text" value="<jsp:expression>location</jsp:expression>" name="location1" ><br><br></td>
                                  </tr>
                                  
                                   <tr>
                                      <td><span>Year:</span> </td>
                                      <td><input type="text" value="<jsp:expression>year</jsp:expression>" name="year1"><br><br></td>
                                  </tr>
                                  
                                   <tr>
                                      <td> <span>Job Title:</span></td>
                                      <td><input type="text" value="<jsp:expression>jobtitle</jsp:expression>" name="jobtitle1"><br><br></td>
                                  </tr>
                                  
                                   <tr>
                                      <td> <span>description</span></td>
                                      <td><textarea name="desc1"><jsp:expression>desc</jsp:expression></textarea><br><br></td>
                                  </tr>
                                  
                                  <tr>
                                      <td></td>
                                      <td><input type="submit" value="update" class="btn btn-danger" onclick="selectButton('update')" > &nbsp <input type="submit" value="delete" class="btn btn-danger"  onclick="selectButton('delete')"><br><br></td>
                                  </tr>
                              </table>
                          </form>
                     </div>
              
                 <div class="col-md-2"></div>
                 </div>
                    
                     </div>

                
             </div>
                     
                 <div class="col-md-2"></div>
                 
             </div>
             
        
             
             
            
          <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

