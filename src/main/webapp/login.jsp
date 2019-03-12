<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>持名法州后台管理中心</title>

    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

	<link rel="icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css" type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" type="text/css"></link>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/script/common.js"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/themes/default/easyui.css">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/themes/icon.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">

		$(function(){

			//点击更换验证码：
			$("#captchaImage").click(function(){//点击更换验证码
				$("#captchaImage").prop("src","${pageContext.request.contextPath}/code.do?time="+new Date().getTime())

			});

			$('#loginBtn').click(function(){
				$("#loginForm").submit();
			});



			$("#code").textbox({


				required:true,
				validType:'length[4,4]',
				missingMessage:'验证码不能为空',
				invalidMessage:'验证码长度为4',
				type:'text'
			});



			$("#password").textbox({


				showEye: true,
				required:true,
				validType:'length[6,20]',
				missingMessage:'密码不能为空',
				invalidMessage:'密码长度为6-20',
				iconCls:'icon-lock'
			});
			$("#loginName").textbox({


				required:true,
				validType:'length[3,20]',
				missingMessage:'用户名不能为空',
				invalidMessage:'用户名长度为3~20',
				type:'text',
				iconCls:'icon-man'
			});


			$('#loginForm').form({
				url:'${pageContext.request.contextPath }/admin/login.do',
				onSubmit:function(){
					var b =  $('#loginForm').form('validate');
					return b;
				},
				success:function(data){
					var map =  JSON.parse(data);
					console.log(map.status);
					if(map.status=='300'){
						$('#errorMsg').html(map.msg);
						$("#captchaImage").prop("src","${pageContext.request.contextPath}/code.do?time="+new Date().getTime())
					}else if(map.status=='400'){
						$('#errorMsg').html(map.msg);
						$("#captchaImage").prop("src","${pageContext.request.contextPath}/code.do?time="+new Date().getTime())
					}else if(map.status=='500'){
						$('#errorMsg').html(map.msg)
						$("#captchaImage").prop("src","${pageContext.request.contextPath}/code.do?time="+new Date().getTime())
					}else{
						window.location.href="${pageContext.request.contextPath }/main.jsp";
					}

				},
				ajax:true
			});



		});
	</script>
</head>
<body>

		<div class="login">
			<form id="loginForm" method="post" >

				<table>
					<tbody>
						<tr>
							<td width="190" rowspan="2" align="center" valign="bottom">
								<img src="img/header_logo.gif" />
							</td>
							<th>
								用户名:
							</th>
							<td>
								<input id="loginName" type="text"  name="name" class="text" value="" />
							</td>
					  </tr>
					  <tr>
							<th>
								密&nbsp;&nbsp;&nbsp;码:
							</th>
							<td>
								<input id="password" type="password"  name="password" class="text" value="" maxlength="20" autocomplete="off"/>

							</td>
					  </tr>

						<tr>
							<td>&nbsp;</td>
							<th>验证码:</th>
							<td>

								<img id="captchaImage" class="captchaImage" src="${pageContext.request.contextPath}/code.do" title="点击更换验证码"/>
								<input type="text" id="code" name="code" class="text captcha" maxlength="4" autocomplete="off"/>
							</td>
						</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<th id="errorMsg" style="color: red;">
							&nbsp;
						</th>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<th>&nbsp;</th>

						<td>
							<input id="loginBtn" type="button" class="loginButton" value="登录">
						</td>
					</tr>
				</tbody></table>
				<div class="powered">COPYRIGHT © 2008-2017.</div>
				<div class="link">
					<a href="http://www.chimingfowang.com/">持名佛网首页</a> |
					<a href="http://www.chimingbbs.com/">交流论坛</a> |
					<a href="">关于我们</a> |
					<a href="">联系我们</a> |
					<a href="">授权查询</a>
				</div>
			</form>
		</div>
</body>
</html>