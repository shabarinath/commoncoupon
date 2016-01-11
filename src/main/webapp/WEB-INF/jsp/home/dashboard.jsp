<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<div align="center">
	<h2>Select Coupons</h2>
</div>
<c:forEach items="${supportedCoupons}" var="element"> 
	${element} <br/>
</c:forEach>