<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../header.jsp" %>
<style>
	.mypage {
		display: block;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 35px;
        width: 100%;
	}
	.mypage > p {
		font-size: 25px;
		font-weight: bold;
		margin: 20px;
	}
	.mypage > div {
		padding: 10px;
		font-weight: bold;
		font-size: 20px;
		padding-bottom: 10px;
	}
	.orderList > p, .info > p {
		margin: 20px 10px;
	}
	.c_list{
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.c_list > div{
		margin: 10px;
		width: 150px;
		font-size: 18px;
	}
	#title{
		margin-left: 30px;
		width: 400px;
		font-weight: bold;
		display: flex;
		justify-content: center;
	}
	#img {
		width: 120px;
		height: 120px;
		margin: 20px;
		margin-left: 40px;
		border: 1px solid black;
	}
	#img > img {
		width: 120px;
		height: 120px;
		margin: 0 auto;
		padding: 0;
	}
	.info > div {
		display: flex;
		justify-content: center;
	}
	.i_left {
		font-size: 20px;
		font-weight: bold;
		margin: 5px 5px 5px 30px;
		width: 150px;
	}
	.i_right {
		font-size: 18px;
		font-weight: normal;
		margin: 5px;
		border: 1px solid #6667ab;
		border-radius: 10px;
		width: 600px;
		padding: 10px;
	}
	#i_mod_btn {
		text-decoration: none;
		padding: 15px;
        background-color: #6667ab;
        border: 0;
        border-radius: 50px;
        color: #fff;
        margin: 20px 0 20px 0;
        cursor: pointer;
        width: 100px;
        font-weight: bold;
        display: flex;
        justify-content: center;
	}
	#c_note{
		display: flex;
		justify-content: center;
		margin: 40px 0;
	}
	.order{
		display: flex;
		justify-content: center;
	}
</style>

<div class="mypage">
	<p>마이 페이지</p>
	<div class="orderList">
		<p>주문 내역</p>
		<hr>
		<c:if test="${empty cartdto }">
			<div id="c_note"><p>주문 내역이 없습니다</p></div>
		</c:if>
		<c:if test="${not empty cartdto }">
		<c:forEach var="i" begin="0" end="${fn:length(cartdto) - '1' }">
			<div class="c_list">
				<div id="img"><img src="${cpath }/upload/${cartdto[i].IMAGE }"></div>
				<div id="title">${cartdto[i].ITEM_NAME }</div>
				<div id="cnt">${cartdto[i].TOTALCOUNT }개</div>
				<div id="state">${cartdto[i].ORDER_STATE }</div>
			</div>
		</c:forEach>
		<div>
		
		<div class="order">
			<div class="i_left">주문날짜</div>
			<div class="i_right" id="orderdate">${purchasedto[0].ORDERDATE }</div>
		</div>
		<div class="order">
			<div class="i_left">배송지</div>
			<div class="i_right">${orderdto[0].ORDER_ADD }</div>
		</div>
		<div class="order">
			<div class="i_left">배송 요청사항</div>
			<div class="i_right">${orderdto[0].ORDER_REQ }</div>
		</div>
		<div class="order">
			<div class="i_left">입금자명</div>
			<div class="i_right">${orderdto[0].ORDER_NAME }</div>
		</div>
		</div>
		
		</c:if>
	</div>
		
	<div class="info">
		<p>개인 정보</p>
		<hr>
		
		<div>
		<div class="i_left">이름</div>
		<div class="i_right">${login.username }</div>
		</div>
		
		<div>
		<div class="i_left">ID</div>
		<div class="i_right">${login.userid }</div>
		</div>
		
		<div>
		<div class="i_left">휴대폰</div>
		<div class="i_right">0${login.phoneno }</div>
		</div>
		
		<div>
		<div class="i_left">주소</div>
		<div class="i_right">${login.useradd }</div>
		</div>
		
	<div id="i_mod">
		<a id="i_mod_btn" href="${cpath }/member/modInfo/${login.idx }">수정</a>
	</div>
	</div>
	
</div>

<script>
var check = document.getElementById('orderdate').innerText;
var check2 = document.getElementById('orderdate');
// check.substr(0,11);
console.log(check.substr(0,11))
// 	el.innerText = date
check2.innerText = check.substr(0,11);
	

</script>

<%@ include file="../footer.jsp"%>