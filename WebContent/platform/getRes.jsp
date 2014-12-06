<%@ page language="java" contentType="text/event-stream; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter,P4_MessageBoard.model.*, org.json.JSONObject;"%>
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
			
			String memID = request.getParameter("memID");	
			if(!("null".equals(memID))&&memID.length()!=0){
				String Notifymsg ="{}";
				FrdService frdSrv = new FrdService();
				String infoMsg = frdSrv.getCoNotify(memID);

				JSONObject info = new JSONObject(infoMsg);
				if (info.length() != 0) {
					//System.out.println("info = " +info.getString("cooperation_friend"));
					if (!("null".equals(info.getString("cooperation_friend")))) {
						String frdName = frdSrv.getFrdsName(info
								.getString("cooperation_friend"));
						//System.out.println("frdName = " +frdName);
						info.put("frdName", frdName);
						Notifymsg = info.toString();
					}
				}
				System.out.println("Notifymsg = " + Notifymsg);
				memID="";
				if (!("{}".equals(Notifymsg))) {
					writer.write("data: " + Notifymsg + "\n\n");
					writer.write("retry: 10000\n");
				}
			}
		%>
</body>
</html>