<%-- 
    Document   : simple-search
    Created on : May 31, 2021, 12:17:58 AM
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
        
        <script>
            function val(tech)
            {
               
                var obj;
                 // 1 step is to creste an object
                if(window.XMLHttpRequest())
                {
                   obj=new XMLHttpRequest();
        
                }
                else
                {
                    obj=new ActiveXObject("Microsoft.XMLHTTP");
                }
                // 2 step is to set the reuqest
                
                

                obj.open("POST","SearchByTechnology?technology="+tech ,true);
                
                //3 step is to send the request
                obj.send();
                
                obj.onreadystatechange = function()
                {
                  
                    if(obj.readyState === 4 && obj.status === 200)
                    {
                      
                      
                        document.getElementById('respgenerated').innerHTML= obj.responseText;
                        
                    }
                };
                
            }
            
            function val1(location)
            {
               
                var obj;
                 // 1 step is to creste an object
                if(window.XMLHttpRequest())
                {
                   obj=new XMLHttpRequest();
        
                }
                else
                {
                    obj=new ActiveXObject("Microsoft.XMLHTTP");
                }
                // 2 step is to set the reuqest
                
                

                obj.open("POST","SearchByLocation?location="+location ,true);
                
                //3 step is to send the request
                obj.send();
                
                obj.onreadystatechange = function()
                {
                  
                    if(obj.readyState === 4 && obj.status === 200)
                    {
                      
                      
                        document.getElementById('respgenerated').innerHTML= obj.responseText;
                        
                    }
                };
                
            }
        </script>
    </head>
       <style>
           body
           
  {
    background-image: url('images/');
    background-repeat: no-repeat;
    background-size:100% auto ;
    background-size: cover; 
    height: 100%;
    
}

        </style>
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
                    <h4>Best platform to search for job!</h4>
                  
                        <input type="text" placeholder="Technology.." class="textfield_design" onkeyup="val(this.value)"><br>
                        OR <br>
                        <input type="text" placeholder="Location..." class="textfield_design" onkeyup="val1(this.value)"/><br>


                    
            
                    
                </div >
                <div class="col-md-2"></div>
                
            </div>
                 <!-- search area ends -->
                 
                 <div class="row">
                     <div class="col-md-3">
                       
                     </div>
                     <div class="col-md-6" style="background-color: #f8f2f2; margin-top: 10px;">
                           <div class="row m-2">
                               
                               <div class="col-md-12" >
                                   <span id="respgenerated" ></span>
                                   
                               </div>
                           
                              
                           </div>
                         
                     </div>
                       <div class="col-md-3">
                      
                     </div>
                     
                 </div>
            
            <!-- footer part starts here -->
            
         
            
            <!-- footer part ends here -->
            
        </div>
    </body>
</html>

