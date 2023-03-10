<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<div class="b-example-divider b-example-vr"></div>

  <div class="flex-shrink-0 p-3 bg-white" style="width: 200px;">
	  <a  class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
		  <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
		  <span class="fs-5 fw-semibold">마이페이지</span>
	  </a>
	  
<c:choose>
<c:when test="${sessionScope.auth eq 1}">
<!-- 유저권한번호로 검증해야함 	   -->
	<ul class="list-unstyled ps-0">    
	 
     
     
     
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#myact-collapse" aria-expanded="false">
          나의 활동
        </button>
        <div class="collapse" id="myact-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          	<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded" onClick="location.href='/mypage/myconsultDoc'">상담 내역</a></li>
            	
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#log-collapse" aria-expanded="false">
         나의 정보
        </button>
        <div class="collapse" id="log-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded" onClick="location.href='/mypage/myInfo/${sessionScope.userNo}'">의료인정보</a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded" onClick="location.href='/mypage/myhospital'">소속병원정보</a></li>                   
          </ul>
        </div>
      </li>  
  	</ul>  
	</c:when>
	<c:otherwise>
	
  <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#mypet-collapse" aria-expanded="false">
          마이펫 정보
        </button>
        <div class="collapse" id="mypet-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded" onClick="location.href='/mypage/mypet/${sessionScope.userNo}'">반려동물정보</a></li>           
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#myact-collapse" aria-expanded="false">
          나의 활동
        </button>
        <div class="collapse" id="myact-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
          	<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded" onClick="location.href='/mypage/myconsult'">상담 내역</a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded" onClick="location.href='/mypage/myfollowH'">팔로우병원</a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded" onClick="location.href='/mypage/myscrap'">스크랩 상담내역</a></li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#log-collapse" aria-expanded="false">
         나의 정보
        </button>
        <div class="collapse" id="log-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded" onClick="location.href='/mypage/myInfo/${sessionScope.userNo}'">회원정보</a></li>           
          </ul>
        </div>
      </li>  
  	</ul>
  	</c:otherwise>
  	</c:choose>
           
  
</div>
