<%-- 
    Document   : company
    Created on : Jun 1, 2021, 2:26:56 PM
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
            
                <div class="col-md-2"></div>
                
            </div>
                 <!-- search area ends -->
                 
                 <div class="row">
                     <div class="col-md-3">
                    
                     </div>
                     <div class="col-md-6" style=" margin-top: 10px;">
                           <div class="row m-2">
                               
                           <jsp:scriptlet>
                           
                           String c_id="",c_name="",c_email="",c_password="",c_logo="",c_phoneno="";
                           try
                           {
                               
                                 Class.forName("com.mysql.jdbc.Driver");
                                 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "root");
                                  PreparedStatement ps = con.prepareStatement("select * from company ");
                                  ResultSet rs = ps.executeQuery();
                                  while(rs.next())
                                  {
                                      c_id=rs.getString("id");
                                     c_name=rs.getString("c_name");
                                     c_email=rs.getString("c_email");
                                      c_password=rs.getString("c_password");
                                      c_logo=rs.getString("c_logo");
                                      c_phoneno=rs.getString("c_phoneno");
                                    
                                      
                                      </jsp:scriptlet>
                             
                               <div class="col-md-12 display_job_div">
                                   <div class="row">
                                       <div class="col-md-2 mt-3">
                                           <img src="images/school.png" height="40">
                                       </div>
                                       
                                       <div class="col-md-10">
                                           <b style="color: #a80000"><jsp:expression>c_name.toUpperCase()</jsp:expression><span style="font-size: 15px ; float: right">(<jsp:expression>c_email </jsp:expression> )</span> </b> <br> <br>
                                       <span style="color:white">Phone No:</span>   <span style="color: white"><jsp:expression>c_phoneno</jsp:expression></span> <br> <br>
                              
                                   <a href="company-jobs.jsp?comp_email=<jsp:expression>c_email</jsp:expression>"> see more details</a>
                                       </div>
                                           
                                       
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
                       <div class="col-md-3">
                        
                     </div>
                     
                 </div>
            
            <!-- footer part starts here -->
            
            <jsp:include page="footer.jsp"></jsp:include>
            
            <!-- footer part ends here -->
            
        </div>
    </body>
</html>

