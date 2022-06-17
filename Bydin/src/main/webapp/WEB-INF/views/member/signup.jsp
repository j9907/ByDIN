<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
body, div, input {
	margin: 0;
	padding: 0;
}

.sign_form {
	width: 80%;
}

#m_signup {
	display: flex;
	justify-content: center;
	height: 1500px;
	margin: 0 auto;
	max-width: 1270px;
	margin-top: 30px;
}

.login_box {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	width: 100%;
	border-top: 1px solid lightgray;
	margin-top: 10px;
}

.login_left {
	padding: 15px 0 15px 0;
	width: 20%;
}

.login_right {
	padding: 15px 0 15px 0;
}

#l_title {
	text-align: center;
}

.login_wrp {
	display: flex;
	flex-flow: column;
	align-items: center;
}

.l_input {
	padding: 10px;
	border: 1px solid #6667ab;
	border-radius: 10px;
	outline: none;
}

.login_right > #sample6_address{
	width: 500px;
	margin: 7px 0;
}
.login_right > #sample6_detailAddress, .login_right > #sample6_extraAddress {
	width: 237px;
}

.l_text {
	margin: 20px 0 10px 0;
	font-size: 11pt;
	font-weight: bold;
}

.l_submit {
	padding: 15px;
	background-color: #6667ab;
	border: 0;
	border-radius: 50px;
	color: #fff;
	margin: 20px 0 0 0;
	cursor: pointer;
	width: 300px;
	font-weight: bold;
}

#m_select {
	width: 433px;
	padding: 15px;
	border: 1px solid #6667ab;
	outline: none;
	border-radius: 10px;
}

#leaveReadme {
	width: 800px;
	height: 200px;
	resize: none;
	margin-bottom: 20px;
	font-size: 10pt;
}
.s_privacy > label {
  display: block;
  cursor:pointer;
  z-index: 999;
}
.s_privacy{
	display: flex;
	justify-content: center;
	align-items:center;
	width:500px;
	margin:100px 0 100px 0;
	background-color:#6667ab;
	flex-flow: column;
	color:white;
	padding:20px 0 20px 0;
	border-radius: 10px;
	
}
#s_bot{
	display: flex;
	flex-flow: column;
	background-color: white;
	color:#6667ab;
	z-index: 1;
	width: 76%;
	padding:10px;
	
}
.s_m_top{
	padding-bottom: 10px;
	display: flex;
	align-items: flex-start;
	width: 90%;
}
#i_check,#p_check,#p_check_to{
	margin: 15px;
}
</style>
<div id="m_signup">
	<form method="post" class="sign_form">
		<h1 id="l_title">회원가입</h1>
		<div class="login_wrp">
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						성명 <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="username"
						autocomplete="off" required>
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						아이디 <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="userid" placeholder="아이디"
						autocomplete="off" required id="userid">
					<span id="i_check"></span>
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						비밀번호 <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="password" name="userpw"
						placeholder="비밀번호" autocomplete="off" required id="userpw1">
					<span id="p_check"></span>
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						비밀번호 확인 <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="password" name="userpwcheck"
						placeholder="비밀번호 확인" autocomplete="off" required id="userpw2">
					<span id="p_check_to"></span>
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						이메일 <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="useremail"
						autocomplete="off" required>
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						휴대전화 <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="phoneno"
						autocomplete="off" required>
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						주소 <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" id="sample6_postcode" name="postcode"
						autocomplete="off" required placeholder="우편번호">
					<input class="l_input" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input class="l_input" type="text" id="sample6_address" name="address" placeholder="주소"><br>
					<input class="l_input" type="text" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">
					<input class="l_input" type="text" id="sample6_extraAddress" name="extraAddress" placeholder="참고항목">
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">생년월일</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="birth"
						placeholder="ex)931122" autocomplete="off">
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">성별</p>
				</div>
				<div class="login_right">
					<input id="m_gender" class="l_input" type="radio" name="gender"
						value="M"> <label for="m_gender">남</label> <input
						id="f_gender" class="l_input" type="radio" name="gender" value="F">
					<label for="f_gender">여</label>
				</div>
			</div>
			<input type="button" value="회원가입" class="l_submit" id="l_submit">
		</div>
	</form>
</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
const userid = document.querySelector('input[id="userid"]');
const userpw = document.querySelector('input[id="userpw1"]')
const userpw2 = document.querySelector('input[id="userpw2"]')
const check = document.getElementById('i_check')
const pwcheck = document.getElementById('p_check')
const pwcheck2 = document.getElementById('p_check_to')
const form = document.forms[1]
const button = document.getElementById('l_submit')

userid.addEventListener("focusout",async (event) => {
	if((userid.value.length < 5)||(userid.value.length > 12))
	  {
			check.innerHTML = "아이디는 최소 5자 최대 12자 까지 가능합니다."
			check.style.color = "red"
			check.style.fontSize = "10pt"
			check.style.fontWeight = "bold"
	   return false;
	  }
	const url = '${cpath}/checkuserid?userid=' + userid.value
	const opt = {
			method : 'GET'
	}
	const resp = await fetch(url,opt)
	const json = await resp.json()
	if(json != 0){
		check.innerHTML = "일치하는 아이디가 존재합니다."
		check.style.color = "red"
		check.style.fontSize = "10pt"
		check.style.fontWeight = "bold"
	}
	else{
		check.innerHTML = "사용가능한 아이디 입니다."
		check.style.color = "#6667ab"
		check.style.fontSize = "10pt"
		check.style.fontWeight = "bold"
	}
	
});

userid.addEventListener("focusin",async (event) => {
	check.innerHTML = ''
});

userpw.addEventListener("focusout",(event) => {
	if((userpw.value.length < 6)||(userpw.value.length > 15))
	  {
		pwcheck.innerHTML = "비밀번호는 최소 6자 최대 15자 까지 가능합니다."
		pwcheck.style.color = "red"
		pwcheck.style.fontSize = "10pt"
		pwcheck.style.fontWeight = "bold"
	   return false;
	  }
});
userpw2.addEventListener("focusout",(event)=>{
	if(userpw.value != userpw2.value){
			pwcheck2.innerHTML = "비밀번호가 일치하지 않습니다."
			pwcheck2.style.color = "red"
			pwcheck2.style.fontSize = "10pt"
			pwcheck2.style.fontWeight = "bold"
			pwcheck2.value = ""
			pwcheck2.focus();
		   return false;
	}
});
userpw.addEventListener("focusin",async (event) => {
	pwcheck.innerHTML = ''
});
userpw2.addEventListener("focusin",async (event) => {
	pwcheck2.innerHTML = ''
});


button.addEventListener("click",function(event) {
	if(check.style.color == "red" && check.innerHTML == "아이디는 최소 5자 최대 12자 까지 가능합니다."){
		alert('아이디는 최소 5자 최대 12자 까지 가능합니다.')
		history.go(0);
		return false;
	}
	if(check.style.color == "red" && check.innerHTML == "일치하는 아이디가 존재합니다."){
		alert('동일한 아이디가 존재합니다.')
		history.go(0)
		return false;
	}
	if(pwcheck.style.color == "red"){
		alert('비밀번호는 최소 6자 최대 15자 까지 가능합니다.')
		history.go(0)
		return false;
	}
	if(pwcheck2.style.color == "red"){
	 	alert('비밀번호가 일치하지 않습니다')
	 	history.go(0)
	 	return false;
	}
	else{
		form.submit();
        return false;
	}
});


function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>



<%@ include file="../footer.jsp"%>