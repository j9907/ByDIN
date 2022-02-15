<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	function topbar_move(url){
		location.href=url
	}
</script>


	<div class="l_topbar">
		<div class="l_topbar_left">
			<select id="l_topbar_menu" onchange="topbar_move(this.value);">
				<option value="${cpath }/item/studyroom">서재</option>
				<option value="${cpath }/item/bedroom">침실</option>
				<option value="${cpath }/item/livingroom">거실</option>
				<option value="${cpath }/item/kichen">주방</option>
				<option value="${cpath }/item/chair">의자</option>
			</select>
			
			<select id="l_topbar_ctg">
				<option>2nd ctg</option>
			</select>
		</div>
		
		<div class="l_topbar_right">
			<select id="l_topbar_sort">
				<option>인기상품순</option>
				<option>가나다순</option>
				<option>높은가격순</option>
				<option>낮은가격순</option>
			</select>
		</div>
	</div>