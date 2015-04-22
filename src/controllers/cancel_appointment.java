package controllers;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.appointments.AppointmentsDAO;
import models.doctor.DoctorApplyDAO;
import models.user.User;
import models.user.UserDAO;

/**
 * Servlet implementation class cancel_appointment
 */
@WebServlet("/cancel_appointment")
public class cancel_appointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String invalid = "invalid";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext sc = request.getServletContext();
		
		String apid = request.getParameter("apid");
		String did = request.getParameter("did");
		String reason = request.getParameter("reason");
		int apidint = 0;
		
		try{
			apidint = Integer.parseInt(apid);
		}catch(NumberFormatException e){
		}
		
		//System.out.println(apid);
		
		User user = (User) request.getSession().getAttribute("user");
		
		if (reason == null && !user.isDoctor()) {
			reason = "I cancelled it.";
		} else if (reason == null && user.isDoctor()) {
			reason = "Doctor cancelled it with unknown reason";
		}
		
		
		if(apidint==0){
			response.sendRedirect("doctor_profile?did="+did);
		}
		else{
			AppointmentsDAO appointmentDao = new AppointmentsDAO();

			if(appointmentDao.deleteAppointment(apidint, reason)){
				response.sendRedirect("success#Success");
			} else{
				response.sendRedirect("doctor_profile?did="+did);
			}
		}
			
				
	}
		
}
