package views;


import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.login;
import controllers.register;
import enums.user_registration_enum;

/**
 * Servlet implementation class index
 */
@WebServlet("/index")
public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ServletContext sc = request.getServletContext();

		String key1 = register.invalid;
		String key2 = login.invalid;
		
		request.setAttribute(key1, sc.getAttribute(key1));
		request.setAttribute(key2, sc.getAttribute(key2));
		sc.removeAttribute(key1);
		sc.removeAttribute(key2);
		
		for(user_registration_enum i : user_registration_enum.values()){
			String val = (String) sc.getAttribute(i.getKey());
			
			if(val!=null){
				request.setAttribute(i.getKey(), val);
				sc.removeAttribute(i.getKey());
			}
		}
		
		request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ServletContext sc = request.getServletContext();

		String key1 = register.invalid;
		String key2 = login.invalid;
		
		request.setAttribute(key1, sc.getAttribute(key1));
		request.setAttribute(key2, sc.getAttribute(key2));
		sc.removeAttribute(key1);
		sc.removeAttribute(key2);
		
		for(user_registration_enum i : user_registration_enum.values()){
			String val = (String) sc.getAttribute(i.getKey());
			if(val!=null){
				request.setAttribute(i.getKey(), val);
				sc.removeAttribute(i.getKey());
				
			}
		}
		
		request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
		
	}
	
}
