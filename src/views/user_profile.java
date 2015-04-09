package views;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.appointments.AppointmentsDAO;
import models.user.User;

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
		
		if(user!=null){
		
			AppointmentsDAO dao = new AppointmentsDAO();
			
			request.setAttribute("user", user);
			request.setAttribute("appointments", dao.getUserAppointments(user.getId()));
			
			request.getRequestDispatcher("/WEB-INF/user_profile.jsp").forward(request, response);
		
		}else {
			
			response.sendRedirect("index");
		
		}
		
	}


}
