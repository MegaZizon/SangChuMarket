
<%@page import="java.util.Collection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../exception.jsp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="msg.*"%>
<%@page import="user.*"%>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/message.css">
        
        
</head>
<body style="height=480px;">

<%
	MsgVO vo = new MsgVO();
	MsgDAO dao=new MsgDAO();
	String userId=null;
	userId=(String)session.getAttribute("userId");
	
	User user2 =new User();
	user2.setUserId(userId);
	
	UserDAO udao2 = new UserDAO();
	user2=udao2.info(user2);
	String p_userNickname=user2.getUserNickname();

	vo.setSenderId(p_userNickname);
	
	List<MsgVO> list2= dao.msgList2(vo);
	
	String otherName;
	String myName;
	
%>
<div class="messenger" >
  <div class="messenger-header">
    대화방 목록
  </div>

  <div class="msglist" id="chatt" >

<%
	if(list2!=null){
		List<MsgVO> list = dao.msgList3(list2);
	for(MsgVO voo:list){
		
		if( (voo.getIsRead()==0) && (p_userNickname.equals(voo.getReciverId()) ) ){
			if(p_userNickname.equals(voo.getSenderId())){
				otherName = voo.getReciverId();
				myName = voo.getSenderId();
			}
			else{
				otherName = voo.getSenderId();
				myName = voo.getReciverId();
			}
			
			%>
		    <a href="./message.jsp?p_userId=<%=myName%>&s_userId=<%=otherName%>">
	        <div class="recived__">
	            <div class="recived__msg">
	            	<%= otherName %> 님과의 대화 : <%= voo.getContent() %>
	            </div>
	            <div class="reading_no">
	                안읽음
	            </div>
	        </div>
	    </a>
	<%	
		}
		else{
			if(p_userNickname.equals(voo.getSenderId())){
				otherName = voo.getReciverId();
				myName = voo.getSenderId();
			}
			else{
				otherName = voo.getSenderId();
				myName = voo.getReciverId();
			}
	%>
		     <a href="./message.jsp?p_userId=<%=myName%>&s_userId=<%=otherName%>">
		        <div class="recived__">
		            <div class="recived__msg">
		                <%= otherName %> 님과의 대화 : <%= voo.getContent() %>
		            </div>
		            <div class="reading_yes">
		                읽음
		            </div>
		        </div>
		    </a>


<%
			}
		}
	}
%>
	
			    
    
  </div>

  <!-- 입력 폼 -->
  <form class="message-form" action="./message_process.jsp">
    <button onclick="window_close1()" >닫기</button>
  </form>
</div>

</body>
</html>
<script>
//setTimeout(function(){location.reload();},1000); //1초 후 새로고침
    
    function window_close1() {
        window.close();
    }
</script>