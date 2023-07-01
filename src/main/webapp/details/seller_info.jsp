
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="image.*"%>
<%@page import="user.*"%>
<%@page import="msg.*"%>
<%@ page errorPage="../exception.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>상추마켓</title>          
        <link rel="stylesheet" type="text/css" href="../css/index.css?v=<%=System.currentTimeMillis() %>">
        <link rel="stylesheet" type="text/css" href="../css/seller.css">
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
    
    <%

	
	String ss_userId =request.getParameter("ss_userId");
	String s_region =request.getParameter("s_region");
	String no =request.getParameter("no");
	String p_userId =request.getParameter("p_userId");
	String s_userId =request.getParameter("s_userId");
%>
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
	
	UserDAO udao5 = new UserDAO();
	User user5 = new User();
	user5.setUserId(ss_userId);
	user5=udao5.info(user5);
	String phoneNumber= user5.getUserPhone();

%>
    
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
                        <main class="contents">
                <div id=seller_wrap>
                    <div id="seller_wrap2">
                        <div id="seller_wrap3">
                            <div id="sell_list_box">
                                <div id="seller_wrap5">
                                    판매내역
                                </div>
                                
                                    <table class='sell_list_table'>
                                        <th>글 제목</th>
                                        <th>판매가격</th>
                                        <th>판매상태</th>
                                        <th>작성시간</th>
                                    </table>
                                    <div id="seller_wrap4">
                                    <table class='sell_list_table'>
                                    <%
                                    	int selling_count=0,score_count=0;
                                    	ImageDAO idao = new ImageDAO();
                                    	
                                    	List<ImageVO> list = idao.sellerInfo(ss_userId);
                                    	for(ImageVO ov : list){

                            	        	SimpleDateFormat sDate2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
                            	        	Date ss = sDate2.parse(ov.getWriteDate());
                            	        	SimpleDateFormat fDate = new SimpleDateFormat("M월d일 h시m분");
                                    		if(ov.getVisit()!=0){
                                    			score_count++;
                                    		}
                                    		else{
                                    			selling_count++;
                                    		}
                                    		
        
                                    %>
                                        <tr class="sell_tr">
                                            
                                                <td>
                                                <a href="./product.jsp?no=<%=ov.getNo()%>&title=<%=ov.getTitle() %>&price=<%=ov.getPrice() %>&s_region=<%=ov.getRegion() %>&content=<%=ov.getContent() %>&
s_userId=<%=ov.getUserId() %>&fileName=<%=ov.getFileName() %>&visit=<%=ov.getVisit() %>&writeDate=<%=ov.getWriteDate() %>&userNickname=<%=s_userId %>">
                                                
                                                <%=ov.getTitle()%></a></td>
                                                <td><%=ov.getPrice() %></td>
                                          
                                <%
                            		if(ov.getVisit()==0){
                            	%>
                            	
                            	 	<td><button class="selling1">판매중</button></td>
                            	
                            	<%		
                            		}else{
                                %>                
                                    <td><button class="selled1">판매완료</button></td>
                               <%
                            		}
                               %>
                                                <td><%=fDate.format(ss) %></td>
                                        </tr>
                                       <%
                                    	}
                                       %>
                                        
                                    </table>
                                </div>
                            </div>

                            <div id="s_discription">
                                <div id="s_title">
                                </div>
                                <div id="s_price">
                                    INFORMATION
                                </div>
                                <table id="s_table">
                                    <tr>
                                        <td>닉네임</td>
                                        <td><%=s_userId %></td>
                                    </tr>
                                    <tr>
                                        <td>거래지역</td>
                                        <td><%=s_region %></td>
                                    </tr>
                                    <tr>
                                        <td>판매중인 상품</td>
                                        <td><%=selling_count %>개</td>
                                    </tr>
                                    <tr>
                                        <td>연락처</td>
                                        <td><%=phoneNumber %></td>
                                    </tr>
                                    <tr>
                                        <td>판매점수</td>
                                        <td><%=score_count * 100 %></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div >
                        <ul id="p_menu">
                            <li class="p_li" id="p_btn_message" onclick="message_click()">1:1 대화신청</li>
                            <li class="p_li" id="p_map" onclick="map_open1()" >중간지점 찾기</li>
                            <li class="p_li" id="p_btn_back" onclick="golist()">목록으로</li>
                            <li class="p_li" id="p_phone" onclick="prev1()">이전으로</li>
                         </ul>
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
                addname=result[0].address.region_1depth_name  +" " +result[0].address.region_2depth_name  +" "+result[0].address.region_3depth_name
                document.write_form.region.value=addname;
            }
        }
        geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);     
    
    }
    function message_click() {
    	  
    	  window.open('../message/message.jsp?no=<%=no%>&p_userId=<%=p_userId%>&s_userId=<%=s_userId%>', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);

   	}
    


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
	window.location.href='../index.jsp';  
}
function prev1() {
	history.back(); 
}
function sellerInfo_open() {
	 location.href = "./seller_info.jsp?no=<%=no%>&p_userId=<%=p_userId%>&s_userId=<%=s_userId%>&ss_userId=<%=ss_userId%>&s_region=<%=s_region%>";

}
function cs_click() {
	  

	  window.open('../message/message.jsp?p_userId=<%=user3.getUserNickname()%>&s_userId=고객센터', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);
	}
function message_main_click() {
	  
	  window.open('../message/message_main.jsp', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);

}
</script>