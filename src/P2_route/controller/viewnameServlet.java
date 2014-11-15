package P2_route.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

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
		
		if("saveRoute".equals(action)){
			String routeJSONStr = request.getParameter("routeJSONStr");
			System.out.println(routeJSONStr);
			try {
				JSONObject routeJSONObj = new JSONObject(routeJSONStr);
				String memID = routeJSONObj.get("memID").toString();
				String routeName = routeJSONObj.get("routeName").toString();
				JSONArray routeResult = (JSONArray)routeJSONObj.get("routeResult");
				
				List<String> routeResultArray = new ArrayList<String>();
				for(int i=0; i< routeResult.length(); i++){
					routeResultArray.add(routeResult.getString(i));
				}
				
				java.sql.Date buildTime = new java.sql.Date(new java.util.Date().getTime());
				
				
				viewnameService vnService = new viewnameService();
				Integer routeID = vnService.insertRouteByID(memID, routeName, buildTime);
				
				String status="";
				if(routeID!=0){
					for(int i=0; i < routeResultArray.size(); i++){
						String routeResultView = routeResultArray.get(i);
						//i -> routeResultViewOrder
						System.out.println("routeResultView = " + routeResultView + ", routeResultViewOrder = " + i);
						status = vnService.insertRouteViewByRouteID(routeID, routeResultView, i+1);
					}
				}
				if("success".equals(status)){
					out.println("success");
				}else{
					out.println("fail");
				}
//				System.out.println(memID);
//				System.out.println(routeName);
//				System.out.println(routeResult);
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		
		if("GetLatlngById".equals(action)){
			String viewID = request.getParameter("viewID");
			
			viewnameService vnService = new viewnameService();
			String viewLatlng = vnService.getViewLatlng(viewID);
			out.println(viewLatlng);
		}
		
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
