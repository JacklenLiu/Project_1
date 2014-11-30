<%@ page language="java" contentType="text/event-stream; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter,P2_route.model.*, org.json.JSONObject;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			response.setContentType("text/event-stream");
			response.setCharacterEncoding("UTF-8");
			PrintWriter writer = response.getWriter();
			int count = Integer.parseInt(request.getParameter("count"));
			viewnameService viewTop6 = new viewnameService();		
			int imgTop6 = viewTop6.getImgTop6Count();
			if(count != imgTop6){
				writer.write("data: " + imgTop6 + "\n\n");
				writer.write("retry: 5000\n");
			}
		%>
</body>
</html>