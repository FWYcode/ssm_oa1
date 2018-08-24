<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统</title>
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="top">
		<div class="global-width">
			<img src="${pageContext.request.contextPath}/Images/logo.gif"
				class="logo" />
		</div>
	</div>
	<div class="status">
		<div class="global-width">

			${session.name}你好！欢迎访问办公管理系统！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="#" onclick="Exit()">注销</a>
		</div>
	</div>
	<form id="myForm" name="myForm" action="userInfo!editData.action"
		method="post">
		<div class="main">
			<div class="global-width">
				<div class="nav" id="nav">
					<div class="t"></div>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息管理
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/self/selfpage" target="_self">个人信息</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							邮件管理</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/mail/toma" target="_self">写邮件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/mail/acptmail" target="_self">收邮件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/mail/torubbish" target="_self">垃圾邮件</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							考勤管理</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/leave/toleavelis" target="_self">休假</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							权限管理</dt>

						<c:if test="${session.power==0}">
							<dd>
								<a
									href="${pageContext.request.contextPath}/accountmanager/singmessa"
									target="_self">个人账户</a>
							</dd>
							<dd>
								<a
									href="${pageContext.request.contextPath}/accountmanager/messa?id=${session.id}&power=${session.power}"
									target="_self">管理账户</a>
							</dd>
						</c:if>
						<c:if test="${session.power==1}">
							<dd>
								<a
									href="${pageContext.request.contextPath}/accountmanager/singmessa"
									target="_self">个人账户</a>
							</dd>
						</c:if>
					</dl>
				</div>
				<div class="action">
					<div class="t">个人账户</div>
					<div class="pages" align="center" id="3">
						<label>用&ensp;&ensp;户:</label><input type="text" name="username"
							value="${session.name}" readonly="readonly" id="1" /><b><font
							color="red" id="font1"></font></b><br> <label>密&ensp;&ensp;码:</label><input
							type="password" name="password" readonly="readonly"
							value="${session.pass}" id="2"><b><font color="red"
							id="font2"></font></b><br /> <b><font color="red"></font></b> <br />
						<input type="button" id="save" value="编辑数据" />
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(function() {

		var un = $("#1");
		var p = $("#2");
		var s = $("#save");
		var f1 = $("#font1");
		var f2 = $("#font2");
		$("#save")
				.click(
						function() {
							$("#3")
									.append(
											'<input type="button" id="s" value="保存数据" />');
							$("#3")
									.append(
											'<input type="button" id="t" value="返回" />');
							un.removeAttr("readonly");
							p.removeAttr("readonly");
							s.remove();
							f1.html("*");
							f2.html("*");
							$("#s")
									.click(
											function() {
												var unv = un.val();
												var pv = p.val();
												if (unv == null || unv == "") {
													f1.html("用户名不能为空");
												} else if (pv == null
														|| pv == "") {
													f1.html("*");
													f2.html("密码不能为空");
												} else {
													location.href = "${pageContext.request.contextPath}/accountmanager/mod?id=${session.id}&name="
															+ unv
															+ "&pass="
															+ pv;
												}
											});
							$("#t")
									.click(
											function() {
												location.href = "${pageContext.request.contextPath}/accountmanager/singmessa";
											});
						});
	});
</script>
<script type="text/javascript">
	function Exit() {
		if (confirm("确认退出登陆吗！！")) {
			location.href = "${pageContext.request.contextPath}/accountmanager/tolog"
		}
	}
</script>
</html>