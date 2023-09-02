<%-- 
    Document   : logindiv
    Created on : May 21, 2021, 6:08:34 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="row">
             <div class="col-md-2">
                 
             </div>
             <div class="col-md-8 register_design_div " >
                 <form method="post" action="login">
                     <br>
                     
                   
                     <input type="text" placeholder="enter email" name="email1" class="reg_textfield_design"> <br> <br>
                     <input type="password" placeholder="enter password" name="pass1" class="reg_textfield_design"> <br> <br>
                    
                     <input type="checkbox" class="option-input checkbox" name="rememberme1"  value="rememberme" /> rememeber me <br> <br>
                    
                     <input type="submit" value="register" class="btn-primary"> <br> <br>
                 
                 </form>
             </div>
             <div class="col-md-2">
                 
             </div>
         
             
         </div>
    </body>
</html>
