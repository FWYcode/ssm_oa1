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
		<input type="hidden" name="id" value="26" /> <input type="hidden"
			name="sex" value="2" id="u_sex" /> <input type="hidden"
			name="supper" value="0" id="u_supper" />
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
									href="${pageContext.request.contextPath}/accountmanager/singmessa?id=${session.id}&power=1"
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
									href="${pageContext.request.contextPath}/accountmanager/singmessa?id=${session.id}"
									target="_self">个人账户</a>
							</dd>
						</c:if>
					</dl>
				</div>
				<div class="action">
					<div class="t">休假信息列表</div>
					<div class="pages" align="center">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							align="center">
							<tr>
								<td align="center" width="5%" height="40px">申请人</td>
								<td align="center" width="10%">开始时间</td>
								<td align="center" width="10%">结束时间</td>
								<td align="center" width="25%">天数</td>
								<td align="center" width="15%">审批状态</td>
								<td align="center" width="25%">事由</td>
								<c:if test="${session.power==0}">
									<td align="center" width="15%">操作</td>
								</c:if>
							</tr>
							<c:forEach items="${lisu}" var="user">
								<c:if test="${session.power==0}">
									<c:forEach items="${user.leavets}" var="leave">
										<c:if test="${leave.revid==session.id}">
											<tr>
												<td align="center" width="5%" height="40px">${user.name}</td>
												<td align="center" width="10%">${leave.begint}</td>
												<td align="center" width="10%">${leave.endt}</td>
												<td align="center" width="25%">${leave.days}</td>
												<td align="center" width="15%"><c:if
														test="${leave.state==0}">未审核</c:if> <c:if
														test="${leave.state==1}">已审核</c:if> <c:if
														test="${leave.state==2}">审核拒绝</c:if></td>
												<td align="center" width="25%">${leave.reasons}</td>
												<td align="center" width="15%"><c:if
														test="${leave.state==0}">
														<a
															href="${pageContext.request.contextPath}/leave/tosh?id=${leave.id}&name=${user.name}">[审核]</a>
													</c:if></td>
											</tr>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${session.power==1}">
									<c:forEach items="${user.leavets}" var="leave">
										<tr>
											<td align="center" width="5%" height="40px">${user.name}</td>
											<td align="center" width="10%">${leave.begint}</td>
											<td align="center" width="10%">${leave.endt}</td>
											<td align="center" width="25%">${leave.days}</td>
											<td align="center" width="15%"><c:if
													test="${leave.state==0}">未审核</c:if> <c:if
													test="${leave.state==1}">已审核</c:if> <c:if
													test="${leave.state==2}">审核拒绝</c:if></td>
											<td align="center" width="25%">${leave.reasons}</td>
										</tr>
									</c:forEach>
								</c:if>
							</c:forEach>
							<tr>
								<td align="center" colspan="2"><br /> <input type="button"
									id="insert" value="申请休假" onclick="setit()" /></td>
							</tr>
						</table>
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
	function setit() {
		location.href = "${pageContext.request.contextPath}/leave/toleave";
	}
</script>
</html>