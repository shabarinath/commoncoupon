<%@ page language="java" contentType="text/html; charset=Shift-JIS" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
testtttttttttttttt--------- ${redirectUrl}
<c:choose>
    <c:when test="${not empty redirectUrl}">
       <c:redirect url="${redirectUrl}"/>
    </c:when>
    <c:otherwise>
       <c:redirect url="/home/transactionFailed"/>
    </c:otherwise>
</c:choose>