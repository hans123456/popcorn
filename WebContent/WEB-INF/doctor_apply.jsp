<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	
	<div class="navbar-fixed">
		<nav>
			<div class="nav-wrapper">
				<a href="index#Home" class="brand-logo">POPCORN</a>
				<a href="#" data-activates="mobile-demo" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
				<ul class="right hide-on-med-and-down">
					<li><a href="index#Home">Home</a></li>
					<li><a href="index#About">About</a></li>
					<li><a href="view_doctors">View Doctors</a></li>
					<li><a href="index#Login">Login</a></li>
					<li><a href="index#Register">Register</a></li>
				</ul>
				<ul class="side-nav" id="mobile-demo">
					<li><a href="index#Home">Home</a></li>
					<li><a href="index#About">About</a></li>
					<li><a href="view_doctors">View Doctors</a></li>
					<li><a href="index#Login">Login</a></li>
					<li><a href="index#Register">Register</a></li>
				</ul>
			</div>
		</nav>
	</div>
	
	<div id="Apply" class="board valign-wrapper">
		<div class="container valign">
			<div class="left-align board-padding col s12 ">
				<h2 class="board-header">Doctor Application</h2>
				<p class="flow-text">We'll get in touch with you ...</p>
				<div class="row">
				<form class="col s12">
					<div class="row">
						<div class="input-field col m6 s12">
							<input id="first_name" type="text" class="validate">
							<label for="first_name">First Name</label>
						</div>
						<div class="input-field col m6 s12">
							<input id="last_name" type="text" class="validate">
							<label for="last_name">Last Name</label>
						</div>
						<div class="input-field col m6 s12">
							<input id="email" type="email" class="validate">
							<label for="email">Email</label>
						</div>
						<div class="input-field col m6 s12">
							<input id="contact-number" type="text" class="validate">
							<label for="contact-number">Contact Number</label>
						</div>
					</div>
					<div class="right-align">
						<a class="waves-effect waves-light btn btn-top-margin"><i class="mdi-content-send right"></i>Continue</a>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
	
	<footer class="page-footer">
         <div class="container">
           <div class="row">
             <div class="col l6 s12">
               <h5 class="white-text">POPCORN</h5>
               <p class="grey-text text-lighten-4">Lorem ipsum dolor sit amet, porro clita imperdiet id pri. Ne mea prima antiopam, ut vis enim doming voluptua. Nihil inimicus ut eam, oratio latine mei in, ut purto inciderint vim.</p>
             </div>
             <div class="col l4 offset-l2 s12">
               <h5 class="white-text">Links</h5>
               <ul>
                 <li><a class="grey-text text-lighten-3" href="index#Home">Home</a></li>
                 <li><a class="grey-text text-lighten-3" href="index#About">About</a></li>
                 <li><a class="grey-text text-lighten-3" href="view_doctors">View Doctors</a></li>
                 <li><a class="grey-text text-lighten-3" href="index#Login">Login</a></li>
                 <li><a class="grey-text text-lighten-3" href="index#Register">Register</a></li>
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
	
</body>
</html>