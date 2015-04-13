<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Map, java.util.List, java.util.ArrayList, java.util.HashMap, models.city.CitiesDAO, models.city.City, models.hospital.HospitalsDAO, models.hospital.Hospital, models.specialization.SpecializationsDAO "%>
    
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--Import materialize.css-->
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

<link type="text/css" rel="stylesheet" href="css/main.css"  media="screen,projection"/>

<title>POPCORN</title>
		
</head>
<body>

	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="js/materialize.min.js"></script>
	
	<c:import url="part/navbar.jsp"></c:import>
	
	<div id="Apply" class="board valign-wrapper">
		<div class="container valign">
			<div class="left-align board-padding col s12 ">
			<div>
				<h2 class="board-header display-inline">Doctor Application</h2>
				<h5 class="red-text display-inline left-margin10">
					<c:if test="${invalid_registration!=null}">
						${invalid_registration}
					</c:if>
				</h5>
			</div>
				<div class="row">
				<form action="doctor_apply" method="POST" class="col s12">
					<div class="row">
						<div class="input-field col m6 s12">
							<input id="user_reg_first_name" name="user_reg_first_name" type="text" class="validate">
							<label for="user_reg_first_name">First Name</label>
						</div>
						<div class="input-field col m6 s12">
							<input id="user_reg_last_name" name="user_reg_last_name" type="text" class="validate">
							<label for="user_reg_last_name">Last Name</label>
						</div>
						<div class="input-field col m6 s12">
							<input id="user_reg_email" name="user_reg_email" type="email" class="validate">
							<label for="user_reg_email">Email</label>
						</div>
						<div class="input-field col m6 s12">
							<input id="user_reg_contact_number" name="user_reg_contact_number" type="text" class="validate">
							<label for="user_reg_contact_number">Contact Number</label>
						</div>
						<div class="input-field col m6 s12 select">
							<select id="user_reg_gender" name="user_reg_gender">
								<option value="" selected disabled>Gender</option>
								<option value="M">Male</option>
								<option value="F">Female</option>
							</select> 
						</div>
						<div class="input-field col m6 s12">
 							<input id="user_reg_birthdate" name="user_reg_birthdate" type="date" class="datepicker">
							<label for="user_reg_birthdate">Birthdate</label>
						</div>
						<div class="input-field col m6 s12">
							<input id="user_reg_password" name="user_reg_password" type="password" class="validate">
							<label for="user_reg_password">Password</label>
						</div>
						<div class="input-field col m6 s12">
							<input id="user_reg_confirm_password" name="user_reg_confirm_password" type="password" class="validate">
							<label for="user_reg_confirm_password">Confirm Password</label>
						</div>
						<div class="input-field col m6 s12 select">
							<select id="specializations" name="specializations">
								<option value="" selected disabled>Specialization</option>
								<c:forEach items="${specializations}" var="curItem">
									<option value="${curItem.getId()}">${curItem.getName()}</option>
								</c:forEach>
							</select>
						</div>
						<div class="input-field col m6 s12 select">
							<select id="cities" name="cities">
								<option value="" selected disabled>City</option>
								<c:forEach items="${cities}" var="curItem">
									<option value="${curItem.getId()}">${curItem.getName()}</option>
								</c:forEach>
							</select>
						</div>
						<div class="input-field col m6 s12">
							<select id="hospitals" name="hospitals" class="browser-default">
								<option value="" selected disabled>Hospital</option>
								<c:forEach items="${hospitals}" var="curItem">
									<option value="${curItem.getId()}">${curItem.getName()}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="left-align board-padding col s12 ">
						<h2 class="board-header">Consultation Hours</h2>
						<p class="flow-text">Monday</p>
						<div class="left-align board-padding col s12 ">
							<div class="row margin-top10">
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="2" type="checkbox" id="monday1"  value="1"/>
									<label for="monday1">8:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="2" type="checkbox" id="monday2" value="6" />
									<label for="monday2">1:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="2" type="checkbox" id="monday3" value="2" />
									<label for="monday3">9:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="2" type="checkbox" id="monday4" value="7" />
									<label for="monday4">2:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="2" type="checkbox" id="monday5" value="3" />
									<label for="monday5">10:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="2" type="checkbox" id="monday6" value="8"/>
									<label for="monday6">3:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="2" type="checkbox" id="monday7" value="4"/>
									<label for="monday7">11:00AM</label>
								</div>					
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="2" type="checkbox" id="monday8" value="9"/>
									<label for="monday8">4:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="2" type="checkbox" id="monday9" value="5"/>
									<label for="monday9">12:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="2" type="checkbox" id="monday10" value="10"/>
									<label for="monday10">5:00PM</label>
								</div>
							</div>	
						</div>
						
						<p class="flow-text">Tuesday</p>
						<div class="left-align board-padding col s12 ">
							<div class="row margin-top10">
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="3" type="checkbox" id="tuesday1"  value="1"/>
									<label for="tuesday1">8:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="3" type="checkbox" id="tuesday2" value="6" />
									<label for="tuesday2">1:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="3" type="checkbox" id="tuesday3" value="2" />
									<label for="tuesday3">9:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="3" type="checkbox" id="tuesday4" value="7" />
									<label for="tuesday4">2:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="3" type="checkbox" id="tuesday5" value="3" />
									<label for="tuesday5">10:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="3" type="checkbox" id="tuesday6" value="8"/>
									<label for="tuesday6">3:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="3" type="checkbox" id="tuesday7" value="4"/>
									<label for="tuesday7">11:00AM</label>
								</div>					
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="3" type="checkbox" id="tuesday8" value="9"/>
									<label for="tuesday8">4:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="3" type="checkbox" id="tuesday9" value="5"/>
									<label for="tuesday9">12:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="3" type="checkbox" id="tuesday10" value="10"/>
									<label for="tuesday10">5:00PM</label>
								</div>
							</div>	
						</div>
						
						<p class="flow-text">Wednesday</p>
						<div class="left-align board-padding col s12 ">
							<div class="row margin-top10">
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="4" type="checkbox" id="wednesday1"  value="1"/>
									<label for="wednesday1">8:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="4" type="checkbox" id="wednesday2" value="6" />
									<label for="wednesday2">1:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="4" type="checkbox" id="wednesday3" value="2" />
									<label for="wednesday3">9:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="4" type="checkbox" id="wednesday4" value="7" />
									<label for="wednesday4">2:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="4" type="checkbox" id="wednesday5" value="3" />
									<label for="wednesday5">10:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="4" type="checkbox" id="wednesday6" value="8"/>
									<label for="wednesday6">3:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="4" type="checkbox" id="wednesday7" value="4"/>
									<label for="wednesday7">11:00AM</label>
								</div>					
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="4" type="checkbox" id="wednesday8" value="9"/>
									<label for="wednesday8">4:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="4" type="checkbox" id="wednesday9" value="5"/>
									<label for="wednesday9">12:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="4" type="checkbox" id="wednesday10" value="10"/>
									<label for="wednesday10">5:00PM</label>
								</div>
							</div>	
						</div>
						
						<p class="flow-text">Thursday</p>
						<div class="left-align board-padding col s12 ">
							<div class="row margin-top10">
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="5" type="checkbox" id="thursday1"  value="1"/>
									<label for="thursday1">8:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="5" type="checkbox" id="thursday2" value="6" />
									<label for="thursday2">1:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="5" type="checkbox" id="thursday3" value="2" />
									<label for="thursday3">9:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="5" type="checkbox" id="thursday4" value="7" />
									<label for="thursday4">2:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="5" type="checkbox" id="thursday5" value="3" />
									<label for="thursday5">10:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="5" type="checkbox" id="thursday6" value="8"/>
									<label for="thursday6">3:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="5" type="checkbox" id="thursday7" value="4"/>
									<label for="thursday7">11:00AM</label>
								</div>					
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="5" type="checkbox" id="thursday8" value="9"/>
									<label for="thursday8">4:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="5" type="checkbox" id="thursday9" value="5"/>
									<label for="thursday9">12:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="5" type="checkbox" id="thursday10" value="10"/>
									<label for="thursday10">5:00PM</label>
								</div>
							</div>	
						</div>
						
						<p class="flow-text">Friday</p>
						<div class="left-align board-padding col s12 ">
							<div class="row margin-top10">
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="6" type="checkbox" id="friday1"  value="1"/>
									<label for="friday1">8:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="6" type="checkbox" id="friday2" value="6" />
									<label for="friday2">1:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="6" type="checkbox" id="friday3" value="2" />
									<label for="friday3">9:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="6" type="checkbox" id="friday4" value="7" />
									<label for="friday4">2:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="6" type="checkbox" id="friday5" value="3" />
									<label for="friday5">10:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="6" type="checkbox" id="friday6" value="8"/>
									<label for="friday6">3:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="6" type="checkbox" id="friday7" value="4"/>
									<label for="friday7">11:00AM</label>
								</div>					
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="6" type="checkbox" id="friday8" value="9"/>
									<label for="friday8">4:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="6" type="checkbox" id="friday9" value="5"/>
									<label for="friday9">12:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="6" type="checkbox" id="friday10" value="10"/>
									<label for="friday10">5:00PM</label>
								</div>
							</div>	
						</div>
						
						<p class="flow-text">Saturday</p>
						<div class="left-align board-padding col s12 ">
							<div class="row margin-top10">
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="7" type="checkbox" id="saturday1"  value="1"/>
									<label for="saturday1">8:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="7" type="checkbox" id="saturday2" value="6" />
									<label for="saturday2">1:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="7" type="checkbox" id="saturday3" value="2" />
									<label for="saturday3">9:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="7" type="checkbox" id="saturday4" value="7" />
									<label for="saturday4">2:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="7" type="checkbox" id="saturday5" value="3" />
									<label for="saturday5">10:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="7" type="checkbox" id="saturday6" value="8"/>
									<label for="saturday6">3:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="7" type="checkbox" id="saturday7" value="4"/>
									<label for="saturday7">11:00AM</label>
								</div>					
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="7" type="checkbox" id="saturday8" value="9"/>
									<label for="saturday8">4:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="7" type="checkbox" id="saturday9" value="5"/>
									<label for="saturday9">12:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="7" type="checkbox" id="saturday10" value="10"/>
									<label for="saturday10">5:00PM</label>
								</div>
							</div>	
						</div>
						
						<p class="flow-text">Sunday</p>
						<div class="left-align board-padding col s12 ">
							<div class="row margin-top10">
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="1" type="checkbox" id="sunday1"  value="1"/>
									<label for="sunday1">8:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="1" type="checkbox" id="sunday2" value="6" />
									<label for="sunday2">1:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="1" type="checkbox" id="sunday3" value="2" />
									<label for="sunday3">9:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="1" type="checkbox" id="sunday4" value="7" />
									<label for="sunday4">2:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="1" type="checkbox" id="sunday5" value="3" />
									<label for="sunday5">10:00AM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="1" type="checkbox" id="sunday6" value="8"/>
									<label for="sunday6">3:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="1" type="checkbox" id="sunday7" value="4"/>
									<label for="sunday7">11:00AM</label>
								</div>					
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="1" type="checkbox" id="sunday8" value="9"/>
									<label for="sunday8">4:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="1" type="checkbox" id="sunday9" value="5"/>
									<label for="sunday9">12:00PM</label>
								</div>
								<div class="margin-top15 col m6 s12">
									<input class="with-gap" name="1" type="checkbox" id="sunday10" value="10"/>
									<label for="sunday10">5:00PM</label>
								</div>
							</div>	
						</div>
						
					</div>
					<div class="right-align">
						<button type="submit" class="waves-effect waves-light btn btn-top-margin"><i class="mdi-content-send right"></i>Submit</button>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>

	<c:import url="part/footer.jsp"></c:import>

</body>

<script>  
	
	function Hospital(){
		
		this.id;
		this.name;
		
	}
	
	var mapping = new Array();
	<%
		Map<Integer, List<Hospital>> map = (Map<Integer, List<Hospital>>)request.getAttribute("cityHospitalMapping");
		for (Map.Entry<Integer, List<Hospital>>  entry : map.entrySet()) {
	%>
			mapping[<%=entry.getKey()%>] = new Array();
	<%
			for(int i = 0; i < entry.getValue().size(); i++) {
	%>
				var h = new Hospital();
				h.id = <%=entry.getValue().get(i).getId()%>;
				h.name = "<%=entry.getValue().get(i).getName()%>";
				mapping["<%=entry.getKey()%>"].push(h);
	<%
			}
		}
	%>
 
	$('.datepicker').pickadate({
	   	selectMonths: true, // Creates a dropdown to control month
	   	selectYears: 15 // Creates a dropdown of 15 years to control year
	});
	

	$(document).ready(function() {
		
		$('select').material_select();

		  
		$("#cities").change(function() {
		    
		    // clear contents
		    var $selectDropdown = 
		      $("#hospitals")
		        .empty()
		        .html(' ');

		    // add new value
		    
		    var city = document.getElementById("cities").value;
			var result = mapping[city];

		    $selectDropdown.append($("<option></option>").attr("value", "").text("Hospital").attr("selected", true).attr("disabled", true));
			for(var i = 0 ; i < result.length; i++){
				var value = result[i];
			    $selectDropdown.append($("<option></option>").attr("value",value.id).text(value.name));
			}
		    

		    // trigger event
		    $selectDropdown.trigger('contentChanged');
		  });


		  $('select').on('contentChanged', function() {
		    // re-initialize (update)
		    $(this).material_select();
		  });
		 
	});
 
</script>


</html>