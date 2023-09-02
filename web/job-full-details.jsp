<%-- 
    Document   : job-full-details
    Created on : May 30, 2021, 3:09:53 PM
    Author     : dell
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    String email=(String) session.getAttribute("session_email");
    String jid = request.getParameter("jobid");
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
    background-image: url('images/');
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
                               <jsp:scriptlet>
                           
                           String jobprofile="",company="",experience="",desc="",date2="",time2="" , salary1="",openings="",location="",venue="",c_email="",c_person_name=""
                              ,c_person_profile="",c_phoneno="";
                          try
                           {
                               
                                 Class.forName("com.mysql.jdbc.Driver");
                                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
                                  PreparedStatement ps = con.prepareStatement("select * from jobs where id=?");
                                  ps.setString(1, jid);
                                  ResultSet rs = ps.executeQuery();
                                  if(rs.next())
                                  {
                                      
                                      jobprofile=rs.getString("job_profile");
                                      company=rs.getString("company");
                                      experience=rs.getString("experience");
                                      desc=rs.getString("description");
                                      date2=rs.getString("date1");
                                      time2=rs.getString("time1");
                                      salary1=rs.getString("salary");
                                      openings=rs.getString("no_of_openings");
                                      location=rs.getString("job_location");
                                      venue=rs.getString("time_venue");
                                      c_email=rs.getString("c_email_id");
                                      c_person_name=rs.getString("c_person_name");
                                      c_person_profile=rs.getString("c_person_profile");
                                      c_phoneno=rs.getString("c_person_phoneno");
                                   
                                  }
          
          
                           }
                           catch(Exception e)
                           {
                                       e.printStackTrace();
                           }
                           </jsp:scriptlet>
                             
                               <div class="col-md-12 display_job_div">
                                   <table class="table">
                                       <tr>
                                           <td><b><jsp:expression>jobprofile.toUpperCase()</jsp:expression><span style="font-size: 10px ; float: right">(<jsp:expression>date2 </jsp:expression> & <jsp:expression>time2</jsp:expression>)</span> </b> </td>
                                       </tr>
                                       <tr>
                                           <td><span style="color:#086b7c ">Comapny:</span> </td>
                                           <td>Comapny:</span>   <span><jsp:expression>company</jsp:expression></span></td>
                                       </tr>
                                       <tr>
                                           <td> <span style="color:#086b7c">experience:</span></td>
                                           <td><span><jsp:expression>experience</jsp:expression></span></td>
                                       </tr>
                                        <tr>
                                           <td>   <span style="color:#086b7c ">Description:</span> </td>
                                           <td> <span><jsp:expression>desc</jsp:expression></span></td>
                                       </tr>
                                        <tr>
                                           <td> <span style="color:#086b7c">Salary:</span>   </td>
                                           <td> <span><jsp:expression>salary1</jsp:expression></span></td>
                                       </tr>
                                        <tr>
                                           <td> <span style="color:#086b7c ">Openings:</span>  </td>
                                           <td><span><jsp:expression>openings</jsp:expression></span></td>
                                       </tr>
                                        <tr>
                                           <td><span style="color:#086b7c ">Location:</span> </td>
                                           <td> <span><jsp:expression>location</jsp:expression></span> </td>
                                       </tr>
                                        <tr>
                                           <td> <span style="color:#086b7c ">Time and Venue:</span>  </td>
                                           <td><span><jsp:expression>venue</jsp:expression></span></td>
                                       </tr>
                                       <tr>
                                           
                                           <td> <b> <span>Company Details</span> </b></td>
                                       </tr>
                                        <tr>
                                           <td><span style="color:#086b7c ">Email:</span> </td>
                                           <td><span><jsp:expression> c_email</jsp:expression></span></td>
                                       </tr>
                                        <tr>
                                           <td>  <span style="color:#086b7c ">Name:</span>  </td>
                                           <td><span><jsp:expression>c_person_name</jsp:expression></span></td>
                                       </tr>
                                        <tr>
                                           <td> <span style="color:#086b7c">Profile:</span> </td>
                                           <td><span><jsp:expression> c_person_profile</jsp:expression></span></td>
                                       </tr>
                                        <tr>
                                           <td><span style="color:#086b7c" >PhoneNo:</span></td>
                                           <td> <span><jsp:expression> c_phoneno</jsp:expression></span></td>
                                       </tr>
                                        <jsp:scriptlet>
            if(email==null ? email==null : email.trim().equals("null"))
            {
                </jsp:scriptlet>
            <tr>
                                           <td></td>
                                           <td><a href="login.jsp" class="btn btn-primary">Login To Apply </a></td>
                                       </tr>
            <jsp:scriptlet>
            }
            else
            {
                </jsp:scriptlet>
                                       
                                   <jsp:scriptlet>
                                   try
                                   {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
                                       PreparedStatement ps  =con.prepareStatement("select * from applied_jobs where email=? and job_id=?");
                                            ps.setString(1, email);
                                            ps.setString(2, jid);
                                            ResultSet rs=ps.executeQuery();
                                            if(rs.next())
                                            {
                                                </jsp:scriptlet>
                                       
                                         <tr>
                                           <td></td>
                                           <td>
                                               
                                               <input type="submit" value="Already applied" class="btn btn-default" style="color: red">
                                               <form method="post" action="dmaf">
                                                   <input type="hidden" value="<jsp:expression>jid</jsp:expression>" name="jid">
                                                   <input type="submit" value="Delete My Application Form" class="btn btn-danger">
                                               </form>
                                           
                                       </td>
                                   </tr>
                                   <jsp:scriptlet>
                                                
                                     
                                                
                                            }
                                            else
                                            {
                                                </jsp:scriptlet>
                                   
                                     <tr>
                                           <td></td>
                                           <td>
                                               <form method="post" action="applyjob">
                                                   <input type="hidden" value="<jsp:expression>jid</jsp:expression>" name="jid"/>
                                               <input type="submit" value="apply" class="btn btn-primary">
                                           </form>
                                       </td>
                                   </tr>
                                   <jsp:scriptlet>
                                            }
                                   }
                                   catch(Exception e)
                                   {
                                       e.printStackTrace();
                                   }
                                   </jsp:scriptlet>
                                    
            
            <jsp:scriptlet>
            }
          
            </jsp:scriptlet>
                                       
                                   
                           
                                    
                     
</table>
</div>
                               
                               
                          

                                       
                           
                              
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
