<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>
<%@ page errorPage="../exception.jsp"%>
<%@ page import="image.*" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int result=0;
	PrintWriter script = response.getWriter();

	String nickName =request.getParameter("nickName");
	String password =request.getParameter("password");
	String phone =request.getParameter("phone");
	String p_password =request.getParameter("p_password");
	String n1_password =request.getParameter("n1_password");
	String n2_password =request.getParameter("n2_password");
	String menu =request.getParameter("menu");
	String no =request.getParameter("no");
	String title =request.getParameter("title");
	String price =request.getParameter("price");
	String content =request.getParameter("content");
	String fileName =request.getParameter("fileName");
	
	String userId=null;
	if(session.getAttribute("userId")!=null){
		userId=(String)session.getAttribute("userId");
	}
	
	User user = new User();
	UserDAO dao = new UserDAO();
	
	if(menu.equals("n_c")){
		user.setUserNickname(nickName);
		user.setUserId(userId);
		dao.nick_c(user);

		script.println("<script>");
		script.println("alert('변경되었습니다.')");
		script.println("location.href='user_info.jsp'");
		script.println("</script>");
	}
	else if(menu.equals("p_c")){
		 result = dao.login(userId,p_password);
		 if( result == 0){
			script.println("<script>");
			script.println("alert('현재 비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		 }else if( n1_password.equals(n2_password)==false ){
			script.println("<script>");
			script.println("alert('변경할 비밀번호가 다릅니다.')");
			script.println("history.back()");
			script.println("</script>");
			
		 }
		 else{
			user.setUserPassword(n2_password);
			user.setUserId(userId);
			dao.pw_c(user);

			script.println("<script>");
			script.println("alert('변경되었습니다.')");
			script.println("location.href='user_info.jsp'");
			script.println("</script>");
		 }
	}
	
	else if(menu.equals("ph_c")){

		user.setUserPhone(phone);
		user.setUserId(userId);
		dao.ph_c(user);
		
		script.println("<script>");
		script.println("alert('변경되었습니다.')");
		script.println("location.href='user_info.jsp'");
		script.println("</script>");
	}
	else if(menu.equals("u_c")){
		result = dao.login(userId,password);
		 if( result == 0){
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		 }
		 else{
			script.println("<script>");
			script.println("if (!confirm('정말로 탈퇴하시겠습니까?')) {");
			script.println("location.href='user_info.jsp'");
			script.println("}");
			script.println("</script>");
		 }

		user.setUserId(userId);
		dao.u_c(user);
			
		script.println("<script>");
		script.println("alert('회원 탈퇴 처리되었습니다.')");
		script.println("location.href='LogoutAction.jsp'");
		script.println("</script>");
	}
	else if(menu.equals("sold")){
		ImageDAO idao = new ImageDAO();
		idao.changeIMG(no);
		
		script.println("<script>");
		script.println("alert('판매완료 처리 되었습니다.')");
		script.println("location.href='user_info.jsp'");
		script.println("</script>");
	}
	else if(menu.equals("edit")){
		%>
		<script>
			location.href="../write/writing.jsp?no=<%=no%>&title=<%=title%>&price=<%=price%>&content=<%=content%>&fileName=<%=fileName%>";
		</script>
		<%
	}
	else if(menu.equals("del") || menu.equals("del_2")){

		ImageDAO idao = new ImageDAO();
		script.println("<script>");
		script.println("if (!confirm('정말로 삭제하시겠습니까?')) {");
		script.println("history.back()");
		script.println("}");
		script.println("</script>");
		if(menu.equals("del_2")){

			idao.delIMG(no);
			script.println("<script>");
			script.println("alert('삭제 되었습니다.')");
			script.println("location.href='../index.jsp'");
			script.println("</script>");
		}else{
			idao.delIMG(no);
			script.println("<script>");
			script.println("alert('삭제 되었습니다.')");
			script.println("location.href='./user_info.jsp'");
			script.println("</script>");
		}
	}
	
 %>
</body>
</html>