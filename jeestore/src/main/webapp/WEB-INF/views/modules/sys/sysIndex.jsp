<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>${fns:getConfig('productName')}</title>
	<jsp:include page="/WEB-INF/views/include/inc.jsp"></jsp:include>
	
	<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/main.css">
	<style type="text/css">
		a {
			color: Black;
			text-decoration: none;
		}
		
		a:hover {
			color: black;
			text-decoration: none;
		}
	</style>
	<script type="text/javascript">
		$(function() {
// 			var sessionInfo_loginName = '${sessionInfo.loginName}';
// 			var sessionInfo_ip = '${sessionInfo.ip}';
// 			if (sessionInfo_loginName && sessionInfo_ip) {
// 				//alert(sessionInfo_loginName);
// 			}else{
// 				window.location.href = "login.jsp";
// 			}
		});
	
	</script>
</head>
<body id="indexLayout" class="easyui-layout">
	<div region="north" class="logo" style="height:60px;padding: 1px; overflow: hidden;" href="layouts/north.jsp"></div>
	<!--  <div region="east" title="当前日期" split="true" collapsed="false" style="width:200px;overflow: hidden;" href="layout/east.jsp"></div>
	-->
	<div region="center" title="功能操作区" style="overflow: hidden;" href="layouts/center.jsp"></div>
	<div region="west" title="功能导航" split="false" style="width:190px;overflow: hidden;" href="layouts/west.jsp"></div>
	<div region="south" style="height:20px;overflow: hidden;" href="layouts/south.jsp"></div>
	<jsp:include page="/WEB-INF/views/include/isIe.jsp"></jsp:include>
	<input type="hidden" id="top" name="top"/>
</body>
</html>