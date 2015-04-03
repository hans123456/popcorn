package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import enums.user_registration_enum;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	public static final String invalid = "invalid_registration";
       
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
		
		for(user_registration_enum i : user_registration_enum.values()){
			String val = request.getParameter(i.toString());
			
			if(val.length()>0){
				sc.setAttribute(i.toString(), val);  
			}
			
		}
		
		String first_name = request.getParameter(user_registration_enum.FIRSTNAME.toString());
		String last_name = request.getParameter(user_registration_enum.LASTNAME.toString());
		String email = request.getParameter(user_registration_enum.EMAIL.toString());
		String contact = request.getParameter(user_registration_enum.CONTACTNUMBER.toString());
		String password = request.getParameter(user_registration_enum.PASSWORD.toString());
		String confirm_password = request.getParameter(user_registration_enum.CONFIRMPASSWORD.toString());
		
		if(first_name.length()==0){
			sc.setAttribute(invalid, "First Name is Empty");
		}else if(last_name.length()==0){
			sc.setAttribute(invalid, "Last Name is Empty");
		}else if(email.length()==0){
			sc.setAttribute(invalid, "Email is Empty");
		} // insert check if email valid
		else if(contact.length()==0){
			sc.setAttribute(invalid, "Contact is Empty");
		}else if(password.length()==0){
			sc.setAttribute(invalid, "Password is Empty");
		}else if(password.equals(confirm_password)==false){
			sc.setAttribute(invalid, "Passwords Do Not Match");
		}
		
		// change to != if checking already okay
		if(sc.getAttribute(invalid)!=null)
			response.sendRedirect("index#Register");
		else{
			response.sendRedirect("success#Success");
		}
		
	}

}
