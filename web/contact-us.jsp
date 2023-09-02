<%-- 
    Document   : contact-us
    Created on : Jun 1, 2021, 3:44:30 PM
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
    background-image: url('images/back.jpg');
    background-repeat: no-repeat;
    background-size:100% auto ;
    background-size: cover;
    height: 100%;



}
        </style>
    </head>
    <body>
     

              
        <div class="container-fluid imgBackground " >
           
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
             
              <div class="row  "  >
                <div class="col-md-2 "></div>
                <div class="col-md-8 search_bar_design">
                  
                </div >
                <div class="col-md-2"></div>
                
            </div>
                 <!-- search area ends -->
                 
                 <div class="row">
                               
                     <div class="col-md-2">
                         <ul>
                           
                         </ul>
                     </div>
                     <div class="col-md-8" style=" margin-top: 10px;">
                          
                      
                     <jsp:scriptlet>
                     if(email==null ? email==null :email.trim().equals("null"))
                     {
                          </jsp:scriptlet>
                     <jsp:include page="contact-us-no-user.jsp"></jsp:include>
                     <jsp:scriptlet>
                     }
                     else
                     {
                          </jsp:scriptlet>
                         <jsp:include page="contact-us-user.jsp"></jsp:include>
                          <jsp:scriptlet>
                     }
                     </jsp:scriptlet>
                              
                           <iframe src="https://www.google.com/maps/d/embed?mid=1GC-26pGg4Z58eto8mukpi6dyUj4&hl=en" width="640" height="380"></iframe>
                         
                     </div>
                       <div class="col-md-2">
                        
                     </div>

                 </div>
                          
                       
            
            <!-- footer part starts here -->
            
            <jsp:include page="footer.jsp"></jsp:include>
            
            <!-- footer part ends here -->
            
        </div>
    </body>
</html>
