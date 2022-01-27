<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <style>
        #headerwrp{
            position: relative;
            z-index: 999;
            margin: 0 auto;
            background-color: #fff;
        }
        #headermain{
            display: block;
            max-width: 1270px;
            margin: 0 auto;
            padding: 0 35px;
            width: 100%;
        }
        .h_main{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 4.5px 0;
            width: 100%;
        }
        img{
            padding: 5px;
        }
        #h_search{
            background-color:#6667ab;
            border-radius: 50px;
            border:0;
            padding:10px;
            color: #fff;
            width: 600px;
        }
        .h_search{
            display:flex;
        }
        #h_search::placeholder{
            color:#fff;
        }
    </style>
<title>ByDIN</title>
</head>
<body>
 <div id="headerwrp">
        <div id="headermain">
            <div class="h_main">
                <a href="${cpath }"><img src="${cpath }/resources/img/logo/logo.png" width="166px"></a>
                <div class="h_search">
                    <input id="h_search" type="text" name="search" placeholder="검색어를 입력하세요">
                    <img class="input_img" src="${cpath }/resources/img/icon/검색.jpg" height="40px" width="40px">
                </div>
                <div class="header_right">
                        <img src="${cpath }/resources/img/icon/로그인.png" height="40px" width="40px">
                        <img src="${cpath }/resources/img/icon/장바구니.png" height="40px" width="40px">
                        <img src="${cpath }/resources/img/icon/고객센터.png" height="40px" width="40px">
                </div>
            </div>
        </div>
        <hr>
    </div>
</body>
</html>