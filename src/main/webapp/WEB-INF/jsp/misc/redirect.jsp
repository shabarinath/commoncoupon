<%@ page language="java" contentType="text/html; charset=Shift-JIS" pageEncoding="UTF-8"%>
<%@ include file="../includes/taglibs.jsp"%>
<div id="loadingDiv" style="display:none;">
	<div align="center" style="margin-top:8%;">
		<i class="fa fa-spinner fa-pulse fa-5x fa-spin"></i>
	</div>
	<div class="progress " style="align:center;margin-left:20%;margin-top:2%;center;margin-right:20%;height:10px;">
		<div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="80" style="width: 50%">
			<span class="sr-only">40% Complete (success)</span>
		</div>
	</div>
	<div align="center" style="margin-top:1%;margin-bottom:25.9%;">
	  <span style="font-size:20px;font-family:Verdana;">Please wait while we redirect you to payment gateway for processing ....</span><br>
	  <span style="font-size:20px;font-family:Verdana;">Please do not press stop, Back or Refresh button or Close this window</span>
	</div>
</div>
<c:if test="${fn:contains(redirectUrl, 'www.instamojo.com')}">
	<script>
		$("#loadingDiv").show();
	</script>
</c:if>
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
