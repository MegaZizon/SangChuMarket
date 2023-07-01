

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>
<%@ page import="image.*" %>
<%@ page import="user.*" %>
<%@ page import="msg.*" %>
<%@ page errorPage="exception.jsp"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
       <title>상추마켓</title>    
        
        <link rel="stylesheet" type="text/css" href="./css/index.css?v=<%=System.currentTimeMillis() %>">
        <script type="text/javascript" src="./index.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d67f7666b7975bc2a2fb3fcc0f2e4082&libraries=services"></script>


    </head>
    <body>
    	<%
			int list_size=0;
    		ImageVO iv = new ImageVO();
    		//session.invalidate();
    		String userId=null;
    		if(session.getAttribute("userId")!=null){
    			PrintWriter script = response.getWriter();
    			userId=(String)session.getAttribute("userId");
    			
    		}
    		String search_5= request.getParameter("search");
    		ImageListService service=new ImageListService();
    		
    		ImageDAO idao = new ImageDAO();
        	List<ImageVO> list = idao.search(search_5);

        	if(list==null){
        		list_size=0;
        	}else{
        		list_size=list.size();
        	}
    		User user =new User();
    		User user5 =new User();
        	user.setUserId(userId);
        	
        	UserDAO udao = new UserDAO();
        	UserDAO udao2 = new UserDAO();
        	user=udao.info(user);
        	
        	MsgVO vo2 = new MsgVO();
        	vo2.setReciverId(user.getUserNickname());
        	
        	MsgDAO dao2 = new MsgDAO();
        	
    	%>
        <div id="body_"></div>
        <div class="login_popup" id="pop1" >
            <a href="#a" onclick="popup_close()"><img src="./img/close.png"alt="1" id="popup_close"></a>
                
            
            <div class="container" id="container">
                <div class="form-container sign-up-container">
                  <form name=joinform action="./user/JoinAction.jsp" class="formc">
                    
                    <h1 class="h1c">SIGN UP</h1>
                    <input type="text" placeholder="아이디" class="inpc" name="userId"/>
                    <input type="password" placeholder="비밀번호" class="inpc" name="userPassword" />
                    <input type="text" placeholder="닉네임" class="inpc" name="userNickname" />
                    <input type="text" placeholder="전화번호" class="inpc" name="userPhone" />
                    <button class="btnc" id="joingo">회원가입 하기</button>
                  </form>
                </div>
                <div class="form-container sign-in-container">
                  <form name=loginform action="./user/LoginAction.jsp" class="formc">
                    <h1>LOGIN</h1>
                    <span> </span>
                    <input type="text" placeholder="아이디" class="inpc" name="userId"/>
                    <input type="password" placeholder="비밀번호" class="inpc" name="userPassword"/>
                    <a href="#"><br>아이디/비밀번호 찾기<br></a>
                    <button class="btnc" id="logingo">로그인하기</button>
                  </form>
                </div>
                <div class="overlay-container">
                  <div class="overlay">
                    <div class="overlay-panel overlay-left">
                      <h1>LOGIN</h1>
                      <p class="h1c">로그인하면 다양한 서비스를 무료로 이용하실 수 있습니다.</p>
                      <button class="ghost btnc" id="signIn">로그인하기</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                      <h1>SIGN UP</h1>
                      <p class="h1c">회원이 되면 더 나은 서비스를 무료로 이용하실 수 있습니다.</p>
                      <button class="ghost btnc" id="signUp">회원가입 하기</button>
                    </div>
                  </div>
                </div>
              </div>
                

        </div>
        <header>
            <div id="logo">
                <a href="./index.jsp">
                    <img id="sangchu" src="./img/sangchu.png">
                </a>
            </div>
            <div id="sangchutext">
                <a href="./index.jsp">상추마켓</a>
            </div>
            
            <nav >
            	<%
            		if(userId==null){
            	%>
            	
            	
                <ul id="topMenu" >
                    <li><a href="javascript:void(0);" id="login_button" class="login_btn" onclick="popup_open()">로그인</a></li>
                    <li><a href="javascript:void(0);" id="reg" onclick="popup_open()">회원가입</a></li>
                </ul>
                <%
            		}else{
       			%>
       			
       			<ul id="topMenu" >
                    <li><a href="./user/LogoutAction.jsp">로그아웃</a></li>
                    <li><a href="./user/user_info.jsp">회원정보</a></li>
                    <li><a href="" onclick="cs_click()">고객센터</a></li>
	                    <li>
	                    
                            <a href="#" onclick="message_main_click()"> 
                                <div>
                                    <div style="position: absolute;">
                                
                                        <div id="new_box" style="position: relative;">
                <%                         
                						if(dao2.msgToMe(vo2)==true){
                %>
                                            <img id="notice" src="./img/new.png"></div>
                <%
                						}
                %>
                                    </div>
                                
                                    <img id="new" src="./img/notice.png" >
                                
                                </div>
                            </a>
                    	</li>
                </ul>
       			
       			<%
            		}
            	%>
            </nav>

            <div id="search">
                <form name="search_option" action="./search.jsp">
                    <input type="text" name="search" value="" placeholder="상품명을 검색해보세요." id="search_1">
                    <button type="submit" id="btn"><img id="searchimg"src="./img/search.png" alt=""></button>
                </form>
            </div>
        </header>
        <main class="contents">
            <div id="mid_box">
	            <div id="middle_menu">
	                <div id="region">
	                    위치정보 확인을 허용해 주세요.
	                </div>
					<%
	            		if(userId!=null){
	            	%>
	                <div id="middle_box" onclick="location.href='./write/writing.jsp?no=-1'">
	                    판매글 등록하기
	                </div>
	                <%
	                	}
					%>
	            </div>
	        </div>
           
            <div id="wrap">
                <ul id="gallery">
                    <%
                    	int page_num=0;
                    	String view_page=request.getParameter("page");
                    	if(view_page==null){
                    		page_num=0;
                    	}
                    	else{
                        	page_num=Integer.parseInt(view_page);
                    	}
                    	
                    	int list_count=0;
                    	int count2=0;
                    	String s="";
                    	
                    	if(list!=null){
						for(ImageVO vo:list){
							
							if(vo.getVisit()==1){
                        		s = "style='transform:scale(1);' ";
                        	}else{
                        		s = "";
                        	}
							
							if(count2>=page_num*8 && count2<(page_num+1)*8){
							
								user5.setUserId(vo.getUserId());
								user5=udao2.info(user5);
							
					%>
							<li class="product_line">
		                        <a href="./details/product.jsp?no=<%=vo.getNo()%>&title=<%=vo.getTitle() %>&price=<%=vo.getPrice() %>&s_region=<%=vo.getRegion() %>&content=<%=vo.getContent() %>&
s_userId=<%=vo.getUserId() %>&fileName=<%=vo.getFileName() %>&visit=<%=vo.getVisit() %>&writeDate=<%=vo.getWriteDate() %>&userNickname=<%=user5.getUserNickname()%>">
		                            <div class="product_img">
		                                 <%
		                                	
		                                %>
		                                
		                                <img <%=s %> src="./data/img/<%=vo.getFileName()%>" alt="1">
		                               <% if(vo.getVisit()==1){
		                            	%>
		                                <div style="position: absolute;  left:-30px; top: 0px; scale:0.7;">
                                            <img style="transform:scale(1);" src="./img/sold.png"></img> 
                                        </div>
                                        <% }
		                            	%>
		                            </div>
		                        </a>
		                        <a href="./details/product.jsp?no=<%=vo.getNo()%>&title=<%=vo.getTitle() %>&price=<%=vo.getPrice() %>&s_region=<%=vo.getRegion() %>&content=<%=vo.getContent() %>&
s_userId=<%=vo.getUserId() %>&fileName=<%=vo.getFileName() %>&visit=<%=vo.getVisit() %>&writeDate=<%=vo.getWriteDate() %>&userNickname=<%=user5.getUserNickname()%>">
			                        <div class="title">
			                            <p class="prd_name"><%=vo.getTitle() %></p>
			                            <p class="prd_price"><%=vo.getPrice() %></p>
			                            <p class="prd_add"><%=vo.getRegion() %></p>
		                            
	                            </a>
		                        </div>
		                    </li>
					<%
								list_count++;
							}
							if(list_count==8){
								break;
							}
							count2++;
						}
                    	}
					%>
                    
                </ul>
            </div>
        </main>
 <div class="prd_page" >
         	<%if(page_num-1<0){
       		 %>
       		 <div class="prd_box" >
       		 	<a href="./search.jsp?search=<%= search_5%>&page=<%=page_num%>" class="p_center"><%=page_num+1 %></a> 
       		 	<%if(list_size > 8){%>
         		<a href="./search.jsp?search=<%= search_5%>&page=<%=page_num+1%>" class="p_left"><%=page_num+2 %></a> 
         		<%	
         		} 
	         	if(list_size>16){
         		
         		%>
         		<a href="./search.jsp?search=<%= search_5%>&page=<%=page_num+2%>" class="p_right"><%=page_num+3 %></a> 
         		<%} %> 
       		 </div>
       		 <%
       		 }
         	else if( ((page_num+1)*8)>list_size){
       		 %>
         	<div class="prd_box" >
         	<%if(list_size > 16 ){
       		 %>
	         	<a href="./search.jsp?search=<%= search_5%>&page=<%=page_num-2%>" class="p_left"><%=page_num-1 %></a>  
	         <%}
         	%>	
	         	
	         	<a href="./search.jsp?search=<%= search_5%>&page=<%=page_num-1%>" class="p_right"><%=page_num %></a> 
	         	<a href="./search.jsp?search=<%= search_5%>&page=<%=page_num%>" class="p_center"><%=page_num+1 %></a> 
        	</div>
			<%
			}
         	else{
         	%>
         	<div class="prd_box" >
         		
         		<a href="./search.jsp?search=<%= search_5%>&page=<%=page_num-1%>" class="p_left"><%=page_num %></a>  
	         	
	         	<%if(list_size > 8){%>
         		<a href="./search.jsp?search=<%= search_5%>&page=<%=page_num%>" class="p_center"><%=page_num+1 %></a> 
         		<%	
         		} 
	         	if(list_size>16){
         		
         		%>
	         	
	         	<a href="./search.jsp?search=<%= search_5%>&page=<%=page_num+1%>" class="p_right"><%=page_num+2 %></a>
	         	<%} %> 
         	</div>
         	<%
         	}
         	%>
         	
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
            addname=result[0].address.region_1depth_name  +" " +result[0].address.region_2depth_name  +" "+result[0].address.region_3depth_name
            var region=document.getElementById("region");
            region.innerHTML=addname+" 주변의 농산물 목록이에요.";
        }
    }
    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);     

}

const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');
const regnButton = document.getElementById('reg');
const loginButton = document.getElementById('login_button');
const joingoButton = document.getElementById('joingo');
const logingoButton = document.getElementById('logingo');
logingoButton.addEventListener('click', () => {
    document.loginform.submit();	
});

joingoButton.addEventListener('click', () => {
    document.joinform.submit();	
});

signUpButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});

regnButton.addEventListener('click', () => {
    container.classList.add("right-panel-active");
});

loginButton.addEventListener('click', () => {
    container.classList.remove("right-panel-active");
});

function cs_click() {
	  

	  window.open('./message/message.jsp?p_userId=<%=user.getUserNickname()%>&s_userId=고객센터', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);
	}

function message_main_click() {
	  
	  window.open('./message/message_main.jsp', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);

}
</script>