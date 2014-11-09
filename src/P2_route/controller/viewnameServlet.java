package P2_route.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import P2_route.model.*;

/**
 * Servlet implementation class viewnameServlet
 */
@WebServlet("/P2_route/viewnameServlet")
public class viewnameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Access-Control-Allow-Origin", "*");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		
		if("GetAllByArea".equals(action)){
			String area = request.getParameter("area");
			
			viewnameService vnService = new viewnameService();
			String viewnames = vnService.getAllJSON(area);
			out.println(viewnames);
		}
		
		if("north".equals(action)||"central".equals(action)||"south".equals(action)||"east".equals(action)){
			String path = getServletContext().getContextPath();
			switch(action){
				case "north": request.setAttribute("area", "北部");break;
				case "central": request.setAttribute("area", "中部");break;
				case "south": request.setAttribute("area", "南部");break;
				case "east": request.setAttribute("area", "東部");break;
			}
				request.setAttribute("path", path);
				RequestDispatcher successView = request.getRequestDispatcher("/P2_route/route_dragdrop.jsp");
				successView.forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
