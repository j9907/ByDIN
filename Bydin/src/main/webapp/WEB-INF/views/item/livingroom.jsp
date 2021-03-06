<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	.topbar {
		padding-top: 100px;
		display: flex;
		max-width: 1200px;
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
	  	border-radius: 15px;
	}
	
	/* Dropdown button on hover & focus */
	.dropbtn:hover, .dropbtn:focus {
	  	background-color: #6667ab;
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
	.dropdown-content button {
	  	color: black;
	  	padding: 12px 16px;
	  	border: 0;
	  	display: block;
	  	width: 100%;
	  	text-align: left;
	  	font-size: 16px;
	}
	
	/* Change color of dropdown links on hover */
	.dropdown-content a:hover {background-color: #ddd}
	.dropdown-content button:hover {background-color: #ddd}
	
	/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
	.show {display:block;}
	
	#h_a{
		text-decoration: none;
		color:inherit;
		cursor:pointer;
	}
	
	#h_a > label{
		cursor:pointer;
	}
</style>


<!-- topbar 구성 -->
<div class="topbar">
<div class="topbar_left">
	<div id="dropdown">
        <button onclick="myfunction1()" class="dropbtn">거실</button>
        <div id="myDropdown1" class="dropdown-content">
            <a href="${cpath}/item/studyroom">서재</a>
            <a href="${cpath}/item/bedroom">침실</a>
            <a href="${cpath}/item/livingroom">거실</a>
            <a href="${cpath}/item/kichen">주방</a>
            <a href="${cpath}/item/chair">의자</a>
        </div>
    </div>

	<div id="dropdown">
		<button onclick="myfunction2()" class="dropbtn">전체보기</button>
		<div id="myDropdown2" class="dropdown-content">
			<button href="#" id="basic_btn">전체보기</button>
			<button href="#" value="2-31">소파</button>
			<button href="#" value="2-32">거실장/수납장</button>
			<button href="#" value="2-33">사이드테이블</button>
		</div>
	</div>
</div>


<div class="topbar_right">
	<div id="dropdown">
		<button onclick="myfunction3()" class="dropbtn" id="btn">기본정렬순</button>
		<div id="myDropdown3" class="dropdown-content">
			<button href="#" id="basicbtn2">기본정렬순</button>
			<button href="#" id="abcbtn">가나다순</button>
			<button href="#" id="highbtn">높은가격순</button>
			<button href="#" id="lowbtn">낮은가격순</button>
		</div>
	</div>
</div>
</div>

<div class="l_item">
	<ul id="l_ul">
	<div id="item">
	</div>
	</ul>
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
	
	const item = document.getElementById('item')
   	const btn = document.getElementById('btn')

    let dom = ''
	

    // filtering
	const filterItem = document.querySelector('div#myDropdown2').addEventListener('click', async e => {
		
		const url = '${cpath}/filter?ctgcode2=' + e.target.value
		const resp = await fetch(url)
		const json = await resp.json()
		
		dom = '';
		
		
		json.forEach(dto => {
        	
			dom += '<li id="l_li"><a id="l_a" href="${cpath}/item/itemview/'+dto.idx+'"><label>'
        	dom += '<div id="l_img"><img src="${cpath }/upload/'+dto.image+'"></div>'
        	dom += '<div id="l_title">'+dto.name+'</div>'
        	dom += '<div id="l_price">'+dto.price+' 원</div></label></a>'
        	dom += '</li>'
        	
    	});
    	item.innerHTML = dom;
	})
	

	
	
	
	// lowPrice
	function lowPrice(event){
        arr.sort((a, b) => {
            const asc = 1
            return (a.price > b.price ? 1 : -1) * asc
        })
    }

    // highPrice
    function highPrice(event) {
        arr.sort((a, b) => {
            const desc = -1
            return (a.price > b.price ? 1 : -1) * desc
        })
    }

    
    //basic_sort
    const basicbtn = document.getElementById('basic_btn')
    const basicbtn2 = document.getElementById('basicbtn2')
    
    basicbtn.addEventListener("click", async (event) => {
    	
    	btn.innerText = ''
    	btn.innerText = '기본정렬순'
    	
    	dom = ''
    	const url = '${cpath}/item/dto3'
    	const opt = {
    			method: 'GET'
    	}
    	const resp = await fetch(url, opt)
    	const json = await resp.json()
    	console.log(json)
    	json.forEach(dto => {
        	console.log(dto.image)
        	
        	dom += '<li id="l_li"><a id="l_a" href="${cpath}/item/itemview/'+dto.idx+'"><label>'
        	dom += '<div id="l_img"><img src="${cpath }/upload/'+dto.image+'"></div>'
        	dom += '<div id="l_title">'+dto.name+'</div>'
        	dom += '<div id="l_price">'+dto.price+' 원</div></label></a>'
        	dom += '</li>'
        	
    	});
    	item.innerHTML = dom;
    })
    basicbtn2.addEventListener("click", async (event) => {
    	
    	btn.innerText = ''
    	btn.innerText = '기본정렬순'
    	
    	dom = ''
    	const url = '${cpath}/item/dto3'
    	const opt = {
    			method: 'GET'
    	}
    	const resp = await fetch(url, opt)
    	const json = await resp.json()
    	console.log(json)
    	json.forEach(dto => {
        	console.log(dto.image)
        	
        	dom += '<li id="l_li"><a id="l_a" href="${cpath}/item/itemview/'+dto.idx+'"><label>'
        	dom += '<div id="l_img"><img src="${cpath }/upload/'+dto.image+'"></div>'
        	dom += '<div id="l_title">'+dto.name+'</div>'
        	dom += '<div id="l_price">'+dto.price+' 원</div></label></a>'
        	dom += '</li>'
        	
    	});
    	item.innerHTML = dom;
    })
    
    // abc
    const abcbtn = document.getElementById('abcbtn')
        
    abcbtn.addEventListener("click", async (event) => {
    	
    	btn.innerText = ''
    	btn.innerText = '가나다순'
    	
    	dom = ""
    	const url = '${cpath}/item/dto3'
        	const opt = {
        			method: 'GET'
        	}
        	const resp = await fetch(url, opt)
        	console.log(resp)
        	const json = await resp.json()
        	console.log(json)
        	
        json.sort((a, b) => {
            const asc = 1
            console.log((a.name > b.name ? 1 : -1) * asc)
            return (a.name > b.name ? 1 : -1) * asc
        })
            json.forEach(dto => {
            	console.log(dto.image)
            	
            dom += '<li id="l_li"><a id="l_a" href="${cpath}/item/itemview/'+dto.idx+'"><label>'
        	dom += '<div id="l_img"><img src="${cpath }/upload/'+dto.image+'"></div>'
        	dom += '<div id="l_title">'+dto.name+'</div>'
        	dom += '<div id="l_price">'+dto.price+' 원</div></label></a>'
        	dom += '</li>'
            	
        	});
    		console.log(dom)
        	item.innerHTML = dom;
    });
    
    // highPrice
    
    const highbtn = document.getElementById('highbtn')
    
    highbtn.addEventListener("click", async (event) => {
    	
    	btn.innerText = ''
    	btn.innerText = '높은가격순'
    	
    	dom = ""
    	const url = '${cpath}/item/dto3'
        	const opt = {
        			method: 'GET'
        	}
        	const resp = await fetch(url, opt)
        	console.log(resp)
        	const json = await resp.json()
        	console.log(json)
        	
        json.sort((a, b) => {
            const desc = -1
            console.log((a.price > b.price ? 1 : -1) * desc)
            return (a.price > b.price ? 1 : -1) * desc
        })
            json.forEach(dto => {
            	console.log(dto.image)
            	
            dom += '<li id="l_li"><a id="l_a" href="${cpath}/item/itemview/'+dto.idx+'"><label>'
        	dom += '<div id="l_img"><img src="${cpath }/upload/'+dto.image+'"></div>'
        	dom += '<div id="l_title">'+dto.name+'</div>'
        	dom += '<div id="l_price">'+dto.price+' 원</div></label></a>'
        	dom += '</li>'
            	
        	});
    		console.log(dom)
        	item.innerHTML = dom;
    });
    
    
    
    // lowPrice
    
    const lowbtn = document.getElementById('lowbtn')
    
    lowbtn.addEventListener("click", async (event) => {
    	
    	btn.innerText = ''
    	btn.innerText = '낮은가격순'
    	
    	dom = ""
    	const url = '${cpath}/item/dto3'
        	const opt = {
        			method: 'GET'
        	}
        	const resp = await fetch(url, opt)
        	console.log(resp)
        	const json = await resp.json()
        	console.log(json) 
        	
        json.sort((a, b) => {
            const asc = 1
            console.log((a.price > b.price ? 1 : -1) * asc)
            return (a.price > b.price ? 1 : -1) * asc
        })
            json.forEach(dto => {
            	console.log(dto.image)
            	
            dom += '<li id="l_li"><a id="l_a" href="${cpath}/item/itemview/'+dto.idx+'"><label>'
        	dom += '<div id="l_img"><img src="${cpath }/upload/'+dto.image+'"></div>'
        	dom += '<div id="l_title">'+dto.name+'</div>'
        	dom += '<div id="l_price">'+dto.price+' 원</div></label></a>'
        	dom += '</li>'
            	
        	});
    		console.log(dom)
        	item.innerHTML = dom;
    });
    
    
    

    window.addEventListener('load',async (event) => {
    	const url = '${cpath}/item/dto3'
    	const opt = {
    			method: 'GET'
    	}
    	const resp = await fetch(url, opt)
    	console.log(resp)
    	const json = await resp.json()
    	console.log(json)
    	
    	json.forEach(dto => {
        	console.log(dto.image)
        	
        	dom += '<li id="l_li"><a id="l_a" href="${cpath}/item/itemview/'+dto.idx+'"><label>'
        	dom += '<div id="l_img"><img src="${cpath }/upload/'+dto.image+'"></div>'
        	dom += '<div id="l_title">'+dto.name+'</div>'
        	dom += '<div id="l_price">'+dto.price+' 원</div></label></a>'
        	dom += '</li>'
        	
    	});
		console.log(dom)
    	item.innerHTML = dom;
    	
    });
    
	
</script>
	

<!--   거실 livingroom 카테고리코드 1-03   -->




<%@ include file="../footer.jsp"%>