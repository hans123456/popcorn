<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<footer class="page-footer">
	<div class="container">
		<div class="row">
			<div class="col l6 s12">
				<h5 class="white-text">POPCORN</h5>
				<p class="grey-text text-lighten-4">An online doctor appointment system.</p>
			</div>
			<div class="col l4 offset-l2 s12">
				<h5 class="white-text">Links</h5>
				<ul>
					<li><a class="grey-text text-lighten-3" href="index#Home">Home</a></li>
					<li><a class="grey-text text-lighten-3" href="index#About">About</a></li>
					<li><a class="grey-text text-lighten-3" href="view_doctors">View Doctors</a></li>
					<c:if test="${sessionScope.user==null}">
						<li><a class="grey-text text-lighten-3" href="index#Login">Login</a></li>
						<li><a class="grey-text text-lighten-3" href="index#Register">Register</a></li>
					</c:if>
					<c:if test="${sessionScope.user!=null}">
						<c:if test="${sessionScope.user.isDoctor()==true}">
							<li><a class="grey-text text-lighten-3" href="doctor_profile">Doctor Profile</a></li>
						</c:if>
						<li><a class="grey-text text-lighten-3" href="user_profile">User Profile</a></li>
						<li><a class="grey-text text-lighten-3" href="logout">Logout</a></li>
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