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
		<input type="hidden" name="id" value="${session.id}">
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
						<table>
							<tr>
								<td><label>用&ensp;&ensp;户:</label></td>
								<td><input type="text" name="name" value="${session.name}"
									readonly="readonly" id="n" /></td>
								<td><b><font color="red" id="font1"></font></b></td>
							</tr>
							<tr id="ag">
								<td><label>年&ensp;&ensp;龄:</label></td>
								<td><input type="text" name="age" readonly="readonly"
									value="${session.age}" id="a"></td>
								<td><b><font color="red" id=""></font></b></td>
							</tr>
							<tr id="se">
								<td><label>性&ensp;&ensp;別:</label></td>
								<td><c:if test="${session.sex==0}">
										<input type="text" name="sex" readonly="readonly" value="男">
									</c:if> <c:if test="${session.sex==1}">
										<input type="text" name="sex" readonly="readonly" value="女">
									</c:if></td>
								<td><b><font color="red" id="font2"></font></b></td>
							</tr>
							<tr>
								<td><label>手&ensp;&ensp;机:</label></td>
								<td><input type="text" name="phone" readonly="readonly"
									value="${session.phone}" id="ph"></td>
								<td><b><font color="red" id="font3"></font></b></td>
							</tr>
							<tr>
								<td><label>地&ensp;&ensp;址:</label></td>
								<td><input type="text" name="address" readonly="readonly"
									value="${session.address}" id="ad"></td>
								<td><b><font color="red" id="font2"></font></b></td>
							</tr>

						</table>
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

		var un = $("#n");
		var se = $("#se");
		var a = $("#a");
		var ph = $("#ph");
		var ad = $("#ad");

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
							se.remove();
							$("#se1").remove();
							$("#ag")
									.after(
											"<tr><td><label>性&nbsp;别 </label></td><td><select name='sex'><option value='0'>男</option><option value='1'>女</option></select></td></tr>");
							a.removeAttr("readonly");
							ph.removeAttr("readonly");
							ad.removeAttr("readonly");
							s.remove();
							f1.html("*");
							f2.html("*");
							$("#font3").html("*");
							$("#s")
									.click(
											function() {
												
												var phv = ph.val();
												if (phv == null
														|| phv == "") {
													f1.html("*");
													$("#font3").html("手机号不能为空");
												} else if(phv.length<11){
													$("#font3").html("手机号不正确");
												}else{
													$.ajax({
														url:"${pageContext.request.contextPath}/self/mod",
														data:$("#myForm").serialize(),
														dataType:"text",
														type:"post",
														success:function(rec){
															location.href="${pageContext.request.contextPath}/self/selfpage";
														},
														error:function(){
															
														}
													});
													
												}
											});
							$("#t")
									.click(
											function() {
												location.href="${pageContext.request.contextPath}/self/selfpage";
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