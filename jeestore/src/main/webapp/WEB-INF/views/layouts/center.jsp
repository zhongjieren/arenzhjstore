<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="utf-8">
	var centerTabs;
	var tabsMenu;
	$(function() {
		tabsMenu = $('#tabsMenu').menu({
			onClick : function(item) {
				var curTabTitle = $(this).data('tabTitle');
				var type = $(item.target).attr('type');

				if (type === 'refresh') {
					refreshTab(curTabTitle);
					return;
				}

				if (type === 'close') {
					var t = centerTabs.tabs('getTab', curTabTitle);
					if (t.panel('options').closable) {
						centerTabs.tabs('close', curTabTitle);
					}
					return;
				}

				var allTabs = centerTabs.tabs('tabs');
				var closeTabsTitle = [];

				$.each(allTabs, function() {
					var opt = $(this).panel('options');
					if (opt.closable && opt.title != curTabTitle && type === 'closeOther') {
						closeTabsTitle.push(opt.title);
					} else if (opt.closable && type === 'closeAll') {
						closeTabsTitle.push(opt.title);
					}
				});

				for ( var i = 0; i < closeTabsTitle.length; i++) {
					centerTabs.tabs('close', closeTabsTitle[i]);
				}
			}
		});

		centerTabs = $('#centerTabs').tabs({
			fit : true,
			border : false,
			onContextMenu : function(e, title) {
				e.preventDefault();
				tabsMenu.menu('show', {
					left : e.pageX,
					top : e.pageY
				}).data('tabTitle', title);
			}
		});
	});
	
	function refreshTab(title) {
		var tab = centerTabs.tabs('getTab', title);
		centerTabs.tabs('update', {
			tab : tab,
			options : tab.panel('options')
		});
	}
	function addTab(node) {
		if (centerTabs.tabs('exists', node.text)) {
			//refreshTab(node.text); //增加左侧菜单点击刷新功能 libc 2012-9-24
			centerTabs.tabs('select', node.text);
			
		} else {
			if (node.attributes.url && node.attributes.url.length > 0) {
				//if (node.attributes.url.indexOf('!druid.action') == -1) {/*数据源监控页面不需要开启等待提示*/
					$.messager.progress({
						text : '正在加载...',
						interval : 100
					});
					window.setTimeout(function() {
						try {
							$.messager.progress('close');
						} catch (e) {
						}
					}, 0);
				//	}
				centerTabs.tabs('add', {
					title : node.text,
					closable : true,
					iconCls : node.iconCls,
					content : '<iframe src="' + node.attributes.url + '" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>',
					tools : [ {
						iconCls : 'icon-mini-refresh',
						handler : function() {
							refreshTab(node.text);
						}
					} ]
				});
			} else {
				centerTabs.tabs('add', {
					title : node.text,
					closable : true,
					iconCls : node.iconCls,
					content : '<iframe src="error/err.jsp" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>',
					tools : [ {
						iconCls : 'icon-mini-refresh',
						handler : function() {
							refreshTab(node.text);
						}
					} ]
				});
			}
		}
	}
	
	
	//--功能描述：左侧菜单添加tab（手风琴样式）
	function addTabs(text,url,ciconCls) {
		if (centerTabs.tabs('exists', text)) {
			//refreshTab(text); //增加左侧菜单点击刷新功能 libc 2012-9-24
			centerTabs.tabs('select', text);
		} else {
			if (url && url.length > 0) {
				//if (node.attributes.url.indexOf('!druid.action') == -1) {/*数据源监控页面不需要开启等待提示*/
					$.messager.progress({
						text : '正在加载...',
						interval : 100
					});
					window.setTimeout(function() {
						try {
							$.messager.progress('close');
						} catch (e) {
						}
					}, 0);
				//	}
				centerTabs.tabs('add', {
					title : text,
					closable : true,
					iconCls : ciconCls,
					content : '<iframe src="' + url + '" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>',
					tools : [ {
						iconCls : 'icon-mini-refresh',
						handler : function() {
							refreshTab(text);
						}
					} ]
				});
			} else {
				centerTabs.tabs('add', {
					title : text,
					closable : true,
					iconCls : iconCls,
					content : '<iframe src="error/err.jsp" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>',
					tools : [ {
						iconCls : 'icon-mini-refresh',
						handler : function() {
							refreshTab(text);
						}
					} ]
				});
			}
		}
	}
</script>
<div id="centerTabs">
  <!-- <div title="公告版" border="false" href="layout/portal.jsp" style="overflow: hidden;"></div> --> 
</div>
<div id="tabsMenu" style="width: 120px;display:none;">
	<div type="refresh">刷新</div>
	<div class="menu-sep"></div>
	<div type="close">关闭</div>
	<div type="closeOther">关闭其他</div>
	<div type="closeAll">关闭所有</div>
</div>