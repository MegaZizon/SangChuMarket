<%@page import="image.ImageDAO"%>
<%@page import="image.ImageVO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String path="/data/img";
	String realPath=request.getServletContext().getRealPath(path);
	System.out.println("image:" + realPath);
	
	int size=10*1024*1024; //10MB size
	MultipartRequest multi =new MultipartRequest(request,realPath,size,"utf-8",new DefaultFileRenamePolicy());

	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	String fileName = multi.getFilesystemName("image");
	String price = multi.getParameter("price");
	String region = multi.getParameter("region");
	String no = multi.getParameter("no");
	String TF = multi.getParameter("TF");
	ImageVO vo = new ImageVO();
	ImageVO vo2 = new ImageVO();
	if(fileName==null){
		PrintWriter script = response.getWriter();
		fileName="test01.png";
	}
	
	String userId=null;
	if(session.getAttribute("userId")!=null){
		userId=(String)session.getAttribute("userId");
	}
	
	if(userId==null){
		System.out.println("error");
	}
	else{

		System.out.println("success");
	}
	
	if(region.equals("")){
		PrintWriter script = response.getWriter();
		region="알 수 없는 위치";
		
	}
	if(title.equals("")){
		title="제목 없음";
	}
	if(price.equals("")){
		price="가격 미기재";
	}
	
	
	
	
	
	
	
		PrintWriter script = response.getWriter();

		vo.setUserId(userId);
		vo.setTitle(title);
		vo.setPrice(price);
		vo.setRegion(region);
		vo.setContent(content);
		vo.setFileName(fileName);
		
		ImageDAO imgin = new ImageDAO();
		if(no.equals("-1")){
			imgin.insertIMG(vo);

			script.println("<script>");
			script.println("location.href='../index.jsp'");
			script.println("</script>");

			
		}else{
			vo.setNo(Integer.parseInt(no));
			if(fileName.equals("test01.png")){
				imgin.editIMG2(vo);
				
			}else{
				imgin.editIMG(vo);
			}
			
			
			script.println("<script>");
			script.println("location.href='../index.jsp'");
			script.println("</script>");
		}
		
		
	

%>
</body>
</html>