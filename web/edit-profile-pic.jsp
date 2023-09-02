<%-- 
    Document   : EditProfilePic
    Created on : May 26, 2021, 4:32:14 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <jsp:scriptlet>
             String name = (String) session.getAttribute("session_name");
                 String name1 = name.toUpperCase();
                  String email = (String) session.getAttribute("session_email");
                  String profile_pic = (String) session.getAttribute("session_profilepic");
                
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
                     <div class="col-md-3">
                         <img src="profilepics/<jsp:expression>profile_pic</jsp:expression>" style="height: 80px">
                     </div>
                          <div class="col-md-9 mt-3" style="text-align: centre">
                          
                              <h3 style="color: black">Edit Profile Pic</h3> <br>
                              <form method="post" action="epp" enctype="multipart/form-data">
                              <b> <jsp:expression>name1</jsp:expression></b> (<jsp:expression>email</jsp:expression>)<br> <br>
                          
                              <input type="file" name="uploadprofilepic" class="btn "> <br> <br>
                              <input type="submit" value="upload pic" class="btn btn-primary"> <br> <br>
                              </form>
                          
                           
                     </div>
              
                 <div class="col-md-1"></div>
                 </div>
                    
                     </div>

                
             </div>
                     
                 <div class="col-md-2"></div>
                 
             </div>
             
        
             
             
            
          <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>

