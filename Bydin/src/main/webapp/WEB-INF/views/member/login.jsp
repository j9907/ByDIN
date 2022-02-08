<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
body,div,input{
	margin:0;
	padding:0;
}
 #m_login{
 	 display: flex;
 	justify-content: center;
 	align-items: center;
 	height: 500px;
 	margin:0 auto;
 	max-width: 1270px;
 }
 #l_title{
 	text-align: center;
 }
 .login_wrp{
	display: flex;
	flex-flow: column;
	align-items: center;
 }
 .l_input{
 	padding: 15px;
 	margin:20px 0 20px 0 ;
 	width: 400px;
 	border:1px solid #6667ab;
 	border-radius: 10px;
 	outline: none;
 }
 .l_submit{
 	padding:15px;
 	background-color: #6667ab;
 	border: 0;
 	border-radius: 50px;
 	color:#fff;
 	margin:10px 0 0 0;
 	cursor: pointer;
 	width: 300px;
 }
</style>
<div id="m_login">
<form method="post">
<h1 id="l_title">로그인</h1>
<div class="login_wrp">
<input type="text" name="userid" placeholder="ID" autofocus autocomplete="off" class="l_input">
<input type="password" name="userpw" placeholder="PW" autocomplete="off" class="l_input">
<input type="submit" value="로그인" class="l_submit">
</div>
</form>
</div>
<%@ include file="../footer.jsp"%>