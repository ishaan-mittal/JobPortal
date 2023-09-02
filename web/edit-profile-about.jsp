<%-- 
    Document   : edit-profile-about
    Created on : May 23, 2021, 1:00:35 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <jsp:scriptlet>
             String name = (String) session.getAttribute("session_name");
                 String name1 = name.toUpperCase();
                  String email = (String) session.getAttribute("session_email");
                 String gender = (String) session.getAttribute("session_gender");
                 String field = (String) session.getAttribute("session_field");
                 String city = (String) session.getAttribute("session_city");
                 String about = (String) session.getAttribute("session_about");
                 String skill  = (String) session.getAttribute("session_skill");
                 
                 if(skill==null || skill.equals(""))
                 {
                     skill="";
                 }
                

                 if (about == null || about.equals("")) {
                     about = "";
                 }

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
        
        <script>
            function chngGender()
            {
                document.getElementById('chngtf').value=document.getElementById('chng2').value ;
            }
        </script>
    </head>
    <body>
        <jsp:include page="profileheader.jsp"></jsp:include>
         <jsp:include page="navbar.jsp"></jsp:include>
         
        
             <div class="row mt-3">
                 <div class="col-md-2"></div>
                 <div class="col-md-8">
                     <div class="row " style="border: 1px solid black">
                     <div class="col-md-2 mt-3">
                         <img src="images/profilepic.png" style="height: 90px">
                     </div>
                          <div class="col-md8 mt-3" style="text-align: centre">
                              <h3 style="color: black">Personal Details</h3> <br><br>
                          <form method="post" action="epa">
                              <table>
                                  <tr>
                                      <td>Email</td>
                                      <td><input type="text" value=" <jsp:expression>email</jsp:expression>" style="color: darkblue" readonly=""><br><br></td>
                                  </tr>
                                  <tr>
                                      <td><span>Name:</span>  </td>
                                      <td><input type="text" value=" <jsp:expression> name1</jsp:expression> " name="name1"> <br></td>
                                  </tr>
                                  
                                   <tr>
                                      <td><span>Gender:</span> </td>
                                      <td><input id="chngtf" type="text" value="<jsp:expression>gender</jsp:expression>" name="gender1" readonly=""></td>
                                   <td><br> 
                                       <select id="chng2" onchange="chngGender()">
                                           <option disabled="">Select gender</option>
                                               <option>Male</option>
                                               <option>Female</option>
                                           </select>
                                           <br><br></td>
                                  </tr>
                                  
                                   <tr>
                                      <td><span>City:</span> </td>
                                      <td><input type="text" value="<jsp:expression> city</jsp:expression >" name="city1"><br><br></td>
                                  </tr> <!-- similarly do it for city -->
                                  
                                   <tr>
                                      <td> <span>Title:</span></td>
                                      <td><input type="text" value="<jsp:expression>about</jsp:expression>" name="about1"><br><br></td>
                                  </tr>
                                  
                                   <tr>
                                      <td> <span>skills</span></td>
                                      <td><textarea name="skill1"><jsp:expression>skill</jsp:expression></textarea><br><br></td>
                                  </tr>
                                  
                                  <tr>
                                      <td></td>
                                      <td><input type="submit" value="update" class="btn btn-danger" ><br><br></td>
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

