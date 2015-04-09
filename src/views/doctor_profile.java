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
		
		try{
			did = Integer.parseInt(request.getParameter("did"));
		}catch(NumberFormatException e){
		}
		
		if(did==0){
			request.getRequestDispatcher("/view_doctors").forward(request, response);
		}else {
			DoctorInfoDAO dao = new DoctorInfoDAO();
			Doctor doctor = dao.getDoctorInfo(did);
			
			if(doctor==null){
				request.getRequestDispatcher("/view_doctors").forward(request, response);
			}else{
				
				for(doctor_info_enum i : doctor_info_enum.values()){
					request.setAttribute(i.toString(), doctor.getInformation(i.toString()));
				}
				
				String date = DateParser.parseDateForDatabase(request.getParameter("date"));
				List<Integer> times = dao.getAvailableTimes(date, doctor.getId());
				
				request.setAttribute("times", times);
				
				User user = (User) request.getSession().getAttribute("user");
				
				if(user!=null){
					AppointmentsDAO dao2 = new AppointmentsDAO();
					request.setAttribute("appointments", dao2.getUserAppointmentForDoctor(date, user.getId(), did));
				}
				
				request.getRequestDispatcher("/WEB-INF/doctor_profile.jsp").forward(request, response);
				
			}
			
		}
		
	}

}
