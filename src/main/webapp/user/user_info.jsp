<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="user.*" %>
<%@ page import="msg.*" %>
<%@ page import="image.*" %>
<%@ page errorPage="../exception.jsp"%>

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
	int selling_count=0,score_count=0;
	ImageDAO idao = new ImageDAO();
	
	List<ImageVO> list = idao.sellerInfo(userId);
	if(list!=null){
		for(ImageVO ov : list){
			if(ov.getVisit()!=0){
				score_count++;
			}
			else{
				selling_count++;
			}
		}
	}
	
	
%>
    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <title>상추마켓</title>      
        <link rel="stylesheet" type="text/css" href="../css/index.css?v=l">
        <link rel="stylesheet" type="text/css" href="../css/seller.css?v=l">
        <script type="text/javascript" src="./index.js"></script>
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
    
        <div id="change_Nick">
            <div id="change_Nick_close" onclick="change_Nick_close1()">
                <img src="../img/close.png" id="p_close">
            </div>
            <div>
                <div class="question_2">
                    닉네임 변경
                </div>
                <div class="question_1">
                    <%=user3.getUserNickname() %><br>에서
                </div>
                <form name=n_c action="info_change.jsp">
                    <input type="hidden" class="textbox_1" name="menu" value="n_c">
                    
                    <input type="text" class="textbox_1" name="nickName">
                    <div class="question_1">
                        (으)로
                    </div>
                    <div>
                    <button class="btnbox_1" id="c_n1">변경하기</button>
                    </div>
                </form>
            </div>
        </div>

        <div id="change_pw">
            <div id="change_pw_close" onclick="change_pw_close1()">
                <img src="../img/close.png" id="p_close">
            </div>
            <div>
                <form name=p_c action="info_change.jsp">
                    <input type="hidden" class="textbox_1" name="menu" value="p_c">
                <div class="question_1">
                    현재 비밀번호
                </div>
                <input type="password" class="textbox_1" name="p_password">
                <div class="question_1">
                    비밀번호 변경
                </div>
                <input type="password" class="textbox_1" name="n1_password">
                <div class="question_1">
                    비밀번호 확인
                </div>
                <input type="password" class="textbox_1" name="n2_password">
                <div>
                    <button class="btnbox_1" id="c_p1">변경하기</button>
                </div>
                </form>
            </div>
        </div>

        <div id="change_phone">
            <div id="change_phone_close" onclick="change_phone_close1()">
                <img src="../img/close.png" id="p_close">
            </div>
            <div >
                <div class="question_2">
                    연락처 변경
                </div>
                <div >
                    <%=user3.getUserPhone() %><br>에서
                </div>
                <form name=ph_c action="info_change.jsp">
                    <input type="hidden" class="textbox_1" name="menu" value="ph_c">
                    <input type="text" class="textbox_1" name="phone">
                
                    <div >
                        (으)로
                    </div>
                    <div>
                        <button class="btnbox_1" id="c_ph1">변경하기</button>
                    </div>
                </form>
            </div>
        </div>

        <div id="quit_user">
            <div id="quit_user_close" onclick="quit_user_close1()">
                <img src="../img/close.png" id="p_close">
            </div>
            <div>
                <div class="question_2">
                    회원 탈퇴
                </div>
                <div class="question_1">
                    비밀번호를 <br>입력해주세요
                </div>
                <form name=u_c action="info_change.jsp">
                    <input type="hidden" class="textbox_1" name="menu" value="u_c">
                    
                    <input type="password" class="textbox_1" name="password">
                    
                    <div>
                    	<button class="btnbox_1" id="c_u1">탈퇴하기</button>
                    </div>
                </form>
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
	                    <li><a href="./LogoutAction.jsp">로그아웃</a></li>
                    	<li><a href="./user_info.jsp">회원정보</a></li>
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
           		</div>
                
            </header>

            <main class="contents">
                <div id=seller_wrap>
                    <div id="seller_wrap2">
                        <div id="seller_wrap3">
                            <div id="u_discription">
                                <div id="s_title">
                                    MyPage
                                </div>
                                <table id="ss_table">
                                    
                                    <tr>
                                        <td style="font-weight:bold;  color:rgb(250, 135, 20)">아이디</td>
                                        <td><%=user3.getUserId() %></td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight:bold;  color:rgb(250, 135, 20)">판매점수</td>
                                        <td><%=score_count*100 %></td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight:bold;  color:rgb(250, 135, 20)">닉네임</td>
                                        <td><%=user3.getUserNickname() %></td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight:bold;  color:rgb(250, 135, 20)">연락처</td>
                                        <td><%=user3.getUserPhone() %></td>
                                    </tr>
                                    <tr>
                                        <td class="asdf" onclick="change_Nick()" style="cursor:pointer; color:black;">닉네임변경</td>
                                        <td class="asdf" onclick="change_pw()" style="cursor:pointer; color:black;">비밀번호변경</td>
                                    </tr>
                                    <tr>
                                        <td class="asdf" onclick="change_phone()" style="cursor:pointer; color:black;">연락처변경</td>
                                        <td class="asdf" onclick="quit_user()" style="cursor:pointer; color:black;">회원탈퇴</td>
                                    </tr>
                                    
                                    
                                </table>
                            </div>
                            <div id="sell_list_box2">
                                <div id="seller_wrap5">
                                    작성글 목록
                                </div>
                                
                                    <table class='sell_list_table'>
                                        <th>글　제목</th>
                                        <th>판매가격</th>
                                        <th>판매상태</th>
                                        <th>수정/삭제<br>판매완료</th>
                                    </table>
                                    <div id="seller_wrap4_1">
                                    <table class='sell_list_table'>
                                <%    
                                	int selling_count2=0,score_count2=0;
                                if(list!=null){
                               			for(ImageVO ov : list){
                                    		if(ov.getVisit()!=0){
                                    			score_count2++;
                                    		}
                                    		else{
                                    			selling_count2++;
                                    		}
                                    		
                           		 %>
                                        <tr class="sell_tr">
                                            
                                                <td>
                                                <a href="../details/product.jsp?no=<%=ov.getNo()%>&title=<%=ov.getTitle() %>&price=<%=ov.getPrice() %>&s_region=<%=ov.getRegion() %>&content=<%=ov.getContent() %>&
s_userId=<%=ov.getUserId() %>&fileName=<%=ov.getFileName() %>&visit=<%=ov.getVisit() %>&writeDate=<%=ov.getWriteDate() %>&userNickname=<%=ov.getUserNickname()%>">
                                                
                                                <%=ov.getTitle() %></a></td>
                                                <td><%=ov.getPrice() %></td>
                                                
                                <%
                                	if(ov.getVisit()==0){
                                %>
                                		<td class="status_set">
                                                <button class="selling1">판매중</button>
                                        </td>
                                        <td>
                                            <form style="inline" action="info_change.jsp" name="e_option">
                    							<input type="hidden" name="menu" value="edit">
                    							<input type="hidden" name="no" value="<%=ov.getNo() %>">
                    							<input type="hidden" name="title" value="<%=ov.getTitle() %>">
                    							<input type="hidden" name="price" value="<%=ov.getPrice() %>">
                    							<input type="hidden" name="content" value="<%=ov.getContent() %>">
                    							<input type="hidden" name="fileName" value="<%=ov.getFileName() %>">
	                                           <button class="edit_1" id="edit123">　수정　</button>
                                           </form>
                                           <form style="inline" action="info_change.jsp" name="d_option">
                                           		<input type="hidden" name="menu" value="del">
                    							<input type="hidden" name="no" value="<%=ov.getNo() %>">
	                                           <button class="edit_1" id="del123">　삭제　</button>
	                                       </form>
	                                       <form style="inline" action="info_change.jsp" name="s_option">
                                          		<input type="hidden" name="menu" value="sold">
                   								<input type="hidden" name="no" value="<%=ov.getNo() %>">
	                                           	<button class="edit_1" id="sold123">판매완료</button>
                                           </form>
                                       </td>
                             		
                             	<%
                                	}else{
                           		 %>	
                           		 		      
                                         <td class="status_set">
                                             <form action="">
                                                 <button class="selled1">판매완료</button>
                                             </form>
                                         </td>
                                         <td>　</td>
                                    </tr>
                         		 <%
                                	}
                                %>
                                          
                                  <%}}%>
                                    </table>
                                </div>
                            </div>

                            
                        </div>
                    </div>
                    <div >
                        <ul id="p_menu">
                            <li class="p_li" id="p_btn_back" onclick="golist()">메인으로</li>
                            
                        </ul>
                    </div>
                </div>
            </main>
    </div>
</body></html>

<script>

function change_Nick() {
  var btn1 = document.getElementById('change_Nick');
  btn1.style.opacity=1;
  btn1.style.visibility = "visible";
  console.log("gddd");
}

function change_Nick_close1() {
  
  const btn1 = document.getElementById('change_Nick');
  btn1.style.opacity = "0";
  btn1.style.visibility = "hidden";
  
}

function change_pw() {
  var btn1 = document.getElementById('change_pw');
  btn1.style.opacity=1;
  btn1.style.visibility = "visible";
  console.log("gddd");
}

function change_pw_close1() {
  
  const btn1 = document.getElementById('change_pw');
  btn1.style.opacity = "0";
  btn1.style.visibility = "hidden";
  
}

function change_phone() {
  var btn1 = document.getElementById('change_phone');
  btn1.style.opacity=1;
  btn1.style.visibility = "visible";
  console.log("gddd");
}

function change_phone_close1() {
  
  const btn1 = document.getElementById('change_phone');
  btn1.style.opacity = "0";
  btn1.style.visibility = "hidden";
  
}

function quit_user() {
  var btn1 = document.getElementById('quit_user');
  btn1.style.opacity=1;
  btn1.style.visibility = "visible";
  console.log("gddd");
}


function quit_user_close1() {
  
  const btn1 = document.getElementById('quit_user');
  btn1.style.opacity = "0";
  btn1.style.visibility = "hidden";
  
}

function golist() {
	window.location.href='../index.jsp';  
}

const pwButton = document.getElementById('c_p1');
const phoneButton = document.getElementById('c_ph1');
const delButton = document.getElementById('c_u1');
const del1234 = document.getElementById('del123');
const edit1234 = document.getElementById('edit123');
const sold1234 = document.getElementById('sold123');

const nickButton = document.getElementById('c_n1');
nickButton.addEventListener('click', () => {
    document.n_c.submit();	
});

pwButton.addEventListener('click', () => {
    document.p_c.submit();	
});

phoneButton.addEventListener('click', () => {
    document.ph_c.submit();	
});

delButton.addEventListener('click', () => {
    document.u_c.submit();	
});

sold1234.addEventListener('click', () => {
    document.s_option.submit();	
});
edit1234.addEventListener('click', () => {
    document.e_option.submit();	
});
del1234.addEventListener('click', () => {
    document.d_option.submit();	
});
function cs_click() {
	  

  window.open('../message/message.jsp?p_userId=<%=user3.getUserNickname()%>&s_userId=고객센터', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);
}

function message_click() {
	  
	  window.open('../message/message.jsp?name', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);

}

function message_main_click() {
 	  
 	  window.open('../message/message_main.jsp', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);

}

</script>