<%@ page contentType="text/html; charset=UTF-8"
    trimDirectiveWhitespaces="true" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	response.setStatus(200);
%>
<!DOCTYPE html>
<html>
	<jsp:include page="/WEB-INF/views/include/staticFiles.jsp"/>
	<body>
		<jsp:include page="/WEB-INF/views/include/bodyHeader.jsp"/>
		<div class="container">
			<div class="content">
				<div class="jumbotron">
					<h2 style="color:red;">${exception.message}</h2>
					<p>
					 </p>
					 <p><a class="btn btn-primary btn-lg" href='<c:url value="/"/>'role="button"><fmt:message key="HOME"/></a></p>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</body>
</html>