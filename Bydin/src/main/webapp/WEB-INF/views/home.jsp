<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
	.slider__item {
            width: 100%;
            height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            position: absolute;
            top: 88px;
            z-index: 0;
            opacity: 0;
            transform: translate3d(-888px, 0px, 0px);          /* 이건 슬라이드 타입 */
            /* transition: opacity 0.5s ease-in-out;            */  /* 이건 투명도 변화 타입 */
        }
        .slider__item img {
            top: 85px;
            height: 500px;
        }
        .showing {
            opacity: 1;
            z-index: 1;
            transition-duration: 0.5s;
            transform: translate3d(0px, 0px, 0px);       /* 이건 슬라이드 타입 */
        }
        .previous {
            opacity: 0;
            z-index: 1;
            transition-duration: 0.5s;
            transform: translate3d(888px, 0px, 0px);      /* 이건 슬라이드 타입 */
        }
</style>
<div id="main">

<div id="m_slide">
		<div class="slider_item"><img src="https://admin.dodot.co.kr/data/main_banner/18/2376ee5d702e671fa3b5173e985a3865.jpg"></div>
		<div class="slider_item"><img src="https://admin.dodot.co.kr/data/main_banner/18/994b859399d0e10771d8da734eab7163.jpg"></div>
</div>
</div>

<script type="text/javascript">
	const slideHandler = () => {
		document.querySelectorAll('.m_slide').forEach((element) => {
			element.style.transition = '';
			element.style.transition = 'translate3d(0px, 0px, 0px)';
		})
		document.querySelector('.previous').style.transform = 'translate3d(-888px, 0px, 0px)';
		document.querySelector('.showing').style.transform = 'translate3d(888px, 0px, 0px)';
	}
	
	
	firstSlide = document.querySelector('.slider_item:first-child');
	lastSlide = document.querySelector('.slider_item:last=child');
	
	function slide(){
		slideHandler();
		
		const currentslide = document.querySelector('.showing');
		const previousSlide = document.querySelector('.previous');
		if(currentSlide){
			currentSlide.classList.remove('showing');
			currentSlide.classList.add('previous');
			const nextSlide = currentSlide.nextElementSibling;
			if(nextSlide){
				nextSlide.classList.add('showing');
			}
			else{
				firstSlide.classList.add('showing');
			}
		}
		else{
			firstSlide.classList.add('showing');
			lastSlide.classList.add('previous');
		}
		if(previousSlide){
			previousSlide.classList.remove('previous');
		}
		slide();
		setInterval(slide, 4000);
	}
</script>
<%@ include file="footer.jsp"%>