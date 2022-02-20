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
	.topbar {
		padding-top: 100px;
		display: flex;
		max-width: 1100px;
		margin: 0 auto;
		justify-content: space-between;
		align-content: center;
	}
	.topbar_left{
		display: flex;
		
	}
	 /* Dropdown Button */
	.dropbtn {
	  	background-color: #fcfcfc;
	  	color: black;
	  	padding: 16px;
	  	font-size: 16px;
	  	border: none;
	  	cursor: pointer;
	}
	
	/* Dropdown button on hover & focus */
	.dropbtn:hover, .dropbtn:focus {
	  	background-color: #2980B9;
	}
	
	/* The container <div> - needed to position the dropdown content */
	.dropdown {
	  	position: relative;
	  	display: inline-block;
	}
	
	/* Dropdown Content (Hidden by Default) */
	.dropdown-content {
	  	display: none;
	  	position: absolute;
	  	background-color: #f1f1f1;
	  	min-width: 160px;
	  	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  	z-index: 1;
	}
	
	/* Links inside the dropdown */
	.dropdown-content a {
	  	color: black;
	  	padding: 12px 16px;
	  	text-decoration: none;
	  	display: block;
	}
	
	/* Change color of dropdown links on hover */
	.dropdown-content a:hover {background-color: #ddd}
	
	/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
	.show {display:block;}
</style>


<!-- topbar 구성 -->
<div class="topbar">
<div class="topbar_left">
	<div id="dropdown">
        <button onclick="myfunction1()" class="dropbtn">주방</button>
        <div id="myDropdown1" class="dropdown-content">
            <a href="${cpath}/item/studyroom">서재</a>
            <a href="${cpath}/item/bedroom">침실</a>
            <a href="${cpath}/item/livingroom">거실</a>
            <a href="${cpath}/item/kichen">주방</a>
            <a href="${cpath}/item/chair">의자</a>
        </div>
    </div>

	<div id="dropdown">
		<button onclick="myfunction2()" class="dropbtn">2nd ctg</button>
		<div id="myDropdown2" class="dropdown-content">
			<a href="${cpath }">1</a>
			<a href="${cpath }">2</a>
			<a href="${cpath }">3</a>
		</div>
	</div>
</div>


<div class="topbar_right">
	<div id="dropdown">
		<button onclick="myfunction3()" class="dropbtn">sortdropdown</button>
		<div id="myDropdown3" class="dropdown-content">
			<a href="${cpath }">인기상품순</a>
			<a href="${cpath }">가나다순</a>
			<a href="${cpath }">높은가격순</a>
			<a href="${cpath }">낮은가격순</a>
		</div>
	</div>
</div>


</div>
	
	
<script>
	function myfunction1(){
	    document.getElementById('myDropdown1').classList.toggle('show');
	}
	function myfunction2(){
		document.getElementById('myDropdown2').classList.toggle('show');
	}
	function myfunction3(){
		document.getElementById('myDropdown3').classList.toggle('show');
	}
	
	window.onclick = function(event) {
	    if(!event.target.matches('.dropbtn')){
	        var dropdowns = document.getElementsByClassName("dropdown-content");
	        var i;
	        for (i = 0; i < dropdowns.length; i++) {
	            var openDropdown = dropdowns[i];
	            if (openDropdown.classList.contains('show')){
	                openDropdown.classList.remove('show');
	            }
	        }
	    }
	}
	
</script>
	

<!--   주방 kichen 카테고리코드 1-04   -->

	<div id="l_item">
	<ul id="l_ul">
	<c:forEach items="${dto4 }" var="dto4">
		<li id="l_li">
			<div><img class="l_item_image" src="${cpath }/upload/${dto4.image}"></div>
			<div class="l_item_info"><p>${dto4.name }</p></div>
		</li>
	</c:forEach>
	</ul>
	</div>



<%@ include file="../footer.jsp"%>