package views;

import java.io.IOException;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.city.CitiesDAO;
import models.city.City;
import models.doctor.Doctor;
import models.doctor.ListOfDoctorsDAO;
import models.hospital.Hospital;
import models.hospital.HospitalsDAO;
import models.specialization.Specialization;
import models.specialization.SpecializationsDAO;

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
		
		SpecializationsDAO spdao = new SpecializationsDAO();
		List<Specialization> specializations = spdao.getSpecializations();
		
		CitiesDAO cdao = new CitiesDAO();
		List<City> cities = cdao.getCities();
			
		HospitalsDAO hdao = new HospitalsDAO();
		List<Hospital> hospitals = hdao.getHospitals();

		sc.setAttribute("specializations", specializations);
		sc.setAttribute("cities", cities);
		sc.setAttribute("hospitals", hospitals);

		int page = 1;
		int recordsPerPage = 10;
		if(request.getParameter("page") != null){
			try{
				page = Integer.parseInt(request.getParameter("page"));
			}catch(NumberFormatException e){
				
			}
		}
		
		ListOfDoctorsDAO dao = new ListOfDoctorsDAO();
		List<Doctor> list = dao.listOfDoctors((page-1)*recordsPerPage, recordsPerPage, request.getParameterMap()); // add filter and search
				
		String parameter = "";
		
		for(Entry<String, String[]> i : request.getParameterMap().entrySet()){
			if(i.getKey().equals("page")==false)
				parameter += "&" + i.getKey() + "=" + i.getValue()[0];
		}
		
		request.setAttribute("parameter", parameter);
		
		int noOfRecords = dao.getNoOfRecords();
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		
		if(noOfPages<page)
			page = noOfPages;
		
		request.setAttribute("doctorsList", list);
		request.setAttribute("noOfPages", noOfPages);
		request.setAttribute("currentPage", page);
		
		request.getRequestDispatcher("/WEB-INF/view_doctors.jsp").forward(request, response);
		
	}

}
