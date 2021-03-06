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
		<h1 id="l_title">?????? ?????? ??????</h1>
		<div class="login_wrp">
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						?????? <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="username"
						autocomplete="off" required value="${login.username }">
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						????????? <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="userid" placeholder="?????????" readonly="readonly"
						autocomplete="off" required id="userid" value="${login.userid }">
					<span id="i_check"></span>
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						???????????? <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="password" name="userpw"
						placeholder="????????????" autocomplete="off" required id="userpw1">
					<span id="p_check"></span>
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						???????????? ?????? <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="password" name="userpwcheck"
						placeholder="???????????? ??????" autocomplete="off" required id="userpw2">
					<span id="p_check_to"></span>
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						????????? <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="useremail"
						autocomplete="off" required value="${login.useremail }">
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						???????????? <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="phoneno"
						autocomplete="off" required  value="0${login.phoneno }">
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">
						?????? <font color="#6667ab">*</font>
					</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" id="sample6_postcode" name="postcode"
						autocomplete="off" required placeholder="????????????">
					<input class="l_input" type="button" onclick="sample6_execDaumPostcode()" value="???????????? ??????"><br>
					<input class="l_input" type="text" id="sample6_address" name="address" placeholder="??????"><br>
					<input class="l_input" type="text" id="sample6_detailAddress" name="detailAddress" placeholder="????????????">
					<input class="l_input" type="text" id="sample6_extraAddress" name="extraAddress" placeholder="????????????">
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">????????????</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="birth"
						placeholder="ex)931122" autocomplete="off" value="${login.birth }">
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">??????</p>
				</div>
				<div class="login_right">
					<input id="m_gender" class="l_input" type="radio" name="gender"
						value="M"> <label for="m_gender">???</label> <input
						id="f_gender" class="l_input" type="radio" name="gender" value="F">
					<label for="f_gender">???</label>
				</div>
			</div>
			<input type="button" value="????????????" class="l_submit" id="l_submit">
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
console.log(button)


userid.addEventListener("focusin",async (event) => {
	check.innerHTML = ''
});

userpw.addEventListener("focusout",(event) => {
	if((userpw.value.length < 6)||(userpw.value.length > 15))
	  {
		pwcheck.innerHTML = "??????????????? ?????? 6??? ?????? 15??? ?????? ???????????????."
		pwcheck.style.color = "red"
		pwcheck.style.fontSize = "10pt"
		pwcheck.style.fontWeight = "bold"
	   return false;
	  }
});
userpw2.addEventListener("focusout",(event)=>{
	if(userpw.value != userpw2.value){
			pwcheck2.innerHTML = "??????????????? ???????????? ????????????."
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
	if(check.style.color == "red" && check.innerHTML == "???????????? ?????? 5??? ?????? 12??? ?????? ???????????????."){
		alert('???????????? ?????? 5??? ?????? 12??? ?????? ???????????????.')
		history.go(0);
		return false;
	}
	if(check.style.color == "red" && check.innerHTML == "???????????? ???????????? ???????????????."){
		alert('????????? ???????????? ???????????????.')
		history.go(0)
		return false;
	}
	if(pwcheck.style.color == "red"){
		alert('??????????????? ?????? 6??? ?????? 15??? ?????? ???????????????.')
		history.go(0)
		return false;
	}
	if(pwcheck2.style.color == "red"){
	 	alert('??????????????? ???????????? ????????????')
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
            // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.

            // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
            // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
            var addr = ''; // ?????? ??????
            var extraAddr = ''; // ???????????? ??????

            //???????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????????.
            if (data.userSelectedType === 'R') { // ???????????? ????????? ????????? ???????????? ??????
                addr = data.roadAddress;
            } else { // ???????????? ?????? ????????? ???????????? ??????(J)
                addr = data.jibunAddress;
            }

            // ???????????? ????????? ????????? ????????? ???????????? ??????????????? ????????????.
            if(data.userSelectedType === 'R'){
                // ??????????????? ?????? ?????? ????????????. (???????????? ??????)
                // ???????????? ?????? ????????? ????????? "???/???/???"??? ?????????.
                if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // ???????????? ??????, ??????????????? ?????? ????????????.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ????????? ??????????????? ?????? ??????, ???????????? ????????? ?????? ???????????? ?????????.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // ????????? ??????????????? ?????? ????????? ?????????.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // ??????????????? ?????? ????????? ?????? ????????? ?????????.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // ????????? ???????????? ????????? ????????????.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

</script>



<%@ include file="../footer.jsp"%>