package views;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.appointments.AppointmentsDAO;
import models.user.User;
import models.user.UserDAO;

/**
 * Servlet implementation class user_profile
 */
@WebServlet("/user_profile")
public class user_profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_profile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		User user = (User) request.getSession().getAttribute("user");
		String user_id = request.getParameter("uid");
		int uid = 0;
		AppointmentsDAO dao1 = new AppointmentsDAO();
		UserDAO dao2 = new UserDAO();
		
		try {
			uid = Integer.parseInt(user_id);
		}catch (Exception e){
			
		}
		
		if(user!=null){
			
			if(user.isDoctor()){
				
				boolean appointee = dao1.isAppointee(uid, user.getDoctorId());
				
				if(uid==0 || uid==user.getId()){
					AppointmentsDAO dao = new AppointmentsDAO();
					request.setAttribute("appointments", dao.getUserAppointments(user.getId()));
					request.setAttribute("cancelled_appointments", dao.getUserCanccelledAppointments(user.getId()));

					int pageCancelled = 1;
					int recordsPerPageCancelled = 5;
					if(request.getParameter("page") != null){
						try{
							pageCancelled = Integer.parseInt(request.getParameter("page"));
						}catch(NumberFormatException e){
							
						}
					}
					
					int noOfRecordsCancelled = dao.cancelledAppointmentGetNoOfRecords();
					int noOfPagesCancelled = (int) Math.ceil(noOfRecordsCancelled * 1.0 / recordsPerPageCancelled);
					
					if(noOfPagesCancelled<pageCancelled)
						pageCancelled = noOfPagesCancelled;
					
					request.setAttribute("noOfPagesCancelled", noOfPagesCancelled);
					request.setAttribute("currentPageCancelled", pageCancelled);
					
					int pageAppointment = 1;
					int recordsPerPageAppointment = 5;
					if(request.getParameter("page") != null){
						try{
							pageAppointment = Integer.parseInt(request.getParameter("page"));
						}catch(NumberFormatException e){
							
						}
					}
					
					int noOfRecordsAppointment = dao.appointmentGetNoOfRecords();
					int noOfPagesAppointment  = (int) Math.ceil(noOfRecordsAppointment  * 1.0 / recordsPerPageAppointment );
					
					if(noOfPagesAppointment <pageAppointment )
						pageAppointment  = noOfPagesAppointment ;
					
					request.setAttribute("noOfPagesAppointment ", noOfPagesAppointment );
					request.setAttribute("currentPageAppointment ", pageAppointment );
					
					request.getRequestDispatcher("/WEB-INF/user_profile.jsp").forward(request, response);
				}else if(appointee){
					request.setAttribute("appointee", dao2.getInfoForDoctor(uid));
					request.getRequestDispatcher("/WEB-INF/user_profile.jsp").forward(request, response);
				}else {
					response.sendRedirect("doctor_profile");
				}
				
			}else {
			
				AppointmentsDAO dao = new AppointmentsDAO();
				request.setAttribute("appointments", dao.getUserAppointments(user.getId()));
				request.setAttribute("cancelled_appointments", dao.getUserCanccelledAppointments(user.getId()));

				int pageCancelled = 1;
				int recordsPerPageCancelled = 5;
				if(request.getParameter("page") != null){
					try{
						pageCancelled = Integer.parseInt(request.getParameter("page"));
					}catch(NumberFormatException e){
						
					}
				}
				
				int noOfRecordsCancelled = dao.cancelledAppointmentGetNoOfRecords();
				int noOfPagesCancelled = (int) Math.ceil(noOfRecordsCancelled * 1.0 / recordsPerPageCancelled);
				
				if(noOfPagesCancelled<pageCancelled)
					pageCancelled = noOfPagesCancelled;
				
				request.setAttribute("noOfPagesCancelled", noOfPagesCancelled);
				request.setAttribute("currentPageCancelled", pageCancelled);
				
				int pageAppointment = 1;
				int recordsPerPageAppointment = 5;
				if(request.getParameter("page") != null){
					try{
						pageAppointment = Integer.parseInt(request.getParameter("page"));
					}catch(NumberFormatException e){
						
					}
				}
				
				int noOfRecordsAppointment = dao.appointmentGetNoOfRecords();
				int noOfPagesAppointment  = (int) Math.ceil(noOfRecordsAppointment  * 1.0 / recordsPerPageAppointment );
				
				if(noOfPagesAppointment < pageAppointment )
					pageAppointment  = noOfPagesAppointment ;
				
				System.out.println(pageAppointment);
				request.setAttribute("noOfPagesAppointment ", noOfPagesAppointment );
				request.setAttribute("currentPageAppointment ", pageAppointment );

				request.getRequestDispatcher("/WEB-INF/user_profile.jsp").forward(request, response);
			
			}
			
		}else {
			
			response.sendRedirect("index");
		
		}
		
	}


}
