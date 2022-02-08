<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
body, div, input {
	margin: 0;
	padding: 0;
}

#m_terms {
	display: flex;
	align-items: center;
	margin: 0 auto;
	margin-top: 30px;
	height: 1000px;
	flex-flow: column;
	max-width: 1270px;
}

.s_title {
	padding: 30px;
}
input[type="checkbox"]{
	display: none;
}
input[type="checkbox"] + label.l_b {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #6667ab;
	cursor: pointer;
	position: relative;
}
input[type="checkbox"]:checked + label.l_b {
	background-color: #6667ab;
}
#leaveReadme {
	width: 800px;
	height: 200px;
	resize: none;
	margin-bottom: 20px;
	font-size: 12pt;
	border:1px solid #6667ab;
}
#top_terms{
	margin-bottom: 20px;
}
#top_terms,#terms_use,#terms_privacy,#temrs_event{
	display: flex;
	align-items: center;
	margin-bottom: 10px;
}
.s_terms{
	margin-left: 10px;
}
.t_btn{
	background-color:lightgray;
	border:0;
	border-radius: 50px;
	padding:10px;
	width: 150px;
	font-size: 12pt;
	font-weight: bold;
	color:#6667ab;
	margin:30px 0 30px 0;
	cursor: pointer;
}
#t_next{
	background-color:#6667ab;
	border:0;
	border-radius: 50px;
	padding:10px;
	width: 150px;
	font-size: 12pt;
	font-weight: bold;
	color:#fff;
	margin:30px 0 0 30px;
	cursor: pointer;
}
</style>
<div id="m_terms">
	<h1 id="l_title">약관동의</h1>
	<div class="s_check_title">
		<p class="s_title">Bydin 쇼핑몰 이용약관과 개인정보 수집 및 이용에 동의를 하셔야 회원가입이
			가능합니다.</p>
	</div>
	<div id="all_terms">
		<div id="top_terms">
			<input type="checkbox" name="agree_all" id="agree_all" onclick='selectAll(this)' > 
			<label for="agree_all" class="l_b"></label>
			<label for="agree_all" style="cursor: pointer;">
			<span class="s_terms">모두 동의합니다</span></label>
		</div>
		<div id="terms_use">
			<input type="checkbox" name="agree" value="0" id="agree1" class="agree" onclick='checkSelectAll()'> 
			<label for="agree1" class="l_b"></label>
			<label for="agree1" style="cursor: pointer"> 
			<strong class="s_terms">(필수)</strong><span>이용약관 동의</span>
			</label>
			</div>
			<div id="terms_use_text">
			<textarea id="leaveReadme">${terms }</textarea>
		</div>
		<div id="terms_privacy">
			<input type="checkbox" name="agree" value="0" id="agree2" class="agree" onclick='checkSelectAll()'> 
			<label for="agree2" class="l_b"></label>
			<label for="agree2" style="cursor: pointer"> <strong class="s_terms">(필수)</strong>
			<span >개인정보 수집, 이용 동의</span></label>
			</div>
			<div id="terms_use_text">
			<textarea id="leaveReadme">${privacy }</textarea>
		</div>
		<div id="temrs_event">
			<input type="checkbox" id="agree3" class="agree" onclick='checkSelectAll()'>  
			<label for="agree3" class="l_b"></label>
			<label for="agree3" style="cursor: pointer"> 
			<strong class="s_terms">(선택)</strong>
			<span>이벤트, 혜택정보 수신동의</span></label>
			</div>
		</div>
		<div id="m_next">
		<a href="${cpath }/"><button class="t_btn">취소하기</button></a>
		<button id="t_next" onclick="agree();">다음으로</button>
		</div>
</div>
<script>
const agreeChkAll = document.querySelector('input[name="agree_all"]');
    agreeChkAll.addEventListener('change', (e) => {
    let agreeChk = document.querySelectorAll('input[class="agree"]');
    for(let i = 0; i < agreeChk.length; i++){
      agreeChk[i].checked = e.target.checked;
    }
});
    
    function checkSelectAll()  {
    	  // 전체 체크박스
    	  const checkboxes 
    	    = document.querySelectorAll('input[class="agree"]');
    	  // 선택된 체크박스
    	  const checked 
    	    = document.querySelectorAll('input[class="agree"]:checked');
    	  // select all 체크박스
    	  const selectAll 
    	    = document.querySelector('input[name="agree_all"]');
    	  
    	  if(checkboxes.length === checked.length)  {
    	    selectAll.checked = true;
    	  }else {
    	    selectAll.checked = false;
    	  }

    	}

    	function selectAll(selectAll)  {
    	  const checkboxes 
    	     = document.getElementsByClass('agree');
    	  
    	  checkboxes.forEach((checkbox) => {
    	    checkbox.checked = selectAll.checked
    	  })
    	}

  
    
    const btn = document.getElementById('t_next')
 	function agree() { 
    	var chkbox = document.getElementsByName('agree'); 
    	var chk = false; 
    	var chk1 = 0;
    	for(var i=0 ; i<chkbox.length ; i++) { 
    		if(chkbox[i].checked) {
    			chk = true; 
    			chk1++;
    			} 
    		else { 
    			chk = false; 
    			} 
    		} 
    	if(chk && chk1 >= 2) { 
			location.href="${cpath}/member/signup"; 
			return false; 
			} 
    	else { 
    		alert("회원가입을 위해 필수 동의항목 모두 동의해주시기 바랍니다.") 
    		} 
    	}
    

    	
    	
 	
</script>
<%@ include file="../footer.jsp"%>