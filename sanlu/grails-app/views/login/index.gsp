<html>
<head>
<title>登入</title>
<meta name="layout" content="login" />
</head>
<body>
	<g:if test="${!session.empLevel}">
	${flash.message} 
	<g:form name="loginForm" url="[action:'login',controller:'login']">
		<fieldset>
			<legend> 登入 </legend>
			<div class="field-row">
				<span class="th1">帳號：</span> 
				<span> <input type="text" id="id" name="id" placeholder="帳號" /></span>
			</div>
			<div class="field-row">
				<span class="th1">密碼：</span> 
				<span><input type="password" id="pw" name="pw" placeholder="密碼" /> </span>
			</div>
			<div class="field-row">
				<span class="th1">分館：</span> <span> <select id="projectName"
					name="projectName">
						<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
				</select> </span>
			</div>
		</fieldset>
		<div>
			<button id="confirm">確定</button>
		</div>
	</g:form>
	</g:if>
	<script>
		$(document).ready( function() {					
			$("#confirm").click( function() {
				var id = $('#id');
				var pw = $('#pw');
				if (!id) {
					alert("請先輸入帳號");
				}
				if (!pw) {
					alert("請先輸入密碼");
				}						
				$.ajax({
					type: "POST",
					url: contextRoot + "/login/login",
					data: {'id':id,'pw':pw},
					success: function(msg) {								
						alert("登入成功");
					}
				})
			});
			
		});
	</script>
</body>
</html>