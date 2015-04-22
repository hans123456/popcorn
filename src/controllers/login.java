package controllers;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.user.User;
import models.user.UserDAO;
import enums.login_enum;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public static final String invalid = "invalid_login";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index#Login");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ServletContext sc = request.getServletContext();
		
		UserDAO dao = new UserDAO();
		
		String email = request.getParameter(login_enum.EMAIL.toString());
		String password = request.getParameter(login_enum.PASSWORD.toString());
		
		User user = dao.login(email, password);
		
		if(user!=null){ // check if account correct
			request.getSession().setAttribute("user", user);
			response.sendRedirect("success#Success");
		}else {
			sc.setAttribute(invalid, "Invalid Email or Password");
			response.sendRedirect("index#Login");
		}
		
	}

}
