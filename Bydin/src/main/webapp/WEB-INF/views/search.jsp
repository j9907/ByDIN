<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="header.jsp" %>
<style>
	ul, li {
		list-style: none;
	}
	.s_item {
		max-width: 1200px;
		margin: 0 auto;
		display: flex;
		justify-content: center;
		padding-top: 50px;
		padding-bottom: 50px;
	}
	.s_item > p {
		font-weight: bold;
		font-size: 23px;
	}
	.s_item > #s_ul {
		float: left;
	}
	.s_item > #s_ul > #s_li {
		float: left;
		width: 250px;
		height: 330px;
		padding: 20px;
	}
	.s_item > #s_ul > #s_li > a {
		text-decoration: none;
		color: black;
		width: 200px;
	}
	.s_item > #s_ul > #s_li > a > label > #s_l_img {
		margin: 0 auto;
		height: 250px;
		border: 1px solid lightgray;
		display: flex;
		align-items: center;
	}
	.s_item > #s_ul > #s_li > a > label > #s_l_img > img {
		width: 190px;
		height: 190px;
		margin: 0 auto;
		display: flex;
		
	}
	.s_item > #s_ul > #s_li > a > label > #s_l_title {
		height: 50px;
		padding: 3px;
	}
	.s_item > #s_ul > #s_li > a > label > #s_l_price {
		height: 30px;
		color: #6667ab;
		font-size: 20px;
		font-weight: bold;
		float: right;
	}
</style>

<c:if test="${empty dto }">
	<div class="s_item"><p>검색 결과가 없습니다</p></div>
</c:if>

<c:if test="${not empty dto }">
<div class="s_item">
	<ul id="s_ul">
	<c:forEach var="i" begin="0" end="${fn:length(dto) - '1' }">
		<li id="s_li">
		<a id="s_a" href="${cpath }/item/itemview/${dto[i].idx}"><label>
			<div id="s_l_img"><img src="${cpath }/upload/${dto[i].image }"></div>
			<div id="s_l_title">${dto[i].name }</div>
			<div id="s_l_price">${dto[i].price } 원</div>
		</label></a>
		</li>
	</c:forEach>
	</ul>
</div>
</c:if>
	
	

<%@ include file="footer.jsp"%>