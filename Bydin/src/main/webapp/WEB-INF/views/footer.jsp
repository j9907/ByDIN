<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	div,dody,a,ul,li{
		margin:0;
		padding:0;
	}
	#footer{
		max-width: 1200px;
		width:100%;
		margin:0 auto;
		padding:40px 12px 80px;
		clear:both;
		border-top:1px solid lightgray;
		background-color: #fff;
	}
	.f_info_top{
		display: flex;
		margin-bottom: 30px;
	}
	#f_left{
		font-weight: bold;
	}
	.f_text_title{
		font-size: 18px;
	}
	.f_text{
		font-size:23pt;
	}
	.f_text_t{
		font-size: 12px;
		color:#cecece;
	}
	.f_ul{
		list-style: none;
		float: left;
		font-size: 10pt;
		margin-bottom: 10px;
	}
	.f_ul > li{
		float: left;
		font-weight: bold;
		margin-right:20px;
	}
	.f_info_bot{
		display: flex;
	}
	.f_info_mid{
		display: flex;
		
	}
	.f_bot p {
		display: inline-block;
		line-height: 1.4em;
	}
</style>
</head>
<body>
<div id="footer">
	<div class="f_info_top">
		<div id="f_left">
			<p class="f_text_title">고객센터</p>
			<p class="f_text">051-111-2222</p>
			<p class="f_text_t">평일 10:00 - 18:00 (점심시간 12:00 - 13:00)</p>
		</div>
	</div>
	<div class="f_info_mid">
		<div id="f_mid">
			<ul class="f_ul">
				<li class="f_li">이용약관</li>
				<li class="f_li">개인정보취급방침</li>
			</ul>
		</div>
	</div>
	<div class="f_info_bot">
		<div class="f_bot">
			<p>@ 2022 Bydin. All Right Reserved.</p>
		</div>
	</div>
</div>
</body>
</html>