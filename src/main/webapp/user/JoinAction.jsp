<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../exception.jsp"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope="page" />

<jsp:setProperty name="user" property="userId" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userNickname" />
<jsp:setProperty name="user" property="userPhone" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<%
		String userId=null;
		if(session.getAttribute("userId")!=null){
			userId=(String)session.getAttribute("userId");
		}
		if(userId!=null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 하였습니다.')");
			script.println("location.href='../index.jsp'");
			script.println("</script>");
		}
	
		
		if(user.getUserId() == null || user.getUserPassword() == null ||
				user.getUserNickname() == null || user.getUserPhone() == null ){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('작성이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			
			if( result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else {//회원가입 성공
	
				session.setAttribute("userId",user.getUserId());
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('상추마켓에 오신걸 환영합니다!')");
				script.println("location.href='../index.jsp'");
				script.println("</script>");
			}
		}
			
		
	%>
</body>
</html>