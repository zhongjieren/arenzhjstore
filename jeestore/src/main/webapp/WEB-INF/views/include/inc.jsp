
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>

<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="${ctxStatic}/jslib/jquery-easyui-1.3/jquery-1.8.0.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/jslib/jquery.cookie.js" charset="utf-8"></script>
<%
	String easyuiThemeName = "default";
	Cookie cookies[] = request.getCookies();
	if (cookies != null && cookies.length > 0) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("easyuiThemeName")) {
				easyuiThemeName = cookie.getValue();
				break;
			}
		}
	}
%>
<link id="easyuiTheme" rel="stylesheet" href="${ctxStatic}/jslib/jquery-easyui-1.3/themes/<%=easyuiThemeName%>/easyui.css" type="text/css"></link>
<link rel="stylesheet" href="${ctxStatic}/jslib/jquery-easyui-1.3/themes/icon.css" type="text/css"></link>
<script type="text/javascript" src="${ctxStatic}/jslib/jquery-easyui-1.3/jquery.easyui.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/jslib/jquery-easyui-1.3/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>

<link rel="stylesheet" href="${ctxStatic}/jslib/jquery-easyui-portal/portal.css" type="text/css"></link>
<script type="text/javascript" src="${ctxStatic}/jslib/jquery-easyui-portal/jquery.portal.js" charset="utf-8"></script>

<link rel="stylesheet" href="${ctxStatic}/css/syCss.css?v=20120804" type="text/css"></link>
<script type="text/javascript" src="${ctxStatic}/jslib/syUtil.js?v=20120805" charset="utf-8"></script>

<script type="text/javascript" src="${ctxStatic}/jslib/xheditor-1.1.14/xheditor-1.1.14-zh-cn.min.js" charset="utf-8"></script>

<script type="text/javascript" src="${ctxStatic}/main/include/js/common.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/main/include/js/validatebox-myrule.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/main/include/js/validatebox-duplicate.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctxStatic}/js/py.js" charset="utf-8"></script>

