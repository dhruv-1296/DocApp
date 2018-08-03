<%@page import="com.docapp.dao.SpecialityDAO"%>
<%@page import="com.docapp.model.Speciality"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.docapp.model.Country"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.docapp.dao.CountryDAO"%>
<!DOCTYPE html>

<html>
    <head>
        <title>signup</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        </script>
        
        <script>
         function getAllState(country_id)
         {
             //alert(country_id);
             var xhttp = new XMLHttpRequest();
             xhttp.open("GET","state.jsp?cid="+country_id,true);
             xhttp.send();   
             xhttp.onreadystatechange = function(){
                 if(xhttp.status == 200 && xhttp.readyState==4)
                 {
                    document.getElementById("state_id").innerHTML=xhttp.responseText; 
                 }
             }
         }
         
         function getAllCities(state_id)
         {
            var xhttp = new XMLHttpRequest(); 
            xhttp.open("GET","city.jsp?sid="+state_id,true); 
            xhttp.send(); 
            //alert(state_id);
            xhttp.onreadystatechange = function()
            {
                if(xhttp.status == 200 && xhttp.readyState == 4)
                {
                 //alert(xhttp.responseText); 
                 document.getElementById("city_id").innerHTML = xhttp.responseText; 
                }
            }
         }
        </script>
        
    </head>
    <body style="background-color: #666666;">
    <center>	
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form action="sign_up_task.jsp" method="post" class="login100-form validate-form">
                        <span class="login100-form-title p-b-43"  style="margin-top: -140px; color:#04aa86 ">
                            SIGN-UP
                        </span>

                        <div class="wrap-input100 validate-input" data-validate = "Please enter your Username">
                            <input class="input100" type="text" name="name"  placeholder="Enter username">
                            <span class="focus-input100"></span>

                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Please enter your Email">
                            <input class="input100" type="text" name="email" placeholder="Enter Email">
                            <span class="focus-input100"></span>

                        </div>


                        <div class="wrap-input100 validate-input" data-validate="Please enter your Password">
                            <input class="input100" type="password" name="password" placeholder="Enter Password">
                            <span class="focus-input100"></span>

                        </div>
                        <div class="wrap-input100 validate-input" data-validate = "Please re-enter your Password">
                            <input class="input100" type="password" name="cpass" placeholder="Re-enter Password">
                            <span class="focus-input100"></span>


                        </div>


                        <div>
                            <span style="font-size: 20px; opacity: .5;">
                                <input  type="radio" name="gender" value="Male" style="align:left;" >&nbsp;&nbsp;&nbsp;Male
                                <input  type="radio" value="Female" name="gender"  style="margin-left: 30px;" >&nbsp;&nbsp;&nbsp;Female

                            </span>
                        </div>

                        
                        <div class="wrap-input100 validate-input" data-validate = "Enter Date of Birth">
                            <input class="input100" type="date" name="dob" placeholder="DOB">
                            <span class="focus-input100"></span>
                        </div>

                        <div class="" data-validate = "Please select your SPECIALITY">
                            <select  id = "spec_id" name="sppec_id" class="wrap-input100" style=" opacity: .5;background-color: whitesmoke;">
                                <option value="0">SELECT SPECIALITY</option>                              
                                <%
                                  ArrayList<Speciality>sppecList = SpecialityDAO.getSpeciality();
                                  Iterator<Speciality>iitr = sppecList.iterator();
                                  while(iitr.hasNext())
                                  {
                                    Speciality sppec = iitr.next();
                                %>
                                <option value="<%=sppec.getId()%>"><%=sppec.getSpeciality()%></option>   
                                    <%
                                  }
                                %>
                            </select>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate = "Enter your Experience">
                            <input class="input100" type="text" name="experience" placeholder="Enter Experience">
                            <span class="focus-input100"></span>
                        </div>
                        
                        
                        <div class="wrap-input100 validate-input" data-validate = "Enter your MCI Number">
                            <input class="input100" type="text" name="mci" placeholder="Enter MCI Number">
                            <span class="focus-input100"></span>
                        </div>


                        <div class="" data-validate = "Select your Country">
                            <select   name="country_id" onchange="getAllState(this.value)" class="wrap-input100" style="opacity: .5;background-color: whitesmoke;">
                                <option value="0">SELECT COUNTRY</option>
                                <%
                                  ArrayList<Country>cList = CountryDAO.getAllCountry();
                                  Iterator<Country>itr = cList.iterator();
                                  while(itr.hasNext())
                                  {
                                    Country c = itr.next();
                                %>
                                    <option value="<%=c.getCountry_id()%>"><%=c.getCountry_name()%></option>   
                                    <%
                                  }
                                %>
                            </select>
                        </div>


                        <div class="" data-validate = "Please select your State">
                            <select  id ="state_id" onchange="getAllCities(this.value)" name="state_id" class="wrap-input100" style=" opacity: .5;background-color: whitesmoke;">
                                <option value="0" >SELECT STATE</option> 
                                <!--<span class="focus-input100"></span>
                                <span class="label-input100"></span>-->

                            </select>

                        </div>

                        <div class="" data-validate = "Please select your City">
                            <select  id = "city_id" name="city_id" class="wrap-input100" style=" opacity: .5;background-color: whitesmoke;">
                                 <option value="0">SELECT CITY</option>
                                 <!--<span class="focus-input100"></span>
                                <span class="label-input100"></span>-->
                                
                                
                            </select>
                        </div>


                        <div class="wrap-input100 validate-input" data-validate = "Enter your Address">
                            <input class="input100" type="text" name="address" placeholder="Address">
                            <span class="focus-input100"></span>
                        </div>

                            <div class="wrap-input100 validate-input" data-validate = "Enter your mobile number">
                            <input class="input100" type="text" name="mobile" placeholder=" Enter mobile no">
                            <span class="focus-input100"></span>

                        </div>

                        <div class="container-login100-form-btn">
                            <button type="submit" class="login100-form-btn">
                                SIGN-UP</button>
                        </div>
                        <div> <a href="home.html">next</a></div>


                    </form>

                    <div class="login100-more" style="background-image: url('images/logo5.jpg');">
                    </div>
                </div>
            </div>
        </div>

    </center>



    <!--===============================================================================================-->
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/bootstrap/js/popper.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/daterangepicker/moment.min.js"></script>
    <script src="vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    <script src="js/main.js"></script>

</body>
</html>

