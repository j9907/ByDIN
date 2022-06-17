<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../header.jsp" %>

<style>
	.buy{
		display: block;
        max-width: 1200px;
        margin: 20px auto;
        padding: 0 35px;
        width: 100%;
	}
	.buy > p {
		font-size: 25px;
		font-weight: bold;
		margin: 20px;
	}
	.buy > div {
		padding: 20px;
	}
	hr {
		width: 1200px;
	}
	.costMemo {
		display: flex;
	}
	.add {
		margin: 10px auto;
		width: 1100px;
	}
	.add > p, .costMemo > p, .payname > div {
		width: 200px;
	}
 	.add > p {
 		margin-bottom: 5px;
 	}
	.info {
		display: flex;
	}
	.info > div {
		margin-right: 20px;
		margin: 10px;
	}
	.c_list, .costMemo, .userInfo > div, .paycheck > div, .payInfo > div {
		display: flex;
		align-items: center;
		width: 1100px;
		margin: 10px auto;
	}
	.c_list > div{
		margin: 10px;
		width: 150px;
		font-size: 18px;
	}
	.goodsInfo, .addInfo, .userInfo, .paycheck, .payInfo {
		padding: 10px;
	}
	.goodsInfo > p, .addInfo > p, .userInfo > p, .paycheck > p, .payInfo > p {
		font-weight: bold;
		font-size: 20px;
		padding-bottom: 10px;
	}
	#title {
		margin-left: 30px;
		width: 260px;
		font-weight: bold;
	}
	#img {
		width: 140px;
		height: 140px;
		margin: 20px;
		margin-left: 40px;
		border: 1px solid black;
	}
	#img > img {
		width: 140px;
		height: 140px;
		margin: 0 auto;
		padding: 0;
	}
	#price {
		width: 200px;
		font-weight: bold;
	}
	.payname { 
		display: flex;
	}
	.btn{
		display: block;
		margin: 20px auto;
		width: 200px;
		height: 60px;
		padding:10px;
		border:1px solid #6667ab;
		background-color: #6667ab;
		color:#fff;
		font-weight: bold;
		font-size: 13pt;
		cursor: pointer;
	}
	.add > #sample6_address{
	width: 500px;
	margin: 7px 0;
}
.add > #sample6_detailAddress, .login_right > #sample6_extraAddress {
	width: 237px;
}
.l_input {
	padding: 10px;
	border: 1px solid #6667ab;
	border-radius: 10px;
	outline: none;
}
</style>

<div class="buy">
    <p>주문/결제</p>
    <hr>
    <div class="goodsInfo">
    	<p>상품정보</p>
        <c:if test="${empty cartdto}">
		<div id="c_empty">구매할 상품이 없습니다</div>
		</c:if>
		
		<c:if test="${not empty cartdto }">
		<c:forEach var="i" begin="0" end="${fn:length(cartdto) - '1' }">
		
		<c:if test="${cartdto[i].ORDER_STATE == '장바구니' }">
			<div class="c_list">
				<div id="img"><img src="${cpath }/upload/${cartdto[i].IMAGE }"></div>
				<div id="title">${cartdto[i].ITEM_NAME }</div>
				<div id="cnt">${cartdto[i].TOTALCOUNT }</div>
				<div id="price">${cartdto[i].ITEM_PRICE } 원</div>
				<div id="totalprice">${cartdto[i].TOTALPRICE }</div>
				<div id="cost">무료</div>
			</div>
		</c:if>
		</c:forEach>
		</c:if></div>
		
	<hr>
		
    <form method="POST" action="${cpath}/purchase/buying/${login.idx}">
    <div class="addInfo">
    	<p>배송지정보</p>
        <div class="add">
            <p>주소 입력</p>
            <input class="l_input" type="text" id="sample6_postcode" name="order_postcode"
						autocomplete="off" required value="${login.postcode }">
			<input class="l_input" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
			<input class="l_input" type="text" id="sample6_address" name="order_address" value="${login.address }"><br>
			<input class="l_input" type="text" id="sample6_detailAddress" name="order_detailAddress" value="${login.detailAddress }">
			<input class="l_input" type="text" id="sample6_extraAddress" name="order_extraAddress" value="${login.extraAddress }">
        </div>
        <div class="costMemo">
            <p>배송 메모 입력</p>
            <select name="order_req">
                <option value="없음">배송메모를 선택해 주세요</option>
                <option>배송 전에 미리 연락 바랍니다</option>
                <option>현관문 앞에 보관해주세요</option>
                <option>부재시 경비실에 맡겨 주세요</option>
                <option>부재시 전화 주시거나 문자 남겨 주세요</option>
            </select>
        </div>
    </div>
	<hr>
	
	
    <div class="userInfo">
    	<p>주문자 정보</p>
        <div>${login.username }</div>
        <div>0${login.phoneno }</div>
        <div>${login.useremail }</div>
    </div>
	<hr>
	
	
    <div class="paycheck">
    	<p>결제 수단</p>
        <div>계좌이체</div>
        <div class="payname">
            <div>입금자명</div>
            <input type="text" name="order_name" placeholder="입금자명을 입력하세요">
        </div>
    </div>
	<hr>
	
    <div class="payInfo">
    	<p>결제정보</p>
        <div id="total_price"></div>
        <div>배송비 : 무료</div>
    </div>
    <hr>
    
    <input type="submit" class="btn" value="결제하기">
    </form>
    </div>
    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>    
<script type="text/javascript">

let total = 0
let totalprice = document.querySelectorAll('div#totalprice')
totalprice.forEach(ch => total += parseInt(ch.innerText))

let total_price = document.getElementById('total_price')
total_price.innerText = '상품금액 : ' + total + ' 원'

async function buy(){
	let buy = alert('구매가 완료되었습니다')
	
	location.href = '${cpath}/purchase/buying/'+${login.idx}
	
}
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

</script>

<%@ include file="../footer.jsp"%>