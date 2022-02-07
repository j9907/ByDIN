<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
body, div, input {
	margin: 0;
	padding: 0;
}
.sign_form{
	width:80%;
}
#m_signup {
	display: flex;
	justify-content: center;
	height: 1000px;
	margin: 0 auto;
	max-width: 1270px;
	margin-top: 30px;
}
.login_box{
	display: flex;
	justify-content: flex-start;
	align-items: center;
	width: 100%;
	border-top:1px solid lightgray;
	margin-top:10px;
}
.login_left{
	padding:15px 0 15px 0;
	width:20%;
}
.login_right{
	padding:15px 0 15px 0;
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
</style>
<div id="m_signup">
	<form method="post" class="sign_form">
		<h1 id="l_title">회원가입</h1>
		<div class="login_wrp">
		<div class="login_box">
				<div class="login_left">
					<p class="l_text">성명</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="username" autocomplete="off" required>
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">아이디</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="userid" placeholder="ID" autocomplete="off" required>
				</div>
			</div>
			<div class="login_box">
				<div class="login_left">
					<p class="l_text">비밀번호</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="password" name="userpw" placeholder="PW" autocomplete="off" required>
				</div>
			</div>
				<div class="login_box">
				<div class="login_left">
					<p class="l_text">이메일</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="useremail" autocomplete="off" required>
				</div>
			</div>
				<div class="login_box">
				<div class="login_left">
					<p class="l_text">휴대전화</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="phoneno" autocomplete="off" required>
				</div>
			</div>
				<div class="login_box">
				<div class="login_left">
					<p class="l_text">주소</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="useradd" autocomplete="off" required>
				</div>
			</div>
				<div class="login_box">
				<div class="login_left">
					<p class="l_text">생년월일</p>
				</div>
				<div class="login_right">
					<input class="l_input" type="text" name="birth" placeholder="ex)931122" autocomplete="off">
				</div>
			</div>
				<div class="login_box">
				<div class="login_left">
					<p class="l_text">성별</p>
				</div>
				<div class="login_right">
					<input id="m_gender" class="l_input" type="radio" name="gender" value="M">
					<label for="m_gender">남</label>
					<input id="f_gender" class="l_input" type="radio" name="gender" value="F">
					<label for="f_gender">여</label>
				</div>
			</div>
			<input type="submit" value="회원가입" class="l_submit">
		</div>
	</form>
</div>


<%@ include file="../footer.jsp"%>