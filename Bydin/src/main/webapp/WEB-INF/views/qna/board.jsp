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
	border-bottom: 1px solid #dadada;
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
	width: 5%;
}
#boardList  .boardt {
	width: 70%;
}
#boardList  .boardd {
	width: 8%;
}
#boardList .boardv {
	width: 8%;
}
#boardList .boardy {
	width: 8%;
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
#a:hover{
	border-bottom:1px solid #6667ab;
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
</style>
<div id="table">
<h3>게시판</h3>
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
<!-- <tbody> -->
<%-- 	<c:forEach var="list" items="${list }"> --%>
<!-- 		<tr> -->
<!-- 			<td colspan="2" class="boardt"> -->
<%-- 				<div class="board-number">${list.idx }</div> --%>
<%-- 				<div class="board-title"><a href="${cpath }/board/read/${list.idx}" id="a">${list.title }</a></div> --%>
<!-- 			</td> -->
<%-- 			<td class="boardw">${list.writer }</td> --%>
<%-- 			<td class="boardd">${list.datetime }</td> --%>
<%-- 			<td class="boardv">${list.viewCount }</td> --%>
<!-- 		</tr> -->
<%-- 	</c:forEach> --%>
<!-- </tbody>	 -->
</table>
<div class="b_btn">
	<button>새글쓰기</button>
</div>
</div>
<%@ include file="../footer.jsp"%>