<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input{
		display: block
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	// 아이디 입력을 하는 동안에 idDuplicate() 함수를 호출하고 입력된 값을 콘솔에 출력
	 function idDuplicate(){
   const id = document.getElementById('m_id').value;
   console.log(id);
   const checkResult = document.getElementById('id-dup-check');
   $.ajax({
      type: 'post',// 전송방식(get, post, delete, put 등)
      url: 'idDuplicate', //요청주소(컨트롤러로 요청하는 주소)
      data: {'m_id': id}, // 전송할 데이터
      dataType: 'text', //요청 후 리턴받을 때의 데이터 형식
      success: function(result){ //요청이 성공적으로 처리됐을 때 실행할 함수
         console.log('ajax 성공');
         console.log(result);
         if(result=="ok"){
        	 checkResult.style.colo = 'green';
        	 checkResult.innerHTML = '멋진아이디네요!!'
         }else{
        	 checkResult.style.colo = 'red';
        	 checkResult.innerHTML = '이미 사용중인 아이디입니다.'
         }
      },
      error: function(){// 요청이 실패했을 때 실행할 함수
         console.log('오타를 찾으세요');
    	  
         
      }
   });
 }
	
</script>
</head>
<body>
<h2>회원가입 페이지</h2>
	<form action="save" method="post"><br>
	아이디: <input type="text" name="m_id" onkeyup= "idDuplicate()" id="m_id" ><br> 
	<span id="id-dup-check"></span>
	비밀번호: <input type="password" name="m_pw"> <br>
	이름: <input type="text" name="m_name"> <br>
	이메일: <input type="text" name="m_email"> <br>
	전화번호: <input type="text" name="m_phone"> <br>
	<input type="submit" value="회원가입"> 
	
	</form>
</body>
</html>