<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.main{
		display: flex;
		flex-flow: column;
		max-width: 1270px;
		margin:0 auto;
		height: 700px;
	}
	.side{
		border-radius: 10px;
		border:1px solid #6667ab;
		height: 600px;
		margin:30px 0 30px 0;
	}
	 #top{
 	padding:10px;
 	font-size:13pt;
 }
 .top{
 	padding:10px 0 10px 0;
 	border-bottom: 1px solid #6667ab;
 	font-weight: bold;
 	font-size: 18pt;
 }
 .under{
 	display: flex;
 	justify-content: space-between;
 	align-items: center;
 	padding:10px 0 10px 0;
 	font-size: 11pt;
 }
 #buttom{
 	padding:10px;
 	font-size: 13pt;
  	height: auto; 
 }
 .btn{
 	padding:10px;
 	margin:10px 0 30px 0;
 	border-radius: 10px;
 	border:0;
 	background-color:#6667ab;
 	color:#fff;
 	font-weight: bold;
 	cursor:pointer;
 }
 #btngroup{
 	display: flex;
 	justify-content: space-between;
 }	
</style>
<div class="main">
<h1 style="margin:0 auto;">문의글</h1>
		<div class="side">
			<div id="top">
				<div class="top">
					<p class="title">${list.title }</p>
				</div>
				<div class="under">
					<p class="writer">작성자 : ${list.writer }</p>
					<p class="datetime">${list.uploaddate }</p>
				</div>
			</div>
			<div id="buttom">
				<pre>${list.content }</pre>
			</div>
		</div>
		<div id="btngroup">
			<button class="btn" onclick="location.href='${cpath}/qna/board'">돌아가기</button>
			<c:if test="${login.userid == list.writer || login.userid == 'admin'}">
			<button class="btn" onclick="del();">삭제</button>
			</c:if>
		</div>
		<c:if test="${login.userid == 'admin' }">
			<form method="post" action="${cpath }/qna/reply/${list.idx}">
				<div class="reply">
					<input name="writer" value="${login.userid }" readonly="readonly"
						class="replyinput">
					<textarea name="content" class="replyinput"></textarea>
					<input type="submit" value="등록" class="replybtn"
						onclick="webSocket.sendChat()">
				</div>
			</form>
		</c:if>
	</div>
	<script>
	const ch = document.querySelector('p[class="datetime"]')
	var data = (ch.innerText).substr(0,11)
	ch.innerText = data
	
	function del() {
		var del = confirm('정말 삭제하시겠습니까?');
		if (del) {
			location.href = '${cpath}/qna/del/${list.idx}';
		}
	}
	</script>
<%@ include file="../footer.jsp"%>