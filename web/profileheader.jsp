<%-- 
    Document   : profileheader
    Created on : May 22, 2021, 4:54:49 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>

 String name1 = (String)session.getAttribute("session_name") ;
 String profile_pic  =(String) session.getAttribute("session_profilepic");
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <div class=" row row1_heading_bgdesign">
                <div class="col-md-5  ">
                    <a href="index.jsp">
                         <img src="images/website logo.jpg" height="50"/>
                    JOB PORTAL
                    
                    </a>
                </div>
                 <div class="col-md-5 ">
                   
                      <a href="profile.jsp"> <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" height="30" ><span style="color: black"> <jsp:expression>name1</jsp:expression></a></span>
                         
                </div>
       
       <div class="col-md-2">
           <a href="Logout" class="hyperlink_header_design">Logout</a>
           
       </div>
                
            </div>
                
                
                
    </body>
</html>

