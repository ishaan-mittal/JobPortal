<%-- 
    Document   : contact-us-user
    Created on : Jun 1, 2021, 4:43:01 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:scriptlet>
    String name1  =(String) session.getAttribute("session_name");
    String email1  =(String) session.getAttribute("session_email");
     
</jsp:scriptlet>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form method="post" action="contactus">
                             <br>


                             <input type="text" placeholder="enter name" name="name1" class="reg_textfield_design" value="<jsp:expression>name1</jsp:expression>" readonly=""> <br> <br>
                             <input type="text" placeholder="enter email" name="email1" class="reg_textfield_design"value="<jsp:expression>email1</jsp:expression>" readonly=""> <br> <br>
                             <input type="text" placeholder="Subject Area" name="sub1" class="reg_textfield_design"> <br> <br>

                             <textarea placeholder="enter message" style="width: 250px" name="msg1"></textarea><br><br>

                             <input type="submit" value="send" class="btn btn-primary"  > <br> <br>

                         </form>
    </body>
</html>
