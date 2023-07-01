<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.*" %>
<%@ page import="msg.*" %>
<%@ page import="image.*" %>
<%@ page errorPage="../exception.jsp"%>

<%
	String userId=null;
	if(session.getAttribute("userId")!=null){
		PrintWriter script = response.getWriter();
		userId=(String)session.getAttribute("userId");
		
	}
	
	User user =new User();
	user.setUserId(userId);
	
	UserDAO udao = new UserDAO();
	user=udao.info(user);
	
	MsgVO vo2 = new MsgVO();
	vo2.setReciverId(user.getUserNickname());
	
	MsgDAO dao2 = new MsgDAO();
	

	String no =request.getParameter("no");
	String title =request.getParameter("title");
	String price =request.getParameter("price");
	String content =request.getParameter("content");
	String fileName =request.getParameter("fileName");
	String d;
	String TF;
	ImageVO vo6 =new ImageVO();
	if(no.equals("-1")){
		title="";
		price="";
		content="";
		fileName="";
		TF="true";
		d="등록";
	}
	else{
		ImageDAO dao6 = new ImageDAO();
		
		vo6= dao6.select(no);
		if(vo6!=null){

			title = vo6.getTitle();
			price = vo6.getPrice();
			content = vo6.getContent();
			fileName = vo6.getFileName();
		}
		
		TF="false";
		d="수정";
	}
	
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>상추마켓</title>    
        <link rel="stylesheet" type="text/css" href="../css/index.css?v=<%=System.currentTimeMillis() %>">
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d67f7666b7975bc2a2fb3fcc0f2e4082&libraries=services"></script>
		
        <style>
            body {
                margin: 0;
            }
            .all {
                width: 100vw;
                height: 100vh;
            }

        </style>
    </head>
    <body>
        <div class="all">
            <header>
                <div id="logo">
                    <a href="../index.jsp">
                        <img id="sangchu" src="../img/sangchu.png">
                    </a>
                </div>
                <div id="sangchutext">
                    <a href="../index.jsp">상추마켓</a>
                </div>
                
                <nav >
					<ul id="topMenu" >
	                    <li><a href="../user/LogoutAction.jsp">로그아웃</a></li>
	                    <li><a href="../user/user_info.jsp">회원정보</a></li>
	                    <li><a href="" onclick="cs_click()">고객센터</a></li>
	                    <li>
                            <a href="" onclick="message_main_click()"> 
                                <div>
                                    <div style="position: absolute;">
                                
                                        <div id="new_box" style="position: relative;">
                <%                         
                						if(dao2.msgToMe(vo2)==true){
                %>
                                            <img id="notice" src="../img/new.png"></div>
                <%
                						}
                %>
                                    </div>
                                
                                    <img id="new" src="../img/notice.png">
                                
                                </div>
                            </a>
                    	</li>
	                </ul>
                </nav>
    
                <div id="search">
                    <form name="search_option" action="../search.jsp">
	                   	 <input type="text" name="search" value="" placeholder="상품명을 검색해보세요." id="search_1">
	                    <button type="submit" id="btn"><img id="searchimg"src="../img/search.png" alt=""></button>
                	</form>
                
            </header>
            <main class="contents">
                <div id="wrap2">
                    <div id="wrap3">
                        
                        <form name=write_form id="register_form" action="writing_process.jsp" method="post" enctype="multipart/form-data" onsubmit="return false;" >
                            <div id="sub_title">판매글 <%=d %>하기</div>
                            
                            <input type="hidden" placeholder="" name="region"/>
                            <input type="hidden" name="no" value=<%=no%>> 
                            <input type="hidden" name="TF" value=<%=TF%>>
                            제목<input class=input_title type="text" placeholder="제목을 입력해 주세요." name="title"/ value="<%=title %>">
                            가격<input class=input_price type="text" placeholder="가격을 입력해 주세요. 예시)1kg당 1000원" name="price"/ value="<%=price %>">
                            내용<textarea class=input_content placeholder="내용을 입력해 주세요." name="content" ><%=content %></textarea>
                            
                            <div  class="filebox makeFlex ai_FE">
                                <input  class="upload-name" placeholder="" style="opacity:1;" value="<%=fileName %>">
                                <label id="file_view">
                                    사진 업로드 +
                                    <input type="file" class="upload-hidden" onchange="uploadName(this)" name="image" value="<%=fileName %>">
                                </label>
                                
                            </div><!-- filebox -->

                           
                        </form>
                        

						<div id="back_box" onclick="back_click()">
                            목록으로
                        </div>
                        <div id="cancel_box" onclick="cancel_click()">
                            다시쓰기
                        </div>
                        <div id="register_box" onclick="reg_click()">
                            등록하기
                        </div>
                    </div>
                </div>
            </main>
        </div>
</body>
</html>

<script>

    var addname;
    (function location(){
    navigator.geolocation.getCurrentPosition(
    function(position) {
    getAddr(position.coords.latitude,position.coords.longitude);
    }, 
    );
    })();
    
    function getAddr(lat,lng){
        let geocoder = new kakao.maps.services.Geocoder();
    
        let coord = new kakao.maps.LatLng(lat, lng);
        let callback = function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
                //result[0].address.address_name);
                //console.log(result[0].address.region_2depth_name);
                //console.log(result[0].address.region_3depth_name);
                //addname=result[0].address.region_1depth_name  +" " +result[0].address.region_2depth_name  +" "+result[0].address.region_3depth_name
                
            	addname=result[0].road_address.address_name;
                document.write_form.region.value=addname;
            }
        }
        geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);     
    
    }
    function message_click() {
  	  
  	  window.open('../message/message.jsp', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);

 	}
    function cs_click() {
  	  
    	window.open('../message/message.jsp?p_userId=<%=user.getUserNickname()%>&s_userId=고객센터', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);

  	}
    function back_click() {
    	  
   	  location.href = "../index.jsp";
   	}
    function cancel_click() {
    	  
   	  const rg = document.getElementById('register_box');
   	  document.write_form.reset();	
   	}
    function reg_click() {
    	  
   	  const rg = document.getElementById('register_box');
   	  document.write_form.submit();	
   	}
    function uploadName(e){
   	  var files = e.files;
   	  var filename = files[0].name;  //console.log(filename);
   	  // 추출한 파일명 삽입 
   	  var upload_name = e.parentNode.previousElementSibling;
   	  upload_name.value = filename;
   	}//uploadName

</script>