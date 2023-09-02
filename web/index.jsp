<%-- 
    Document   : index
    Created on : May 19, 2021, 1:09:42 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    String email=(String) session.getAttribute("session_email");
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
            .divstyle ul li
            {
                list-style: none
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            
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
            
            <div class="row">
                <img src="images/banner.png" alt="image not load" style="width: 100; height: 200"/>
            </div>
            
             <!-- banner start -->
             
             
              <!-- search area start -->
             
            <div class="row  " >
                <div class="col-md-2 "></div>
                <div class="col-md-8 search_bar_design">
                    <h4>Best platform to search for job!</h4>
                    <form method="post" action="search-jobs-result.jsp">
                        <input type="text" placeholder="Technology.." class="textfield_design" name="technology1"/>
                    <input type="text" placeholder="Location..." class="textfield_design" name="location1"/>
                    <input type="submit" value="search" class="btn btn-primary"/>
                    </form>
                </div >
                <div class="col-md-2"></div>
                
            </div>
                 <!-- search area ends -->
                 
                 <div class="row">
                     <div class="col-md-3 divstyle">
                         <ul>
                             <li><a href="https://www.infosys.com/" ><img src="images/infosys.png" height="70"></a></li>
                             <li><a  href="https://www.amazon.com"><img src="images/amazon.png"height="70"></a></li>
                             <li><a  href="https://www.apple.com/in/"><img src="images/apple.jpg"height="70"></a></li>
                             <li><a  href="https://www.facebook.com"><img src="images/facebook.png"height="70"></a></li>
                             <li><a href="https://www.google.com"><img src="images/google.png"height="70"></a></li>
                             <li><a  href="https://www.ibm.com/in-en"><img src="images/ibm.png"height="70"></a></li>
                             <li><a  href="https://www.goindigo.in/"><img src="images/indigo.png"height="70"></a></li>
                             <li><a  href="https://www.intuit.com/"><img src="images/intruit.png"height="70"></a></li>
                             <li><a  href="https://www.microsoft.com/en-in"><img src="images/microsoft.png"height="70"></a></li>
                             <li><a  href="https://www.netflix.com/in/"><img src="images/netflix.png"height="70"></a></li>
                         </ul>
                     </div>
                     <div class="col-md-6" style="background-image: linear-gradient(-20deg, #e9defa 0%, #fbfcdb 100%); margin-top: 10px;">
                           <div class="row m-2">
                               
                           <jsp:scriptlet>
                           
                           String id ,jobprofile="",company="",experience="",desc="",date2="",time2="" ,salary1,openings,jocation,venue,c_email,c_person_name
                              ,c_person_profile,c_phoneno;
                           try
                           {
                               
                                 Class.forName("com.mysql.jdbc.Driver");
                                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
                                  PreparedStatement ps = con.prepareStatement("select * from jobs ");
                                  ResultSet rs = ps.executeQuery();
                                  while(rs.next())
                                  {
                                      id=rs.getString("id");
                                      jobprofile=rs.getString("job_profile");
                                      company=rs.getString("company");
                                      experience=rs.getString("experience");
                                      desc=rs.getString("description");
                                      date2=rs.getString("date1");
                                      time2=rs.getString("time1");
                                      
                                      </jsp:scriptlet>
                             
                               <div class="col-md-12 display_job_div">
                                   <b><jsp:expression>jobprofile.toUpperCase()</jsp:expression><span style="font-size: 10px ; float: right">(<jsp:expression>date2 </jsp:expression> & <jsp:expression>time2</jsp:expression>)</span> </b> <br> <br>
                               <span style="color:#d0cfcf ">Comapny:</span>   <span><jsp:expression>company</jsp:expression></span> <br> <br>
                                <span style="color:#d0cfcf ">experience:</span>   <span><jsp:expression>experience</jsp:expression></span> <br> <br>
                                <span style="color:#d0cfcf ">Description:</span>   <span><jsp:expression>desc</jsp:expression></span> <br> <br>
                                <a href="job-full-details.jsp?jobid=<jsp:expression>id</jsp:expression>"> see more details</a>
                                    
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
                       <div class="col-md-3 divstyle">
                             <ul>
                             <li><a href="https://www.infosys.com/" ><img src="images/infosys.png" height="70"></a></li>
                             <li><a  href="https://www.amazon.com"><img src="images/amazon.png"height="70"></a></li>
                             <li><a  href="https://www.apple.com/in/"><img src="images/apple.jpg"height="70"></a></li>
                             <li><a  href="https://www.facebook.com"><img src="images/facebook.png"height="70"></a></li>
                             <li><a href="https://www.google.com"><img src="images/google.png"height="70"></a></li>
                             <li><a  href="https://www.ibm.com/in-en"><img src="images/ibm.png"height="70"></a></li>
                             <li><a  href="https://www.goindigo.in/"><img src="images/indigo.png"height="70"></a></li>
                             <li><a  href="https://www.intuit.com/"><img src="images/intruit.png"height="70"></a></li>
                             <li><a  href="https://www.microsoft.com/en-in"><img src="images/microsoft.png"height="70"></a></li>
                             <li><a  href="https://www.netflix.com/in/"><img src="images/netflix.png"height="70"></a></li>
                         </ul>
                     </div>
                     
                 </div>
            
            <!-- footer part starts here -->
            
            <jsp:include page="footer.jsp"></jsp:include>
            
            <!-- footer part ends here -->
            
        </div>
    </body>
</html>
