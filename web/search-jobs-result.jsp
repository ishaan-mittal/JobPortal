<%-- 
    Document   : search-jobs-result
    Created on : May 31, 2021, 3:38:44 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    String email=(String) session.getAttribute("session_email");
    
    String tech = request.getParameter("technology1");
    String locat  =request.getParameter("location1");
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
                     <div class="col-md-3">
                         <ul>
                             <li><a href="">Infosys</a></li>
                             <li><a  href="">Ibm</a></li>
                             <li><a  href="">Intruit</a></li>
                             <li><a  href="">Indigo</a></li>
                             <li><a href="">Google</a></li>
                             <li><a  href="">Amazon</a></li>
                             <li><a  href="">Netflix</a></li>
                             <li><a  href="">Facebook</a></li>
                             <li><a  href="">Apple</a></li>
                             <li><a  href="">Microsoft</a></li>
                         </ul>
                     </div>
                     <div class="col-md-6" style="background-color: #ececec; margin-top: 10px;">
                           <div class="row m-2">
                               
                           <jsp:scriptlet>
                           
                           String id ,jobprofile="",company="",experience="",desc="",date2="",time2="" ,salary1,openings,jocation,venue,c_email,c_person_name
                              ,c_person_profile,c_phoneno;
                           try
                           {
                               
                                 Class.forName("com.mysql.jdbc.Driver");
                                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
                                  PreparedStatement ps = con.prepareStatement("select * from jobs where job_profile LIKE '%"+tech+"%' and job_location Like '%"+locat+"%' ");
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
                       <div class="col-md-3">
                          <ul>
                             <li><a>Infosys</a></li>
                             <li><a>Ibm</a></li>
                             <li><a>Intruit</a></li>
                             <li><a>Indigo</a></li>
                             <li><a>Google</a></li>
                             <li><a>Amazon</a></li>
                             <li><a>Netflix</a></li>
                             <li><a>Facebook</a></li>
                             <li><a>Apple</a></li>
                             <li><a>Microsoft</a></li>
                         </ul>
                     </div>
                     
                 </div>
            
            <!-- footer part starts here -->
            
            <jsp:include page="footer.jsp"></jsp:include>
            
            <!-- footer part ends here -->
            
        </div>
    </body>
</html>
