<%-- 
    Document   : add-profile-experience
    Created on : May 24, 2021, 11:19:04 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
             String name = (String) session.getAttribute("session_name");
                 String name1 = name.toUpperCase();
                 String email  =(String) session.getAttribute("session_email");
                 if (name1 == null || name1.equals("")) {
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
         
        
             <div class="row mt-3">
                 <div class="col-md-2"></div>
                 <div class="col-md-8">
                     <div class="row " style="border: 1px solid black">
                     <div class="col-md-2">
                         <img src="images/profilepic.png" style="height: 90px">
                     </div>
                          <div class="col-md8 mt-3" style="text-align: centre">
                              <h3>Experience Details</h3>
                              <span style="color: blue"><jsp:expression>email</jsp:expression></span> <br><br>
                          <form method="post" action="ape1">
                              <table>
                                  <tr>
                                      <td><span>Company:</span>  </td>
                                      <td><input type="text" value=" " name="company1"> <br><br></td>
                                  </tr>
                                  
                                   <tr>
                                      <td><span>Location:</span> </td>
                                      <td><input type="text" value="" name="location1"><br><br></td>
                                  </tr>
                                  
                                   <tr>
                                      <td><span>Year:</span> </td>
                                      <td><input type="text" value="" name="year1"><br><br></td>
                                  </tr>
                                  
                                   <tr>
                                      <td> <span>Job Title:</span></td>
                                      <td><input type="text" value="" name="jobtitle1"><br><br></td>
                                  </tr>
                                  
                                   <tr>
                                      <td> <span>Description:</span></td>
                                      <td><textarea name="desc1"></textarea><br><br></td>
                                  </tr>
                                  
                                  <tr>
                                      <td></td>
                                      <td><input type="submit" value="add" class="btn btn-danger" ><br><br></td>
                                  </tr>
                              </table>
                          </form>
               
                           
                           
                     </div>
              
                 <div class="col-md-2"></div>
                 </div>
                    
                     </div>

                
             </div>
                     
                 <div class="col-md-2"></div>
                 
             </div>
             
        
             
             
            
          <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

