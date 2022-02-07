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
	justify-content:space-between;
	width: 90%;
	
	
}
</style>
<div id="m_signup">
	<form method="post" class="sign_form">
	

		<h1 id="l_title">회원가입</h1>
		<div class="login_wrp">
		<div class="s_privacy">
		<div class="s_m_top">
		<label for="agree_all" style="padding-bottom: 10px;"> 
		<input type="checkbox"name="agree_all" id="agree_all"> 
		<span>모두 동의합니다</span>
		</label>
		</div>
		
		<div id="s_bot">
		<label for="agree1"> 
		<input type="checkbox" name="agree" value="1" id="agree1"> 
		<strong>(필수)</strong><span>이용약관 동의</span>
		</label> 
		<label for="agree2"> 
		<input type="checkbox" name="agree" value="2" id="agree2"> 
		<strong>(필수)</strong><span>개인정보 수집, 이용 동의</span>
		</label> 
		<label for="agree3"> <input type="checkbox" name="agree"
			value="3" id="agree3"> 
			<strong>(필수)</strong><span>개인정보 이용 동의</span>
		</label> 
		<label for="agree4"> <input type="checkbox" name="agree" value="4" id="agree4"> 
			<strong class="select_disable">(선택)</strong>
			<span>이벤트, 혜택정보 수신동의</span>
		</label>
		</div>
		</div>
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
						autocomplete="off" required>
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
						placeholder="비밀번호" autocomplete="off" required>
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
						placeholder="비밀번호 확인" autocomplete="off" required>
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
					<input class="l_input" type="text" name="useradd"
						autocomplete="off" required>
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
			<input type="submit" value="회원가입" class="l_submit">
		</div>
	</form>
</div>

<script>
const agreeChkAll = document.querySelector('input[name=agree_all]');
    agreeChkAll.addEventListener('change', (e) => {
    let agreeChk = document.querySelectorAll('input[name=agree]');
    for(let i = 0; i < agreeChk.length; i++){
      agreeChk[i].checked = e.target.checked;
    }
});
</script>
<%@ include file="../footer.jsp"%>