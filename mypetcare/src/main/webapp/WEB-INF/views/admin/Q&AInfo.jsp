<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="adminMenu.jsp"%>
<style>
  .admininfo{
    position:absolute; 
    top:10%; 
    left:20%; 
    width:70%;
  }
    </style>



<body>
	
	<div  class = "admininfo">
	<h1> Q&A </h1>
	<table class="table table-sm " >
	 
  <thead>

    <tr>
      <th scope="col">no.</th>
      <th scope="col">title</th>
      <th scope="col">contents</th>
      <th scope="col">writer</th>
      <th scope="col">date</th>
      <th scope="col">reply</th>
  
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Q&A 테스트입니다.</td>     
      <td>Q&A 테스트입니다 테스트 중입니다. 내용이 들어가는 부분입니다.</td>
      <td>관리자 </td>              
      <td>YYYY-MM-DD</td>
      <td>X</td>
    
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Q&A 테스트입니다</td>     
      <td>Q&A 테스트입니다 테스트 중입니다. 내용이 들어가는 부분입니다. 조금더 길게 진행중</td>
      <td>관리자 </td>              
      <td>YYYY-MM-DD</td>
      <td>X</td>
    
    </tr>
  
  </tbody>
</table>
	
	</div>

	</div>
</body>

