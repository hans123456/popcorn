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
<link type="text/css" rel="stylesheet" href="css/user_profile.css"  media="screen,projection"/>

<title>POPCORN</title>

</head>
<body>
	
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="js/materialize.min.js"></script>
	
	<c:import url="part/navbar.jsp"></c:import>
	
	<div class="board valign-wrapper">
		<div class="container valign">
			<div class="board-padding col s12 ">
				<div class="row description">
					<div class="hide-on-med-and-up col s12">
						<a class="waves-effect waves-light btn display-inline left" onclick="window.history.back()"><i class="mdi-hardware-keyboard-backspace left"></i>back</a>
					</div>
					<div>
						<h3 id="name" class="display-inline margin-top30">${name}</h3>
						<div class="hide-on-small-only display-inline">
							<a class="waves-effect waves-light btn display-inline right" onclick="window.history.back()"><i class="mdi-hardware-keyboard-backspace left"></i>back</a>
						</div>
					</div>
					<h4>
						<strong id="user_name">
							<c:if test="${appointee==null}">${user.getInformation("name")}</c:if>
							<c:if test="${appointee!=null}">${appointee.getInformation("name")}</c:if>
						</strong>
					</h4>
					<div class="grey-text">
						<h5 id="user_gender_age">
							<c:if test="${appointee==null}">${user.getInformation("gender")}, ${user.getInformation("birthdate")}</c:if>
							<c:if test="${appointee!=null}">${appointee.getInformation("gender")}, ${appointee.getInformation("birthdate")}</c:if>
						</h5>
					</div>
					<div class="sub-description">
						<div class="grey-text">
							<h5 id="user_contact">
							<c:if test="${appointee==null}">${user.getInformation("contact")}</c:if>
							<c:if test="${appointee!=null}">${appointee.getInformation("contact")}</c:if>
							</h5>
						</div>
					</div>
				</div>
				
				<c:if test="${appointee==null}">
				
				<div class="row">
					<p class="flow-text">
						<strong>
							Upcoming Appointments
						</strong>
					</p>
					<div class="card-panel">
						<div class="row">
							<table class="hoverable center-align centered bordered">
								<thead>
									<tr>
										<th data-field="id">Name</th>
										<th data-field="name">Date</th>
										<th data-field="price">Time</th>
									</tr>
								</thead>
								<tbody id="list_of_appointments">
									<c:forEach var="appointment" items="${appointments}">
										<tr onclick="location.href='doctor_profile?did=${appointment.getDoctorId()}'">											
										    <td>${appointment.getDoctorName()}</td>
										    <td>${appointment.getDate()}</td>
										    <td>${appointment.getTime()}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							<div class="row center">
								<ul class="pagination col s12 center-align" style="width: auto">
								
									<c:if test="${currentPageAppointment == null || currentPageAppointment == 1}">
										<li class="disabled"><i class="mdi-navigation-chevron-left"></i></li>
									</c:if>
									<c:if test="${currentPageAppointment > 1}">
										<li class="waves-effect"><a href="user_profile?page=${currentPageAppointment - 1}${parameter}"><i class="mdi-navigation-chevron-left"></i></a></li>
									</c:if>
									
									<c:forEach begin="1" end="${noOfPagesAppointment}" var="i">
						                <c:choose>
						                    <c:when test="${currentPageAppointment eq i}">
						                    	<li class="active">${i}</li>
						                    </c:when>
						                    <c:otherwise>
						                    	<li class="waves-effect"><a href="user_profile?page=${i}${parameter}">${i}</a></li>
						                    </c:otherwise>
						                </c:choose>
						            </c:forEach>
						            
						            <c:if test="${currentPageAppointment lt noOfPagesAppointment}">
										<li class="waves-effect"><a href="user_profile?page=${currentPageAppointment + 1}${parameter}"><i class="mdi-navigation-chevron-right"></i></a></li>
									</c:if>
									<c:if test="${currentPageAppointment ge noOfPagesAppointment}">
										<li class="disabled"><i class="mdi-navigation-chevron-right"></i></li>
									</c:if>
									
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<p class="flow-text">
						<strong>
							Cancelled Appointments
						</strong>
					</p>
					<div class="card-panel">
						<div class="row">
							<table class="hoverable center-align centered bordered">
								<thead>
									<tr>
										<th data-field="id">Name</th>
										<th data-field="name">Date</th>
										<th data-field="price">Time</th>
										<th data-field="price">Reason</th>
									</tr>
								</thead>
								<tbody id="list_of_appointments">
									<c:forEach var="cancelled_appointment" items="${cancelled_appointments}">
										<tr onclick="location.href='doctor_profile?did=${cancelled_appointment.getDoctorId()}'">											
										    <td>${cancelled_appointment.getDoctorName()}</td>
										    <td>${cancelled_appointment.getDate()}</td>
										    <td>${cancelled_appointment.getTime()}</td>
										    <td>${cancelled_appointment.getReason()}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="row center">
								<ul class="pagination col s12 center-align" style="width: auto">
								
									<c:if test="${currentPageCancelled == 1 || currentPageCancelled == null}">
										<li class="disabled"><i class="mdi-navigation-chevron-left"></i></li>
									</c:if>
									<c:if test="${currentPageCancelled != 1}">
										<li class="disabled"><a href="user_profile?page=${currentPageCancelled - 1}${parameter}"><i class="mdi-navigation-chevron-left"></i></a></li>
									</c:if>
									
									<c:forEach begin="1" end="${noOfPagesCancelled}" var="i">
						                <c:choose>
						                    <c:when test="${currentPageCancelled eq i}">
						                    	<li class="active">${i}</li>
						                    </c:when>
						                    <c:otherwise>
						                    	<li class="waves-effect"><a href="user_profile?page=${i}${parameter}">${i}</a></li>
						                    </c:otherwise>
						                </c:choose>
						            </c:forEach>
						            
						            <c:if test="${currentPageCancelled lt noOfPagesCancelled}">
										<li class="waves-effect"><a href="user_profile?page=${currentPageCancelled + 1}${parameter}"><i class="mdi-navigation-chevron-right"></i></a></li>
									</c:if>
									<c:if test="${currentPageCancelled ge noOfPagesCancelled}">
										<li class="disabled"><i class="mdi-navigation-chevron-right"></i></li>
									</c:if>
									
								</ul>
							</div>
						</div>
					</div>
				</div>
				
				
				</c:if>
				
			</div>
		</div>
	</div>
	
	<c:import url="part/footer.jsp"></c:import>
	
</body>

</html>