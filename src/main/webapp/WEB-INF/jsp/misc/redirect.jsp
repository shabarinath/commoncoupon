<%@ page language="java" contentType="text/html; charset=Shift-JIS" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<c:choose>
    <c:when test="${not empty redirectUrl}">
	<script>
	   window.location="${redirectUrl}";
	 </script>
    </c:when>
    <c:otherwise>
	  <script>
		window.location="/";
		</script>
    </c:otherwise>
</c:choose>
