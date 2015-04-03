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
					<h4>
						<strong id="user_name">
							John Carlo De Guzman
						</strong>
					</h4>
					<div class="grey-text">
						<h5 id="user_gender_age">
							Male, 19
						</h5>
					</div>
					<div class="sub-description">
						<div class="grey-text">
							<h5 id="user_contact">
								0915 1111 111
							</h5>
						</div>
						<div class="grey-text">
							<h5 id="user_address">
								DLSU Manila
							</h5>
						</div>
					</div>
				</div>
				<div class="row">
					<p class="flow-text">
						<strong>
							Current Medications
						</strong>
					</p>
					<div class="card-panel">
						<table class="left-align hoverable bordered">
							<tbody>
								<tr>
									<td>Multi-Vitamins</td>
								</tr>
								<tr>
									<td>Something</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<p class="flow-text">
						<strong>
							Previous Hospitalizations
						</strong>
					</p>
					<div class="card-panel">
						<div class="row">
							<table class="center-align centered hoverable bordered">
								<thead>
									<tr>
										<th data-field="sickness">Sickness</th>
										<th data-field="date">Date</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Something</td>
										<td>March 13, 2015</td>
									</tr>
									<tr>
										<td>Something</td>
										<td>March 13, 2015</td>
									</tr>
								</tbody>
							</table>
							<ul class="pagination col s12 center-align" style="width: auto">
								<li class="disabled"><a href="#!"><i class="mdi-navigation-chevron-left"></i></a></li>
								<li class="active"><a href="#!">1</a></li>
								<li class="disabled"><a href="#!"><i class="mdi-navigation-chevron-right"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
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
										<th data-field="name">Name</th>
										<th data-field="date">Date</th>
										<th data-field="time">Time</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Alvin</td>
										<td>March 13, 2015</td>
										<td>01:00 PM</td>
									</tr>
									<tr>
										<td>Alan</td>
										<td>March 13, 2015</td>
										<td>02:00 PM</td>
									</tr>
									<tr>
										<td>Jonathan</td>
										<td>March 13, 2015</td>
										<td>03:00 PM</td>
									</tr>
									<tr>
										<td>Jonathan</td>
										<td>March 13, 2015</td>
										<td>04:00 PM</td>
									</tr>
									<tr>
										<td>Jonathan</td>
										<td>March 13, 2015</td>
										<td>05:00 PM</td>
									</tr>
								</tbody>
							</table>
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
	
	<c:import url="part/footer.jsp"></c:import>
	
</body>

</html>