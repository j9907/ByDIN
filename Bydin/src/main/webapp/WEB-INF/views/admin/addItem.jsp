<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
	<style>
		h3 {
			width: 70%;
			padding: 20px;
			margin: 0 auto;
		}
		#add {
			width: 70%;
			margin: 0 auto;
			text-align: center;
		}
        #addList{
            display: flex;
            justify-content: flex-start;
            align-items: center;
            width: 100%;
            border-top:1px solid lightgray;
            margin-top:10px;
        }
        .add_left{
            padding:15px 0;
            width:20%;
            font-weight: bold;
        }
        .add_right{
            padding: 15px 0 15px 0;
            width: 870px;
        }
        .add_right input {
            height: 40px;
            width: 98%;
            border-radius: 5px;
            border: 1px solid lightgray;
        }
        .addSubmit {
        	padding: 15px;
			background-color: #6667ab;
			border: 0;
			border-radius: 50px;
			color: #fff;
			margin: 20px 0 20px 0;
			cursor: pointer;
			width: 300px;
			font-weight: bold;
        }
    </style>

<h3>상품 등록</h3>
<div id="add">
<form method="POST">
	<div id="addList">
        <div class="add_left"><p>제품번호</p></div>
        <div class="add_right"><input ></div>
    </div>
        
    <div id="addList">
        <div class="add_left"><p>가격</p></div>
        <div class="add_right"><input ></div>
    </div>
        
    <div id="addList">
        <div class="add_left"><p>제품이름</p></div>
        <div class="add_right"><input ></div>
    </div>
        
    <div id="addList">
        <div class="add_left"><p>제품이미지</p></div>
        <div class="add_right"><input type="file"></div>
    </div>
        
    <div id="addList">
        <div class="add_left"><p>카테고리</p></div>
        <div class="add_right"><input ></div>
    </div>
        
    <div id="addList">
        <div class="add_left"><p>재고</p></div>
        <div class="add_right"><input ></div>
    </div>
        
    <div id="addList">
        <div class="add_left"><p>상세설명</p></div>
        <div class="add_right"><input ></div>
    </div>
    <input type="submit" value="등록" class="addSubmit">
</form>
</div>

<%@ include file="../footer.jsp"%>