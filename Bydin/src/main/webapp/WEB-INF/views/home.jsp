<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
ul, li {
	list-style: none;
}

.l_m_item {
	max-width: 1200px;
	margin: 0 auto;
	display: flex;
	justify-content: center;
}

.l_m_item>p {
	font-weight: bold;
	font-size: 23px;
}

.l_m_item>#l_ul {
	float: left;
}

.l_m_item>#l_ul>#item>#l_li {
	float: left;
	width: 250px;
	height: 330px;
	padding: 20px;
}

.l_m_item>#l_ul>#item>#l_li>a {
	text-decoration: none;
	color: black;
	width: 200px;
}

.l_m_item>#l_ul>#item>#l_li>a>label>#l_img {
	margin: 0 auto;
	height: 250px;
	border: 1px solid lightgray;
	display: flex;
	align-items: center;
}

.l_m_item>#l_ul>#item>#l_li>a>label>#l_img>img {
	width: 190px;
	height: 190px;
	margin: 0 auto;
	display: flex;
}

.l_m_item>#l_ul>#item>#l_li>a>label>#l_title {
	height: 50px;
	padding: 10px;
}

</style>
<div id="main">

	<!-- 이미지 슬라이드 -->
    <div id="m_slider">
    <div id="m_slider_frame">
        <div class="slider_item">
        	<a href="${cpath }/item/studyroom"><img src="${cpath }/resources/img/main_slider/slide_studyroom.jpg"></a>
        </div>
        <div class="slider_item">
        	<a href="${cpath }/item/bedroom"><img src="${cpath }/resources/img/main_slider/slide_bedroom.jpg"></a>
        </div>
        <div class="slider_item">
        	<a href="${cpath }/item/livingroom"><img src="${cpath }/resources/img/main_slider/slide_livingroom.jpg"></a>
        </div>
        <div class="slider_item">
        	<a href="${cpath }/item/kichen"><img src="${cpath }/resources/img/main_slider/slide_kichen.png"></a>
        </div>
        <div class="slider_item">
        	<a href="${cpath }/item/chair"><img src="${cpath }/resources/img/main_slider/slide_chair.png"></a>
        </div>
    </div>
    </div>

	<!-- 메인 영상 -->
	<div id="m_video">
		<video autoplay="autoplay" loop muted>
			<source src="${cpath }/resources/video/m_video.mp4">
		</video>
	</div>

	<!-- 메인페이지에 카테고리별 대표 이미지 띄우기 -->
	<!-- 서재 -->
	<div class="l_m_item">
	<ul id="l_ul">
	<div id="item">
	<c:forEach items="${dto1 }" var="dto1" begin="0" end="3">
		<li id="l_li">
		<a id="l_a" href="${cpath }/item/itemview/${dto1.idx}"><label>
			<div id="l_img"><img src="${cpath }/upload/${dto1.image}"></div>
			<div id="l_title"><p>${dto1.name }</p></div>
		</label>
		</a>
		</li>
	</c:forEach>
	</div>
	</ul>
	</div>
	
	<!-- 침실 -->
	<div class="l_m_item">
	<ul id="l_ul">
	<div id="item">
	<c:forEach items="${dto2 }" var="dto2" begin="0" end="3">
		<li id="l_li">
		<a id="l_a" href="${cpath }/item/itemview/${dto2.idx}"><label>
			<div id="l_img"><img src="${cpath }/upload/${dto2.image}"></div>
			<div id="l_title"><p>${dto2.name }</p></div>
			</label></a>
		</li>
	</c:forEach>
	</div>
	</ul>
	</div>
	
	<!-- 거실 -->
	<div class="l_m_item">
	<ul id="l_ul">
	<div id="item">
	<c:forEach items="${dto3 }" var="dto3" begin="0" end="3">
		<li id="l_li">
		<a id="l_a" href="${cpath }/item/itemview/${dto3.idx}"><label>
			<div id="l_img"><img src="${cpath }/upload/${dto3.image}"></div>
			<div id="l_title"><p>${dto3.name }</p></div>
			</label></a>
		</li>
	</c:forEach>
	</div>
	</ul>
	</div>
	
	<!-- 주방 -->
	<div class="l_m_item">
	<ul id="l_ul">
	<div id="item">
	<c:forEach items="${dto4 }" var="dto4" begin="0" end="3">
		<li id="l_li">
		<a id="l_a" href="${cpath }/item/itemview/${dto4.idx}"><label>
			<div id="l_img"><img src="${cpath }/upload/${dto4.image}"></div>
			<div id="l_title"><p>${dto4.name }</p></div>
			</label></a>
		</li>
	</c:forEach>
	</div>
	</ul>
	</div>
	
	<!-- 의자 -->
	<div class="l_m_item">
	<ul id="l_ul">
	<div id="item">
	<c:forEach items="${dto5 }" var="dto5" begin="0" end="3">
		<li id="l_li">
		<a id="l_a" href="${cpath }/item/itemview/${dto5.idx}"><label>
			<div id="l_img"><img src="${cpath }/upload/${dto5.image}"></div>
			<div id="l_title"><p>${dto5.name }</p></div>
			</label></a>
		</li>
	</c:forEach>
	</div>
	</ul>
	</div>

</div>

    <script type="text/javascript">
        window.addEventListener('load',(event) => {
        	let left = 0
        	
        	const slider = document.getElementById('m_slider')
        	const sliderFrame = document.getElementById('m_slider_frame')
        	
        	function move(){
        		const unitSize = 1215
        		left += unitSize
        		if(left > unitSize * 3){
        			left = 0
        		}
        		sliderFrame.style.left = -left + 'px'
        		
        	}
        	move();
        	setInterval(move, 5000);
        })
    </script>



<%@ include file="footer.jsp"%>