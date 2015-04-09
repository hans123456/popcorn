package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utilities.DateParser;
import models.doctor.Doctor;
import models.doctor.DoctorApplyDAO;
import models.user.User;
import models.user.UserDAO;
import enums.doctor_info_enum;
import enums.user_registration_enum;

/**
 * Servlet implementation class doctor_apply
 */
@WebServlet("/doctor_apply")
public class doctor_apply extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String invalid = "invalid_registration";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doctor_apply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("doctor_application#Apply");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ServletContext sc = request.getServletContext();
		
		String first_name = request.getParameter(user_registration_enum.FIRSTNAME.getKey());
		String last_name = request.getParameter(user_registration_enum.LASTNAME.getKey());
		String email = request.getParameter(user_registration_enum.EMAIL.getKey());
		String contact = request.getParameter(user_registration_enum.CONTACTNUMBER.getKey());
		String password = request.getParameter(user_registration_enum.PASSWORD.getKey());
		String confirm_password = request.getParameter(user_registration_enum.CONFIRMPASSWORD.getKey());
		String birth_date = DateParser.parseDateForDatabase(request.getParameter(user_registration_enum.BIRTHDATE.getKey()));
		Date date = DateParser.parseStringToDate(birth_date);
		String gender = request.getParameter(user_registration_enum.GENDER.getKey());
		String hospital = request.getParameter("hospitals");
		String specialization = request.getParameter("specializations");
		String city = request.getParameter("cities");
		
		Integer[] checkBoxNames = {1, 2, 3, 4, 5, 6, 7};
		
		Map<String, List<String>> consultHours = new HashMap();
		
		for(int i = 0; i < checkBoxNames.length; i++) {
			String[] checkboxNamesList= request.getParameterValues(checkBoxNames[i].toString());
			List<String> times = new ArrayList();
			if(checkboxNamesList != null) {
				for(int j = 0; j < checkboxNamesList.length; j++) {
					if(checkboxNamesList[j] != null) {
						times.add(checkboxNamesList[j]);
					}
				}
			consultHours.put(checkBoxNames[i].toString(), times);
			}
			
		}
		
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
		}else if(date == null) {
			sc.setAttribute(invalid, "Birthdate is Empty");
		}else if(date.after(new Date())) {
			sc.setAttribute(invalid, "Invalid Birthdate");
		}else if(hospital == null) {
			sc.setAttribute(invalid, "No hospital chosen");
		}else if(specialization == null) {
			sc.setAttribute(invalid, "No specialization chosen");
		}else if(city == null) {
			sc.setAttribute(invalid, "No city chosen");
		}else if(gender == null){
			sc.setAttribute(invalid, "No gender chosen");
		}else if(consultHours.size()==0) {
			sc.setAttribute(invalid, "No consultation hours");
		}else if(password.length()==0){
			sc.setAttribute(invalid, "Password is Empty");
		}else if(password.equals(confirm_password)==false){
			sc.setAttribute(invalid, "Passwords Do Not Match");
		}
		
		
		
		
		// change to != if checking already okay
		if(sc.getAttribute(invalid)!=null)
			response.sendRedirect("doctor_application#Apply");
		else{
			User user = new User();
			user.setInformation(user_registration_enum.FIRSTNAME.getKey(), first_name);
			user.setInformation(user_registration_enum.LASTNAME.getKey(), last_name);
			user.setInformation(user_registration_enum.EMAIL.getKey(), email);
			user.setInformation(user_registration_enum.CONTACTNUMBER.getKey(), contact);
			user.setInformation(user_registration_enum.PASSWORD.getKey(), password);
			user.setInformation(user_registration_enum.BIRTHDATE.getKey(), birth_date);
			user.setInformation(user_registration_enum.GENDER.getKey(), gender);
			
			Doctor doctor = new Doctor();
			doctor.setInformation(doctor_info_enum.HOSPITAL.toString(), hospital);
			doctor.setInformation(doctor_info_enum.SPECIALIZATION.toString(), specialization);
			doctor.setInformation(doctor_info_enum.CITY.toString(), city);
			
			//Map<String, List<String>> consultHours = new HashMap();
			
			//System.out.println(consultHours);
			doctor.setSchedule(consultHours);
			
			UserDAO userDao = new UserDAO();
			if(userDao.registerUser(user)) {
				
				DoctorApplyDAO doctorApplyDao = new DoctorApplyDAO();
				
				if(doctorApplyDao.registerDoctor(doctor, user)) {
					//response.sendRedirect("success#Success");
					if(doctorApplyDao.addSchedule(doctor, user)) {
						response.sendRedirect("success#Success");
					}
					else {
						doctorApplyDao.deleteDoctor(doctor, user);
					}
				}
				else
					userDao.deleteUser(user);
			}
			else
				response.sendRedirect("doctor_application#Apply");
		}
		

	}

}
