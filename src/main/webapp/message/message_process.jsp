<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="msg.*"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page errorPage="../exception.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String s_userId=request.getParameter("reciverId");
	String p_userId=request.getParameter("senderId");
	String no=request.getParameter("no");
	int visit=1;
	MsgVO vo = new MsgVO();
	vo.setIsRead(visit);
	vo.setReciverId(request.getParameter("reciverId"));
	vo.setSenderId(request.getParameter("senderId"));
	vo.setContent(request.getParameter("content"));
	
	MsgDAO dao = new MsgDAO();
	dao.insertMsg(vo);
	
	PrintWriter script=response.getWriter();

%>
<%=vo.getContent() %>
<%=vo.getSenderId() %>
<%=vo.getReciverId() %>
</body>
</html>
<script>
	var link = "./message.jsp?no=<%=no%>&p_userId=<%=p_userId%>&s_userId=<%=s_userId%>";
	window.location.href = link;   
</script>