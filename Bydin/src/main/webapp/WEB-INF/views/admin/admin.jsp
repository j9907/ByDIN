<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	#a_list {
		display: block;
            max-width: 1270px;
            margin: 0 auto;
            padding: 0 35px;
            width: 100%;
		
	}
	#a_list p {
		padding: 20px;
	}
	a {
		text-decoration: none;
	}
</style>

	<div id="a_list">
		<p><a href="${cpath }/admin/addItem">상품추가</a></p>
		<p><a href="${cpath }/admin/mngAcnt">회원목록</a></p>
	</div>

<%@ include file="../footer.jsp" %>