<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="header.jsp" %>


<c:if test="${empty dto }">
	<div class="l_item"><p>검색 결과가 없습니다</p></div>
</c:if>

<c:if test="${not empty dto }">
<div class="l_item">
	<ul id="l_ul">
	<div id="item">
	<c:forEach var="i" begin="0" end="${fn:length(dto) - '1' }">
		<li id="l_li">
		<a id="l_a" href="${cpath }/item/itemview/${dto[i].idx}"><label>
			<div id="l_img"><img src="${cpath }/upload/${dto[i].image }"></div>
			<div id="l_title">${dto[i].name }</div>
			<div id="l_price">${dto[i].price } 원</div>
		</label></a>
		</li>
	</c:forEach>
	</div>
	</ul>
</div>
</c:if>
	
	

<%@ include file="footer.jsp"%>