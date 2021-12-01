<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
 /* 비밀번호 입력창에서 비밀번호를 입력받고 DB에서 가져온 비밀번호와 비교해서 일치하면 update처리
 일치하지 않으면 비밀번호가 일치하지 않습니다. alert 출력*/
 	function update(){
	 console.log('update 함수호출')
	 const pw = document.getElementById('m_pw').value;
	 console.log(pw);
	 const pwDB = '${member.m_pw}';
	 console.log(pwDB);
	 if(pw==pwDB){
		 update_form.submit();
	 }else{
		 alert('비밀번호가 틀립니다.')
	 }
	 
 }
 
</script>
</head>
<body>
<h2>update.jsp</h2>
<form action="update" method="post" name="update_form">
        
        <input type="hidden" name="m_number"value="${member.m_number}" ><br>
        아이디: <input type="text" name="m_id"value="${member.m_id}"readonly><br>
        비밀번호: <input type="password" name="m_pw" id="m_pw"><br>
        이름 :<input type="text" name="m_name"value="${member.m_name}"readonly><br>
        이메일: <input type="text" name="m_email"value="${member.m_email}"><br>
        전화번호: <input type="text" name="m_phone"value="${member.m_phone}"><br>
        <input type="button" value="수정" onclick="update()">
        
    </form>

</body>
</html>