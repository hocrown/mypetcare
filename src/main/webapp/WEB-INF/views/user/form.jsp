<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="form.js"></script>
<link rel="apple-touch-icon" href="/docs/5.2/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.2/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.2/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
<link rel="icon" href="/docs/5.2/assets/img/favicons/favicon.ico">

<link rel="canonical" href="https://getbootstrap.kr/docs/5.2/examples/checkout/">
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


<style>

.id_ok{
color:#008000;
display: none;
}

.id_already{
color:#6A82FB; 
display: none;
}

.bg-light{

 padding-left:40%;
	padding-top:10%;
  
  width:70%;
   
    padding-bottom: 40px;
    background-color: #f5f5f5;
        height: 100%;
}

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
<script src="/docs/5.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="form-validation.js"></script>
<script>
	function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('userPostNum').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("userAddress").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("userAddress").value = jibunAddr;
            }
        }
    }).open();
}
</script>
<script>

function checkId(){
        var id = $('#userId').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'./idCheck', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{"userId":id},
            success:function(result){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(result == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                    $('.id_ok').css("display","inline-block"); 
                    $('.id_already').css("display", "none");
                } else { // result가 1일 경우 -> 이미 존재하는 아이디
                    $('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
             
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
        };

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>

	 <body class="bg-light">
    
<div class="container">
  <main>
			  
   <!-- <div class="py-5 text-center">
      <img class="d-block mx-auto mb-4" src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt=""  height="57">
      <h2>SignUp</h2>
    </div>
      </div> -->
    
	<div>
      <h4 class="mb-3">회원가입</h4>
      
     <%--  <form action="<c:url value='/user/insert'/>" method="post" id="joinForm" name="joinForm" class="form-horizontal"> --%>
		
	<div class="row g-3">
		<div class="col-sm-8">	
			<label class="form-label" for="address2">아이디</label> 
			<input type="text" id="userId" name="userId" value="${usermodel['userId']}" oninput = "checkId()" class="form-control" placeholder="사용자 아이디">
			<!-- id ajax 중복체크 -->
			<span class="id_ok">사용 가능한 아이디입니다.</span>
			<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span>
		</div>
	</div>
		
          <%--  <div class="row g-3">
            <div class="col-sm-8">
              <label for="userId" class="form-label">UserId</label>
              <span class="text-muted">(Optional)</span></label>
              <input type="text" name="userId" id="userId"
		value="${usermodel['userId']}" ${empty usermodel.userId ? "" : "readonly"}
		title="사용자 아이디" pattern="\w+" class="form-control"
		placeholder="아이디 입력 " required>
                <div class="invalid-feedback">
                Valid first UserId is required.
              </div>
            </div>
            </div>  --%>
            
     <div class="row g-3">
     	<div class="col-sm-8">
        	<label for="userPw" class="form-label">Password</label>
         	<input type="password" name="userPw" id="userPw"
			value="${usermodel.userPw}" class="form-control" title="<fmt:message
			key='PASSWORD_TITLE'/>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" placeholder="사용자 비밀번호" required>
            <div class="invalid-feedback">
                Valid first Password is required.
            </div>
     	</div>
	 </div>
            
         <div class="row g-3">
            <div class="col-sm-8">
              <label for="password_re" class="form-label">Password Check</label>
              <input type="password" name="password_re" id="password_re"
				class="form-control" title="<fmt:message key='PASSWORD_RE_TITLE'/>"
				pattern="(?=.*\d)(?=.*[a-z])(?=*[A-Z]).{6,}" placeholder="비밀번호 재확인" required>
             </div>
          </div>
           
		<div class="row g-3">
        	<div class="col-sm-8">
              <label for="userName" class="form-label">UserName</label>
              <div class="input-group has-validation">
              <span class="input-group-text">#</span>
              <input type="text" name="userName" id="userName" value="${usermodel.userName}"
			  class="form-control" placeholder="사용자 이름" required>
              </div>
            </div>
		</div>
			
		<div class="row g-3">	
            <div class="col-sm-8">
            	<label for="userNickname" class="form-label">Nickname 
            	<span class="text-muted">(Optional)</span></label>
            	<input type="text" name="userNickname" id="userNickname" value="${usermodel.userName}"
			 	class="form-control" placeholder="닉네임입력" required>
            </div>
       </div>			 
			 
		<div class="row g-3">
        	<div class="col-sm-8">
            	<label for="userPhone" class="form-label">Phone</label>
              	<input type="text" name="userPhone" id="userPhone" value="${usermodel.userPhone}"
				class="form-control" placeholder="사용자 전화번호"  required>
            </div>
        </div>
            
        <div class="form-group">
			<label class="control-label col-sm-2" for="userPostNum">PostNum</label>
			<div class="col-sm-8">
  			<input type="text" id="userPostNum" name="userPostNum" placeholder="우편주소"
  		 	value="${usermodel.userPostNum}" readonly onclick="findAddr()" class="form-control">
	  	
	  		<input id="userAddress" name="userAddress" type="text" placeholder="도로명주소"
	  		value="${usermodel.userAddress}" readonly class="form-control"> <br>
	  		</div>
	  	</div>
						 
        <div class="col-sm-8">
        	<label for="address2" class="form-label">Address Detail <span class="text-muted">(Optional)</span></label>
        	<input type="text" id="userDetailAddress" name="userDetailAddress" placeholder="상세주소"
	  		value="${usermodel.userDetailAddress}" class="form-control">
        </div>

        <div class="col-md-8">
        	<label for="country" class="form-label">의료인여부</label>
            <select class="form-select" id="country" required>
            	<option value="">Choose...</option>
            	<option>의료인</option>
            </select>
        </div>

		<div class="row g-3">
        	<div class="my-8">
          	<label for="country" class="form-label">의료인여부</label>
            <div class="form-check">
              <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
              <label class="form-check-label" for="credit">일반회원</label>
            </div>
            <div class="form-check">
              <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="debit">의료인</label>
            </div>
            <div class="form-check">
              <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
              <label class="form-check-label" for="paypal">간호사</label>
            </div>
          </div>
		</div>	

          <hr class="my-4" width=70%>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">회원가입 동의합니다.</label>
          </div>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info">
            <label class="form-check-label" for="save-info">진짜로 동의합니다.</label>
          </div>

          <hr class="my-4"  width=70%>
			
		
          <input onclick="signupCheck()" class="btn btn-primary" type="submit"  style="margin: 2 0 2 0;" width=70%  value="가입">
          <button class="btn btn-primary" type="button" style="margin: 2 0 2 0;" onClick="location.href='../index'">Home</button>
      </div>

       </form>
    </div>
  </main>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; MyPetCare2023</p>
   
  </footer>
</div>

<script>

function signupCheck() {
  	alert("회원가입되었습니다");
  
  	answer=confirm("펮 정보를 추가하시겠습니까?");
if(answer==true){
  window.location.href = "http://localhost:8080/mypage/mypetWrite";
	
	
}else{
  window.location.href = "http://localhost:8080/index";
	
}

}

</script>
   
  </body>

</html>