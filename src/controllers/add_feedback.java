package controllers;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.feedback.Feedback;
import models.feedback.FeedbackDAO;
import models.user.User;
import enums.doctor_feedback_enum;

/**
 * Servlet implementation class addFeedback
 */
@WebServlet("/add_feedback")
public class add_feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String invalid = "invalid_feedback";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		System.out.println("a");
		String rate = request.getParameter(doctor_feedback_enum.RATE.toString());
		String comment = request.getParameter(doctor_feedback_enum.COMMENT.toString());
		String did = request.getParameter("did");

		
		if(rate == null){
			sc.setAttribute(invalid, "No rating");
		}else if(comment.length()==0){
			sc.setAttribute(invalid, "No comment");
		}
		
		// change to != if checking already okay
		
		User user = (User) request.getSession().getAttribute("user");
		
		if(sc.getAttribute(invalid)!=null)
			response.sendRedirect("doctor_profile?did=" + did + "#feedbacks");
		else{
			Feedback feedback = new Feedback(Integer.parseInt(rate), comment);
			
			FeedbackDAO feedbackDao = new FeedbackDAO();
			if(feedbackDao.addFeedback(user.getId(), Integer.parseInt(did), feedback))
				response.sendRedirect("doctor_profile?did=" + did + "#feedbacks");
			else{
				System.out.println("error");
				response.sendRedirect("doctor_profile?did=" + did + "#feedbacks");
			//response.sendRedirect("index#Register");
			}
		}
	}

}
