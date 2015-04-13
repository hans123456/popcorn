package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.appointments.AppointmentsDAO;
import models.user.User;

/**
 * Servlet implementation class schedule_appointment
 */
@WebServlet("/schedule_appointment")
public class schedule_appointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public schedule_appointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String doctor_id = request.getParameter("did");
		
		User user = (User) request.getSession().getAttribute("user");
		
		if(user==null){
			request.setAttribute("invalid", "Please Login");
			request.getRequestDispatcher("doctor_profile").forward(request, response);
			return;
		}
		
		int uid = user.getId();
		int did, time_id;
		
		try{
			
			time_id = Integer.parseInt(time);
			did = Integer.parseInt(doctor_id);
			boolean result = AppointmentsDAO.addAppointment(date, time_id, uid, did);
			
			System.out.println(result);
			
			if(result){
				request.setAttribute("invalid", "Success");
				request.getRequestDispatcher("doctor_profile").forward(request, response);
			}else {
				request.setAttribute("invalid", "Someone already took the time");
				request.getRequestDispatcher("doctor_profile").forward(request, response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			request.getRequestDispatcher("doctor_profile").forward(request, response);
		}
		
	}

}
