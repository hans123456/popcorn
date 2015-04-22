<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="navbar-fixed">
	<nav>
		<div class="nav-wrapper">
			<a class="brand-logo" href="index#Home">Senpai</a>
			<a href="#" data-activates="mobile-demo2" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
			<ul class="right hide-on-med-and-down">
				<li><a href="index#Home">Home</a></li>
				<li><a href="index#About">About</a></li>
				<li><a href="view_doctors">View Doctors</a></li>
				<c:if test="${sessionScope.user==null}">
					<li><a href="index#Login">Login</a></li>
					<li><a href="index#Register">Register</a></li>
				</c:if>
				<c:if test="${sessionScope.user!=null}">
					<c:if test="${sessionScope.user.isDoctor()==true}">
						<li><a class="grey-text text-lighten-3" href="doctor_profile">Doctor Profile</a></li>
					</c:if>
					<li><a class="grey-text text-lighten-3" href="user_profile">User Profile</a></li>
					<li><a class="grey-text text-lighten-3" href="logout">Logout</a></li>
				</c:if>
			</ul>
			<ul class="side-nav" id="mobile-demo2">
				<li><a href="index#Home">Home</a></li>
				<li><a href="index#About">About</a></li>
				<li><a href="view_doctors">View Doctors</a></li>
				<c:if test="${sessionScope.user==null}">
					<li><a href="index#Login">Login</a></li>
					<li><a href="index#Register">Register</a></li>
				</c:if>
				<c:if test="${sessionScope.user!=null}">
					<c:if test="${sessionScope.user.isDoctor()==true}">
						<li><a class="black-text text-lighten-3" href="doctor_profile">Doctor Profile</a></li>
					</c:if>
					<li><a class="black-text text-lighten-3" href="user_profile">User Profile</a></li>
					<li><a class="black-text text-lighten-3" href="logout">Logout</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
</div>

<script>

	$(document).ready(function(){
	
		$('.slider').slider({full_width: true});
		$('.button-collapse').sideNav({menuWidth: 240, activationWidth: 70});
	
	});

</script>