<%-- 
    Document   : navbar
    Created on : May 19, 2021, 2:43:27 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:scriptlet>
    String email=(String) session.getAttribute("session_email");
</jsp:scriptlet>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <div class="row row2_navbar_design">
                <div class="col-md-7" id="mynavbar">
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="search-by-technology.jsp">Search</a></li>
                        <li><a href="company.jsp">Companies</a></li>
                         <jsp:scriptlet>
                        if(email==null ? email==null : email.trim().equals("null"))
                        {
                            </jsp:scriptlet>
                        
                        <jsp:scriptlet>
                        }
                        else
                        {
                            </jsp:scriptlet>
                        <li><a href="my-applied-jobs.jsp">My Applied Jobs</a></li>
                        <jsp:scriptlet>
                        }
                        </jsp:scriptlet>
                    </ul>
                    
                </div>
                <div class="col-md-5" id="mynavbar">
                    <ul>
                         <li><a href="">About Us</a></li>
                         <li><a href="contact-us.jsp">Contact Us</a></li>
                        
                    </ul>
                </div>
                
            </div>
    </body>
</html>
