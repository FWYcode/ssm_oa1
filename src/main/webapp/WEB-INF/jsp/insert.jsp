<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>办公自动化管理系统</title>
<style type="text/css">
</style>
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
					<div class="t">添加用户</div>
					<div class="pages" align="center" id="insert">
						<table>
							<tr>
								<td><label>用户名 </label></td>
								<td><input type="text" name="name" id="n1" /></td>
								<td><b><font color="red" id="f1">*</font></b></td>
							</tr>
							<tr>
								<td><label>密&nbsp;码 </label></td>
								<td><input type="password" name="pass" id="p2" /></td>
								<td><b><font color="red" id="f2">*</font></b></td>
							</tr>
							<tr>
								<td><label> 年&nbsp;龄 </label></td>
								<td><input type="text" name="age" /></td>
								<td><b><font color="red"></font></b></td>
							</tr>
							<tr>
								<td><label>性&nbsp;别 </label></td>
								<td><select name="sex">
										<option value="0">男</option>
										<option value="1">女</option>
								</select></td>
								<td></td>
							</tr>
							<tr>
								<td><label>手&nbsp;机</label></td>
								<td><input type="text" name="phone" /></td>
								<td></td>
							</tr>
							<tr>
								<td><label> 地&nbsp;址 </label></td>
								<td><input type="text" name="address" /></td>
								<td><b><font color="red"></font></b></td>
							</tr>
							<tr>
								<td><label> 管理权限 </label></td>
								<td><select name="power">
										<option value="0">管理员</option>
										<option value="1">普通员工</option>
								</select></td>
								<td></td>
							</tr>
						</table>
						<br> <input type="button" class="login-sub" value="保存数据"
							id="but1" />&nbsp;&nbsp;<input type="button" class="login-sub"
							value="返回" id="but2" />
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="copyright">Copyright &nbsp; &copy; &nbsp;</div>
</body>
<script type="text/javascript">
	function Exit() {
		if (confirm("确认退出登陆吗！！")) {
			location.href = "${pageContext.request.contextPath}/accountmanager/tolog"
		}
	}
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#but1")
				.click(
						function() {
							var un = $("#n1").val();
							var p = $("#p2").val();
							if (un == null || un == "") {
								$("#f1").html("用户名不能为空");
							} else if (p == null || p == "") {
								$("#f1").html("*")
								$("#f2").html("密码不能为空");
							} else {
								$("#f2").html("*")
								$
										.ajax({
											url : "${pageContext.request.contextPath}/accountmanager/save",
											data : $("#myForm").serialize(),
											dataType : "text",
											type : "post",
											success : function(rec) {
												if (rec == "1") {
													location.href = "${pageContext.request.contextPath}/accountmanager/messa?id=${session.id}&power=${session.power}";
												} else {
													$("#f1").html("用户名重复请重新命名")
												}
											},
											error : function() {

											}
										});
							}

						});
		$("#but2")
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/accountmanager/messa?id=${session.id}&power=${session.power}";
						});
	});
	function Exit() {
		if (confirm("确认退出登陆吗！！")) {
			location.href = "${pageContext.request.contextPath}/accountmanager/tolog"
		}
	}
</script>
</html>