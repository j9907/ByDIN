<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
.main {
	display: flex;
	flex-flow: column;
	max-width: 1270px;
	margin: 0 auto;
	height: 1000px;
}

.side {
	border-bottom:1px solid #6667ab;
	height: 400px;
	margin: 30px 0 0 0;
}

#top {
	padding: 10px;
	font-size: 13pt;
}

.top {
	padding: 10px 0 10px 0;
	border-bottom: 1px solid #6667ab;
	border-top: 1px solid #6667ab;
	font-size: 18pt;
	display: flex;
	justify-content: space-between;
}

.under {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px 0 10px 0;
	font-size: 11pt;
}
.writer{
	padding-right: 5px;
	border-right: 1px solid #6667ab;
}
.datetime{
	padding:0 5px 0 5px;
}

#buttom {
	padding: 10px;
	font-size: 13pt;
	height: auto;
}

.btn {
	padding: 10px;
	margin: 10px 0 10px 0;
	border-radius: 10px;
	border: 0;
	background-color: #6667ab;
	color: #fff;
	font-weight: bold;
	cursor: pointer;
}

.reply {
	display: flex;
	flex-flow: column;
	border: 1px solid #6667ab;
	padding: 10px;
	border-radius: 10px;
	max-width: 1200px;
	justify-content: center;
	margin: 0 30px 30px 30px;
}

.replyinput {
	border: 0;
	resize: none;
	height: 100px;
	outline: none;
	
}

.replybtn {
	border: 0;
	background-color: white;
	text-align: right;
	margin-right: 20px;
	color: midnightblue;
	font-weight: bold;
}

p.replywriter {
	font-weight: bold;
	padding: 5px 0 5px 0;
}

p.replydate {
	font-size: 8pt;
	padding: 5px 0 5px 0;
	color: midnightblue;
}
.title{
	font-weight: bold;
}
.reply_b {
	margin:0 10px 10px 10px;
	min-height: 100px;
	display: flex;
	flex-flow: column;
	justify-content: center;
	border-bottom: 1px solid #6667ab;
}

#replybtn {
	display: flex;
	justify-content: space-between;
}

.replybtn:hover {
	cursor: pointer;
}

#btngroup {
	display: flex;
	justify-content: space-between;
}

.p_text {
	max-width: 1200px;
	margin: 0 0 10px 30px;
	font-size: 13pt;
	font-weight: bold;
}
.p_count{
	margin:10px 10px 0 10px;
	font-size: 10pt;
	font-weight: bold;
	border-bottom: 1px solid #6667ab;
	padding-bottom: 10px;
}
.b_title{
	border:0;
	border-bottom: 2px solid #6667ab;
	width: 300px;
	font-weight: bold;
	outline: none;
	font-size: 14pt;
}
#board_img{
	width:200px;
}
</style>
<div class="main">
	<h1 style="margin: 0 auto;">문의글</h1>
	<div class="side">
		<div id="top">
			<div class="top">
				<p class="title">${list.title }</p>
			<div class="under">
				<p class="writer">${list.writer }</p>
				<p class="datetime">${list.uploaddate }</p>
				</div>
			</div>
		</div>
		<div id="buttom">
			
			<c:if test="${list.img != null }">
			<div id="board_pr">
				 <img src="${cpath }/upload/${list.img}" id="board_img">
			</div>
			</c:if>
			<div id="read_div">
			<p id="read_text">
			${list.content }</p></div>
		</div>
	</div>
	<div id="btngroup">
		<button class="btn" onclick="location.href='${cpath}/qna/board'">돌아가기</button>
		<c:if test="${login.userid == list.writer || login.userid == 'admin'}">
			<div>
				<a href="${cpath }/qna/modify/${list.idx}"><button class="btn">수정</button></a>
				<button class="btn" onclick="del();">삭제</button>
			</div>
		</c:if>
	</div>
	<div class="b_count">
		<p class="p_count">댓글 <font style="color:#6667ab; font-size:11pt;">${row}</font></p>
	</div>
	<div id="replybox">
		<div class="replylist" id="replylist">	</div>
			<c:if test="${login.userid == 'admin' }">
				<form method="post" action="${cpath }/qna/reply/${list.idx}">
					<p class="p_text">답변</p>
					<div class="reply">						
						<input type="text" name="title" class="b_title" placeholder="제목">
						<input type="hidden" name="writer" value="${login.username }">						
						<textarea name="content" class="replyinput" id="content"></textarea>
						<input type="submit" value="등록" class="replybtn">
					</div>
				</form>
			</c:if>
	
	</div>
</div>
<script>
	const ch = document.querySelector('p[class="datetime"]')
	var data = (ch.innerText).substr(0,11)
	const rep = document.getElementById('replylist')
	ch.innerText = data
	
	function del() {
		var del = confirm('정말 삭제하시겠습니까?');
		if (del) {
			location.href = '${cpath}/qna/del/${list.idx}';
		}
	}
	var dom = ""
	async function main(){
		const url = '${cpath}/reply/${list.idx}' 
		const opt = {
				method:'GET'
		}
		const resp = await fetch(url,opt)
		console.log(resp)
		const json = await resp.json()
		console.log(json)
		if(json.length < 1){
			dom += '<div class="reply_b"> ' + '등록된 답변이 없습니다' + '</div>';
		}
		json.forEach(dto => {
			dom += '<div class="reply_b">'
				dom += '<p class="replywriter">' + dto.writer;
				dom += '<p class="replycontent">' + dto.content;
				dom += '<div id="replybtn">';
				dom += '<p class="replydate">' + dto.uploaddate + '</p>';
				dom += '</div></div>'
		})
		rep.innerHTML = dom;
	}
	main();
	
	</script>
<%@ include file="../footer.jsp"%>