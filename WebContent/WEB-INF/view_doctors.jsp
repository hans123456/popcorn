<%@page import="models.doctor.DoctorInfoDAO"%>
<%@page import="enums.doctor_info_short_enum"%>
<%@ page import="enums.filters_enum" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>

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
<link type="text/css" rel="stylesheet" href="css/view_doctors.css"  media="screen,projection"/>

<title>POPCORN</title>
		
</head>
<body>
	
	<!--Import jQuery before materialize.js-->
	<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="js/materialize.min.js"></script>
	
	<c:import url="part/navbar.jsp"></c:import>
	
	<form action="view_doctors" method="GET">
	
	<div class="board">
		<div class="container custom-container row center-align board-padding">
			<div class="center-align col s12">
				<div class="col l3 hide-on-med-and-down">
					<div class="card">
						<div class="card-content">
							<p class="flow-text">Search</p>
							<div class="input-field">
								<input id="search" type="text" class="validate" name="search">
								<label for="search">Doctor's Name (any)</label>
							</div>
							<div class="right-align">
								<button type="submit" class="waves-effect waves-light btn white-text">Search</button>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-content">
							<p class="flow-text">Filters</p>
							<select id="specialization_selector" name="specialization" onchange="this.form.submit()">
								<option value="" disabled selected>Specialization</option>
								<option value="0">None</option>
								<c:forEach items="${specializations}" var="specialization">
							        <option value="${specialization.getId()}">${specialization.getName()}</option>
							    </c:forEach>
							</select>
							<select id="city_selector" name="city" onchange="this.form.submit()">
								<option value="" disabled selected>City</option>
								<option value="0">None</option>
								<c:forEach items="${cities}" var="city">
							        <option value="${city.getId()}">${city.getName()}</option>
							    </c:forEach>
							</select>
							<select id="hospital_selector" name="hospital" onchange="this.form.submit()">
								<option value="" disabled selected>Hospital</option>
								<option value="0">None</option>
								<c:forEach items="${hospitals}" var="hospital">
							        <option value="${hospital.getId()}">${hospital.getName()}</option>
							    </c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="col l9 s12 list">
					<div class="row">
						<div class="col s12 hide-on-large-only">
							<ul class="collapsible" data-collapsible="accordion">
								<li>
									<div class="collapsible-header"><i class="mdi-action-search"></i>Search</div>
									<div class="collapsible-body"></div>
								</li>
								<li>
									<div class="collapsible-header"><i class="mdi-content-filter-list"></i>Filters</div>
									<div class="collapsible-body">
										<div class="filter-small">
											<div class="row">
												<div class="col s12 m4">
													<select id="specialization_selector" name="specialization" onchange="this.form.submit()">
														<option value="" disabled selected>Specialization</option>
														<option value="0">None</option>
														<c:forEach items="${specializations}" var="specialization">
													        <option value="${specialization.getId()}">${specialization.getName()}</option>
													    </c:forEach>
													</select>
												</div>
												<div class="col s12 m4">
													<select id="city_selector" name="city" onchange="this.form.submit()">
														<option value="" disabled selected>City</option>
														<option value="0">None</option>
														<c:forEach items="${cities}" var="city">
													        <option value="${city.getId()}">${city.getName()}</option>
													    </c:forEach>
													</select>
												</div>
												<div class="col s12 m4">
													<select id="hospital_selector" name="hospital" onchange="this.form.submit()">
														<option value="" disabled selected>Hospital</option>
														<option value="0">None</option>
														<c:forEach items="${hospitals}" var="hospital">
													        <option value="${hospital.getId()}">${hospital.getName()}</option>
													    </c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<div class="col s12">
							<div class="card-panel">
								<div class="row">
									<div class="col s12">
										<table class="hoverable center-align centered bordered">
											<thead>
												<tr>
													<th data-field="id">Name</th>
													<th data-field="name">Location</th>
													<th data-field="price">Specialization</th>
												</tr>
											</thead>
											<tbody id="list_of_doctors">
												<c:forEach var="doctor" items="${doctorsList}">
													<tr onclick="location.href='doctor_profile?did=${doctor.getId()}'">
														<c:forEach items="<%=doctor_info_short_enum.values()%>" var="entry">
														    <td>${doctor.getInformation(entry.toString())}</td>
														</c:forEach>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row center">
									<ul class="pagination col s12 center-align" style="width: auto">
									
										<c:if test="${currentPage le 1 || currentPage eq null}">
											<li class="disabled"><i class="mdi-navigation-chevron-left"></i></li>
										</c:if>
										<c:if test="${currentPage gt 1 && currentPage le noOfPages}">
											<li class="waves-effect"><a href="view_doctors?page=${currentPage - 1}${parameter}"><i class="mdi-navigation-chevron-left"></i></a></li>
										</c:if>
										
										<c:forEach begin="1" end="${noOfPages}" var="i">
							                <c:choose>
							                    <c:when test="${currentPage eq i}">
							                    	<li class="active">${i}</li>
							                    </c:when>
							                    <c:otherwise>
							                    	<li class="waves-effect"><a href="view_doctors?page=${i}${parameter}">${i}</a></li>
							                    </c:otherwise>
							                </c:choose>
							            </c:forEach>
							            
							            <c:if test="${currentPage lt noOfPages}">
											<li class="waves-effect"><a href="view_doctors?page=${currentPage + 1}${parameter}"><i class="mdi-navigation-chevron-right"></i></a></li>
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
	</div>
	
	</form>
	
	<c:import url="part/footer.jsp"></c:import>
	
</body>

	<script>
	
		<%
			String o;
			for(filters_enum i : filters_enum.values()){
				String attr = i.toString();
				o = request.getParameter(attr);
				if(o==null || o.equals("0")){
					%>
						$("#<%=attr%>_selector option[value='']").attr('selected', true);
					<%
				}else{
					%>
						$("#<%=attr%>_selector option[value='']").attr('selected', false);
						$("#<%=attr%>_selector option[value=\"" + <%=o.toString()%>+ "\"]").attr('selected', true);
					<%
				}
			}
			
			o = request.getParameter("search");
			
			if(o!=null){
				%>
					$("#search").val("<%=o%>");
				<%
			}
		%>
	
		$(document).ready(function(){
		
			$('select').material_select();
			$('.collapsible').collapsible({
				accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
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
			
		});
	
	</script>
	
</html>