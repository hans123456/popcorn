<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<footer class="page-footer" style="margin-top:0px">
	<div class="container">
		<div class="row">
			<div class="col l6 s12">
				<h5 href="index#Home" class="white-text">Senpai</h5>
				<p class="grey-text text-lighten-4">An online doctor appointment system for the WEBAPPS of Chua, Cu and Paguiligan.</p>
			</div>
			<div class="col l4 offset-l2 s12">
				<h5 class="white-text">Links</h5>
				<ul>
					<li><a href="index#Home" class="white-text">Home</a></li>
					<li><a href="view_doctors" class="white-text">View Doctors</a></li>
					<li><a href="index#About" class="white-text">About</a></li>
					
					<c:if test="${sessionScope.user==null}">
						<li><a href="index#Login" class="white-text">Login</a></li>
						<li><a href="index#Register" class="white-text">Register</a></li>
					</c:if>
					<c:if test="${sessionScope.user!=null}">
						<c:if test="${sessionScope.user.isDoctor()==true}">
							<li><a href="doctor_profile" class="white-text">Doctor Profile</a></li>
						</c:if>
						<li><a href="user_profile" class="white-text">User Profile</a></li>
						<li><a href="logout" class="white-text">Logout</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="footer-copyright">
		<div class="container">
			&copy; 2015 Copyright Text
		</div>
	</div>
</footer>