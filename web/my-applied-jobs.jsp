<%-- 
    Document   : my-applied-jobs
    Created on : May 30, 2021, 10:29:11 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:declaration>
 String email;
</jsp:declaration>
<jsp:scriptlet>
     email=(String) session.getAttribute("session_email");
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
            <style>
                 .imgBackground {
    background-image: url('images/com.jpg');
    background-repeat: no-repeat;
    background-size:100% auto ;
    background-size: cover;
    height: 100%;



}
        </style>
    </head>
    <body>
        <div class="container-fluid imgBackground">
            
            <jsp:scriptlet>
            if(email==null ? email==null : email.trim().equals("null"))
            {
                </jsp:scriptlet>
            <jsp:include page="header.jsp"></jsp:include>
            <jsp:scriptlet>
            }
            else
            {
                </jsp:scriptlet>
             <jsp:include page="profileheader.jsp"></jsp:include>
            
            <jsp:scriptlet>
            }
          
            </jsp:scriptlet>
       
         
            <jsp:include page="navbar.jsp"></jsp:include>
            
            <!-- banner start -->
            
         
             <!-- banner start -->
             
             
              <!-- search area start -->
             
            <div class="row  " >
                <div class="col-md-2 "></div>
                <div class="col-md-8 search_bar_design">
                    
                    
                </div >
                <div class="col-md-2"></div>
                
            </div>
                 <!-- search area ends -->
                 
                 <div class="row">
                     <div class="col-md-3">
                   
                     </div>
                    
                     <div class="col-md-6" style=" margin-top: 10px;">
                           <div class="row m-2">
                               
                               <h5 style="color: red">MY Applied Jobs!</h5>
                               
                           <jsp:scriptlet>
                           
                           String id="" ,jobprofile="",company="",experience="",desc="",date2="",time2="" ,salary1,openings,jocation,venue,c_email,c_person_name
                              ,c_person_profile,c_phoneno;
                           try
                           {
                               
                                 Class.forName("com.mysql.jdbc.Driver");
                                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
                                  PreparedStatement ps1 = con.prepareStatement("select * from applied_jobs where email=? ");
                                  ps1.setString(1, email);
                                  ResultSet rs1 = ps1.executeQuery();
                                  while(rs1.next())
                                  {
                                     
                                      id=rs1.getString("job_id");
                                      
                                      PreparedStatement ps2  =con.prepareStatement("select * from jobs where id=?");
                                      ps2.setString(1, id);
                                      ResultSet rs2  =ps2.executeQuery();
                                      
                                      while(rs2.next())
                                      {
                                          
                                          jobprofile = rs2.getString("job_profile");
                                              company = rs2.getString("company");
                                              experience = rs2.getString("experience");
                                              desc = rs2.getString("description");
                                              date2 = rs2.getString("date1");
                                              time2 = rs2.getString("time1");
                                              
                                               </jsp:scriptlet>
                               <div class="col-md-12 display_job_div">
                                   <b><jsp:expression>jobprofile.toUpperCase()</jsp:expression><span style="font-size: 10px ; float: right">(<jsp:expression>date2</jsp:expression> & <jsp:expression>time2</jsp:expression>)</span> </b> <br> <br>
                               <span style="color:#d0cfcf ">Comapny:</span>   <span style="color: #e90837"><jsp:expression>company</jsp:expression></span> <br> <br>
                               <span style="color:#d0cfcf ">experience:</span>   <span style="color: #e90837"><jsp:expression>experience</jsp:expression></span> <br> <br>
                               <span style="color:#d0cfcf ">Description:</span>   <span style="color: #e90837"><jsp:expression>desc</jsp:expression></span> <br> <br>
                               <a href="job-full-details.jsp?jobid=<jsp:expression>id</jsp:expression>"> see more details</a>

                           </div> 
                               
                           <jsp:scriptlet>
                                      }
                                  }
                           }
                           catch(Exception e)
                           {
                               out.print(e);
                           }
                           </jsp:scriptlet>
                           
                              
                           </div>
                         
                     </div>
                       <div class="col-md-3">
                     
                     </div>
                     
                 </div>
            
            <!-- footer part starts here -->
            
            <jsp:include page="footer.jsp"></jsp:include>
            
            <!-- footer part ends here -->
            
        </div>
    </body>
</html>

