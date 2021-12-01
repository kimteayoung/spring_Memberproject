<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
function detailAjax(m_number){
    console.log(m_number);
    const view = document.getElementById('detail-view');
    $.ajax({
       type: 'post',
       url: 'detailAjax',
       data: {'m_number':m_number},
       dataType: 'json',
       success: function(result){ // 처리결과를 받는 부분
          console.log(result);
          console.log(result.m_number);    
          console.log(result.m_id);    
          
			let output = "<table class='table'>";
			output += "<tr><th>number</th> <th>id</th> <th>pw</th> <th>name</th>";
			output += "<th>email</th> <th>phone</th> </tr>";
			output += "<tr>";
			output += "<td>"+result.m_number+"</td>";
			output += "<td>"+result.m_id+"</td>";
			output += "<td>"+result.m_pw+"</td>";
			output += "<td>"+result.m_name+"</td>";
			output += "<td>"+result.m_email+"</td>";
			output += "<td>"+result.m_phone+"</td>";
			output += "</tr>";
			output += "</table>";
			
			view.innerHTML = output;
          
       },
       error: function(){
          console.log('오타를 찾으세요');
       }
    });
 }
</script>
</head>
<body>

<h2>fineAll.jsp</h2>

<table class="table table-dark">
<tr>
<th>번호</th>
<th>아이디</th>
<th>비번</th>
<th>이름</th>
<th>이메일</th>
<th>전화번호</th>
<th>상세조회</th>
<th>상세조회(ajax)</th>
<th>삭제</th>
<th>수정</th>
</tr>

<c:forEach items="${memberList}" var="m">
	<tr>
	<td>${m.m_number}</td>
	<td>${m.m_id}</td>
	<td>${m.m_pw}</td>
	<td>${m.m_name}</td>
	<td>${m.m_email}</td>
	<td>${m.m_phone}</td>

	<td><a href="detail?m_number=${m.m_number}">조회</a></td>
	<td><button onclick="detailAjax('${m.m_number}')">조회(ajax)</button>
	<td><a href="delete?m_number=${m.m_number}">삭제</a></td>
	<td><a href="update?m_number=${m.m_number}">수정</a></td>
	</tr>
</c:forEach>
</table>
<div id="detail-view"></div>
</body>
</html>