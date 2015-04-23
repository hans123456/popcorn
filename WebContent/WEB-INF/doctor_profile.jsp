	<%@ page import="java.util.List, models.doctor.Time" %>
	<%@ page import="java.util.List, models.appointments.*" %>
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
									<tr id="tr1"><td>8:00AM</td><td id="avail_1"></td></tr>
									<tr id="tr2"><td>9:00AM</td><td id="avail_2"></td></tr>
									<tr id="tr3"><td>10:00AM</td><td id="avail_3"></td></tr>
									<tr id="tr4"><td>11:00AM</td><td id="avail_4"></td></tr>
									<tr id="tr5"><td>12:00PM</td><td id="avail_5"></td></tr>
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
									<tr id="tr6"><td>1:00PM</td><td id="avail_6"></td></tr>
									<tr id="tr7"><td>2:00PM</td><td id="avail_7"></td></tr>
									<tr id="tr8"><td>3:00PM</td><td id="avail_8"></td></tr>
									<tr id="tr9"><td>4:00PM</td><td id="avail_9"></td></tr>
									<tr id="tr10"><td>5:00PM</td><td id="avail_10"></td></tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<c:choose>
					<c:when test="${doc==false}">
				
					<div class="row">
						<span class="right">
						
						<c:choose>
							<c:when test="${sessionScope.user!=null}">
								<a class="waves-effect waves-light btn red modal-trigger" href="#cancel_appointment_modal">Cancel Appointment</a>
								<a class="waves-effect waves-light btn green modal-trigger" href="#schedule_appointment_modal">Schedule Appointment</a>
							</c:when>
							<c:otherwise>
								<a class="waves-effect waves-light btn green" href="index#Login">Schedule Appointment</a>
							</c:otherwise>
						</c:choose>
						</span>
					</div>
				
					</c:when>
					<c:otherwise>
						<div class="row">
						<span class="right">
						
							<c:if test="${sessionScope.user!=null}">
								<a class="waves-effect waves-light btn red modal-trigger" href="#cancel_appointment_modal">Cancel Appointment</a>
							</c:if>
						</span>
					</div>
					</c:otherwise>
				</c:choose>
				
			</div>
			
			<div id="feedbacks" class="col s12">
			
				<div class="row">
					<div class="card-panel margin-top30">
						<c:if test="${doc==false}">
							<c:if test="${sessionScope.user!=null}">
							<a class="waves-effect waves-light btn blue modal-trigger right " href="#give_feedback_modal">Give Feedback</a>
							</c:if>
						</c:if>
						<div class="flow-text">
							Feedbacks
						</div>
						<div class="row top-margin30">
						<table class="hoverable center-align centered bordered">
							<thead>
								<tr>
									<th data-field="rate">Rate</th>
									<th data-field="comment">Comment</th>
								</tr>
							</thead>
							<tbody id="list_of_feedbacks">
								<c:forEach var="feedback" items="${feedbacks}">
									<tr>											
									    <td>${feedback.getRate()}</td>
									    <td>${feedback.getComment()}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="row center">
							<ul class="pagination col s12 center-align" style="width: auto">
							
								<c:if test="${currentPage == 1}">
									<li class="disabled"><i class="mdi-navigation-chevron-left"></i></li>
								</c:if>
								<c:if test="${currentPage != 1}">
									<li class="disabled"><a href="user_profile?page=${currentPage - 1}${parameter}"><i class="mdi-navigation-chevron-left"></i></a></li>
								</c:if>
								
								<c:forEach begin="1" end="${noOfPages}" var="i">
					                <c:choose>
					                    <c:when test="${currentPage eq i}">
					                    	<li class="active">${i}</li>
					                    </c:when>
					                    <c:otherwise>
					                    	<li class="waves-effect"><a href="user_profile?page=${i}${parameter}">${i}</a></li>
					                    </c:otherwise>
					                </c:choose>
					            </c:forEach>
					            
					            <c:if test="${currentPage lt noOfPages}">
									<li class="waves-effect"><a href="user_profile?page=${currentPage + 1}${parameter}"><i class="mdi-navigation-chevron-right"></i></a></li>
								</c:if>
								<c:if test="${currentPage ge noOfPages}">
									<li class="disabled"><i class="mdi-navigation-chevron-right"></i></li>
								</c:if>
								
							</ul>
						</div>
					</div>

			</div>

		</div>

	</div>
</div>

	</div>
	
	<c:import url="part/footer.jsp"></c:import>
	
	<c:if test="${doc==false}">
		
		<form action = "add_feedback" method = "POST">
			<input id="doc_id" value="${did}" name="did" class="hidden"></input>	
			<div id="give_feedback_modal" class="modal">
				<div class="modal-content">
					<h4>Feedback</h4>
					<div class="input-field col s12 margin-top30">
						<textarea id="comment" name="comment" class="materialize-textarea"></textarea>
						<label for="comment">Feedback here</label>
						<select id="rate" name="rate">
							<option value="" selected disabled>Rate</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
				</div>
				<div class="modal-footer">
					<button class="waves-effect waves-green btn-flat modal-action" type="submit">Submit</button>
					<button class="waves-effect waves-teal btn-flat modal-action modal-close">Cancel</button>
				</div>
			</div>
		</form>
		
	</c:if>
	
	<form action = "cancel_appointment" method = "POST">
	<input id="appointment_id" name="apid" class="hidden"></input>	
	<input id="doctor_id" name="did" class="hidden" value="${did}"></input>
	<div id="cancel_appointment_modal" class="modal">
		<div class="modal-content">
			<h4>Cancel Appointment</h4>
			<p>You really want to cancel your appointment?</p>
			<div class="flow-text margin-top30">Choose Your Appointment Time To Be Cancelled: </div>
			<div class="row margin-top10">
				<div class="margin-top15 col m6 s12" id="appointment_1">
					<input class="with-gap" name="time" type="radio" id="appointment1" value="1"/>
					<label for="appointment1">8:00AM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="appointment_2">
					<input class="with-gap" name="time" type="radio" id="appointment2" value="2"/>
					<label for="appointment2">9:00AM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="appointment_3">
					<input class="with-gap" name="time" type="radio" id="appointment3" value="3"/>
					<label for="appointment3">10:00AM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="appointment_4">
					<input class="with-gap" name="time" type="radio" id="appointment4" value="4"/>
					<label for="appointment4">11:00AM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="appointment_5">
					<input class="with-gap" name="time" type="radio" id="appointment5" value="5"/>
					<label for="appointment5">12:00PM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="appointment_6">
					<input class="with-gap" name="time" type="radio" id="appointment6" value="6"/>
					<label for="appointment6">1:00PM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="appointment_7">
					<input class="with-gap" name="time" type="radio" id="appointment7" value="7"/>
					<label for="appointment7">2:00PM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="appointment_8">
					<input class="with-gap" name="time" type="radio" id="appointment8" value="8"/>
					<label for="appointment8">3:00PM</label>
				</div>					
				<div class="margin-top15 col m6 s12" id="appointment_9">
					<input class="with-gap" name="time" type="radio" id="appointment9" value="9"/>
					<label for="appointment9">4:00PM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="appointment_10">
					<input class="with-gap" name="time" type="radio" id="appointment10" value="10"/>
					<label for="appointment10">5:00PM</label>
				</div>
			</div>
			<c:if test="${doc==true}">
				<div class="flow-text margin-top30">Reason: </div>
				<div class="input-field col s12 margin-top30">
					<input id="reason" name="reason" type="text" class="validate">
					<label for="reason">Reason</label>
				</div>
			</c:if>
		</div>
		<div class="modal-footer">
			<button class="waves-effect waves-green btn-flat modal-action" type="submit">Unshedule</button>
			<button class="waves-effect waves-teal btn-flat modal-action modal-close">Cancel</button>
		</div>
	</div>
	</form>
	
	<c:if test="${doc==false}">
	<form action="schedule_appointment" method="POST">
	<input name="did" value="${did}" class="hidden"></input>
	<input name="date" value="<c:if test='${param.date!=null}'>${param.date}</c:if>" class="hidden"></input>
	<div id="schedule_appointment_modal" class="modal modal-fixed-footer">
		<div class="modal-content">
			<h4>Schedule An Appointment</h4>
			<div class="flow-text margin-top30">Choose Your Appointment Time : </div>
			<div class="row margin-top10">
				<div class="margin-top15 col m6 s12" id="sched_1">
					<input class="with-gap" name="time" type="radio" id="sched1" value="1"/>
					<label for="sched1">8:00AM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="sched_2">
					<input class="with-gap" name="time" type="radio" id="sched2" value="2"/>
					<label for="sched2">9:00AM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="sched_3">
					<input class="with-gap" name="time" type="radio" id="sched3" value="3"/>
					<label for="sched3">10:00AM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="sched_4">
					<input class="with-gap" name="time" type="radio" id="sched4" value="4"/>
					<label for="sched4">11:00AM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="sched_5">
					<input class="with-gap" name="time" type="radio" id="sched5" value="5"/>
					<label for="sched5">12:00PM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="sched_6">
					<input class="with-gap" name="time" type="radio" id="sched6" value="6"/>
					<label for="sched6">1:00PM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="sched_7">
					<input class="with-gap" name="time" type="radio" id="sched7" value="7"/>
					<label for="sched7">2:00PM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="sched_8">
					<input class="with-gap" name="time" type="radio" id="sched8" value="8"/>
					<label for="sched8">3:00PM</label>
				</div>					
				<div class="margin-top15 col m6 s12" id="sched_9">
					<input class="with-gap" name="time" type="radio" id="sched9" value="9"/>
					<label for="sched9">4:00PM</label>
				</div>
				<div class="margin-top15 col m6 s12" id="sched_10">
					<input class="with-gap" name="time" type="radio" id="sched10" value="10"/>
					<label for="sched10">5:00PM</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button class="waves-effect waves-green btn-flat modal-action" type="submit">Schedule</button>
			<button class="waves-effect waves-teal btn-flat modal-action modal-close">Cancel</button>
		</div>
	</div>
	</form>
	
	</c:if>
	
	
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
				selectYears: 1, // Creates a dropdown of 15 years to control year
				min: true,
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
			
			$('.modal-trigger').leanModal();
			
			var temp = new Array();
			<%
				List<Time> times = (List<Time>) request.getAttribute("times");
				boolean doc = false;
					
					if(request.getAttribute("doc")!=null){
						doc = (Boolean) request.getAttribute("doc");
					}
					
				for(Time i : times){
			%>
					temp[<%=i.getTimeId()%>] = true;
			<%
					if(i.getAppointeeId().equals("")){
			%>
						$("#avail_"+<%=i.getTimeId()%>).toggleClass("green white-text");
						$("#avail_"+<%=i.getTimeId()%>).text("YES");
			<%	
					} else if(doc==true){
			%>
						$("#avail_"+<%=i.getTimeId()%>).toggleClass("blue white-text");
						$("#avail_"+<%=i.getTimeId()%>).text('<%=i.getAppointeeName()%>');
						$("#tr"+<%=i.getTimeId()%>).attr("onclick", "location.href='user_profile?uid=" + <%=i.getAppointeeId()%> + "'");
			<%
					} else {
			%>			
						if(<%=i.getAppointeeId()%> != "${sessionScope.user.getId()}"){
							$("#avail_"+<%=i.getTimeId()%>).toggleClass("red white-text");
							$("#avail_"+<%=i.getTimeId()%>).text("NO");
							$("#sched_"+<%=i.getTimeId()%>).remove();
						} else {
							$("#avail_"+<%=i.getTimeId()%>).toggleClass("blue white-text");
							$("#avail_"+<%=i.getTimeId()%>).text('<%=i.getAppointeeName()%>');
							$("#sched_"+<%=i.getTimeId()%>).remove();
						}
			<%
					}
				}
			%>

			for(var i=1; i<=10; i++){
				if(temp[i]==null){
					$("#avail_"+i).toggleClass("red white-text");
					$("#avail_"+i).text("NO");
					$("#sched_"+i).remove();
				}
			}
			
			<c:if test="${sessionScope.user!=null}">
			
				var appointments = new Array();
				<%
					List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
					doc = false;
						
					if(request.getAttribute("doc")!=null){
						doc = (Boolean) request.getAttribute("doc");
					}
					
					for(Appointment i : appointments){
				%>
						appointments[<%=i.getTimeId()%>] = <%=i.getId()%>+"";
						$("#appointment"+<%=i.getTimeId()%>).click(function DoTheThing(i){
																		$("#appointment_id").val("<%=i.getId()%>");
																		$("#doctor_id").val("<%=i.getDoctorId()%>");
																	});
				<%
					}
				%>
			
				for(var i=1; i<=10; i++){
					if(appointments[i]==null){
						$("#appointment_"+i).remove();
					}
				}
		</c:if>
		
		<c:if test="${invalid!=null}">
			alert("${invalid}");
		</c:if>
		
		<c:if test="${success!=null}">
			alert("Successfully ${success}");
		</c:if>
		
		});
		

		
	</script>

</html>