<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	#m_join{
		display: flex;
		align-items:center;
		justify-content:center;
		margin:20px;
		height: 400px;
		flex-flow: column;
	}
	.sign_btn{
		background-color: #6667ab;
		border: 0;
		border-radius: 20px;
		color:#fff;
		width: 200px;
		padding:15px;
		font-size: 15pt;
		font-weight: bold;
		margin:60px;
		cursor:pointer;
	}
	h1 {
		margin: 0 auto;
		display: flex;
		text-align: center;
	}
	
	
</style>
<div id="m_join">
<h1>회원탈퇴가 완료되었습니다<br>
이용해 주셔서 감사합니다</h1>
	<a href="${cpath }/"><button class="sign_btn">홈화면으로 이동</button></a>
</div>
<%@ include file="../footer.jsp"%>