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
	.item_texts, .item_box{
		margin:30px 0 0 30px;
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
		padding: 0 0 5px 0;
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
	}
	.but_btn2{
		width: 50%;
		padding:10px;
		border:1px solid #6667ab;
		background-color: #6667ab;
		color:#fff;
		font-weight: bold;
		font-size: 13pt;
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
	}
	.dom_right2{
		display: flex;
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
				</li>			
			</ul>
			<div class="i_select">
			<select class="i_select" id="selectBox"> 
				<option value="">== 옵션 선택 ==</option>
				<option value="${item.idx }">${item.name }</option>
			</select>
			</div>
			<div id="dom_box"></div>
			<div class="coin">
			<p class="i_coin">총구매가</p>
			<div class="con_but">
			<p class="i_coin2" id="i_coin">0 </p>
			
			<p class="i_coin2"> 원</p>
			</div>
			</div>
			
			<div class="buy_button">
			<button class="but_btn">장바구니</button>
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
	
	const num = document.getElementById("inputNum")
	const text = document.getElementById("i_coin")
	target.addEventListener('change', e => {
		const coin = target.options[target.selectedIndex].value
		const mon = ${item.price}
		text.innerText = mon
		dom += '<div class="dom_box2">'
		dom += '<p>${item.name}</p>'
		dom += '<div class="dom_right">'
		dom += '<div><button id="min_btn">-</button><input id="inputNum" type="number" value="1"><button id="plus_btn">+</button></div>'
		dom += '<div class="dom_right2"><p>${item.price}</p>'
		dom += '<a>X</a></div>'
		dom += '</div></div>'
		dom_box.innerHTML = dom
		const btn1 = document.getElementById("plus_btn");
		const btn2 = document.getElementById("min_btn");
		btn1.addEventListener('click',e => {
			num++;
		})
		btn2.addEventListener('cleck',e=>{
			num--;
		})
	})
	
	
	
	</script>
<%@ include file="../footer.jsp"%>