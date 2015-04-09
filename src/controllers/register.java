package controllers;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utilities.DateParser;
import models.user.User;
import models.user.UserDAO;
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
//		
//		for(user_registration_enum i : user_registration_enum.values()){
//			System.out.println(i.toString());
//			String val = request.getParameter(i.toString());
//			
//			if(val.length()>0){
//				sc.setAttribute(i.toString(), val);  
//			}
//			
//		}
//		
		
		String first_name = request.getParameter(user_registration_enum.FIRSTNAME.getKey());
		String last_name = request.getParameter(user_registration_enum.LASTNAME.getKey());
		String email = request.getParameter(user_registration_enum.EMAIL.getKey());
		String contact = request.getParameter(user_registration_enum.CONTACTNUMBER.getKey());
		String password = request.getParameter(user_registration_enum.PASSWORD.getKey());
		String confirm_password = request.getParameter(user_registration_enum.CONFIRMPASSWORD.getKey());
		String birth_date = DateParser.parseDateForDatabase(request.getParameter(user_registration_enum.BIRTHDATE.getKey()));
		Date date = DateParser.parseStringToDate(birth_date);
		String gender = request.getParameter(user_registration_enum.GENDER.getKey());
		
		if(first_name.length()==0){
			sc.setAttribute(invalid, "First Name is Empty");
		}else if(last_name.length()==0){
			sc.setAttribute(invalid, "Last Name is Empty");
		}else if(email.length()==0){
			sc.setAttribute(invalid, "Email is Empty");
		}else if (!(email.matches("^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$"))) {
			sc.setAttribute(invalid, "Invalid Email");
		}else if(contact.length()==0){
			sc.setAttribute(invalid, "Contact is Empty");
		}else if(password.length()==0){
			sc.setAttribute(invalid, "Password is Empty");
		}else if(password.equals(confirm_password)==false){
			sc.setAttribute(invalid, "Passwords Do Not Match");
		}else if(date == null) {
			sc.setAttribute(invalid, "Birthdate is Empty");
		}else if(date.after(new Date())) {
			sc.setAttribute(invalid, "Invalid Birthdate");
		}else if(gender == null) {
			sc.setAttribute(invalid, "No Gender Selected");
		}
		
		// change to != if checking already okay
		if(sc.getAttribute(invalid)!=null)
			response.sendRedirect("index#Register");
		else{
			User user = new User();
			user.setInformation(user_registration_enum.FIRSTNAME.getKey(), first_name);
			user.setInformation(user_registration_enum.LASTNAME.getKey(), last_name);
			user.setInformation(user_registration_enum.EMAIL.getKey(), email);
			user.setInformation(user_registration_enum.CONTACTNUMBER.getKey(), contact);
			user.setInformation(user_registration_enum.PASSWORD.getKey(), password);
			user.setInformation(user_registration_enum.BIRTHDATE.getKey(), birth_date);
			user.setInformation(user_registration_enum.GENDER.getKey(), gender);
			
			UserDAO userDao = new UserDAO();
			if(userDao.registerUser(user))			
				response.sendRedirect("success#Success");
			else
				System.out.println("error");
			//response.sendRedirect("index#Register");
		}
		
	}

}
