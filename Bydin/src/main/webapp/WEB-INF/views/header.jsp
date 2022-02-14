<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style>

 		body{
 		overflow-x: hidden;
 		}
 		body,div,a,ul,li,p{
 			margin:0;
 			padding:0;
		} 
        #headerwrp{
            position: relative;
            z-index: 999;
            margin: 0 auto;
            background-color: #fff;
        }
        #headermain{
            display: block;
            max-width: 1270px;
            margin: 0 auto;
            padding: 0 35px;
            width: 100%;
            border-bottom:1px solid lightgray;
        }
        .h_main{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 4.5px 0;
            width: 100%;
            height: 100px;
        }
        img{
            padding: 5px;
        }
        #h_search{
            background-color:#6667ab;
            border-radius: 50px;
            border:0;
            padding:10px;
            color: #fff;
            width: 600px;
            outline: none;
        }
        .h_search{
            display:flex;
        }
        #h_search::placeholder{
            color:#fff;
        }
        .h_ul{
        	list-style: none;
        	float: left;
        	padding:0;
        	margin: 20px 0 20px 0;
        }
        .h_menu{
       	 float: left;	
       	 margin-left: 20px;
        }
        #h_down{
        	max-width:1270px;
        	margin:0 auto;
        	display: flex;
        	justify-content: space-between;
        	align-items: center;
        }
        .h_menu2{
       		float: left;
       		color:red;
        }
        #main{
       		position: relative;
            z-index: 999;
            margin: 0 auto;
            background-color: #fff;
            margin-bottom: 50px;
            margin-top:20px;
            max-width: 1270px;
            height:4000px;
        }

        #m_slider {
            width: 1200px;
            height: 500px;
            margin: 0 auto;
        }
        .slider_item {
            width: 100%;
            height: 500px;
            opacity: 0;
            /* display: flex; */
            justify-content: center;
            align-items: center;
            /* color: white; */
            position: absolute;
            z-index: 0;
            /* transform: translate3d(-888px, 0px, 0px);        */  /* 이건 슬라이드 타입 */
            /* transition: opacity 0.5s ease-in-out;            */  /* 이건 투명도 변화 타입 */
        }
        .slider_item img {
            top: 85px;
            height: 500px;
            width: 1200px;
        }
        .slider_item div {
        	font-size: 30px;
        	text-align: center;
        }
        .showing {
            z-index: 1;
            opacity: 1;
            transition-duration: 0.5s;
            /* transform: translate3d(0px, 0px, 0px); */        /* 이건 슬라이드 타입 */
        }
        .previous {
            z-index: 1;
            opacity: 0;
            transition-duration: 0.5s;
            /* transform: translate3d(888px, 0px, 0px); */      /* 이건 슬라이드 타입 */
        }
        .h_a{
        	color:inherit;
        	text-decoration: none;	
        }
        .h_m{
        	font-weight: bold;
        }
        #m_video {
        	padding-top: 100px;
        	width: 1200px;
        	margin: 0 auto;
        	border: 0;
        }
        #m_video video{
        	width: 1200px;
        	border: 0;
        }
        .h_r_a{
        	color: #fff;
        }
    </style>
<title>ByDIN</title>
</head>
<body>
 <div id="headerwrp">
        <div id="headermain">
            <div class="h_main">
                <a href="${cpath }/"><img src="${cpath }/resources/img/logo/logo.png" width="166px"></a>
                <div class="h_search">
                    <input id="h_search" type="text" name="search" placeholder="검색어를 입력하세요">
                    <img class="input_img" src="${cpath }/resources/img/icon/검색.jpg" height="40px" width="40px">
                </div>
                <div class="header_right">
                        <a class="h_r_a" href="${cpath}/${login.userid == 'admin' ? 'admin' : 'member' }/${login.userid == 'admin' ? 'admin' : 'mypage' }">
                        	<img title="${login.userid == 'admin' ? '관리자페이지' : '마이페이지' }" src="${cpath }/resources/img/icon/로그인.png" height="40px" width="40px">
                        </a>
                        <img title="장바구니" src="${cpath }/resources/img/icon/장바구니.png" height="40px" width="40px">
                        <a href="${cpath }/qna/board" class="h_r_a"><img title="고객센터" src="${cpath }/resources/img/icon/고객센터.png" height="40px" width="40px"></a>
                </div>
            </div>
        </div>
        <div id="h_down">
        <ul class="h_ul">
        	<li class="h_menu2">NEW</li>
        	<li class="h_menu">서재</li>
        	<li class="h_menu">침실</li>
        	<li class="h_menu">거실</li>
        	<li class="h_menu">주방</li>
        	<li class="h_menu">의자</li>
        </ul>
     	<div class="h_right">
     		<ul class="h_ul">
     			<li class="h_menu h_m">${empty login ? '' : login.username} ${empty login ? '' : '님'}</li>
     			<li class="h_menu"><a class="h_a" href="${cpath }/${empty login ? 'member/login' : 'member/logout'}">${empty login ? '로그인' : '로그아웃' }</a></li>
     			<c:if test="${empty login }">
     			<li class="h_menu"><a class="h_a" href="${cpath }/member/terms">회원가입</a></li>
     			</c:if>
     			<li class="h_menu">쿠폰/혜택</li>
     		</ul>
     	</div>
 	</div>
    </div>
