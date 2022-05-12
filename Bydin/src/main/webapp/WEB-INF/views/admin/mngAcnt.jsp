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
#memberList{
	border-collapse: collapse; 
	margin: 30px auto;
	width: 1200px;
	min-width: 1200px;
	text-align:center;
}
#memberList tr {
	border-bottom: 1px solid #6667ab;
	height: 45px;
}
#memberList tr:hover {
	cursor: default;
}
#memberList thead > tr {
	background-color:#6667ab;	
	color: #fff;
	font-weight: bold;
}
#memberList tbody td {
	text-align: center;
}
#memberList tbody > tr:hover {
	background-color: #dadada;
}

#memberList > thead > tr > .m_idx {
	width: 10%;
}
#memberList > thead > tr > .m_id {
	width: 20%;
}
#memberList > thead > tr > .m_name {
	width: 20%;
}
#memberList > thead > tr > .m_ph {
	width: 27%;
}
#memberList > thead > tr > .m_date {
	width: 18%;
}

a{
	text-decoration: none;
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
	<h3>회원 관리</h3>
	
	<table id="memberList">
<thead>

	<tr>
		<td class="m_idx">회원번호</td>
		<td class="m_id">아이디</td>
		<td class="m_name">이름</td>
		<td class="m_ph">휴대폰</td>
		<td class="m_date">가입날짜</td>
	</tr>
</thead>
<tbody>
<c:choose>
	<c:when test="${empty list}">
	<tr>
	<td colspan="7">
		회원 목록이 없습니다
	</td>
	</tr>
	</c:when>
	</c:choose>
	<c:forEach var="list" items="${list }">
		<tr>
			<td class="m_idx">${list.idx }</td>
			<td class="m_id">
				<a href="${cpath }/admin/memberView/${list.idx}" id="a">${list.userid }</a>
			</td>
			<td class="m_name"><a href="${cpath }/admin/memberView/${list.idx}" id="a">${list.username }</a></td>
			<td class="m_ph">0${list.phoneno }</td>
			<td class="m_date">${list.joindate }</td>
		</tr>
	</c:forEach>

</tbody>	
</table>
<div class="paging">
		<c:if test="${prev }">
			<a href="${cpath }/qna/board/${begin - 1}/"
			   style="display: inline; color:#6667ab; font-size:12pt;">◀</a>
		</c:if>
		<c:forEach var="page" begin="${begin }" end="${end }">
			<c:if test="${nowPage == page }">
				<b style="border-bottom:1px solid #6667ab">[${page }]</b>
			</c:if>
			<c:if test="${not (nowPage == page) }">
				<a id="searchLisk" style="display: inline; color:#6667ab; font-size:12pt;" href="${cpath }/qna/board/${page}">
					[${page }] </a>
			</c:if>
		</c:forEach>
		
		<c:if test="${next }">
			<a href="${cpath }/qna/board/${end + 1}"
			   style="display: inline; color:#6667ab; font-size:12pt;">▶</a>
		</c:if>
	</div>
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
	const answer = document.querySelectorAll('td[id^="b_answer"]')
	answer.forEach((el,i) => {
		if(el.innerText == 0){
			el.innerText = "답변 미완료"
		}
		else{
			el.innerText = "답변 완료"
		}
	})
</script>

<%@ include file="../footer.jsp"%>