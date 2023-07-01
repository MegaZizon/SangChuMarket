<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="msg.*" %>
<%@ page errorPage="../exception.jsp"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/message.css?v=<%=System.currentTimeMillis() %>">
         
</head>
<body>
<%
	String senderId=request.getParameter("p_userId");
	String reciverId=request.getParameter("s_userId");
	String no = request.getParameter("no");
	MsgDAO dao = new MsgDAO();
	MsgVO vo = new MsgVO();
	vo.setSenderId(reciverId);
	vo.setReciverId(senderId);
	dao.msgRead(vo);

	vo.setSenderId(senderId);
	vo.setReciverId(reciverId);
	List<MsgVO> list=dao.msgList(vo);
%>
<!-- 메신저 -->
<div class="messenger">
  <!-- 헤더 -->
  <div class="messenger-header"><div id="msg_back" onclick="msg_back1()">목록으로</div>
    <%=reciverId %> 님과의 대화
  </div>

  <!-- 쪽지 목록 -->
  <div class="msglist" id="chat">
    <!-- 예시 쪽지 -->
    <%
        int list_count=0;
    	if(list==null){
    		
    	}
    	else{
			for(MsgVO voo:list){
				if(reciverId.equals(voo.getReciverId())){
					
	%>
				    <div class="send__">
				        <div class="send__msg">
				            <%=voo.getContent()%>
				        </div>
				    </div>
	<%
				}
				else{
			
	%>
	
				    <div class="recive__">
				        <div class="recive__msg">
				            <%=voo.getContent()%>
				        </div>
				    </div>
			    
	<%
				}
			}
		}
	%>
    
    
    
  </div>

  <!-- 입력 폼 -->
  <form class="message-form" action="./message_process.jsp">
  	<input type="hidden" name="reciverId" value="<%=reciverId%>">
  	<input type="hidden" name="senderId" value="<%=senderId%>">
  	<input type="hidden" name="no" value="<%=no%>">
    <input type="text" placeholder="메시지를 입력하세요" id="send_textbox" name="content">
    <button type="submit">보내기</button>
  </form>
</div>

</body>
</html>
<script>
//setTimeout(function(){location.reload();},1000); //1초 후 새로고침
    let chat = document.querySelector('#chat');
    chat.scrollTop = chat.scrollHeight;

   function send() {
    const msg = document.querySelector('#msg');
    if (msg.value == '') {
        return;
    } else {
        socket.emit('send', msg.value);
        msgAdd(msg.value, 'me');
        msg.value = '';
        
        let chat = document.querySelector('#chat');
        chat.scrollTop = chat.scrollHeight;
    }
}
 function msg_back1() {
  window.location.href='./message_main.jsp';
}
</script>