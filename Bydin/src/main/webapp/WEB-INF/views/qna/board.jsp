<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
h3{
	text-align: center;
	padding-top:30px;
	font-size:20pt;
	color:#6667ab;
	max-width: 1200px;
	margin: 0 auto;
}
#boardList{
	border-collapse: collapse; 
	margin: 30px auto;
	width: 1200px;
	min-width: 1200px;
	text-align:center;
}
#boardList tr {
	border-bottom: 1px solid #6667ab;
	height: 45px;
}
#boardList tr:hover {
	cursor: default;
}
#boardList thead > tr {
	background-color:#6667ab;	
	color: #fff;
	font-weight: bold;
}
#boardList tbody td {
	text-align: center;
}
#boardList tbody > tr:hover {
	background-color: #dadada;
}
#boardList tbody .boardt {
	width: 58%;
	padding-left: 20px;
}
#boardList tbody .boardt > a {
	text-decoration: none;
	color: inherit;
	font-weight: bold;
	display: block;
}
#boardList tbody .boardt > a:hover {
	cursor: pointer;
}
#boardList .boardw {
	width: 8%;
}
#boardList  .boardt {
	width: 68%;
}
#boardList  .boardd {
	width: 8%;
}
#boardList .boardv {
	width: 8%;
}
#boardList .boardy {
	width: 10%;
}
#boardList .current {
	background-color: #eaeaea;
}

.board-number{
	display: inline-block;
	float: left;
	padding-left:20px;
}
.board-title{
	display: inline-block;
	padding-right:20px;
	font-weight: bold;
	font-size:15pt;
}
.paging{
	text-align: center;
}
.button{
	display:flex;
	margin-left:10%;
	margin-right:10%;
	align-items: center;
	justify-content: space-between;
}
#a{
	color:black;
	font-size:11pt;
}

.search{
	padding:5px;
	border-radius: 10px;
}
.in_search{
	padding:5px;
	border-radius: 10px;
	border:1px solid #6667ab;
}
.in_sub{
	padding:6px;
	background-color: #6667ab;
	border-radius: 10px;
	color:white;
	border:0;
	cursor:pointer;
}
.b_btn{
	max-width: 1200px;
	margin:auto;
	padding:30px;
}
.b_btn button{
	background-color: #6667ab;
	border: 0;
	border-radius: 10px;
	color:#fff;
	padding: 10px;
	cursor:pointer;
	outline: none;
}
</style>
<div id="table">
<h3>문의 게시판</h3>
<table id="boardList">
<thead>

	<tr>
		<td class="boardw">글번호</td>
		<td class="boardt" colspan="2">제목</td>
		<td class="boardd">작성자</td>
		<td class="boardv">작성일</td>
		<td class="boardy">답변유무</td>
	</tr>
</thead>
<tbody>
<c:choose>
	<c:when test="${empty list}">
	<tr>
	<td colspan="7">
		작성된 게시글이 없습니다.
	</td>
	</tr>
	</c:when>
	</c:choose>
	<c:forEach var="list" items="${list }">
		<tr>
			<td class="boardw">${list.idx }</td>
			<td colspan="2" class="boardt">
				<a href="${cpath }/qna/confirm/${list.idx}" id="a">${list.title }</a>
			</td>
			<td class="boardd">${list.writer }</td>
			<td class="boardv" id="b_date">${list.uploaddate }</td>
			<td class="boardy">${list.anwercheck}</td>
		</tr>
	</c:forEach>

</tbody>	
</table>
<div class="b_btn">
	<a href="${cpath }/qna/write"><button>새글쓰기</button></a>
</div>
</div>
<script>
	const check = document.querySelectorAll('td[id^="b_date"]')
	check.forEach((el,i) => {
		const date = (el.innerText).substr(0,11);
		el.innerText = date
	});
	console.log(check)
</script>
<%@ include file="../footer.jsp"%>