<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<div class="b-example-divider b-example-vr"></div>

  <div class="flex-shrink-0 p-3 bg-white" style="width: 200px;">
    <a  class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold">고객센터</span>
    </a>
    <ul class="list-unstyled ps-0">
      
   

     
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#customer-collapse" aria-expanded="false">
          고객센터
        </button>
        <div class="collapse" id="customer-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">

           		<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded" onClick="location.href='/board/menu/1/${sessionScope.userNo}/1'">공지사항</a></li>
            	
            <c:if test="${not empty sessionScope.userId}">	
            	<li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded" onClick="location.href='/board/menu/2/${sessionScope.userNo}/1'">Q&A</a></li>
			</c:if>
          </ul>
        </div>
      </li>
    </ul>
    </div>