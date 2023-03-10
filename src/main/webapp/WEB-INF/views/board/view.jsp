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
     position:absolute; 
  top:15%; 
  left:16%; 
  width:20%;
     
}
.screen1-1{
    width: 200px;
   
}
.screen2{
    width: 800px;
    height:700px;  
     margin-left:500px;
   
} 
.screen2-1{
    width: 700px;
    height:700px;
    float: left;
   
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
		<c:choose>
			<c:when test="${sessionScope.userId eq 'adminId'}">
				<%@ include file="../admin/adminMenu.jsp"%>
			</c:when>
			<c:otherwise>
				<%@ include file="../service/serviceMenu.jsp"%>	
			</c:otherwise>
		</c:choose>
		</div>
		<div class="screen2">
			<div class="colmenu">
				<div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col p-4 d-flex flex-column position-static">
						<div class="mb-1 text-muted">제목: ${board.boardTitle}</div> 
						<div class="mb-1 text-muted">
							<c:choose>
								<c:when test="${board.userId eq 'adminId'}">
						    		<td>작성자: 관리자</td>  
								</c:when>
								<c:otherwise>
									<td>작성자: ${board.userId}</td> 
								</c:otherwise>
							</c:choose>
						</div> 
			        	<div class="mb-1 text-muted">작성일: <fmt:formatDate value="${board.boardDate}" pattern="YYYY-MM-dd HH:mm:ss" /></div>
						<br>
						<p class="card-text mb-auto">${board.boardContent}</p>
						<br>
						<c:if test="${!empty board.fileName}">
							<tr>
								<div class="mb-1 text-muted">첨부파일</div>
								<td>
									<c:set var="len" value="${fn:length(board.fileName)}"/>
									<c:set var="filetype" value="${fn:toUpperCase(fn:substring(board.fileName, len-4, len))}"/>
									<c:if test="${(filetype eq '.JPG') or (filetype eq 'JPEG') or (filetype eq '.PNG') or (filetype eq '.GIF')}"><img src='<c:url value="/file/${board.fileId}"/>' class="img-thumbnail"><br></c:if>
									<a href='<c:url value="/file/${board.fileId}"/>'>${board.fileName}(<fmt:formatNumber>${board.fileSize}</fmt:formatNumber>byte)</a>
								</td>
							</tr>
						</c:if>
					</div>
				</div>
			</div>
			<tr>
				<td colspan=2 align="right">
					<c:choose>
						<c:when test="${menuId eq 1}">
							<a href='<c:url value="/board/menu/1/${sessionScope.userNo}/1"/>'><button type="button" class="btn btn-primary">목록</button></a>
						</c:when>
						<c:when test="${menuId eq 2}">
							<a href='<c:url value="/board/menu/2/${sessionScope.userNo}/1"/>'><button type="button" class="btn btn-primary">목록</button></a>
<%-- 						<a href='<c:url value="/board/write/${menuId}"/>'><button type="button" class="btn btn-primary"><fmt:message key="WRITE_NEW_BOARD"/></button></a> --%>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${menuId eq 1 && sessionScope.userId eq 'adminId'}">
								<a href='<c:url value="/board/update/${menuId}/${board.boardId}"/>'><button type="button" class="btn btn-primary">수정</button></a>
								<a href='<c:url value="/board/delete/${board.boardId}"/>'><button type="button" class="btn btn-primary">삭제</button></a>			
						</c:when>
						<c:when test="${menuId eq 2 && not empty sessionScope.userId}">
							<c:choose>
								<c:when test="${sessionScope.userId eq 'adminId'}">
									<a href='<c:url value="/board/reply/${board.boardId}"/>'><button type="button" class="btn btn-primary">답글</button></a>
								</c:when>
								<c:when test="${sessionScope.userId eq board.userId}">
									<a href='<c:url value="/board/update/${menuId}/${board.boardId}"/>'><button type="button" class="btn btn-primary">수정</button></a>
									<a href='<c:url value="/board/delete/${board.boardId}"/>'><button type="button" class="btn btn-primary">삭제</button></a>			
								</c:when>
							</c:choose>
						</c:when>
					</c:choose>
				</td>
			</tr>
		</div>
	</div>
<div class="screen3"> 
	<%@ include file="../footer.jsp"%>
</div>
</body>