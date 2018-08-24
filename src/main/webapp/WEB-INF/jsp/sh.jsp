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
	<form id="myForm" name="myForm"
		action="${pageContext.request.contextPath}/leave/insertleave"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="seid" value="${session.id}"> <input
			type="hidden" name="state" value="0"> <input type="hidden"
			name="sign" value="0">
		<div class="main">
			<div class="global-width">
				<div class="nav" id="nav">
					<div class="t"></div>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">信息管理
						</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/self/selfpage"
								target="_self">个人信息</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							邮件管理</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/mail/toma"
								target="_self">写邮件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/mail/acptmail"
								target="_self">收邮件</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath}/mail/torubbish"
								target="_self">垃圾邮件</a>
						</dd>
					</dl>
					<dl>
						<dt
							onclick="this.parentNode.className=this.parentNode.className=='open'?'':'open';">
							考勤管理</dt>
						<dd>
							<a href="${pageContext.request.contextPath}/leave/toleavelis"
								target="_self">休假</a>
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
					<div class="t">审核</div>
					<div class="pages" align="center" id="insert">
						<table>
							<tr>
								<td><label>姓名</label></td>
								<td><input type="text" name="nus" id="p2" value="${name}" /></td>
							</tr>
							<tr>
								<td><label>开始时间 </label></td>
								<td><input type="text" name="begint" id="begin"
									value="${leave.begint}" /></td>

							</tr>
							<tr>
								<td><label>结束时间 </label></td>
								<td><input type="text" name="endt" id="end"
									value="${leave.endt}" /></td>
							</tr>
							<tr>
								<td><label>请假天数 </label></td>
								<td><input type="text" name="days" id="days"
									value="${leave.days}" /></td>
							</tr>
							<tr>
								<td><label>请假原因</label></td>
								<td><textarea rows="10" cols="25" name="reasons">${leave.reasons}</textarea></td>

							</tr>
							<tr>
								<td><label>审批人 </label></td>
								<td><input type="text" name="days" value="${session.name}" /></td>
							</tr>

						</table>
						<br> <input type="button" class="login-sub" value="同意申请"
							onclick="tong(${leave.id})" id="but2" /> <input type="button"
							class="login-sub" value="驳回申请" onclick="bohui(${leave.id})" />
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
	
	function Exit() {
		if (confirm("确认退出登陆吗！！")) {
			location.href = "${pageContext.request.contextPath}/accountmanager/tolog";
		}
	}
	function tong(id) {
		location.href = "${pageContext.request.contextPath}/leave/update?id="+id+"&state=1";
	}
	function bohui(id){
		location.href = "${pageContext.request.contextPath}/leave/update?id="+id+"&state=2";
	}
</script>
</html>