# SangChuMarket
농산물 직거래 장터 상추마켓

## 🖥️ 프로젝트 소개
농산물 직거래 장터 상추마켓 입니다. 당근마켓을 참고하여 제작하였습니다.
<br>

### ⚙️ 개발 환경
- `Java 8`
- `JDK 20`
- **IDE** : Eclipse 
- **Server** : Apache Tomcat (v9.0)
- **Database** : MySQL

## 📌 주요 기능
#### 기본적인 CRUD 기능
#### 1:1 대화 기능
#### 대화 알림 기능
#### COS 라이브러리를 활용한 파일 업로드 기능
#### 페이징 기능
#### KAKAO API를 이용한 접속위치 확인 기능
#### 게시물 검색 기능
#### 판매자 정보 표시 기능
<br>

## 🗝️ 사용 기술 상세
<details><summary><h4>판매자와 구매자의 중간지점 찾기</h4> </summary>

<!-- summary 아래 한칸 공백 두어야함 -->
```
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
            }
        };

```
</details>
<details><summary><h4>1:1 대화 기능</h4> </summary>

<!-- summary 아래 한칸 공백 두어야함 -->

1. <message.jsp에 관하여(메세지보내는 창)>메시지를 보낼 때 msg 테이블에 reciverID에 받는사람 senderID에 보낸사람을 입력하여 msg table에 into 하도록 하였습니다.
   과거 대화내역 출력 부분은 select * from msg where (받는사람 = 나 and 보낸사람 = 상대) or (받는사람 = 상대 and 보낸사람 = 나) 인 경우를 리스트에 담아서 가져오게하였습니다.
   가져온 뒤 reciverID가 나면 대화의 왼쪽, senderID가 나면 대화의 오른쪽에 표시되도록 하였습니다.


2. <message_main.jsp에 관하여(메세지함 창)>메세지 함에서 개개인별 대화내역의 마지막 내용을 리스트를 가져온 방법은 자신의 닉네임이 받는사람 이거나 보낸사람이면(select * from msg where (senderId= 자신닉네임) or (reciverId= 자신닉네임)  리스트에 담아서 가지고왔습니다.
   그 뒤 한 상대당 1개의 리스트(채팅방)만 보여지게 하기 위해 중복된 값을 제거하여(msgList3 메소드에서 반복문과 ArrayList<String>의 contain 메소드를 이용) 대화함에 출력하였습니다.


3. 메세지 알림기능은 is Read가 0이고 받는사람이 자신이라면 알림이 표시되도록 하였고(msgToMe 메소드) 알림을 확인할경우 isRead를 1로 update 하도록 하였습니다(msgRead 메소드)


<a href="https://github.com/MegaZizon/SangChuMarket/blob/main/src/main/webapp/message/message.jsp">message.jsp</a>


<a href="https://github.com/MegaZizon/SangChuMarket/blob/main/src/main/webapp/message/message_main.jsp">message_main.jsp</a>


<a href="https://github.com/MegaZizon/SangChuMarket/blob/main/src/main/java/msg/MsgDAO.java">MsgDAO.java</a>

</details>

</details>
<details><summary><h4> 데이터베이스 구성</h4> </summary>

<!-- summary 아래 한칸 공백 두어야함 -->

TABLE USER


![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/4eaa899e-808a-4f7c-b8ac-3c4ed7857624)

TABLE Image


![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/96e74297-a60f-4b3e-924f-3d2ec16e4984)

TABLE Msg


![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/a17cc4e8-6b2b-4764-9059-1ab6669f5d0a)


</details>

 

<!-- <details><summary><h4>MVC 모델 1</h4> </summary> -->

<!-- summary 아래 한칸 공백 두어야함 -->

<!--  ![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/955710bc-b54b-49da-8dc0-8ce25f9b12ac) -->


상추마켓은 MVC모델 1 구조를 사용하였습니다. View 와 Controller 모두 JSP가 담당하며 Model은 JavaBeans에서 담당합니다. 
구조가 단순하여 익히고 적용하기가 쉽기 때문에 이 구조를 사용하였습니다.
하지만 사용하면서 출력을 위한 뷰 코드와 로직처리를 위한 자바 코드 등이 뒤섞여 나중에는 유지보수가 매우 어려워지는 것을 느꼈습니다. 
</details>

</details> 


## 🚩 구현 결과



#### 메인 페이지


![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/7a484bd3-a125-4685-8ee9-ad183203a237)


<details><summary><h4>로그인 팝업창</h4> </summary>

<!-- summary 아래 한칸 공백 두어야함 -->

![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/6a2e72cf-6387-4553-8546-491e2ebb469f)

</details>

<details><summary><h4>회원가입 팝업창</h4> </summary>

<!-- summary 아래 한칸 공백 두어야함 -->

![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/aab684ce-f219-4a25-ae99-1b8e8d1ceea0)


</details>

<details><summary><h4>검색 페이지</h4> </summary>

<!-- summary 아래 한칸 공백 두어야함 -->

![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/66290e9d-d1dc-45a4-9a65-07422677421b)


</details>

<details><summary><h4>판매글 등록 페이지</h4> </summary>

<!-- summary 아래 한칸 공백 두어야함 -->

![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/a7cf49bc-0ba3-407d-b4ba-7c6b7cb4b2a0)


</details>

<details><summary><h4>판매자 상세정보 페이지</h4> </summary>

<!-- summary 아래 한칸 공백 두어야함 -->

![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/ac490a7d-1784-4585-af1c-43d8d5955b8c)
![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/c80466e9-c3e0-4b4f-8630-075434985461)
![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/49a7ea1f-5cd9-4f4f-a81e-1a10adf6831c)
![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/9ad55d46-4121-45da-9366-559427da32ac)




</details>

<details><summary><h4>1:1 대화</h4> </summary>

<!-- summary 아래 한칸 공백 두어야함 -->

![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/b1a24d66-cddf-44a1-9d76-0e4ed2e95b4d)


</details>

<details><summary><h4>중간지점 찾기 클릭</h4> </summary>

<!-- summary 아래 한칸 공백 두어야함 -->

![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/5d35e499-ad56-473a-bee0-49eec2eac468)



</details>

<details><summary><h4>판매자 상세정보 페이지</h4> </summary>

<!-- summary 아래 한칸 공백 두어야함 -->

![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/f9d2e029-df85-48f7-9658-e983d61ae93c)


</details>

<details><summary><h4>회원정보 페이지</h4> </summary>

<!-- summary 아래 한칸 공백 두어야함 -->

![image](https://github.com/MegaZizon/SangChuMarket/assets/105596059/e7a3982b-f7c1-45a2-9880-cedc41b4bc58)



</details>

