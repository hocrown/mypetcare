<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
  .admininfo{
    position:absolute; 
    top:10%; 
    left:20%; 
    width:70%;
  }

.full{
    width: 1200px;
   
}
.screen1{
    width: 400px;
    float: left;
}
.screen2{
    width: 800px;
    height:700px;
    float: left;
} 
.screen2-1{
    width: 800px;
    height:400px;
    float: right;
} 
.screen3{
    width: 100%;
    height:100px;
    float: left;
}  
.btn-admin {

display: inline-block;
  font-weight: 400;
  color: #212529;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  background-color: transparent;
  border: 1px solid transparent;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  line-height: 1.5;
  border-radius: 0.25rem;
  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
  color: #007bff;
  border-color: #007bff;
}

.form-labell {
  padding-top: calc(0.375rem + 1px);
  padding-bottom: calc(0.375rem + 1px);
  margin-bottom: 0;
  font-size: inherit;
  line-height: 1.5;
  font-weight:bold;
}
  </style>


<body>
	<div class="full">
		<div class="screen1">
			<%@ include file="mypageMenu.jsp"%>	
		</div>
		<div class="screen2"> 
			<div><h1>팔로우한 병원</h1></div>
			<table class="table table-sm " >
			  <tbody>
			    <tr>
			     <td>병원명</td>    
			     <td>멍멍병언</td>    
			    </tr>
			    <tr>
			     <td>주소</td>    
			     <td>{서울시특별시 서초구 반포2동 00건물 2층 000호}</td>    
			    </tr>
			    <tr>
			     <td>번호</td>    
			     <td>{02-1234-1234}</td>    
			    </tr>
			    <tr>
			     <td>팔로우여부</td>    
			     <td>{♥}</td>    
			    </tr>
			    
			  
			  </tbody>
			</table>
			<div class="screen2-1"> 
					<div> 
					 <button type="button" class="btn-admin" >팔로우취소</button>
						<button type="button" class="btn-admin" onClick="location.href='/mypage/myfollowH'">팔로우병원목록</button>
				      	
				       
			        </div>
				</div>
		</div>
	</div>
	<div class="screen3"> 
	    <%@ include file="footer.jsp"%>
	    </div>
</body>


