<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
	#b_main{
		display: flex;
		flex-flow: column;
		align-items: center;
		height: 500px;
	}
	.b_confirm{
		margin-top: 50px;
	}
	.b_form{
		text-align: center;
		margin:30px 0 30px 0;
	}
	.i_input{
		margin-top:10px;
		width: 250px;
		padding:10px;
		border-radius: 10px;
		border:1px solid #6667ab;
		outline:none;
	}
	.b_bot{
		display: flex;
		align-items: center;
		justify-content: space-around;
	}
	.b_btn{
		padding:10px;
		border-radius: 30px;
		border:0;
		font-weight: bold;
		width: 100px;
		color:#fff;
		cursor:pointer;
	}
	.btn1{
		background-color: darkgray;
	}
	.btn2{
		background-color:#6667ab;
	}
</style>
<div id="b_main">
	<div class="b_confirm">
		<h1>답변 확인</h1>
	</div>
	<form method="post">
		<div class="b_form">
			<p class="p_text">비밀번호</p>
			<input type="password" class="i_input" autocomplete="off" name="password">
		</div>
		<div class="b_bot">
			<input type="button" class="b_btn btn1" onclick="back();" value="뒤로가기">
			<input class="b_btn btn2" type="submit" value="입력">
		</div>
	</form>
</div>
<script>
	function back(){
		location.href='${cpath}/qna/board'
	}
	const msg = '${msg}'
	console.log(msg);
		if(msg === '비밀번호가 다릅니다'){
			alert(msg)
			location.replace(location.href);
		}
</script>
<%@ include file="../footer.jsp"%>