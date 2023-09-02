<%-- 
    Document   : contact-us-no-user
    Created on : Jun 1, 2021, 4:42:32 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <form method="post" action="contactus">
                             <br>


                             <input type="text" placeholder="enter name" name="name1" class="reg_textfield_design"> <br> <br>
                             <input type="text" placeholder="enter email" name="email1" class="reg_textfield_design"> <br> <br>
                             <input type="text" placeholder="Subject Area" name="sub1" class="reg_textfield_design"> <br> <br>

                             <textarea placeholder="enter message" style="width: 250px" name="msg1"></textarea><br><br>

                             <input type="submit" value="send" class="btn btn-primary"> <br> <br>

                         </form>
             
    </body>
</html>
