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
        	<img src="https://admin.dodot.co.kr/data/main_banner/18/bc123e19b0f5919e65a12ab1d52a5fc9.jpg">
        	<div>슬라이드 이미지 1</div>
        </div>
        <div class="slider_item">
        	<img src="https://admin.dodot.co.kr/data/main_banner/18/d71bec32f018b5f2b4c18b88a3d28098.jpg">
        	<div>슬라이드 이미지 2</div>
        </div>
        <div class="slider_item">
        	<img src="https://admin.dodot.co.kr/data/main_banner/18/d6d3f558a12a03dd25e3ecbf87168d49.jpg">
        	<div>슬라이드 이미지 3</div>
        </div>
        <div class="slider_item">
        	<img src="https://admin.dodot.co.kr/data/main_banner/18/39cc3a0f887e9e213879e46f1e36481c.jpg">
        	<div>슬라이드 이미지 4</div>
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
        	
//             const slideHandler = () => {
//              document.querySelectorAll('.slider_item').forEach( (element) => {
//                 element.style.transition = '';
//                 element.style.transform = 'translate3d(0px, 0px, 0px)';
               
//              })
//              document.querySelectorAll('.previous').forEach( (element) => {
                 
//                 document.querySelector('.previous').style.transform = 'translate3d(-900px, 0px, 0px)';
//             document.querySelector('.showing').style.transform = 'translate3d(900px, 0px, 0px)';
//             })
//          }

//         firstSlide = document.querySelector('.slider_item:first-child');   // 첫번째 자식 노드 선택
//         lastSlide = document.querySelector('.slider_item:last-child');     // 마지막 자식 노드 선택

//         function slide() {
//             slideHandler();          // 선택된 방식으로 이미지 변환 결정


//             const currentSlide = document.querySelector('.showing');
//             const previousSlide = document.querySelector('.previous');
//             if(currentSlide) {
//                 currentSlide.classList.remove('showing');
//                 currentSlide.classList.add('previous');
//                 const nextSlide = currentSlide.nextElementSibling;
//                 if(nextSlide) {
//                     nextSlide.classList.add('showing');
//                 }
//                 else {
//                     firstSlide.classList.add('showing');
//                 }
//             }
//             else {  // 첫번째 실행 때 지정된 클래스가 없으면 부여함
//                 firstSlide.classList.add('showing');
//                 lastSlide.classList.add('previous');
//             }
//             if(previousSlide) {
//                 previousSlide.classList.remove('previous');
//             }
//         }
//         slide();
//         setInterval(slide, 5000);
        })
    </script>



<%@ include file="footer.jsp"%>