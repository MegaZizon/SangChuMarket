<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.*" %>
<%@ page import="msg.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
	String userId=null;
	if(session.getAttribute("userId")!=null){
		userId=(String)session.getAttribute("userId");
		
	}
	User user3 =new User();
	user3.setUserId(userId);
	
	UserDAO udao2 = new UserDAO();
	user3=udao2.info(user3);
	
	MsgVO vo2 = new MsgVO();
	vo2.setReciverId(user3.getUserNickname());
	MsgDAO dao2 = new MsgDAO();
	
	if(userId==null){

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href='../index.jsp'");
		script.println("</script>");
	}
	
	
	
	
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>상추마켓</title>        
        <link rel="stylesheet" type="text/css" href="../css/index.css?v=<%=System.currentTimeMillis() %>">
        <script type="text/javascript" src="../index.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d67f7666b7975bc2a2fb3fcc0f2e4082&libraries=services"></script>
        <style>
            body{-ms-overflow-style:none; }
            body::-webkit-scrollbar { display:none; }
            body {
                margin: 0;
  				padding:0;   /* 패딩 리셋 */
            }
            .all {
                margin: 0;
  				padding:0;   /* 패딩 리셋 */
                width: 100vw;
                padding-bottom: 100px;
            }

        </style>

    </head>
    <body>
    
        <div id="map">
            <div id="map_close" onclick="map_close1()">
                <img src="../img/close.png" id="p_close">
            </div>
        </div>
        
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
                            <a href="#" onclick="message_main_click()"> 
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
            <%
	            String p_userId=null;
	    		if(session.getAttribute("userId")!=null){
	    			p_userId=(String)session.getAttribute("userId");
	    		}
            	String userNickname =request.getParameter("userNickname");
	        	String s_userId =request.getParameter("s_userId");
	        	String s_region =request.getParameter("s_region");
	        	String no =request.getParameter("no");
	        	String title =request.getParameter("title");
	        	String price =request.getParameter("price");
	        	String content =request.getParameter("content");
	        	String fileName =request.getParameter("fileName");
	        	String visit =request.getParameter("visit");
	        	String writeDate =request.getParameter("writeDate");
	        	String ss_userId=s_userId;
	        	
	        	User user =new User();
	        	User user7 =new User();
	        	user.setUserId(p_userId);
	        	
	        	UserDAO udao = new UserDAO();
	        	user=udao.info(user);
	        	String p_userNickname=user.getUserNickname();
	        	
	        	p_userId=p_userNickname;
	        	s_userId=userNickname;
	        	
	        	SimpleDateFormat sDate2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
	        	Date ss = sDate2.parse(writeDate);
	        	SimpleDateFormat fDate = new SimpleDateFormat("yy년 M월d일 h시m분");
	        	
	        	if(userNickname.equals("null")){
	        		user7.setUserId(ss_userId);
	        		user7=udao.info(user7);
	        		userNickname = user.getUserNickname();
	        	}
	        	
	        	
            %>
            <main class="contents">
                <div id=product_wrap>
                    <div id="product_wrap2">
                        <div id="product_wrap3">
                            <div id="the_product_img" style="position: relative;">
                                <img src="../data/img/<%=fileName %>" alt="1">
                                
                            </div>

                            <div id="p_discription">
	                            <%if(visit.equals("1")){
                                %>
                                <div style="position: absolute; left: 20%; top:100px; scale:1.5;">
                                     <img src="../img/sold.png"></img> 
                                </div>
                                <%} %>
                                <div id="p_title">
                                    <%=title %>
                                </div>
                                <div id="p_price">
                                    <%=price %><span style="font-size: 30px;">&nbsp;원</span>
                                </div>
                                <table id="p_table">
                                    <tr>
                                        <td class="main_text">작성자</td>
                                        <td><%=userNickname %></td>
                                    </tr>
                                    <tr>
                                        <td class="main_text">거래지역</td>
                                        <td><%=s_region %></td>
                                    </tr>
                                    <tr>
                                        <td class="main_text">작성시간</td>
                                        <td><%=fDate.format(ss) %></td>
                                    </tr>
                                    <tr>
                                        <td class="main_text">상세설명</td>
                                        <td id="content_box1" ><%=content %></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <%if(!user.getUserNickname().equals(userNickname)){
                   	 %>
                    	
                   	<div >
                        <ul id="p_menu">
                            <li class="p_li" id="p_btn_message" onclick="message_click()">1:1 대화신청</li>
                            <li class="p_li" id="p_map" onclick="map_open1()" >중간지점 찾기</li>
                            <li class="p_li" id="p_phone" onclick="sellerInfo_open()">판매자 정보</li>
                            <li class="p_li" id="p_btn_back" onclick="golist()">이전으로</li>
                         </ul>
                    </div>
                    <%}
                    else{
                    	
                    %>
                   
                    <div >
                        <ul id="p_menu">
                        
                            
                            <form style="inline" action="../user/info_change.jsp" name="s_option">
                           		<input type="hidden" name="menu" value="sold">
   								<input type="hidden" name="no" value="<%=no %>">
                            </form>
                            <%if(visit.equals("0")){ %>
                            
                            <li class="p_li" id="p_phone" onclick="sold_click3()">판매완료</li>
                            <form style="inline" action="../user/info_change.jsp" name="d_option">
                          		<input type="hidden" name="menu" value="del_2">
   								<input type="hidden" name="no" value="<%=no %>">
                            </form>
                            <li class="p_li" id="p_map" onclick="del_click3()" >삭제하기</li>
                            
                             <form style="inline" action="../user/info_change.jsp" name="e_option">
								<input type="hidden" name="menu" value="edit">
								<input type="hidden" name="no" value="<%=no %>">
								<input type="hidden" name="title" value="<%=title %>">
								<input type="hidden" name="price" value="<%=price %>">
								<input type="hidden" name="content" value="<%=content %>">
								<input type="hidden" name="fileName" value="<%=fileName %>">
		                    </form>
                            <li class="p_li" id="p_btn_message" onclick="edit_click3()">수정하기</li>
                            <%} %>
                            
                            <li class="p_li" id="p_btn_back" onclick="golist()">이전으로</li>
                         </ul>
                    </div>
                    <%}
                    %>
                    
                </div>
            </main>
    </div>
</body></html>

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
                document.write_form.region.value=addname;
            }
        }
        geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);     
    
    }
    function message_click() {
    	  
    	  window.open('../message/message.jsp?no=<%=no%>&p_userId=<%=p_userId%>&s_userId=<%=s_userId%>', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);

   	}
    function sellerInfo_open() {
    	 location.href = "./seller_info.jsp?no=<%=no%>&p_userId=<%=p_userId%>&s_userId=<%=s_userId%>&ss_userId=<%=ss_userId%>&s_region=<%=s_region%>";

 	}
    
    

</script>

<script>

(function location(){
    navigator.geolocation.getCurrentPosition(
    function(position) {
    addy2= position.coords.latitude;
    addx2= position.coords.longitude;
    }, 
    );       
})();

var addx1,addy1,addx2,addy2,addx3,addy3,addy4,addx4,lat,lng,addname2;
let options;
var geocoder = new kakao.maps.services.Geocoder();
var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        console.log(result);
        addx1=result[0].address.x;
        addy1=result[0].address.y;
        addx1=parseFloat(addx1);
        addy1=parseFloat(addy1);
        addx3=addx1+addx2;
        addy3=addy1+addy2;
        addx4 = addx3/2;
        addy4 = addy3/2;
        lat = addy4;
        lng = addx4;

        options = { //지도를 생성할 때 필요한 기본 옵션
            center: new kakao.maps.LatLng(addy4, addx4), //지도의 중심좌표.
            level: 4 //지도의 레벨(확대, 축소 정도)
        };
        const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
        let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
        var marker = new kakao.maps.Marker({ 
            // 지도 중심좌표에 마커를 생성합니다 
            position: map.getCenter() 
        }); 
        // 지도에 마커를 표시합니다
        marker.setMap(map);
        getAddr(lat,lng);
        function getAddr(lat,lng){
            let geocoder = new kakao.maps.services.Geocoder();

            let coord = new kakao.maps.LatLng(lat, lng);
            let callback = function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    addname2=result[0].address.address_name;
                }
            }
            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
        }
    }
};
<%if(!s_region.equals("알 수 없는 위치")){
%>
	geocoder.addressSearch('<%=s_region %>', callback);
<%
}
%>

function map_open1() {
  if(addname==undefined){
	    alert("현재 위치정보를 받아올 수 없습니다.")
	    addname="강원도 춘천시";
  }
  var btn1 = document.getElementById('map');
  btn1.style.opacity=1;
  btn1.style.visibility = "visible";
  console.log("gddd");
}

function map_close1() {
  
  const btn1 = document.getElementById('map');
  btn1.style.opacity = "0";
  btn1.style.visibility = "hidden";
  
}

function golist() {
	history.back();
}
function cs_click() {
	  

	  window.open('../message/message.jsp?p_userId=<%=user.getUserNickname()%>&s_userId=고객센터', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);
	}
	
function cs_click() {
	  

	  window.open('../message/message.jsp?p_userId=<%=user.getUserNickname()%>&s_userId=고객센터', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);
	}
	
function edit_click3() {
	  document.e_option.submit();
}
function del_click3() {
	  document.d_option.submit();
}
function sold_click3() {
	  document.s_option.submit();
}

function message_main_click() {
	  
	  window.open('../message/message_main.jsp', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);

}
</script>
