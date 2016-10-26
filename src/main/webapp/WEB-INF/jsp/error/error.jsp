<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<div style="min-height:269px;">
	<div align="center" class="alert alert-danger" style="margin-top:20%;width:60%;margin-left:22%;font-size:25px;">	
	  <strong>Sorry !!!</strong> 
	  <div style="margin-bttom:10px;">
			<c:choose>
				<c:when test="${empty error}">
					Something Went wrong !!!
				</c:when>
				<c:otherwise>
					${error}
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>