<%-- 
    Document   : profile
    Created on : May 20, 2021, 8:02:07 PM
    Author     : dell
--%>


<%@page import="backend.ProfilePath"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <jsp:scriptlet>
             String name1 = (String) session.getAttribute("session_name");
                 String gender = (String) session.getAttribute("session_gender");
                 String field = (String) session.getAttribute("session_field");
                 String city = (String) session.getAttribute("session_city");
                 String about = (String) session.getAttribute("session_about");
                 String skill = (String) session.getAttribute("session_skill");
                 String profile_pic = (String) session.getAttribute("session_profilepic");

                 if (name1 == null || name1.equals("")) {
                     response.sendRedirect("login.jsp");
                 }
                 
                 if(field==null || field.equals(""))
                 {
                     field="";
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
          <style>
           body
           
  {
    background-image: url('images/prof.jpg');
    background-repeat: no-repeat;
    background-size:100% auto ;
    background-size: cover;
    height: 100%;
    
}

        </style>
    </head>
    <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
         <jsp:include page="navbar.jsp"></jsp:include>
         
         <div class="container-fluid imgBackground">
         <div class="row" >
                 <div class="col-md-2"></div>
                 <div class="col-md-8">
                      <div class="row" style="border: 1px solid black; margin-top: 10px ; box-shadow: 1px 1px 1px 1px floralwhite">
                     <div class="col-md-2 mt-3">
                         <a href="edit-profile-pic.jsp" style="font-size: 15px ; float: right ;margin: 5px " >
                                  <span class="glyphicon glyphicon-pencil"  ></span> </a>
                         <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="50" style="border-radius: 50px">
                     </div>
                          <div class="col-md-8" style="text-align: centre ; ">
                              <h3 style="color: darkslateblue" > <jsp:expression> name1</jsp:expression>&nbsp <a href="edit-profile-about.jsp" style="font-size: 15px ; float: right " >
                                  <span class="glyphicon glyphicon-pencil"  ></span> </a> </h3>
                          
                          <jsp:expression>about</jsp:expression><br><br>
                          <span>skill:</span> <jsp:expression>skill</jsp:expression>  <br><br> 
                          <span style="color: buttonshadow;">Gender :</span> <jsp:expression> gender</jsp:expression> <br>
                  <span style="color: buttonshadow;">Field :</span>   <jsp:expression> field</jsp:expression> <br>
                     <span style="color: buttonshadow;">City:</span> &nbsp &nbsp<jsp:expression> city</jsp:expression> <br>
                       

                         
                      </div>
                 </div>
             </div>
       
                 <div class="col-md-2"></div>
                 </div>
                     
                     <div class="row">
                         <div class="col-md-2"></div>
                         <div class="col-md-8">
                             <div class="row" style="border: 1px solid black; margin-top: 10px ; box-shadow: 1px 1px 1px 1px floralwhite">
                                 <div class="col-md-12">
                                     <h3 style="color: #719ECE">Education   <a href="add-profile-education.jsp" style="font-size: 15px ; float: right " >
                                             <span class="glyphicon glyphicon-plus"  ></span> </a></h3> 
                                              <jsp:scriptlet>
                                             String school="";
                                             String degree = "";
                                             String year = "";
                                             String id="";
                                             
                                             String email = (String)session.getAttribute("session_email");
                                             
                                             try
                                             {
                                                   Class.forName("com.mysql.jdbc.Driver");
                                                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
                                                   PreparedStatement ps = con.prepareStatement("select * from add_education where email=?");
                                                   ps.setString(1, email);
                                                   ResultSet rs  =ps.executeQuery();
                                                   
                                                   while(rs.next())
                                                   {
                                                       id=rs.getString("id");
                                                       school  =rs.getString("school");
                                                       degree  =rs.getString("degree");
                                                       year  =rs.getString("year");
                                                       
                                                       </jsp:scriptlet> <br>
                                     
                                     <div class="row" style="background-color: #eee" >

                                         <div class="col-md-2 mt-3">
                                             <img src="images/school.png"height="50" style="border-radius: 25px">
                                         </div>
                                         <div class="col-md-10 mt-3" >
                                             <!-- ? belongs to url rewritting concept  -->
                                             <a href="edit-profile-education.jsp?id=<jsp:expression>id</jsp:expression>" style="font-size: 15px ; float: right " >
                                                 <span class="glyphicon glyphicon-pencil"  ></span> </a>
                                         <jsp:expression>school</jsp:expression> <br>
                                         <jsp:expression>degree</jsp:expression><br>
                                         <jsp:expression>year</jsp:expression><br>
                                     </div>

                                 </div>
                                             <jsp:scriptlet>
                                                    
                                                 }
                                                 }
                                                 catch(Exception e)
                                                 {
                                                 e.printStackTrace();
                                                 }
                                         
                                             </jsp:scriptlet> 
                                 </div>

                             </div>

                         </div>
                         <div class="col-md-2"></div>

                     </div>
                                     
                                     
                                     
                                     
                                     
                                     <div class="row">
                         <div class="col-md-2"></div>
                         <div class="col-md-8">
                             <div class="row" style="border: 1px solid black; margin-top: 10px ; box-shadow: 1px 1px 1px 1px floralwhite">
                                 <div class="col-md-12">
                                     <h3 style="color: #719ECE">Experience  <a href="add-profile-experience.jsp" style="font-size: 15px ; float: right " >
                                             <span class="glyphicon glyphicon-plus"  ></span> </a></h3> 
                                              <jsp:scriptlet>
                                             String company="";
                                             String location = "";
                                             String year1 = "";
                                             String jobtitle="";
                                             String desc1="";
                                             String id1="";
                                             
//                                             String email1 = (String)session.getAttribute("session_email");
                                             
                                             try
                                             {
                                                   Class.forName("com.mysql.jdbc.Driver");
                                                   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
                                                   PreparedStatement ps = con.prepareStatement("select * from add_experience where email=?");
                                                   ps.setString(1, email);
                                                   ResultSet rs  =ps.executeQuery();
                                                   
                                                   while(rs.next())
                                                   {
                                                       id1=rs.getString("id");
                                                       company =rs.getString("company");
                                                       location  =rs.getString("location");
                                                       year1  =rs.getString("year");
                                                       jobtitle  =rs.getString("job_title");
                                                       desc1 =rs.getString("description");
                                                       
                                                       </jsp:scriptlet> <br>
                                     
                                     <div class="row" style="background-color: #eee" >

                                         <div class="col-md-2 mt-3">
                                             <img src="images/experience.png" height="50" style="border-radius: 25px">
                                         </div>
                                         <div class="col-md-10 mt-3" >
                                             <!-- ? belongs to url rewritting concept  -->
                                             <a href="edit-profile-experience.jsp?edu=<jsp:expression>id1</jsp:expression>" style="font-size: 15px ; float: right " >
                                                 <span class="glyphicon glyphicon-pencil"  ></span> </a>
                                         <jsp:expression>company</jsp:expression> <br>
                                         <jsp:expression>jobtitle</jsp:expression><br>
                                         <jsp:expression>year1</jsp:expression><br>
                                     </div>

                                 </div>
                                             <jsp:scriptlet>
                                                    
                                                 }
                                                 }
                                                 catch(Exception e)
                                                 {
                                                 e.printStackTrace();
                                                 }
                                         
                                             </jsp:scriptlet> 
                                 </div>

                             </div>

                         </div>
                         <div class="col-md-2"></div>

                     </div>
                                     
                                     
                                      <div class="row">
                         <div class="col-md-2"></div>
                         <div class="col-md-8">
                             <div class="row" style="border: 1px solid black; margin-top: 10px ; box-shadow: 1px 1px 1px 1px floralwhite">
                                 <div class="col-md-12">
                                     <h3 style="color: #719ECE">Resume  <a href="add-profile-education.jsp" style="font-size: 15px ; float: right " >
                                             <span class="glyphicon glyphicon-plus"  ></span> </a></h3> 
                                             
                                     <div class="row" style="background-color: #eee">

                                         <div class="col-md-12">
                                             <a href="edit-resume.jsp">upload resume</a> 
                                             
                                             <!--<a href="" class="btn btn-success">Download</a>-->
                                         <jsp:scriptlet>
                                         String file_name="";
                                         try
                                         {
                                             Class.forName("com.mysql.jdbc.Driver");
                                              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
                                              PreparedStatement ps  =con.prepareStatement("select * from resume where email=?");
                                              ps.setString(1,email);
                                              
                                              ResultSet rs  =ps.executeQuery();
                                              if(rs.next())
                                              {
                                                  file_name=rs.getString("path");
                                                  </jsp:scriptlet>
                                             
                                             <a href="DownloadFile?fn=<jsp:expression> file_name</jsp:expression>" class="btn btn-success">Download</a>
                                             
                                         <jsp:scriptlet>
                                              }
                                         } 
                                         catch(Exception e)
                                         {
                                             e.printStackTrace();
                                         }
                                         </jsp:scriptlet>
                                         </div>
                                         
                                        

                                     </div> <br> 


                                     <div class="row  mb-2"  style="background-color: #eee">

                                         <div class="col-md-12">
                                             <a href="resume-builder-details.jsp">resume builder</a> 
                                         <jsp:scriptlet>
                                         File f= new File(ProfilePath.profile_builder_path + name1 +".pdf");
                                         if(f.exists())
                                         {
                                              </jsp:scriptlet>
                                              <a href="DownloadResumeBuilder?fn=<jsp:expression> name1 + ".pdf" </jsp:expression>" class="btn btn-success">Download</a>
                                             
                                         <jsp:scriptlet>
                                         }
                                         </jsp:scriptlet>
                                             
                                             
                                            
                                             
                                     
                                         </div>


                                     </div>
                                
                                     
                                               
                                
                                           
                                 </div>

                             </div>
                             
                             

                         </div>
                         <div class="col-md-2"></div>

                     </div>
         </div>
          <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
