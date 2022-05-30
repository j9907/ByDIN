<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../header.jsp" %>

<style>
	h3 {
		text-align: center;
		padding-top:30px;
		font-size:20pt;
		color:#6667ab;
		max-width: 1200px;
		margin: 0 auto;
	}
	.memberView {
		max-width: 1200px;
		margin: 0 auto;
		padding: 20px;
	}
	.memberView > div {
		padding: 10px;
	}
	.v_info {
		max-width: 1200px;
		margin: 0 auto;
	}
	#i_p {
		font-weight: bold;
		border-bottom: 1px solid #6667ab;
 		padding: 10px;
 		padding-bottom: 15px;
		font-size: 20px;
	}
	.v_info > div {
		border-bottom: 1px solid #6667ab;
	}
	.m_v_info{
		display: flex;
		justify-content: center;
		padding: 10px;
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
	
	.i_list{
	
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
	.c_list > #title {
		width: 400px;
	}
	.totalPrice{
		max-width: 1100px;
		margin: 0 auto;
		text-align: center;
		display: flex;
		justify-content:center;
	}
	.totalPrice > p, .totalPrice > div {
		padding: 15px;
		font-size: 20px;
		font-weight: bold;
	}
	#bottom{
		max-width: 1200px;
		display: flex;
		justify-content: center;
	}
	#m_v_btn{
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
</style>

<h3>회원 정보</h3>
<div class="memberView">
<div class="v_info">
	<p id="i_p">회원 정보</p>
	<div>
		
		<div class="m_v_info">
			<div class="i_left">ID</div>
			<div class="i_right">${memberdto.userid }</div>
		</div>
		<div class="m_v_info">
			<div class="i_left">NAME</div>
			<div class="i_right" id="orderdate">${memberdto.username }</div>
		</div>
		<div class="m_v_info">
			<div class="i_left">Gender</div>
			<div class="i_right">${memberdto.gender }</div>
		</div>
		<div class="m_v_info">
			<div class="i_left">PH</div>
			<div class="i_right">0${memberdto.phoneno }</div>
		</div>
		<div class="m_v_info">
			<div class="i_left">e-mail</div>
			<div class="i_right">${memberdto.useremail }</div>
		</div>
		<div class="m_v_info">
			<div class="i_left">Address</div>
			<div class="i_right">${memberdto.address } ${memberdto.detailAddress }${memberdto.extraAddress }</div>
		</div>
		<div class="m_v_info">
			<div class="i_left">Birth</div>
			<div class="i_right">${memberdto.birth }</div>
		</div>
		
		
	</div>
</div>

<div>
	<p id="i_p">구매 내역</p>
	<div class="i_list">
	<c:if test="${empty purchasedto }">
		<div>구매 내역이 없습니다</div>
	</c:if>
	<c:if test="${not empty purchasedto }">
		<c:forEach var="i" begin="0" end="${fn:length(purchasedto) - '1' }">
			<div class="c_list">
				<div id="title">${detaildto[i].item_name }</div>
				<div id="cnt">${purchasedto[i].totalcount }개</div>
				<div id="price">${detaildto[i].item_price }원</div>
				<div id="state">${purchasedto[i].order_state }</div>
			</div>
		</c:forEach>
		<div></div>
	</c:if>
	
		<div class="totalPrice">
			<p>총 주문금액</p>
			<div id="total_price"></div>
		</div>
		
		<div class="orderInfo">
		
		<div class="m_v_info">
			<div class="i_left">주문날짜</div>
			<div class="i_right" id="orderdate">${purchasedto[0].orderdate }</div>
		</div>
		<div class="m_v_info">
			<div class="i_left">배송지</div>
			<div class="i_right">${detaildto[0].order_add }</div>
		</div>
		<div class="m_v_info">
			<div class="i_left">배송 요청사항</div>
			<div class="i_right">${detaildto[0].order_req }</div>
		</div>
		<div class="m_v_info">
			<div class="i_left">입금자명</div>
			<div class="i_right">${detaildto[0].order_name }</div>
		</div>
			
		</div>
	</div>
	
</div>

<div id="bottom">
	<a href="${cpath }/admin/mngAcnt" id="m_v_btn">목록</a>
</div>

</div>


<script>
let total = 0
let totalprice = document.querySelectorAll('div#price')
totalprice.forEach(ch => total += parseInt(ch.innerText))

let total_price = document.getElementById('total_price')
total_price.innerText = total + ' 원'
</script>

<%@ include file="../footer.jsp"%>