function popup_open() {
  
    const btn1 = document.getElementById('pop1');
    var bd = document.getElementById('body_');
    bd.style.opacity='0.5';
    bd.style.zIndex='1';
    bd.style.overflow='hidden';
    btn1.style.opacity = "1";
    btn1.style.display = "block";
  }
function popup_close() {
  
    const btn1 = document.getElementById('pop1');
    var bd = document.getElementById('body_');
    bd.style.opacity='0';
    bd.style.zIndex='0';
    btn1.style.opacity = "0";
    btn1.style.display = "none";
  }
  function changeFileName(e){
    e.classList.add('on');
    e.innerHTML = '파일명을 변경합니다.';
    e.nextElementSibling.disabled = false;
    e.nextElementSibling.focus();
}

function uploadName(e){
  var files = e.files;
  var filename = files[0].name;  //console.log(filename);
  // 추출한 파일명 삽입 
  var upload_name = e.parentNode.previousElementSibling;
  upload_name.value = filename;
}//uploadName





function reg_click() {
  
  const rg = document.getElementById('register_box');
  document.write_form.submit();	
}

function back_click() {
  
  location.href = "./index.jsp";
}

function cancel_click() {
  
  const rg = document.getElementById('register_box');
  document.write_form.reset();	
}

function message_click() {
  
  window.open('./message/message.jsp?name', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);

}

function message_main_click() {
 	  
 	  window.open('./message/message_main.jsp', '', 'status=no, height=600, width=420, left='+ 400 + ', top='+ 200);

}