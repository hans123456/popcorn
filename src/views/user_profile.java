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

				int page = 1;
				int recordsPerPage = 5;
				if(request.getParameter("page") != null){
					try{
						page = Integer.parseInt(request.getParameter("page"));
					}catch(NumberFormatException e){
						
					}
				}
				
				int noOfRecords = dao.getNoOfRecords();
				int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
				
				if(noOfPages<page)
					page = noOfPages;
				
				request.setAttribute("noOfPages", noOfPages);
				request.setAttribute("currentPage", page);
				
				request.getRequestDispatcher("/WEB-INF/user_profile.jsp").forward(request, response);
			
			}
			
		}else {
			
			response.sendRedirect("index");
		
		}
		
	}


}
