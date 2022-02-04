<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
body, div, input {
	margin: 0;
	padding: 0;
}

#m_signup {
	display: flex;
	justify-content: center;
	height: 1000px;
	margin: 0 auto;
	max-width: 1270px;
	margin-top: 30px;
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
	padding: 15px;
	width: 400px;
	border: 1px solid #6667ab;
	border-radius: 10px;
	outline: none;
}

.l_text {
	margin: 20px 0 10px 0;
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
	<form method="post">
		<h1 id="l_title">회원가입</h1>
		<div class="login_wrp">
			<div class="login_text">
				<p class="l_text">아이디</p>
				<input type="text" name="userid" placeholder="ID" autocomplete="off"
					class="l_input">
			</div>
			<div class="login_text">
				<p class="l_text">비밀번호</p>
				<input type="password" name="userpw" placeholder="PW"
					autocomplete="off" class="l_input">
			</div>
			<div class="login_text">
				<p class="l_text">이름</p>
				<input type="text" name="username" autocomplete="off"
					class="l_input">
			</div>
			<div class="login_text">
				<p class="l_text">이메일</p>
				<input type="text" name="useremail" autocomplete="off"
					class="l_input">
			</div>
			<div class="login_text">
				<p class="l_text">휴대전화</p>
				<input type="text" name="phoneno" autocomplete="off" class="l_input">
			</div>
			<div class="login_text">
				<p class="l_text">주소</p>
				<input type="text" name="useradd" autocomplete="off" class="l_input">
			</div>
			<div class="login_text">
				<p class="l_text">생일</p>
				<input type="text" name="birth" placeholder="ex) 931122"
					autocomplete="off" class="l_input">
			</div>
			<div class="login_text">
				<p class="l_text">성별</p>
				<select name="gender" id="m_select">
					<option value="W">여성</option>
					<option value="M">남성</option>
				</select>

			</div>
			<input type="submit" value="회원가입" class="l_submit">
		</div>
	</form>
</div>


<%@ include file="../footer.jsp"%>