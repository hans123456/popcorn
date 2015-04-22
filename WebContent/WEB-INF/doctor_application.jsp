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
	
	<div id="Apply" class="board valign-wrapper orange">
		<div class="container valign left-align board-padding">
			
			<div style="margin-top:50px; margin-bottom:20px">
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
							<c:choose>
								<c:when test="${user_reg_first_name == null }">
									<input id="user_reg_first_name" name="user_reg_first_name" type="text" class="validate">
									<label for="user_reg_first_name" class="black-text">First Name</label>
								</c:when>
								<c:otherwise>
									<input id="user_reg_first_name" name="user_reg_first_name" value="${user_reg_first_name}" type="text" class="validate">
									<label for="user_reg_first_name" class="black-text">First Name</label>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="input-field col m6 s12">
							<c:choose>
								<c:when test="${user_reg_last_name == null }">
									<input id="user_reg_last_name" name="user_reg_last_name" type="text" class="validate">
									<label for="user_reg_last_name" class="black-text">Last Name</label>
								</c:when>
								<c:otherwise>
									<input id="user_reg_last_name" name="user_reg_last_name" value="${user_reg_last_name}" type="text" class="validate">
									<label for="user_reg_last_name" class="black-text">Last Name</label>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="input-field col m6 s12">
							<c:choose>
								<c:when test="${user_reg_email == null }">
									<input id="user_reg_email" name="user_reg_email" type="text" class="validate">
									<label for="user_reg_email" class="black-text">Email</label>
								</c:when>
								<c:otherwise>
									<input id="user_reg_email" name="user_reg_email" value="${user_reg_email}" type="text" class="validate">
									<label for="user_reg_email" class="black-text">Email</label>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="input-field col m6 s12">
							<c:choose>
								<c:when test="${user_reg_contact_number == null }">
									<input id="user_reg_contact_number" name="user_reg_contact_number" type="text" class="validate">
									<label for="user_reg_contact_number" class="black-text">Contact Number</label>
								</c:when>
								<c:otherwise>
									<input id="user_reg_contact_number" name="user_reg_contact_number" value="${user_reg_contact_number}" type="text" class="validate">
									<label for="user_reg_contact_number" class="black-text">Contact Number</label>
								</c:otherwise>
							</c:choose>
						</div>
												<div class="input-field col m6 s12">
							<c:choose>
								<c:when test="${user_reg_password == null}">
									<input id="user_reg_password" name="user_reg_password" type="password" class="validate">
									<label for="user_reg_password" class="black-text">Password</label>
								</c:when>
								<c:otherwise>
									<input id="user_reg_password" name="user_reg_password" value="${user_reg_password}" type="password" class="validate">
									<label for="user_reg_password" class="black-text">Password</label>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="input-field col m6 s12">
							<c:choose>
								<c:when test="${user_reg_confirm_password == null}">
									<input id="user_reg_confirm_password" name="user_reg_confirm_password" type="password" class="validate">
									<label for="user_reg_confirm_password" class="black-text">Confirm Password</label>
								</c:when>
								<c:otherwise>
									<input id="user_reg_confirm_password" name="user_reg_confirm_password" value="${user_reg_confirm_password}" type="password" class="validate">
									<label for="user_reg_confirm_password" class="black-text">Confirm Password</label>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="input-field col m6 s12 select">
							<select id="user_reg_gender" class=" select" name="user_reg_gender">
								<option value="" selected disabled>Gender</option>
								<c:choose>
									<c:when test="${user_reg_gender == null}">
										<option value="M">Male</option>
										<option value="F">Female</option>
									</c:when>
									<c:when test="${user_reg_gender == 'F'}">
										<option value="M">Male</option>
										<option value="F" selected>Female</option>
									</c:when>
									<c:otherwise>
										<option value="M" selected>Male</option>
										<option value="F">Female</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
						<div class="input-field col m6 s12">
							<c:choose>
								<c:when test="${user_reg_birthdate == null}">
 									<input id="user_reg_birthdate" name="user_reg_birthdate" type="text" class="datepicker">
									<label for="user_reg_birthdate" class="black-text">Birthdate</label>
								</c:when>
								<c:otherwise>
									<input id="user_reg_birthdate" name="user_reg_birthdate" value="${user_reg_birthdate}" type="text" class="datepicker">
									<label for="user_reg_birthdate" class="black-text">Birthdate</label>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="input-field col m6 s12 select">
							<select id="specializations" name="specializations">
								<option value="" selected disabled>Specialization</option>
								<c:forEach items="${specializations}" var="curItem">
									<c:choose>
										<c:when test="${specialization == null}">
											<option value="${curItem.getId()}">${curItem.getName()}</option>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${curItem.getId() == specialization}">
													<option value="${curItem.getId()}" selected>${curItem.getName()}</option>
												</c:when>
												<c:otherwise>
													<option value="${curItem.getId()}">${curItem.getName()}</option>
												</c:otherwise>
											</c:choose>
									</c:otherwise>
								</c:choose>
								</c:forEach>
							</select>
						</div>
						<div class="input-field col m6 s12 select">
							<select id="cities" name="cities">
								<option value="" selected disabled>City</option>
								<c:forEach items="${cities}" var="curItem">
									<c:choose>
										<c:when test="${city == null}">
											<option value="${curItem.getId()}">${curItem.getName()}</option>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${curItem.getId() == city}">
													<option value="${curItem.getId()}" selected>${curItem.getName()}</option>
												</c:when>
												<c:otherwise>
													<option value="${curItem.getId()}">${curItem.getName()}</option>
												</c:otherwise>
											</c:choose>
									</c:otherwise>
								</c:choose>
								</c:forEach>
							</select>
						</div>
						<div class="input-field col m6 s12"> 
							<select id="hospitals" name="hospitals" class="browser-default" style="background-color:transparent; border: 0px; border-bottom: 1px solid rgb(211,211,211); outline:0px;">
							</select>
						</div>
					</div>
					
					<div class="left-align board-padding col s12">
						<h4 class="board-header" style="margin-bottom:20px;">Consultation Hours</h4>
						<div class="white row">
							<div class="col s12">
								<ul class="tabs">
									<li class="tab col s3"><a class="active" href="#test1">Sun</a></li>
									<li class="tab col s3"><a href="#test2">Mon</a></li>
									<li class="tab col s3"><a href="#test3">Tue</a></li>
									<li class="tab col s3"><a href="#test4">Wed</a></li>
									<li class="tab col s3"><a href="#test5">Thu</a></li>
									<li class="tab col s3"><a href="#test6">Fri</a></li>
									<li class="tab col s3"><a href="#test7">Sat</a></li>
								</ul>
							</div>
							<div id="test1" class="col s12">Test 1</div>
							<div id="test2" class="col s12">Test 2</div>
							<div id="test3" class="col s12">Test 3</div>
							<div id="test4" class="col s12">Test 4</div>
							<div id="test5" class="col s12">Test 5</div>
							<div id="test6" class="col s12">Test 6</div>
							<div id="test7" class="col s12">Test 7</div>
						</div>
					</div>
					
					<div class="right-align">
						<button type="submit" class="waves-effect waves-light btn btn-top-margin"><i class="mdi-content-send right"></i>Submit</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>

	<c:import url="part/footer.jsp"></c:import>

</body>

<script>  
	
	// generate table
	var ndays = 7;
	var times = ["8:00AM", "1:00PM", "9:00AM", "2:00PM", "10:00AM", "3:00PM", "11:00AM", "4:00PM", "12:00PM", "5:00PM"];
	var timesName = [1, 6, 2, 7, 3, 8, 4, 9, 5, 10];
	var days = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"];
	
	var temp = "";
	for(var j=0; j<days.length; j++){
		temp += '<div class="left-align board-padding col s12"><div class="row margin-top10">';
		for(var k=0; k<times.length; k++){
			temp += '<div class="margin-top15 col m6 s12"><input class="with-gap" name="' + (j+1) + '" type="checkbox" id="' + days[j] + timesName[k] + '" value="' + timesName[k] + '"/><label for="' + days[j] + timesName[k] + '" class="black-text">' + times[k] + '</label></div>';
		}
		temp += "</div></div>";
		$("#test" + (j+1)).html(temp);
		temp = "";
	}
	
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
 
	var days = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"];
	<%
		Map<String, List<String>> consultHours = (Map<String, List<String>>)request.getAttribute("consultation");
		if(consultHours != null){
			for(Map.Entry<String, List<String>> entry: consultHours.entrySet()) {
	%>
	<%			for(String time: entry.getValue()) {
	%>
					$("#" + days[<%=Integer.parseInt(entry.getKey()) -1 %>] + <%=time%>).prop('checked', true); 
					
	<%
				}
	%>
				
	<%
			}
		}
	%>
	
	$(document).ready(function() {
		
		$('select').material_select();

		$('.datepicker').pickadate({
		   	selectMonths: true, // Creates a dropdown to control month
		   	selectYears: 15 // Creates a dropdown of 15 years to control year
		});
		
		$('ul.tabs').tabs();
		  
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
	
	$("#hospitals").ready(function(){
		
	  	var city = document.getElementById("cities").value;
		var result = mapping[city];
		
		var $selectDropdown = 
		      $("#hospitals")
		        .empty()
		        .html(' ');
		
		$selectDropdown.append($("<option></option>").attr("value", "").text("Hospital").attr("selected", true).attr("disabled", true));

		if(result != null) {
		    
		    var hospital = <%=request.getAttribute("hospital")%>
			for(var i = 0 ; i < result.length; i++){
				var value = result[i];
				if(value.id == hospital) {
			    	$selectDropdown.append($("<option></option>").attr("value",value.id).attr("selected", true).text(value.name));
				} else {
					$selectDropdown.append($("<option></option>").attr("value",value.id).text(value.name));
				}
			}
		    
	
		    // trigger event
		    $selectDropdown.trigger('contentChanged');
		    
		}
		
	});

	$("#user_reg_birthdate").ready(function(){
		
		var monthNames = [	"January", "February", "March", "April", "May", "June",
		                  	"July", "August", "September", "October", "November", "December"	];
		
	    var date = new Date();
	    var day = date.getDate();
	    var month = date.getMonth();
	    var year = date.getFullYear();
	    
	    var today = day + " " + monthNames[month] + ", " + year;       
	    console.log(today);
	    $("#user_reg_birthdate").val(today);
	    
	});
	
</script>


</html>