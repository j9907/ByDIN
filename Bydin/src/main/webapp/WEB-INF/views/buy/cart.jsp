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
.c_head{
	height: 100px;
	margin:0 auto;
}
.c_main{
	margin:0 auto;
	width: 1200px;
	border-top: 1px solid #dadada;
}
#c_main{
	width: 1270px;
	height: 800px;
	margin:0 auto;
}
#c_table{
	border-collapse: collapse; 
	margin: 30px auto;
	width: 1200px;
	min-width: 1200px;
	text-align:center;
}
#c_table tr {
	border-bottom: 1px solid #6667ab;
	height: 45px;
}
#c_table thead > tr {
	background-color:#6667ab;	
	color: #fff;
	font-weight: bold;
}

.c_img,.c_price,.c_fee,.c_count,.c_total,.c_check{
	width:8%;
}
input[type="checkbox"]{
	display: none;
}
input[type="checkbox"] + label.l_b {
	display: inline-block;
	width: 10px;
	height: 10px;
	border: 1px solid black;
	cursor: pointer;
	position: relative;
	background-color: #fff;
}
input[type="checkbox"]:checked + label.l_b {
	background-color: #dadada;
}
</style>
<div id="c_main">
<div class="c_head">
	<h3>장바구니</h3> 
</div>
<div class="c_main">
	<table id="c_table">
		<thead>
		<tr>
			<td class="c_check"><input type="checkbox" name="agree_all" id="agree_all" onclick='selectAll(this)' > 
			<label for="agree_all" class="l_b"></label>
			<label for="agree_all" style="cursor: pointer;"></label></td>
			<td class="c_img">이미지</td>
			<td class="c_name" colspan="4">상품명</td>
			<td class="c_price">판매가</td>
			<td class="c_count">수량</td>
			<td class="c_fee">배송비</td>
			<td class="c_total">합계</td>
		</tr>
		</thead>
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
			<input type="checkbox" name="agree" value="0" id="agree1" class="agree" onclick='checkSelectAll()'> 
			<label for="agree1" class="l_b"></label>
			<label for="agree1" style="cursor: pointer"></label>
			<td class="boardw">${list.image }</td>
			<td colspan="2" class="boardt">
				${list.item_name }
			</td>
			<td class="boardd">${list.item_price }</td>
			<td class="boardv" id="b_date">${list.item_count }</td>
			<td>무료</td>
			<td>합계</td>
		</tr>
	</c:forEach>

</tbody>	
</table>
</div>

</div>
<%@ include file="../footer.jsp"%>