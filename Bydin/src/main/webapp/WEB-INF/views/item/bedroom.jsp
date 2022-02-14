<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	ul, li {
		list-style: none;
	}
	.l_item_image{
		width:190px;
		display: flex;
		justify-content: center;
	}
	.l_item_info{
		display: flex;
		justify-content: flex-start;
	}
	.l_item_info p{
		height: 100px;
		width: 180px;
		font-size: 15px;
		/* text-align: center; */
	}
	#l_item {
		max-width: 1100px;
		margin: 0 auto;
		display: flex;
		justify-content: center;
		padding-top: 50px;
		padding-bottom: 50px;
	}
	#l_ul {
		float: left;
	}
	#l_li {
		float: left;
		width: 200px;
		padding: 10px;
	}
	.l_topbar {
		padding-top: 100px;
		display: flex;
		max-width: 1100px;
		margin: 0 auto;
		justify-content: space-between;
		align-content: center;
	}
	
</style>

<%@ include file="topbar.jsp" %>
	

<!--   침실 bedroom 카테고리코드 1-02   -->

	<div id="l_item">
	<ul id="l_ul">
	<c:forEach items="${dto2 }" var="dto2">
		<li id="l_li">
			<div><img class="l_item_image" src="${cpath }/upload/${dto2.image}"></div>
			<div class="l_item_info"><p>${dto2.name }</p></div>
		</li>
	</c:forEach>
	</ul>
	</div>


<%@ include file="../footer.jsp"%>