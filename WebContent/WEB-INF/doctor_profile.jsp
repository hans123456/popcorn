<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
<link type="text/css" rel="stylesheet" href="css/doctor_profile.css"  media="screen,projection"/>

<title>POPCORN</title>
		
</head>
<body>

	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="js/materialize.min.js"></script>
	
	<c:import url="part/navbar.jsp"></c:import>
	
	<div class="board">
		<div class="container board-padding">
			<div class="row margin-top30">
				<div class="hide-on-med-and-up col s12">
					<a class="waves-effect waves-light btn display-inline left" onclick="window.history.back()"><i class="mdi-hardware-keyboard-backspace left"></i>back</a>
				</div>
				<div>
					<h3 id="name" class="display-inline margin-top30">${name}</h3>
					<div class="hide-on-small-only display-inline">
						<a class="waves-effect waves-light btn display-inline right" onclick="window.history.back()"><i class="mdi-hardware-keyboard-backspace left"></i>back</a>
					</div>
				</div>
				<p id="specialization" class="flow-text">
					${specialization}
				</p>
				<div id="city" class="flow-text">
					${city}
				</div>
				<div id="hospital" class="flow-text">
					${hospital}
				</div>
			</div>
			
			<div class="row">
				
				<div class="col s12">
					<ul class="tabs">
						<li class="tab col s3"><a class="active" href="#appointments">Appointments</a></li>
						<li class="tab col s3"><a href="#feedbacks">Feedbacks</a></li>
					</ul>
				</div>
				
				<div id="appointments" class="col s12">
					<div class="row">
						<div class="card-panel margin-top30">
							<form action="doctor_profile?did=1&" method="GET">
								<input name="did" class="hide-on-small-only hide-on-med-and-up" value="<%=request.getParameter("did")%>"/>
								<div class="flow-text display-inline">
									Check Schedules On : 
								</div>
								<button class="waves-effect waves-light btn blue left-margin10">Check</button>
								<input name="date" type="date" class="datepicker center" placeholder="Pick A Date" value='<c:if test="${param.date!=null}">${param.date}</c:if>'/>
							</form>
							<div class="row">
								<table class="hoverable bordered centered col m6 s12">
									<thead>
										<tr>
											<th data-field="time" colspan="2">AM</th>
										</tr>
									</thead>
									<thead>
										<tr>
											<th data-field="time">Time</th>
											<th data-field="appointed">Available?</th>
										</tr>
									</thead>
									<tbody id="AMschedule">
									</tbody>
								</table>
								<table class="hoverable bordered centered col m6 s12">
									<thead>
										<tr>
											<th data-field="time" colspan="2">PM</th>
										</tr>
									</thead>
									<thead>
										<tr>
											<th data-field="time">Time</th>
											<th data-field="appointed">Available?</th>
										</tr>
									</thead>
									<tbody id="PMschedule">
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<div class="row">
						<span class="right">
							<a class="waves-effect waves-light btn red modal-trigger" href="#cancel_appointment_modal">Cancel Appointment</a>
							<a class="waves-effect waves-light btn green modal-trigger" href="#schedule_appointment_modal">Schedule Appointment</a>
						</span>
					</div>
				</div>
				
				<div id="feedbacks" class="col s12">
				
					<div class="row">
						<div class="card-panel margin-top30">
							<a class="waves-effect waves-light btn blue modal-trigger right " href="#give_feedback_modal">Give Feedback</a>
							<div class="flow-text">
								Feedbacks
							</div>
							<div class="row margin-top30">
								<table class="hoverable bordered col s12">
									<tbody>
										<tr>
											<td class="container">
												<div>
													<div class="flow-text">
														test
													</div>
													<div>
														a
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td class="container">
												<div>
													<div class="flow-text">
														test
													</div>
													<div>
														Lorem ipsum dolor sit amet, porro clita imperdiet id pri. Ne mea prima antiopam, ut vis enim doming voluptua. Nihil inimicus ut eam, oratio latine mei in, ut purto inciderint vim.
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row center">
								<ul class="pagination col s12 center-align" style="width: auto">
									<li class="disabled"><a href="#!"><i class="mdi-navigation-chevron-left"></i></a></li>
									<li class="active"><a href="#!">1</a></li>
									<li class="waves-effect"><a href="#!">2</a></li>
									<li class="waves-effect"><a href="#!">3</a></li>
									<li class="waves-effect"><a href="#!">4</a></li>
									<li class="waves-effect"><a href="#!">5</a></li>
									<li class="waves-effect"><a href="#!"><i class="mdi-navigation-chevron-right"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
	
	<c:import url="part/footer.jsp"></c:import>
	
	<div id="give_feedback_modal" class="modal">
		<div class="modal-content">
			<h4>Feedback</h4>
			<div class="input-field col s12 margin-top30">
				<textarea id="textarea1" class="materialize-textarea"></textarea>
				<label for="textarea1">Feedback here</label>
			  </div>
		</div>
		<div class="modal-footer">
			<a class="waves-effect waves-green btn-flat modal-action modal-close">Submit</a>
			<a class="waves-effect waves-teal btn-flat modal-action modal-close">Cancel</a>
		</div>
	</div>
	
	<div id="cancel_appointment_modal" class="modal">
		<div class="modal-content">
			<h4>Cancel Appointment</h4>
			<p>You really want to cancel your appointment?</p>
		</div>
		<div class="modal-footer">
			<a class="waves-effect waves-green btn-flat modal-action modal-close">Agree</a>
			<a class="waves-effect waves-teal btn-flat modal-action modal-close">Disagree</a>
		</div>
	</div>
	
	<div id="schedule_appointment_modal" class="modal modal-fixed-footer">
		<div class="modal-content">
			<h4>Schedule An Appointment</h4>
			<div class="flow-text margin-top30">Choose Your Appointment Time : </div>
			<div class="row margin-top10">
				<div class="margin-top15 col m6 s12">
					<input class="with-gap" name="group3" type="radio" id="test1" checked />
					<label for="test1">8:00AM</label>
				</div>
				<div class="margin-top15 col m6 s12">
					<input class="with-gap" name="group3" type="radio" id="test2" checked />
					<label for="test2">9:00AM</label>
				</div>
				<div class="margin-top15 col m6 s12">
					<input class="with-gap" name="group3" type="radio" id="test3" checked />
					<label for="test3">10:00AM</label>
				</div>
				<div class="margin-top15 col m6 s12">
					<input class="with-gap" name="group3" type="radio" id="test4" checked />
					<label for="test4">12:00PM</label>
				</div>
				<div class="margin-top15 col m6 s12">
					<input class="with-gap" name="group3" type="radio" id="test5" checked />
					<label for="test5">1:00PM</label>
				</div>
				<div class="margin-top15 col m6 s12">
					<input class="with-gap" name="group3" type="radio" id="test6" checked />
					<label for="test6">2:00PM</label>
				</div>
				<div class="margin-top15 col m6 s12">
					<input class="with-gap" name="group3" type="radio" id="test7" checked />
					<label for="test7">3:00PM</label>
				</div>					
				<div class="margin-top15 col m6 s12">
					<input class="with-gap" name="group3" type="radio" id="test8" checked />
					<label for="test8">4:00PM</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a class="waves-effect waves-green btn-flat modal-action modal-close">Schedule</a>
			<a class="waves-effect waves-teal btn-flat modal-action modal-close">Cancel</a>
		</div>
	</div>
	
</body>

	<script>

		$(document).ready(function(){
			
			$('select').material_select();
			$('ul.tabs').tabs();
			$('ul.tabs').tabs('select_tab', 'tab_id');
			$('.collapsible').collapsible({
				accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
			});
			
			$('.datepicker').pickadate({
				selectMonths: false, // Creates a dropdown to control month
				selectYears: 15 // Creates a dropdown of 15 years to control year
			});
	
			$('a[href^="#"]').on('click',function (e) {
				e.preventDefault();

				var target = this.hash;
				var $target = $(target);

				$('html, body').stop().animate({
					'scrollTop': $target.offset().top
				}, 600, 'swing', function () {
					window.location.hash = target;
				});
			});
			
			var schedule = $("#AMschedule");
			
			schedule.append("<tr><td>8:00AM</td><td class='green white-text'>YES</td></tr>");
			schedule.append("<tr><td>9:00AM</td><td class='green white-text'>YES</td></tr>");
			schedule.append("<tr><td>10:00AM</td><td class='green white-text'>YES</td></tr>");
			schedule.append("<tr><td>11:00AM</td><td class='red white-text'>NO</td></tr>");
			schedule.append("<tr><td>12:00PM</td><td class='green white-text'>YES</td></tr>");
			
			var schedule = $("#PMschedule");
			
			schedule.append("<tr><td>1:00PM</td><td class='red white-text'>NO</td></tr>");
			schedule.append("<tr><td>2:00PM</td><td class='green white-text'>YES</td></tr>");
			schedule.append("<tr><td>3:00PM</td><td class='green white-text'>YES</td></tr>");
			schedule.append("<tr><td>4:00PM</td><td class='green white-text'>YES</td></tr>");
			schedule.append("<tr><td>5:00PM</td><td class='red white-text'>NO</td></tr>");
			
			$('.modal-trigger').leanModal();
			
		});
		
		
	</script>

</html>