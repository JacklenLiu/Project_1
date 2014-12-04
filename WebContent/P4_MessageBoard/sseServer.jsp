<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, P4_MessageBoard.model.* ,org.json.JSONObject;"%>

		<%
			response.setContentType("text/event-stream");
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			
			String loginid = request.getParameter("loginid");
			
			FrdService frdsvc = new FrdService();
			int temp = frdsvc.checkinvitecount(loginid);
			writer.write("retry: 10000\n");
			
// 			if(temp == count){
// 				System.out.println("沒更新");
// 			}else{
				writer.write("data: " + temp + "\n\n");
// 				System.out.println("有更新!!!");
// 			}
		%>

