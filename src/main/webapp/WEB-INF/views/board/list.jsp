<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
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
</style>

<body>
	<div  class = "full">
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
			<div class = "admininfo">
				<div>
					<div>
						<c:forEach var="menu" items="${menuList}">
							<h1>${menu.menuName}</h1>
						</c:forEach>
					</div>
					<div class="class2">
						<form class="d-flex" action="<c:url value='/board/search/${menuId}/1'/>" role="search" method="get">
							<c:if test="${menuId eq 1}">
								<input type="text" name="keyword" class="form-control me-2" placeholder="Search" aria-label="Search">
								<input type="submit" class="btn btn-outline-success" value="Search">
							</c:if>
						</form>							
					</div>
				</div>
				<div style="float : right">
					<c:choose>
								<c:when test="${menuId eq 1 && sessionScope.userId eq 'adminId'}">
									<a href='<c:url value="/board/write/${menuId}"/>'><button type="button" class="btn btn-outline-success" style="width: 80px">작성</button></a>
								</c:when>
								<c:when test="${menuId eq 2 && sessionScope.userId ne 'adminId' && not empty sessionScope.userId}">
									<a href='<c:url value="/board/write/${menuId}"/>'><button type="button" class="btn btn-outline-success" style="width: 80px">작성</button></a>
								</c:when>				
					</c:choose>
				</div>
				<table class="table table-sm " >
					<thead>
					  <tr>
					  	<c:if test="${menuId eq 1}">
						  <td scope="col">no.</td>
						</c:if>
						  <td scope="col">title</td>
						  <td scope="col">writer</td>
						  <td scope="col">date</td>
						  <td scope="col">readcount</td>
					  </tr>
					</thead>
			 		<c:forEach var="board" items="${boardList}">
				  		<tbody>
						    <tr>
						    	<c:if test="${menuId eq 1}">
							    	<td scope="row">${board.boardId}<!-- (${board.menuId}) --></td>
							    </c:if>
							    <td>
								<jk:reply replynum="${board.replyNum}" />
										<c:url var="viewLink" value="/board/${board.boardId}/${page}"/>
										<a href="${viewLink}">${board.boardTitle}</a>
								</td>
								<c:choose>
									<c:when test="${menuId eq 1}">
							    		<td>관리자</td>  
									</c:when>
									<c:otherwise>
										<td>${board.userId}</td> 
									</c:otherwise>
							    </c:choose>	
							    <td><fmt:formatDate value="${board.boardDate}" pattern="YYYY-MM-dd"/></td>
								<td>${board.readCount}</td>
						    </tr>
						 </tbody>
					</c:forEach> 
						
	 	 		</table>
	 	 		<table>
	 	 		<tr>
					<td align="left">
						<jk:paging menuId="${menuId}" userNo="${sessionScope.userNo}" nowPage="${page}" totalPageCount="${totalPageCount}"/>
					</td>
				</tr>
				</table>
			</div>
		</div>
	</div>
<div class="screen3"> 
	<%@ include file="../footer.jsp"%>
</div>	
</body>