<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/css/modal.css"/>" rel='stylesheet' />
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


<script src="https://code.jquery.com/jquery-latest.js"></script> 

<c:set var="path" value="${pageContext.request.contextPath}" />



<style>
.screen1{
position:absolute;
margin-left:50px;
top:2%; 
width:400px;
}
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // ???????????? ???????????? ????????? ??????????????? ????????? ????????? ???????????? ??????.
            // ????????? ????????? ?????? ????????? ?????? ????????? ????????????.
            // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
            var roadAddr = data.roadAddress; // ????????? ?????? ??????
            var jibunAddr = data.jibunAddress; // ?????? ?????? ??????
            // ??????????????? ?????? ????????? ?????? ????????? ?????????.
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
        var id = $('#userId').val(); //id?????? "id"??? ???????????? ?????? ??????
        $.ajax({
            url:'./idCheck', //Controller?????? ?????? ?????? ??????
            type:'post', //POST ???????????? ??????
            data:{"userId":id},
            success:function(result){ //?????????????????? ????????? cnt?????? ????????? 
                if(result == 0){ //cnt??? 1??? ?????????(=0??? ??????) -> ?????? ????????? ????????? 
                    $('.id_ok').css("display","inline-block"); 
                    $('.id_already').css("display", "none");
                } else { // result??? 1??? ?????? -> ?????? ???????????? ?????????
                    $('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
             
                }
            },
            error:function(){
                alert("???????????????");
            }
        });
        };

</script>


</head>

<body class="bg-light">
    
<div class="container">
  <main>
			  
    
	<div>
      <h4 class="mb-3">????????????</h4>
      
     <form action="<c:url value='/user/insert'/>" method="post" id="joinForm" name="joinForm" class="form-horizontal"> 
		
	<div class="row g-3">
		<div class="col-sm-8">	
			<label class="form-label" for="address2">?????????</label> 
			<input type="text" id="userId" name="userId" value="${usermodel['userId']}" oninput = "checkId()" class="form-control" placeholder="????????? ?????????">
			<!-- id ajax ???????????? -->
			<span class="id_ok">?????? ????????? ??????????????????.</span>
			<span class="id_already">????????? ??? ???????????? ???????????? ?????????.</span>
		</div>
	</div>
		
     <div class="row g-3">
     	<div class="col-sm-8">
        	<label for="userPw" class="form-label">Password</label>
         	<input type="password" name="userPw" id="userPw"
			value="${usermodel.userPw}" class="form-control" title="<fmt:message
			key='PASSWORD_TITLE'/>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" placeholder="????????? ????????????" required>
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
				pattern="(?=.*\d)(?=.*[a-z])(?=*[A-Z]).{6,}" placeholder="???????????? ?????????" required>
             </div>
          </div>
           
		<div class="row g-3">
        	<div class="col-sm-8">
              <label for="userName" class="form-label">UserName</label>
              <div class="input-group has-validation">
              <input type="text" name="userName" id="userName" value="${usermodel.userName}"
			  class="form-control" placeholder="????????? ??????" required>
              </div>
            </div>
		</div>
			
		<div class="row g-3">	
            <div class="col-sm-8">
            	<label for="userNickname" class="form-label">Nickname 
            	<span class="text-muted">(Optional)</span></label>
            	<input type="text" name="userNickname" id="userNickname" value="${usermodel.userNickname}"
			 	class="form-control" placeholder="???????????????" required>
            </div>
       </div>			 
			 
		<div class="row g-3">
        	<div class="col-sm-8">
            	<label for="userPhone" class="form-label">Phone</label>
              	<input type="text" name="userPhone" id="userPhone" value="${usermodel.userPhone}"
				class="form-control" placeholder="????????? ????????????"  required>
            </div>
        </div>
            
        <div class="form-group">
			<label class="control-label col-sm-2" for="userPostNum">PostNum</label>
			<div class="col-sm-8">
  			<input type="text" id="userPostNum" name="userPostNum" placeholder="????????????"
  		 	value="${usermodel.userPostNum}" readonly onclick="findAddr()" class="form-control">
	  	
	  		<input id="userAddress" name="userAddress" type="text" placeholder="???????????????"
	  		value="${usermodel.userAddress}" readonly class="form-control"> <br>
	  		</div>
	  	</div>
						 
        <div class="col-sm-8">
        	<label for="address2" class="form-label">Address Detail <span class="text-muted">(Optional)</span></label>
        	<input type="text" id="userDetailAddress" name="userDetailAddress" placeholder="????????????"
	  		value="${usermodel.userDetailAddress}" class="form-control">
        </div>

        <div class="col-md-8">
        	<label for="country" class="form-label">???????????????</label>
            <select class="form-select" id="country" required>
            	<option value="">Choose...</option>
            	<option>?????????</option>
            	<option>?????????</option>
            </select>
        </div>

          <hr class="my-4" width=70%>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="same-address">
            <label class="form-check-label" for="same-address">??????????????? ???????????????.</label>
          </div>

          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="save-info">
            <label class="form-check-label" for="save-info">???????????? ??????????????? ???????????????.</label>
          </div>

          <hr class="my-4"  width=70%>
			
		
			<!-- onclick="signupCheck()" --> 
			<input class="btn btn-primary" type="submit"  style="margin: 2 0 2 0;" width=70%  value="??????" onclick="signupCheck()">
			<button class="btn btn-primary" type="button" style="margin: 2 0 2 0;" onClick="location.href='../index'">Home</button>
			<button class="btn btn-primary" type="button" style="margin: 2 0 2 0;" id="add-btn">????????? ????????????</button>
	      
	      	<div class="form-check">
	      		<input type="text" class="form-check-input" id="hospitalId" name="hospitalId" value="">
	      	</div>
		</form>
	</div>


			<!-- The Modal -->
			<div class="modal" id="modal" role="document">
			  <div class="modal_body">
			    <div class="m_head">
			      <div class="modal_title">?????? ??????</div>
			      <div class="close_btn" id="close_btn">X</div>
			    </div>
			    <div class="m_body" style="overflow:auto;">
				    <div class="col-sm-8">
						<table id="resTb" class="table table-striped table-bordered text-center">
							    <colgroup>
							        <col width="5%" />
							        <col width="30%" />
							        <col width="15%"/>
							        <col width="25%"/>
							        <col width="20%"/>
							        <col width="5%"/>
							    </colgroup>
							<thead>
							    <tr>
							    	<th></th>
							        <th scope="col">Address</th>
							        <th scope="col">Time</th>
							        <th scope="col">Name</th>
							        <th scope="col">Phone</th>
							        <th scope="col">Num</th>
							    </tr>
							</thead>
							<tbody>
							    <c:forEach var="hospital" items="${hospitalList}" varStatus="status">
							        <tr id="tr_${hospital.hospitalId}">
							        	<input type="hidden" name="rf_idx" value="${hospital.hospitalId}">
							        	<input type="hidden" name="r_hospitalId" value="${hospital.hospitalId}">
							            <input type="hidden" name="r_hospitalName" value="${hospital.hospitalName}">
							          
							          
							            <td><input type="checkbox" name="hospitalId" value="${hospital.hospitalId}" /></td>
							            <td class="hospitalAddress"><c:out value="${hospital.hospitalAddress}"/></td>
							            <td class="hospitalTime"><c:out value="${hospital.hospitalTime}"/></td>
							            <td class="hospitalName"><c:out value="${hospital.hospitalName}"/></td>
							            <td class="hospitalPhone"><c:out value="${hospital.hospitalPhone}"/></td>
							            <td class="hospitalId"><c:out value="${hospital.hospitalId}"/></td>
							        </tr>
							    </c:forEach>
							    <c:if test="${fn:length(hospitalList) == 0}">
							        <tr>
							            <td colspan="5"><spring:message code="list.noResult" text="??????????????? ????????????." /></td>
							        </tr>
							    </c:if>
							    </tbody>
							</table>
							</div>
							<div class="d-flex justify-content-between">>
							</div>
							<a href="#" id="modal_close" onclick="selectItem();" class="btn btn-dark btn-lg">?????? ??????</a>
							</div>
							</div>
							</div>
			<!--End Modal-->


  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">&copy; MyPetCare2023</p>
   
  </footer>

<script>

function signupCheck() {
  	alert("???????????????????????????");
  
//   	answer=confirm("??? ????????? ?????????????????????????");
// 		if(answer==true){
// 		  window.location.href = "http://localhost:8080/mypage/mypetWrite";
// 		}else{
// 		  window.location.href = "http://localhost:8080/index";
// 		}
}


//click on ?????? ?????? ?????? ??????
$(document).on('click', '#add-btn', function (e) {
  console.log("click event");
  $('#modal').addClass('show');
});

// ?????? ??????
$(document).on('click', '#close_btn', function (e) {
  console.log("click event");
  $('#modal').removeClass('show');
});

$(document).on('click', '#modal_close', function (e) {
	  console.log("click event");
	  $('#modal').removeClass('show');
});

var path = "${pageContext.request.contextPath }";

function selectItem(){
	 
	console.log(hospitalId);
	window.close();
}

$("#resTb tr").click(function(){
	var td1 ="";
	var td2 ="";
	$(this).find("td").each(function(i,item){
		if(i==1){
			td1=$(item).text();
		}
		else if(i==5){
			td2=$(item).text();
		}
	});
	console.log("td1:"+ td1 + ",td2: "+ td2);
	document.getElementById("hospitalId").value=td2;
});

</script>
   
  </body>

</html>