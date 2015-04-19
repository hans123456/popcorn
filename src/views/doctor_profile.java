package views;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.appointments.AppointmentsDAO;
import models.doctor.Doctor;
import models.doctor.DoctorInfoDAO;
import models.doctor.Time;
import models.feedback.FeedbackDAO;
import models.user.User;
import utilities.DateParser;
import enums.doctor_info_enum;

/**
 * Servlet implementation class doctor_profile
 */
@WebServlet("/doctor_profile")
public class doctor_profile extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public doctor_profile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int did = 0;
		User user = (User) request.getSession().getAttribute("user");
		
		try{
			did = Integer.parseInt(request.getParameter("did"));
		}catch(NumberFormatException e){
		}
		
		if(user!=null){
			if(user.isDoctor() && did==0){
				did = user.getDoctorId();
			}
		}
		
		if(did==0){
			
			request.getRequestDispatcher("/view_doctors").forward(request, response);
			
		}else {
			
			//idk
			FeedbackDAO feedbackDao = new FeedbackDAO();
			request.setAttribute("feedbacks", feedbackDao.getFeedbacksofDoctor(did));

			int page = 1;
			int recordsPerPage = 5;
			if(request.getParameter("page") != null){
				try{
					page = Integer.parseInt(request.getParameter("page"));
				}catch(NumberFormatException e){
							
				}
			}
					
			int noOfRecords = feedbackDao.getNoOfRecords();
			int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
				
			if(noOfPages<page)
				page = noOfPages;
					
			request.setAttribute("noOfPages", noOfPages);
			request.setAttribute("currentPage", page);
			//idk
			
			DoctorInfoDAO dao = new DoctorInfoDAO();
			Doctor doctor = dao.getDoctorInfo(did);
			
			if(user!=null){
				if(did==user.getDoctorId()){
					request.setAttribute("doc", true);
				}else {
					request.setAttribute("doc", false);
				}
			}else {
				request.setAttribute("doc", false);
			}
			
			if(doctor==null){
				request.getRequestDispatcher("/view_doctors").forward(request, response);
				
			}else{
				
				for(doctor_info_enum i : doctor_info_enum.values()){
					request.setAttribute(i.toString(), doctor.getInformation(i.toString()));
				}
				
				String date = DateParser.parseDateForDatabase(request.getParameter("date"));
				List<Time> times = dao.getAvailableTimes(date, doctor.getId());
				
				request.setAttribute("times", times);
				
				AppointmentsDAO dao2 = new AppointmentsDAO();
				if(user != null && user.getDoctorId() == did){
					request.setAttribute("appointments", dao2.getAppointmentsForDoctor(date, did));
				} else if(user != null) {
					request.setAttribute("appointments", dao2.getUserAppointmentForDoctor(date, user.getId(), did));
				}
				
				request.setAttribute("did", did);
				request.getRequestDispatcher("/WEB-INF/doctor_profile.jsp").forward(request, response);
				
			}
			
		}
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		//even not login...anyone can see doctor's feedback from other user	
		
		int did = 0;
		User user = (User) request.getSession().getAttribute("user");
		
		try{
			did = Integer.parseInt(request.getParameter("did"));
		}catch(NumberFormatException e){
		}
		
		if(user!=null){
			if(user.isDoctor() && did==0){
				did = user.getDoctorId();
			}
		}
		
		
		if(did==0){
			request.getRequestDispatcher("/view_doctors").forward(request, response);
		}else {
			DoctorInfoDAO dao = new DoctorInfoDAO();
			Doctor doctor = dao.getDoctorInfo(did);
			
			if(user!=null){
				if(did==user.getDoctorId()){
					request.setAttribute("doc", true);
				}else {
					request.setAttribute("doc", false);
				}
			}else {
				request.setAttribute("doc", false);
			}
			
			if(doctor==null){
				request.getRequestDispatcher("/view_doctors").forward(request, response);
			}else{
				
				for(doctor_info_enum i : doctor_info_enum.values()){
					request.setAttribute(i.toString(), doctor.getInformation(i.toString()));
				}
				
				String date = DateParser.parseDateForDatabase(request.getParameter("date"));
				System.out.println(date);
				List<Time> times = dao.getAvailableTimes(date, doctor.getId());
				
				request.setAttribute("times", times);
				
				AppointmentsDAO dao2 = new AppointmentsDAO();
				if(user != null && user.getDoctorId() == did){
					request.setAttribute("appointments", dao2.getAppointmentsForDoctor(date, did));
				} else if(user != null) {
					request.setAttribute("appointments", dao2.getUserAppointmentForDoctor(date, user.getId(), did));
				}
				
				request.setAttribute("did", did);
				request.getRequestDispatcher("/WEB-INF/doctor_profile.jsp").forward(request, response);
				
			}
			
		}
		
		
		
	}

}
