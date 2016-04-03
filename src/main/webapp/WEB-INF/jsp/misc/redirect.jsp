<%@ page language="java" contentType="text/html; charset=Shift-JIS" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<c:choose>
    <c:when test="${not empty redirectUrl}">
       <c:redirect url="${redirectUrl}"/>
    </c:when>
    <c:otherwise>
	  <script>
		window.location="/";
		</script>
    </c:otherwise>
</c:choose>
