
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	#i_main{
		display: flex;
		max-width: 1270px;
		margin:0 auto;
	}
	.item_img{
		margin-top:30px;
	}
	.item_img > img{
		width: 428px;
		height: 428px;
		border:1px solid #6667ab;	
	}
	#i_top{
		display: flex;
		width: 1000px;
		margin:0 auto;
	}
	.item_texts{
		margin:30px 0 0 30px;
	}
	
	 .item_box{
		 margin:0 0 0 30px;
	 }
	 
	.item_text{
		width: 100%;
		margin-left:30px;
	}
	.i_title{
		padding: 0 0 20px 0 ;
		color:#6667ab;
		font-weight: bold;
		font-size: 11pt;
	}
	.i_text{
		font-weight: bold;
		font-size: 15pt;
		font-family: nanumBarunGothic;
	}
	.i_price{
		font-size: 18pt;
		font-weight: bold;
		padding: 20px 0 20px 0;
		font-family: nanumBarunGothic;
	}
	.text_ul{
		display: flex;
		list-style: none;
		padding-top:20px;
	}
	.text_ul2{
		display: flex;
		list-style: none;
		
	}
	.text_li1{
		margin-right: 35px;
		font-size: 16px;
		font-family: nanumBarunGothic;
		padding: 0 0 5px 0;
	}
	.text_li2{
		font-size: 16px;
		font-family: nanumBarunGothic;
		padding: 0 0 7px 0;
	}
	.coin{
		display: flex;
		padding-top: 20px;
		justify-content: space-between;
	}
	.con_but{
		display: flex;
	}
	.i_coin,.i_coin2{
		font-family: nanumBarunGothic;
		font-size: 14pt;
	}
	.i_coin2{
		color:red;
	}
	.buy_button{
		margin-top:20px;
		width: 100%;
		display: flex;
	}
	.but_btn{
		width: 50%;
		padding:10px;
		border:1px solid #6667ab;
		background-color: #fff;
		color:#6667ab;
		font-weight: bold;
		font-size: 13pt;
		cursor:pointer;
		
	}
	.but_btn2{
		width: 50%;
		padding:10px;
		border:1px solid #6667ab;
		background-color: #6667ab;
		color:#fff;
		font-weight: bold;
		font-size: 13pt;
		cursor:pointer;
	}
	select.i_select{
		width: 100%;
		padding: 8px;
		margin:20px 0;
		border:1px solid #6667ab;
		border-radius: 10px;
	}
	.dom_box2{
		display: flex;
		flex-flow: column;
	}
	.dom_right{
		display: flex;
		justify-content: space-between;
		margin-top:15px;
	}
	.dom_right2{
		display: flex;
	}

	#btn_qu{
		display: flex;
		border:1px solid black;
		margin-left:5px;
	}
	#min_btn{
		background-color: #fff;
		border:0;
		border-right:1px solid black;
		cursor:pointer;
	}
	#result{
		padding:0 10px;
	}
	#plus_btn{
		background-color:#fff;
		border:0;
		border-left:1px solid black;
		cursor:pointer;
	}
	#close{
	cursor:pointer;}
	.cart_a{
		width: 50%;
}
	#moditem{
		padding-top: 15px;
	}
	#mod{
		padding: 5px;
		text-decoration: none;
		color: black;
		border: 1px solid #666ab7;
		border-radius: 10px;

	}
</style>
<c:set var="modLink" value="${login.username == '관리자' ? 'modItem' : '' }"/>
<c:set var="modMenu" value="${login.username == '관리자' ? '상품수정' : '' }"/>
<div id="i_main">
<div id="i_top">
	<div class="item_img">
		<img src="${cpath }/upload/${item.image}">
	</div>
	<div class="item_text">
		<div class="item_texts">
			<p class="i_text">${item.name }</p>
			<div id="moditem">
			<c:if test="${login.username == '관리자' }"><a id="mod" href="${cpath }/admin/modItem/${item.idx}">상품 수정</a></c:if>
			<c:if test="${login.username == '관리자' }"><a id="mod" href="${cpath }/admin/delItem">상품 삭제</a></c:if>	
				
			</div>
		</div>
		<div class="item_box">
			<p class="i_price">${item.price }</p>
			<ul class="text_ul">
				<li class="text_li">
					<ul class="text_ul2">
						<li class="text_li1">사이즈</li>
						<li class="text_li2">100 X 100 X 100 mm</li>
					</ul>
					<ul class="text_ul2">
						<li class="text_li1">적립금</li>
						<li class="text_li2">600원</li>
					</ul>
					<ul class="text_ul2">
						<li class="text_li1">배송비</li>
						<li class="text_li2">무료배송</li>
					</ul>
					<ul class="text_ul2">
						<li class="text_li1">수량 &nbsp;</li>
						<li class="text_li2">
						<div id="btn_qu">
						<button id="min_btn">-</button><div id="result">1</div><button id="plus_btn">+</button>
						</div></li>
					</ul>
				</li>			
			</ul>
			<div class="i_select">
<!-- 			<select class="i_select" id="selectBox">  -->
<!-- 				<option value="">== 옵션 선택 ==</option> -->
<%-- 				<option value="${item.idx }">${item.name }</option> --%>
<!-- 			</select> -->
<!-- 	<div class="dom_box2" id="dom_box2"> -->
<%-- 		<p>${item.name}</p> --%>
<!-- 		<div class="dom_right"> -->
<!-- 		 <div id="btn_qu"><button id="min_btn">-</button><div id="result">1</div><button id="plus_btn">+</button></div> -->
<!-- 		 </div></div> -->
			</div>
			<div id="dom_box"></div>
			<div class="coin">
			<p class="i_coin">총구매가</p>
			<div class="con_but">
			<p class="i_coin2" id="i_coin">${item.price } </p>
			<p class="i_coin2"> 원</p>
			</div>
			</div>
			
			<div class="buy_button">
			<button class="but_btn" id="cart">장바구니</button>
			<button class="but_btn2">구매하기</button>
			</div>
		</div>
	</div>
</div>
</div>
<script>
	var target = document.getElementById("selectBox");
	var dom = ''
	const dom_box = document.getElementById("dom_box");
	const btn1 = document.getElementById("plus_btn");
	const btn2 = document.getElementById("min_btn");
	const number = document.getElementById("result")
	const num = document.getElementById("inputNum")
	const text = document.getElementById("i_coin")
	const price = document.getElementById("dom_right")
	const mon = ${item.price}
	const cart = document.getElementById("cart")
	
	btn1.addEventListener('click',e => {
			const num = number.innerText
			const text = document.getElementById("i_coin")
			number.innerText = parseInt(num) + 1;
			console.log(parseInt(num) + 1)
			if(parseInt(number.innerText) > ${item.stock}){
				alert('최대 수량입니다.')
				number.innerText = ${item.stock}
				text.innerText = parseInt(text.innerText)
				return false;
			}
			text.innerText = parseInt(text.innerText) + parseInt(mon)
			
		});
		btn2.addEventListener('click',e =>{
			
			const num = number.innerText
			number.innerText = parseInt(num) - 1;
			const text = document.getElementById("i_coin")
			console.log(parseInt(num) - 1)
			
			if(num == 1){
				number.innerText = 1
				text.innerText = ${item.price}
			}
			else{
				text.innerText = parseInt(text.innerText) - parseInt(mon)
			}
			
		});
		
		cart.addEventListener('click', async e => {
			if('${login.userid}' != ''){
				const text = document.getElementById("i_coin")
				const url = '${cpath}/buy/parchase?idx=' + ${item.idx} + '&member=' + ${login.idx} + '&total=' + text.innerText + '&count=' + number.innerText
				const resp = await fetch(url)
				const json = await resp.json()
				
				if(confirm("상품을 장바구니에 담았습니다 \n장바구니로 이동하시겠습니까?")){
					location.href="${cpath}/buy/cart"
				}
				else{
					history.go(0);
				}
				
			}else{
				alert('로그인이 필요한 서비스입니다.')
				location.href="${cpath}/member/login"
			}
		})
	
	</script>
<%@ include file="../footer.jsp"%>