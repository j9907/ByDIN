<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	#readlist{
		max-width: 1200px;
		margin:0 auto;
		
	}
.main {
	margin: 0 auto;
	max-width: 1270px;
	margin-top: 30px;
	}
.b_input{
	padding: 8px;
	border: 1px solid #6667ab;
	outline: none;
	width: 90%;
}
#board_text h2{
	text-align: center;
}
.b_writer{
	border:0;
	border-radius: 10px;
	font-size: 11pt;
	padding:10px;
	font-weight: bold;
	outline: none;
	width: 98%;
}
.under{
	display: flex;
	align-items: center;
	margin:10px;
	padding:10px;
	border-top: 1px solid #dadada;
	border-bottom: 1px solid #dadada;
}
.top{
	margin:10px;
}
p.writer{
	width: 6%;
}
.textarea {
	resize: none;
	font-size: 12pt;
	width: 91%;
	height:auto;
	line-height: 30px;
	border:1px solid #6667ab;
	outline:none;
}
#buttom{
	padding-left:10px;
}
#b_submit{
display:flex;
width: 93%;
margin-bottom: 30px;
justify-content: flex-end;
margin-top:30px;
}
.btn{
	color: #fff;
	font-weight: bold;
	background-color: #6667ab;
	padding:10px;
	border: 0;
	border-radius: 10px;
	outline:none;
	cursor: pointer;
}
.board_box{
	display: flex;
	justify-content: flex-start;
	align-items: center;
	width: 100%;
	margin-top: 10px;
}
.board_left {
	padding: 15px 0 15px 0;
	width: 20%;
}
.board_right{
	width:100%;
}
.board_s{
	border-radius: 10px;
	padding: 10px;
	border:1px solid #6667ab;
}
.b_text {
	font-size: 11pt;
	font-weight: bold;
}
</style>
<div id="board_text"><h2>문의게시판 글쓰기</h2></div>
        <form method="post">
<div id="readlist">
        <div class="main">
            <div class="side">
            <div class="board_box">
            	<div class="board_left">
            <p class="b_text">문의 구분 <font color="#6667ab">*</font></p>      	
            	</div>
            	<div class="board_right">
            	<select name="division" class="board_s">
            		<option value="상품">상품 문의</option>
            		<option value="배송">배송 문의</option>
            		<option value="주문">주문 문의</option>
            		<option value="AS">AS 문의</option>
            		<option value="기타">기타 문의</option>
            	</select>
            	</div>
            </div>
           <div class="board_box">
            	<div class="board_left">
            <p class="b_text">제목 <font color="#6667ab">*</font></p>      	
            	</div>
            	<div class="board_right">
                    <input class="b_input" type="text" placeholder="제목" autofocus autocomplete="off" name="title">
                    </div>
                </div>
                 <div class="board_box">
            	<div class="board_left">
            <p class="b_text">작성자 <font color="#6667ab">*</font></p>      	
            	</div>
            	<div class="board_right">
                    <input class="b_input" type="text" value="${empty login ? '' : login.userid }" name="writer" id="b_wrtier">
            	</div>
            </div>
            <div class="board_box">
            	<div class="board_left">
            <p class="b_text">이메일 <font color="#6667ab">*</font></p>      	
            	</div>
            	<div class="board_right">
                    <input class="b_input" type="text" autocomplete="off" name="email">
                    </div>
                </div>
             <div class="board_box">
            	<div class="board_left">
            <p class="b_text">내용 <font color="#6667ab">*</font></p>      	
            	</div>
            	<div class="board_right">
            	<textarea name="content" rows="10" class="writeinput textarea" placeholder="글을 작성하세요!"></textarea></p>
            </div>
            </div>
            <div class="board_box">
            	<div class="board_left">
            <p class="b_text">비밀번호 <font color="#6667ab">*</font></p>      	
            	</div>
            	<div class="board_right">
                    <input  class="b_input" type="password" autocomplete="off" name="password">
                    </div>
                </div>
        </div>
        </div>
        <div id="b_submit">
        <input type="submit" value="작성하기" class="btn" >
        </div>
    </div>
        </form>
  
  <script>
  	var jsVar = '${msg}';
  	
  		if(jsVar === '1'){
  			alert('작성이 완료되었습니다');
  			location.href='${cpath}/board';
   		}
  		if(jsVar == '0'){
  			alert('작성이 실패되었습니다');
  		}
  	const userid = document.getElementById('b_wrtier')
  	if(userid.value != ''){
  		userid.setAttribute("readonly","readonly");
  	}
  	
  </script>
<%@ include file="../footer.jsp"%>