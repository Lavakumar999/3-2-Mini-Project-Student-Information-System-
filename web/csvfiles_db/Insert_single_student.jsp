<%-- 
    Document   : Insert_single_student
    Created on : Feb 24, 2017, 12:38:43 PM
    Author     : Lava Kumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Registration Form</title>
        <link href="../css/cssFile.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.branch{
margin-left:22px;
}
#branch{
margin-left:200px;
}
font,.form-photo{
font-family:"Times New Roman", Times, serif;
 color:#999999;
}
h1{
    color:#000099;
}
select{
    border: 1px solid #999999;
    border-radius: 5px;
}
#border{
    border: 1px solid #999999;
    border-radius: 5px;
}
select:hover,select:visited,#border:hover,#border:visited{
    border-color:#4f93ce; 
}
#photo{
    display: inline;
    border-radius: 5px;
}
#fontcolor{
    color:#666;
}
</style>
<script type="text/javascript">
	<!--
	function validator(){
	var sname = document.getElementById("sname").value;
	var fname = document.getElementById("fname").value;
	var email = document.getElementById("email").value;
	var address = document.getElementById("address").value;
	var phone1 = document.getElementById("phone1").value;
	var phone2= document.getElementById("phone2").value;
	var radio_1 = document.getElementById("radio_male").value;
	
	if(fname==""&&sname==""&&email==""&&address==""&&phone1=="")
			alert("Fill all required areas.");
	else
			alert("Thanks for the submission!");
}
	-->
	</script>
</head>

<body>
<div class="container">
    <center><h2>Student Registration Form</h2></center>
    <form action="../InsertStudent" method="post" enctype="multipart/form-data">
        <div class="form-group">
          <input  name="sid" id="sid" size="40" type="number" required="required"/>
          <label for="input" class="control-label">Enter Your RegId</label><i class="bar"></i>
      </div>
       <div class="form-group">
      <input  name="sname" id="sname" type="text" required="required"/>
      <label for="input" class="control-label">Enter Your Name</label><i class="bar"></i>
    </div>
           <div class="form-group">
      <input name="fname" id="fname" type="text" required="required"/>
      <label for="input" class="control-label">Father Name</label><i class="bar"></i>
    </div>
    
	<div class="form-group">
      <input name="mname" id="fname" type="text" required="required"/>
      <label for="input" class="control-label">Mother Name</label><i class="bar"></i>
    </div>
	<div class="form-group">
     <input name="foccuption" type="text"  id="foccupation" required="required"/>
      <label for="input" class="control-label">Your Father Occuption</label><i class="bar"></i>
    </div>
	
	 <div class="form-radio">
	 <font style="font-size:20px;">Gender:</font><br/><br/>
      <div class="radio">
        <label>
          <input id="radio_male" type="radio" name="gender" value="male" /><i class="helper"></i>Male
        </label>
      </div>
      <div class="radio">
        <label>
          <input id="radio_female" type="radio" name="gender" value="female"/><i class="helper"></i>Female
        </label>
      </div>
    </div>
    <div class="form-group">
     <input name="dob" type="date"  id="dob" required="required"/>
      <label for="input" class="control-label">Date Of Birth:</label><i class="bar"></i>
    </div>
    <div class="form-group">
                  <font size="+1">Choose Branch:</font>
		  <SELECT NAME="branch" SINGLE id="fontcolor">
                      <OPTION>Select Branch</option>
                      <OPTION>IT</option>
                      <OPTION>CSE</option>
                      <OPTION>Civil</option>
                      <OPTION>ECE</option>
                      <OPTION>EEE</option>
                      <OPTION>MECH</option>
                      <option>CHEM</option>
                  </SELECT>
                </div>
                <div id="batch" class="form-group">
                    <br/>
                    <font size="+1">Admitted Batch:</font>
                    <SELECT NAME="adm" id="fontcolor" SINGLE>
                        <OPTION>Select Batch</option>
                        <OPTION>2007-2011</option>
                        <OPTION>2008-2012</option>
                        <OPTION>2009-2013</option>
                        <OPTION>2010-2014</option>
                        <OPTION>2011-2015</option>
                        <OPTION>2012-2016</option>
                        <OPTION>2013-2017</option>
                        <option>2014-2018</option>
                        <option>2015-2019</option>
                        <option>2016-2020</option>
                   </SELECT>		<br/><br/>
                </div>
                 <div>
		<font>Educational Qualifications: </font><b><font>SSC
<INPUT id="border" TYPE="text" SIZE="3" NAME="ssc" maxlength="5">% Intermediate
<INPUT  id="border" TYPE="text" SIZE="3" NAME="inter" maxlength="5">%</font></b><br/>
		
		</div>
	
	 <div class="form-group">
      <textarea id="address" name="address" required="required"></textarea>
      <label for="textarea" class="control-label">Address</label><i class="bar"></i>
    </div>
    <div class="form-group">
     <input name="scity" type="text"  id="fcity" required="required"/>
      <label for="input" class="control-label">Your city</label><i class="bar"></i>
    </div>
    <div class="form-group">
     <input name="sstate" type="text"  id="state" required="required"/>
      <label for="input" class="control-label">Your State</label><i class="bar"></i>
    </div>
    <div class="form-group">
     <input  type="number"   name="szipcode" size="10" id="zipcode" required="required"/>
      <label for="input" class="control-label">Pin code</label><i class="bar"></i>
    </div>
	<div class="form-group">
	<input type="number" size="40" id="sphone" name="phonenum1" required="required" /><br/>
	<label for="input" class="control-label">Your Phone number</label><i class="bar"></i>
	</div>
	<div class="form-group">
	<input type="number" size="40" id="fphone"  name="phonenum2" required="required"/><br/>
	<label for="input" class="control-label">your Father Phone number</label><i class="bar"></i>
	</div>
		<div class="form-group">
      <input name="email" id="semail" type="text" required="required"/>
      <label for="input" class="control-label">Enter Your Email ID</label><i class="bar"></i>
    </div>
    <div class="form-photo">
                <label for="input">Upload Your Photo</label><i class="bar"></i> 
		<INPUT TYPE="file" id="sphoto"  name="simage" required="required"/>
	 </div>
         <input type="submit" onClick="validator(this)" class="button" value="submit">
    </form>
</div>
</body>
</html>
