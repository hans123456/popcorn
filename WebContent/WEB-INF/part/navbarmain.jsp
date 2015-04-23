<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav id="navbar" class="navbarmain-trans" style="box-shadow : 0px 0px 0px;">
	<div class="nav-wrapper">	
		<a href="index#Home" name="nav-text" class="brand-logo black-text">Senpai</a>
		<a href="#" data-activates="mobile-demo" id="nav-burger" class="button-collapse grey-text text-darken-2"><i class="mdi-navigation-menu"></i></a>
		<ul class="right hide-on-med-and-down">
			<li><a href="index#Home" name="nav-text" class="black-text">Home</a></li>
			<li><a href="index#About" name="nav-text" class="black-text">About</a></li>
			<li><a href="view_doctors" name="nav-text" class="black-text">View Doctors</a></li>
			<c:if test="${sessionScope.user==null}">
				<li><a href="index#Login" name="nav-text" class="black-text">Login</a></li>
				<li><a href="index#Register" name="nav-text" class="black-text">Register</a></li>
			</c:if>
			<c:if test="${sessionScope.user!=null}">
				<c:if test="${sessionScope.user.isDoctor()==true}">
					<li><a href="doctor_profile" name="nav-text" class="black-text">Doctor Profile</a></li>
				</c:if>
				<li><a href="user_profile" name="nav-text" class="black-text">User Profile</a></li>
				<li><a href="logout" name="nav-text" class="black-text">Logout</a></li>
			</c:if>
		</ul>
		<ul class="side-nav" id="mobile-demo">
			<li><a href="index#Home">Home</a></li>
			<li><a href="index#About">About</a></li>
			<li><a href="view_doctors">View Doctors</a></li>
			<c:if test="${sessionScope.user==null}">
					<li><a href="index#Login">Login</a></li>
					<li><a href="index#Register">Register</a></li>
				</c:if>
				<c:if test="${sessionScope.user!=null}">
					<c:if test="${sessionScope.user.isDoctor()==true}">
						<li><a href="doctor_profile">Doctor Profile</a></li>
					</c:if>
					<li><a href="user_profile">User Profile</a></li>
					<li><a href="logout">Logout</a></li>
				</c:if>
			</ul>
		</div>
	</nav>

<script>

	$(document).ready(function(){
	
		$('.slider').slider({full_width: true});
		$('.button-collapse').sideNav({menuWidth: 240, activationWidth: 70});
	
	});

</script>