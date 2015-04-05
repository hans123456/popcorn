package views;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			e.printStackTrace();
		}
		
		if(did==0){
			request.getRequestDispatcher("/view_doctors").forward(request, response);
		}else {
//			DoctorInfoDAO dao = new DoctorInfoDAO();
//			Doctor doctor = dao.getDoctorInfo(did);	
//			request.setAttribute("doctor_info", doctor);
			request.getRequestDispatcher("/WEB-INF/doctor_profile.jsp").forward(request, response);
		}
		
	}

}
