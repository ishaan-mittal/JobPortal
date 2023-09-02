<%-- 
    Document   : register
    Created on : May 19, 2021, 5:09:14 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> RegisterS Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" >
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" ></script>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        
        <script>
            function val(v)
            {
                document.getElementById(v).innerHTML="";
            }
            
            function validation()
            {
                var flag=true;
              var name2  =document.form1.name1.value;
              var email2 = document.form1.email1.value;
              var pass2  =document.form1.pass1.value;
              var gender2 = document.form1.gender1.value;
              var city2  =document.form1.city1.value;
          
              var name_pattern= /^[a-zA-Z]{5,30}$/ ;
              var email_pattern=/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/ ;

              var pass_pattern=/^[a-zA-Z0-9@# ]{8,20}$/;
             if(!name2.match(name_pattern))
              {
                  document.getElementById('name_error').innerHTML="format" ;
                  flag=false ;
              }
              
              if(name2==="")
              {
                  document.getElementById('name_error').innerHTML="name cant be empty" ;
                  flag=false ;
              }
              
              if(!email2.match(email_pattern))
              {
                   document.getElementById('email_error').innerHTML="format" ;
                  
                   flag=false ;
              }
             
               
               if(email2==="")
              {
                  document.getElementById('email_error').innerHTML="email id cant be empty" ;
                  
                   flag=false ;
              }
              
              if(!pass2.match(pass_pattern))
              {
                  document.getElementById('pass_error').innerHTML="format" ;
                  flag=false ;
              }
                if(pass2==="")
              {
                  document.getElementById('pass_error').innerHTML="password cant be empty" ;
                  flag=false ;
              }
               if(gender2==="")
              {
                  document.getElementById('gender_error').innerHTML="gender cnt be empty" ;
                   flag=false ;
              }
              
              if(city2==="select City")
              {
                  document.getElementById('city_error').innerHTML="please select the city";
                   flag=false ;
              }
             
              return flag ;
              
            }
            
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
         <jsp:include page="navbar.jsp"></jsp:include>
         
         <div class="row">
             <div class="col-md-2">
                 
             </div>
             <div class="col-md-8 register_design_div " >
                 <form method="post" name="form1" onsubmit="return validation()"  action="reg">
                     <h3>Register Here</h3>
                     <input type="text" placeholder="enter name" name="name1" class="reg_textfield_design" onkeyup="val('name_error')" > <br><span id="name_error" style="color: red;"></span>  <br> <br>
                         
                     <input type="text" placeholder="enter email" name="email1" class="reg_textfield_design" onkeyup="val('email_error')">  <br> <span id="email_error" style="color: red;"></span> <br> <br>
                     <input type="password" placeholder="enter password" name="pass1" class="reg_textfield_design" onkeyup="val('pass_error')">  <br><span id="pass_error" style="color: red;"></span><br> <br>
                     Select Gender: <input type="radio" name="gender1" value="Male" class="option-input radio" >Male  <input type="radio" name="gender1" value="Female" class="option-input radio">Female  <br>  <span id="gender_error" style="color: red;"></span>  <br> <br>
                     Select Fields:
                         <input type="checkbox" class="option-input checkbox" name="field1"  value="Information Technology" />
                         Information Technology
                     
                     <input type="checkbox" name="field1" value="Marketing" class="option-input"/>Marketing <br>
                     <input type="checkbox" name="field1" value="Sales" class="option-input"/>    Sales <br> <br>


                     <select name="city1" class="reg_textfield_design" onkeyup="val('city_error')" >
                         <option>select City</option>
                         <option value="Aligarh">Aligarh</option>
                         <option value="Delhi">Delhi</option>
                         <option value="Mumbai">Mumbai</option>
                         <option value="Gurgaon"> Gurgaon</option>
                     </select>   <br>  <span id="city_error" style="color: red;"></span>  <br>  <br>  


                     <input type="submit" value="register" class="btn-success">
                 
                 </form>
             </div>
             <div class="col-md-2">
                 
             </div>
         
             
         </div>
         <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
