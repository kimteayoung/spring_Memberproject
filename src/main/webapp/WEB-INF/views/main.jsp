<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function logout(){
		location.href="logout";
	}
</script>
</head>
<body>
<h2>main.jsp</h2>
세션에 저장한 데이터 출력: ${sessionScope.loginId}
<!-- 로그아웃 버튼을 클릭하면 logout 이라는 주소 요청 -->
<button onclick="logout()">로그아웃</button><br>

<!--  아래링크를 클릭하면 전체회원목록을 조회하여 findAll.jsp에 출력 -->
<!-- 아이디가 admin인 사람이 로그인 했을때 보이도록 -->
<c:if test="${sessionScope.loginId eq 'admin'}">
<a href="findAll">회원목록(관리자만 보여요)</a>
</c:if>


<a href="findAll">회원목록</a>

</body>
</html>