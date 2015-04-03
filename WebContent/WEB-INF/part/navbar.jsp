<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<div class="navbar-fixed">
	<nav>
		<div class="nav-wrapper">
			<a href="index#Home" class="brand-logo">POPCORN</a>
			<a href="#" data-activates="mobile-demo" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
			<ul class="right hide-on-med-and-down">
				<li><a href="index#Home">Home</a></li>
				<li><a href="index#About">About</a></li>
				<li><a href="view_doctors">View Doctors</a></li>
				<c:if test="${user==null}">
					<li><a class="grey-text text-lighten-3" href="index#Login">Login</a></li>
					<li><a class="grey-text text-lighten-3" href="index#Register">Register</a></li>
				</c:if>
				<c:if test="${user!=null}">
					<li><a class="grey-text text-lighten-3" href="doctor_profile">Doctor Profile</a></li>
					<li><a class="grey-text text-lighten-3" href="user_profile">User Profile</a></li>
				</c:if>
			</ul>
			<ul class="side-nav" id="mobile-demo">
				<li><a href="#Home">Home</a></li>
				<li><a href="#About">About</a></li>
				<li><a href="view_doctors">View Doctors</a></li>
				<c:if test="${user==null}">
					<li><a class="black-text text-lighten-3" href="#Login">Login</a></li>
					<li><a class="black-text text-lighten-3" href="#Register">Register</a></li>
				</c:if>
				<c:if test="${user!=null}">
					<li><a class="black-text text-lighten-3" href="doctor_profile">Doctor Profile</a></li>
					<li><a class="black-text text-lighten-3" href="user_profile">User Profile</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
</div>

<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
	
<script>

	$(document).ready(function(){
	
		$('.slider').slider({full_width: true});
		$('.button-collapse').sideNav({menuWidth: 240, activationWidth: 70});
	
	});

</script>