<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	#a_list {
		display: flex;
        max-width: 1270px;
        margin: 0 auto;
        padding: 50px;
        width: 80%;
	}
	#a_list p {
		padding: 20px;
	}
	a {
		text-decoration: none;
	}
	.admin_btn {
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

	<div id="a_list">
		<p><a href="${cpath }/admin/addItem" class="admin_btn">상품추가</a></p>
		<p><a href="${cpath }/admin/mngAcnt" class="admin_btn">회원목록</a></p>
		<p><a href="${cpath }/member/mypage" class="admin_btn">마이페이지</a></p>
	</div>

<%@ include file="../footer.jsp" %>