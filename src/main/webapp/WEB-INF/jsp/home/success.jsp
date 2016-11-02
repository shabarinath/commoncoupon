<%@ page language="java" contentType="text/html; charset=Shift-JIS" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<c:choose>
	<c:when test="${empty msg}">
		Successsssssss !!
	</c:when>
	<c:otherwise>
		<div align="center" style="margin-top:50%;">
			<h4 style="color: #42f471;">${msg}</h4>
		</div>
	</c:otherwise>
</c:choose>
