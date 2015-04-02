package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("index#Register");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ServletContext sc = request.getServletContext();
		
		String key = "invalid_registration";
		
		String first_name = request.getParameter("first_name");
		String last_name = request.getParameter("last_name");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact_number");
		String password = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		
		if(first_name.length()==0){
			sc.setAttribute(key, "First Name is Empty");
		}else if(last_name.length()==0){
			sc.setAttribute(key, "Last Name is Empty");
		}else if(email.length()==0){
			sc.setAttribute(key, "Email is Empty");
		} // insert check if email valid
		else if(contact.length()==0){
			sc.setAttribute(key, "Contact is Empty");
		}else if(password.length()==0){
			sc.setAttribute(key, "Password is Empty");
		}else if(password.equals(confirm_password)==false){
			sc.setAttribute(key, "Passwords Do Not Match");
		}
		
		// change to != if checking already okay
		if(sc.getAttribute(key)!=null)
			response.sendRedirect("index#Register");
		else{
			response.sendRedirect("success#Success");
		}
		
	}

}
