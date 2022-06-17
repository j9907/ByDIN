<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../header.jsp" %>

<style>
	.cart{
		display: block;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 35px;
        width: 100%;
	}
	.cart > p {
		font-size: 25px;
		font-weight: bold;
		margin: 20px;
	}
	.c_list{
		border-top: 1px solid #6667ab;
		border-bottom: 1px solid #6667ab;
		display: flex;
		align-items: center;
	}
	.c_list > div{
		margin: 10px;
		width: 150px;
		font-size: 18px;
	}
	#title{
		margin-left: 30px;
		width: 260px;
		font-weight: bold;
	}
	#img {
		width: 170px;
		height: 170px;
		margin: 20px;
		margin-left: 40px;
		border: 1px solid black;
	}
	#price{
		width: 200px;
		font-weight: bold;
	}
	.c_bottom{
		display: flex;
		float: right;
		margin: 30px;
	}
	.c_bottom > div{
		font-size: 30px;
    	width: 320px;
    	font-weight: bold;
    	margin-right: 240px;
    	display: flex;
    	justify-content: center;
	}
	.c_bottom > div > p {
		margin: 10px;
		text-align: center;
	}
	.c_bottom > div > p:nth-child(1){
		font-size: 25px;
		color: #6667ab;
		margin-top: 12px;
	}
	.c_bottom > button{
		width: 200px;
		height: 60px;
		padding:10px;
		border:1px solid #6667ab;
		background-color: #6667ab;
		color:#fff;
		font-weight: bold;
		font-size: 13pt;
		cursor:pointer;
	}
	#img > img {
		width: 170px;
		height: 170px;
		margin: 0 auto;
		padding: 0;
	}
	#c_empty {
		font-size: 20px;
		font-weight: bold;
		display: flex;
		justify-content: center;
	}
	#img_header {
		width: 170px;
	}
	.c_header{
		display: flex;
		justify-content: center;
	}
</style>


<!-- 반복문 돌려서 나오게하기 -->
<div class="cart">
	<p>장바구니 상품</p>
	
	<c:if test="${empty cartdto}">
	<div id="c_empty">장바구니에 담긴 상품이 없습니다</div>
	</c:if>
	
	<c:if test="${not empty cartdto}">
	
	<c:forEach var="i" begin="0" end="${fn:length(cartdto) - '1' }">
		<c:if test="${cartdto[i].ORDER_STATE == '장바구니' }">
		<div class="c_list">
			<div id="img"><img src="${cpath }/upload/${cartdto[i].IMAGE }"></div>
			<div id="title">${cartdto[i].ITEM_NAME }</div>
			<div id="cnt">${cartdto[i].TOTALCOUNT }</div>
			<div id="price">${cartdto[i].ITEM_PRICE } 원</div>
			<div id="totalprice">${cartdto[i].TOTALPRICE }</div>
			<div id="cost">무료</div>
			<div id="del"><button id="delbtn" onclick="del();" data-idx="${cartdto[i].ITEM_IDX }">삭제</button></div>
		</div>
		</c:if>
	</c:forEach>
	</c:if>
	<div class="c_bottom">
		<div>
			<p>총 주문금액</p>
			<div id="total_price"></div>
			</div>
		<button onclick="buy();">ORDER</button>
	</div>
</div>

<script>
let total = 0
let totalprice = document.querySelectorAll('div#totalprice')
totalprice.forEach(ch => total += parseInt(ch.innerText))

let total_price = document.getElementById('total_price')
total_price.innerText = total + ' 원'

function buy(){
	location.href='${cpath}/purchase/buy'
}

let delbtn = parseInt(document.getElementById('delbtn').dataset.idx);

async function del(event){
	let del = confirm('삭제하시겠습니까?')
	if (del) {
		const url = '${cpath}/purchase/del/'+delbtn;
		console.log(url)
		const resp = await fetch(url)
		console.log(resp)
	}
	location.reload();
}
</script>



<%@include file="../footer.jsp" %>