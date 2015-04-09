package views;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.city.CitiesDAO;
import models.city.City;
import models.hospital.Hospital;
import models.hospital.HospitalsDAO;
import models.specialization.SpecializationsDAO;

/**
 * Servlet implementation class doctor_apply
 */
@WebServlet("/doctor_application")
public class doctor_application extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doctor_application() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SpecializationsDAO speDao = new SpecializationsDAO();
		CitiesDAO cityDao = new CitiesDAO();
		HospitalsDAO hospitalDao = new HospitalsDAO();
		
		List<City> cities = cityDao.getCities();
		List<Hospital> hospitals = hospitalDao.getHospitals();
		Map<String, List<Hospital>> cityHospitalMapping = new HashMap<String, List<Hospital>>(); 
		
		for(City city: cities) {
			List<Hospital> hospitalPerCity = new ArrayList<Hospital>();
			for(Hospital hospital: hospitals) {
				if(hospital.getCityId() == city.getId()) {
					hospitalPerCity.add(hospital);
				}
			}
			cityHospitalMapping.put(city.getName(), hospitalPerCity);
		}

		request.setAttribute("specializations", speDao.getSpecializations());
		request.setAttribute("cities", cities);
		request.setAttribute("hospitals", cityHospitalMapping.get(cities.get(0).getName()));
		request.setAttribute("cityHospitalMapping", cityHospitalMapping);
		
		request.getRequestDispatcher("/WEB-INF/doctor_application.jsp").forward(request, response);
	
	}

}
