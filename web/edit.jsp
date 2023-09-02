<%-- 
    Document   : edit
    Created on : May 22, 2021, 8:09:13 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <jsp:scriptlet>
             String name = (String)session.getAttribute("session_name");  
             String name1 = name.toUpperCase();
             </jsp:scriptlet>
  
    <jsp:scriptlet>
             String gender = (String)session.getAttribute("session_gender");  
             
             </jsp:scriptlet>
  
    <jsp:scriptlet>
             String field = (String)session.getAttribute("session_field");  
             
             </jsp:scriptlet>
  
    <jsp:scriptlet>
             String city = (String)session.getAttribute("session_city");  
            
             </jsp:scriptlet>
  
   <jsp:scriptlet>
            if(name1==null || name1.equals(""))
{
    response.sendRedirect("login.jsp");
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
    </head>
    <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
         <jsp:include page="navbar.jsp"></jsp:include>
         
        
             <div class="row">
                 <div class="col-md-2"></div>
                 <div class="col-md-8">
                      <div class="row">
                     <div class="col-md-2">
                         <img src="images/image6.png">
                     </div>
                          <div class="col-md8" style="text-align: centre">
                           <jsp:expression> name1</jsp:expression> <br> <br>
                           
                           <table>
                               <tr>
                                   <td> <span >Gender :</span></td>
                                   <td><input type="text" value="<jsp:expression>gender</jsp:expression>"><br><br></td>
                               </tr>
                               
                               <tr>
                                   <td><span>Field :</span>  </td>
                                   <td><input type="text" value="<jsp:expression> field</jsp:expression>"><br><br></td>
                               </tr>
                               
                               <tr>
                                   <td> <span >City:</span></td>
                                   <td> <input type="text" value="<jsp:expression> city</jsp:expression>"><br><br></td>
                               </tr>
                               
                               <tr>
                                   <td></td>
                                   <td><input type="submit" value="update" class="btn btn-danger" ></td>
                               </tr>
                           </table>
                           
                     </div>
              
                 <div class="col-md-2"></div>
                 </div>
                     <div class="row mt-3">
                         <div class="col-md-2"></div>
                         <div class="col-md-8 " >
                             <h5>Education Details</h5>
                             <table>
                                 <tr>
                                     <td><span> School Name: </span></td>
                                     <td><input type="text" value=""> <br><br></td> 
                                 </tr> 
                                 
                                 <tr>
                                     <td><span> High School percent:</span></td>
                                     <td><input type="text" value=""> <br><br> </td>
                                 </tr> 
                                 
                                 <tr>
                                     <td> <span> College Name: </span></td>
                                     <td><input type="text" value=""><br><br></td>
                                 </tr>
                                 
                                 <tr>
                                     <td><span>Cgpa:</span></td>
                                     <td><input type="text" value=""> <br><br></td>
                                 </tr>
                                 
                                 <tr>
                                     <td> <span> Experience: </span></td>
                                     <td><input type="text" value=""> <br><br></td>
                                 </tr>
                                 
                                 <tr>
                                   <td></td>
                                   <td><input type="submit" value="update" class="btn btn-danger" ></td>
                               </tr>
                             </table>
                            
                         </div>
                         <div class="col-md-2">
                             
                         </div>
                         
                     </div>

                
             </div>
                     
                 <div class="col-md-2"></div>
                 
             </div>
             
        
             
             
            
          <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

