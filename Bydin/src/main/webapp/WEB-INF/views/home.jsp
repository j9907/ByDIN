<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
	ul, li {
		list-style: none;
	}
	.m_item_image{
		width:270px;
		display: flex;
		justify-content: center;
	}
	.m_item_info p{
		text-align: center;
	}
	#m_item {
		display: flex;
		justify-content: center;
		padding-top: 100px;
	}
	#m_ul {
		float: left;
	}
	#m_li {
		float: left;
		width: 300px;
		padding: 2px;
	}
</style>
<div id="main">

	<!-- 이미지 슬라이드 -->
    <div id="m_slider">
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

	<!-- 메인 영상 -->
	<div id="m_video">
		<video autoplay="autoplay" loop muted>
			<source src="${cpath }/resources/video/m_video.mp4">
		</video>
	</div>

	<!-- 메인페이지에 카테고리별 대표 이미지 띄우기 -->
	<!-- 서재 -->
	<div id="m_item">
	<ul id="m_ul">
	<c:forEach items="${dto1 }" var="dto1" begin="0" end="3">
		<li id="m_li">
			<div><img class="m_item_image" src="${cpath }/upload/${dto1.image}"></div>
			<div class="m_item_info"><p>${dto1.name }</p></div>
		</li>
	</c:forEach>
	</ul>
	</div>
	
	<!-- 침실 -->
	<div id="m_item">
	<ul id="m_ul">
	<c:forEach items="${dto2 }" var="dto2" begin="0" end="3">
		<li id="m_li">
			<div><img class="m_item_image" src="${cpath }/upload/${dto2.image}"></div>
			<div class="m_item_info"><p>${dto2.name }</p></div>
		</li>
	</c:forEach>
	</ul>
	</div>
	
	<!-- 거실 -->
	<div id="m_item">
	<ul id="m_ul">
	<c:forEach items="${dto3 }" var="dto3" begin="0" end="3">
		<li id="m_li">
			<div><img class="m_item_image" src="${cpath }/upload/${dto3.image}"></div>
			<div class="m_item_info"><p>${dto3.name }</p></div>
		</li>
	</c:forEach>
	</ul>
	</div>
	
	<!-- 주방 -->
	<div id="m_item">
	<ul id="m_ul">
	<c:forEach items="${dto4 }" var="dto4" begin="0" end="3">
		<li id="m_li">
			<div><img class="m_item_image" src="${cpath }/upload/${dto4.image}"></div>
			<div class="m_item_info"><p>${dto4.name }</p></div>
		</li>
	</c:forEach>
	</ul>
	</div>
	
	<!-- 의자 -->
	<div id="m_item">
	<ul id="m_ul">
	<c:forEach items="${dto5 }" var="dto5" begin="0" end="3">
		<li id="m_li">
			<div><img class="m_item_image" src="${cpath }/upload/${dto5.image}"></div>
			<div class="m_item_info"><p>${dto5.name }</p></div>
		</li>
	</c:forEach>
	</ul>
	</div>

</div>

    <script type="text/javascript">
        window.addEventListener('load',(event) => {
            const slideHandler = () => {
             document.querySelectorAll('.slider_item').forEach( (element) => {
                element.style.transition = '';
                element.style.transform = 'translate3d(0px, 0px, 0px)';
               
             })
             document.querySelectorAll('.previous').forEach( (element) => {
                 
                document.querySelector('.previous').style.transform = 'translate3d(-900px, 0px, 0px)';
            document.querySelector('.showing').style.transform = 'translate3d(900px, 0px, 0px)';
            })
         }

        firstSlide = document.querySelector('.slider_item:first-child');   // 첫번째 자식 노드 선택
        lastSlide = document.querySelector('.slider_item:last-child');     // 마지막 자식 노드 선택

        function slide() {
            slideHandler();          // 선택된 방식으로 이미지 변환 결정


            const currentSlide = document.querySelector('.showing');
            const previousSlide = document.querySelector('.previous');
            if(currentSlide) {
                currentSlide.classList.remove('showing');
                currentSlide.classList.add('previous');
                const nextSlide = currentSlide.nextElementSibling;
                if(nextSlide) {
                    nextSlide.classList.add('showing');
                }
                else {
                    firstSlide.classList.add('showing');
                }
            }
            else {  // 첫번째 실행 때 지정된 클래스가 없으면 부여함
                firstSlide.classList.add('showing');
                lastSlide.classList.add('previous');
            }
            if(previousSlide) {
                previousSlide.classList.remove('previous');
            }
        }
        slide();
        setInterval(slide, 5000);
        })
    </script>



<%@ include file="footer.jsp"%>