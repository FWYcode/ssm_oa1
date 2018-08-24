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
		action="${pageContext.request.contextPath}/mail/write" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="seid" value="${session.id}"> <input
			type="hidden" name="state" value="0">
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
					<div class="t">收信箱</div>
					<div class="pages" align="center" id="insert">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							align="center">
							<tr>
								<td align="center" width="15%" height="40px"><label>邮件标题
								</label></td>
								<td align="center" width="15%"><label>邮件内容</label></td>
								<td align="center" width="15%"><label>是否已读</label></td>
								<td align="center" width="15%"><label>时间</label></td>
								<td align="center" width="15%"><label>操作</label></td>
							</tr>
							<c:forEach items="${session.lis}" var="mail">
								<c:if test="${mail.sign==1}">
									<tr>
										<td align="center" width="15%" height="40px"><a
											href="${pageContext.request.contextPath}/mail/madetails?id=${mail.id}&state=1">${mail.name}</a></td>
										<td align="center" width="15%">${mail.matter}</td>
										<c:if test="${mail.state==0}">
											<td align="center" width="15%">未读</td>
										</c:if>
										<c:if test="${mail.state==1}">
											<td align="center" width="15%">已读</td>
										</c:if>
										<td align="center" width="15%">${mail.date}</td>
										<td align="center" width="15%"><a href="#"
											onclick="remove(${mail.id})">删除</a>|<a href="#"
											onclick="restore(${mail.id})">还原</a></td>
									</tr>
								</c:if>
							</c:forEach>
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
	function remove(id) {
		if (confirm("确定删除吗！！！")) {
			location.href = "${pageContext.request.contextPath}/mail/removemail?id="+id;
		}
	}
	function restore(id){
		if(confirm("确定执行此操作吗？")){
			location.href="${pageContext.request.contextPath}/mail/restore"+"?id="+id+"&sign=0";
		}
	}
	
</script>

</html>