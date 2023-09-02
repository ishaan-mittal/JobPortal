<%-- 
    Document   : resume-builder-details
    Created on : May 28, 2021, 1:35:10 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
             String name = (String) session.getAttribute("session_name");
                 String name1 = name.toUpperCase();
                 String email  =(String) session.getAttribute("session_email");
                 String profile_pic=(String)session.getAttribute("session_profilepic");
                 if (name1 == null || name1.equals("")) {
                     response.sendRedirect("login.jsp");
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
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
         <jsp:include page="navbar.jsp"></jsp:include>
         
        
             <div class="row mt-3">
                 <div class="col-md-2"></div>
                 <div class="col-md-8">
                     <div class="row " style="border: 1px solid black">
                     <div class="col-md-2 mt-3">
                        <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" style="height: 50px">
                     </div>
                          <div class="col-md-10 mt-3 mb-2" style="text-align: centre">
                              <h3>Resume Builder</h3> <br>
                              <form method="post" action="resumebuilder">
                                  <input type="text" value="<jsp:expression>name1</jsp:expression>" class="textfield_design" name="name2" readonly=""/><a href="edit-profile-about.jsp" style="font-size: 15px ; " >
                                  <span class="glyphicon glyphicon-pencil"  ></span> </a><br><br>
                              <input type="text" value="<jsp:expression>email</jsp:expression>" class="textfield_design" email="email1"/><br><br>
                              <textarea name="address1" placeholder="Address"></textarea>
                              <textarea placeholder="Career Objective" name="career1"></textarea> <br> <br>
                              <h5>Education Details  <a href="add-profile-education.jsp" style="font-size: 15px ;float: right; " >
                                  <span class="glyphicon glyphicon-plus"  ></span> </a></h5> 
                              <table class="table table-borderless table-light">
                                  <thead>
                                      <tr>
                                          <th scope="col">School</th>
                                          <th scope="col">Degree</th>
                                          <th scope="col">Year</th>
                                          <th scope="col">Grade</th>
                                          <th></th>
                                      </tr>
                                  </thead>
                                
                                   <jsp:scriptlet>
                              String school="" ,degree="" , year="",grade="" ,id="";
                              try
                              {
                                    Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
                                        PreparedStatement ps = con.prepareStatement("select * from add_education where email=? ");
                                        ps.setString(1, email);
                                        
                                        ResultSet rs  =ps.executeQuery();
                                        
                                
                                         
                                        while(rs.next())
                                        {
                                            id=rs.getString("id");
                                            school = rs.getString("school");
                                                degree = rs.getString("degree");
                                                year = rs.getString("year");
                                                grade = rs.getString("grade");
                                               
                                 
                                         </jsp:scriptlet>
                                   <tbody>
                                       <tr>
                                           <td><jsp:expression>school</jsp:expression></td>
                                           <td><jsp:expression>degree</jsp:expression></td>
                                           <td><jsp:expression>year</jsp:expression></td>
                                           <td><jsp:expression>grade</jsp:expression></td>
                                           <td><a href="edit-profile-education.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 15px ; " >
                                  <span class="glyphicon glyphicon-pencil"  ></span> </a></td>
                                       </tr>
                              <jsp:scriptlet>
                                               
                                      
                                        }
                                  
                              }
                              catch(Exception e)
                              {
                                  e.printStackTrace();
                              }
                              
                              </jsp:scriptlet> 
                              </tbody>
                              </table>
                              
                             
                              <h5>Experience Details   <a href="add-profile-experience.jsp" style="font-size: 15px ; float: right " >
                                  <span class="glyphicon glyphicon-plus"  ></span> </a></h5> 
                            
                               <table class="table table-borderless table-light">
                                  <thead>
                                      <tr>
                                          <th scope="col">Company</th>
                                          <th scope="col">Location</th>
                                          <th scope="col">Year</th>
                                          <th scope="col">Job Title</th>
                                          <th></th>
                                      </tr>
                                  </thead>
                              
                              
                              <jsp:scriptlet>
                              String company="" ,location="" , year1="",jobtitle="" , edu="";
                              try
                              {
                                    Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
                                        PreparedStatement ps = con.prepareStatement("select * from add_experience where email=? ");
                                        ps.setString(1, email);
                                        
                                        ResultSet rs  =ps.executeQuery();
                                        
                                
                                         
                                        while(rs.next())
                                        {
                                            edu=rs.getString("id");
                                            company = rs.getString("company");
                                              location= rs.getString("location");
                                                year1 = rs.getString("year");
                                                jobtitle= rs.getString("job_title");
                                               
                                 
                                         </jsp:scriptlet>
                                  
                                  <tbody>
                                       <tr>
                                           <td><jsp:expression>company</jsp:expression></td>
                                           <td><jsp:expression>location</jsp:expression></td>
                                           <td><jsp:expression>year1</jsp:expression></td>
                                           <td><jsp:expression>jobtitle</jsp:expression></td>
                                           <td><a href="edit-profile-experience.jsp?edu=<jsp:expression>edu</jsp:expression>" style="font-size: 15px ; " >
                                  <span class="glyphicon glyphicon-pencil"  ></span> </a></td>
                                       </tr>
                                    
                              
                       
<!--                              <input type="text" value="<jsp:expression>company</jsp:expression>"  />
                              <input type="text" value="<jsp:expression>location</jsp:expression>"/>
                              <input type="text" value="<jsp:expression>year1</jsp:expression>" style="width: 100px"/>
                              <input type="text" value="<jsp:expression>jobtitle</jsp:expression>"style="width: 100px" />
                              <br><br>-->
                              
                              <jsp:scriptlet>
                                               
                                      
                                        }
                                  
                              }
                              catch(Exception e)
                              {
                                  e.printStackTrace();
                              }
                              
                              </jsp:scriptlet>
                               </tbody>
                               </table>
                              
                             
                              
                              <h5>Personal Details</h5><br>
                              <input type="date" value="" class="textfield_design" name="date1"/> <br> <br>
                              <input type="text" placeholder="Gender/Marital status" value="" class="textfield_design" name="marital1"/><br>   <br>                          
                              <input type="text"  placeholder="Language Proficiency" value="" class="textfield_design" name="language1"/><br><br>
                               <textarea placeholder="Hobbies" name="hobbies1"></textarea><br>
                              <input type="submit" value="Build Resume" class="btn btn-success"> <br>
                    
                          </form>
                     </div>
              

                 </div>
                    
                     </div>

                
           
                     
                 <div class="col-md-2"></div>
                 
             </div>
             
        
             
             
            
          <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

