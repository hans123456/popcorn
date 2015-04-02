package view;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class view_doctors
 */
@WebServlet("/view_doctors")
public class view_doctors extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public view_doctors() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ServletContext sc = request.getServletContext();
		
			Map<String, String> specializations = new HashMap<String, String>();
			specializations.put("7", "Test");
			
			Map<String, String> cities = new HashMap<String, String>();
			cities.put("7", "Test");
			
			Map<String, String> hospitals = new HashMap<String, String>();
			hospitals.put("7", "Test");

		sc.setAttribute("specializations", specializations);
		sc.setAttribute("cities", cities);
		sc.setAttribute("hospitals", hospitals);
		
		request.getRequestDispatcher("/WEB-INF/view_doctors.jsp").forward(request, response);
	}

}
