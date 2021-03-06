<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
   <style>
      h3 {
         width: 1100px;
         padding: 20px;
         padding-left: 40px;
         margin: 0 auto;
      }
      #add {
         width: 1100px;
         margin: 0 auto;
         text-align: center;
      }
        #addList{
            display: flex;
            justify-content: flex-start;
            align-items: center;
            width: 100%;
            border-top:1px solid lightgray;
            margin-top:10px;
        }
        .add_left{
            padding:15px 0;
            width:215px;
            font-weight: bold;
        }
        .add_right{
            padding: 15px 0 15px 0;
            width: 870px;
        }
        .ctg{
           display: flex;
           padding-top: 20px;
           padding-right: 30px;
           width: 100px;
        }
        .ctg_right{
           display: flex;
        }
        #slt{
           height: 25px;
        }
        .add_right input {
/*             height: 40px; */
         	padding: 10px;
            width: 98%;
            border-radius: 5px;
            border: 1px solid lightgray;
        }
        .addSubmit {
           padding: 15px;
         background-color: #6667ab;
         border: 0;
         border-radius: 50px;
         color: #fff;
         margin: 20px 0 20px 0;
         cursor: pointer;
         width: 300px;
         font-weight: bold;
        }
        .info{
           height: 550px;
        }
        .infoImg{
           height: 50px;
           padding-top: 40px;
        }
        #pre{
        	margin: 10px;
        }
        #pre > p{
        	float: left;
        }
        .infoTxt > input{
           height: 500px;
        }
    </style>

<h3>상품 등록</h3>
<div id="add">
<form method="POST" enctype="multipart/form-data">

    <div id="addList">
        <div class="add_left"><p>제품이름</p></div>
        <div class="add_right"><input name="name" type="text" autofocus required value="${item.name }"></div>
    </div>
        
    <div id="addList">
        <div class="add_left"><p>가격</p></div>
        <div class="add_right"><input name="price" required value="${item.price }"></div>
    </div>
        
    <div id="addList">
        <div class="add_left"><p>제품이미지</p></div>
        <div>
        	<input type="hidden" name="image" value="${item.image }">
			<div class="add_right" id="pre"><p>기존 이미지: ${item.image }</p></div>
	        <div class="add_right"><input name="file" type="file" accept="image/*"></div>
        </div>
    </div>
        
    <div id="addList">
        <div class="add_left"><p>카테고리</p></div>
        <div class="add_right ctg_right">
        <div class="ctg" id="ctg_1st">
        <select name="ctgcode1" id="ctgCode1" class="slt">
           <option value="">===대분류===</option>
           <option value="1-01" ${item.ctgcode1 == '1-01' ? 'selected="selected"' : '' }>서재</option>
           <option value="1-02" ${item.ctgcode1 == '1-02' ? 'selected="selected"' : '' }>침실</option>
           <option value="1-03" ${item.ctgcode1 == '1-03' ? 'selected="selected"' : '' }>거실</option>
           <option value="1-04" ${item.ctgcode1 == '1-04' ? 'selected="selected"' : '' }>주방</option>
           <option value="1-05" ${item.ctgcode1 == '1-05' ? 'selected="selected"' : '' }>의자</option>
        </select>
        </div>
        
      <div class="ctg" id="ctg_2nd" class="slt">
      <select name="ctgcode2" id="ctgCode2">
         <option>===소분류===</option>
         <c:forEach var="ctg" items="${ctg }">
         	<option value="${ctg.ctgCode2 }" ${item.ctgcode2 == ctg.ctgCode2 ? 'selected="selected"' : '' }>${ctg.ctgRef }</option>
         </c:forEach>
      </select></div>
      </div>

    </div>
        
    <div id="addList">
        <div class="add_left"><p>재고</p></div>
        <div class="add_right"><input name="stock" required value="${item.stock }"></div>
    </div>
    
    <div id="addList">
       <div class="add_left"><p>업로드 날짜</p></div>
       <div class="add_right"><input name="uploadDate" type="date" id="now_date"></div>
    </div>
        
    <div id="addList">
        <div class="add_left"><p>상세설명</p></div>
        <div class="info add_right">
        	<div id="pre"><p>기존 이미지: ${item.infoImg }</p></div>
        	<input type="hidden" name="infoImg" value="${item.infoImg }">
           <div class="infoImg"><input name="file" type="file" accept="image/*"></div>
           <div class="infoTxt"><input name="info" type="text" maxlength="2000" required value="${item.info }"></div>
        </div>
    </div>
    <input type="submit" value="등록" class="addSubmit">
</form>
</div>

<script>
   document.getElementById('now_date').valueAsDate = new Date();
   
   const ctgs = document.querySelector('select#ctgCode1')
   const ctgs2 = document.querySelector('select#ctgCode2')
   
   ctgs.addEventListener('change', selectCtg2)
   
//    window.onload = selectCtg2(ctgs);
   
   
   async function selectCtg2(event){
      
      console.log(event.target.value)
      
      const url = '${cpath}/ctg?ctg1=' + event.target.value
//       const opt = { method: 'GET'}
      const resp = await fetch(url)
      const json = await resp.json()
      
      let dom2 = ''
         
      json.forEach(ctg => {
            dom2 += '<option value='+ctg.ctgCode2+'>'+ctg.ctgRef+'</option>'
      })
      
      ctgs2.innerHTML = dom2;

   }
</script>

<%@ include file="../footer.jsp"%>