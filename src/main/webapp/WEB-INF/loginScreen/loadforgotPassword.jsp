<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://admin-templates.websitedesignmarketingagency.com/soft-material-admin/images/favicon.ico">
    <title>Log in</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<style>




/* body {
	background: linear-gradient(90deg, #C7C5F4, #776BCC);		
} */
body {
	background: linear-gradient(
0deg
, rgb(255 255 255 / 0%), rgb(255 255 255 / 0%)), url(https://i.pinimg.com/originals/b9/c8/f8/b9c8f893c9a782033a01f47e0c0b1d6e.jpg);
	 background-attachment: fixed;
	 background-size: cover;
	 background-repeat: no-repeat;	
	     background-position: bottom;
	     overflow-y: clip;
	  
}



.screen {		
	background: linear-gradient(90deg, #5D54A4, #7C78B8);		
	position: relative;	
	height: 600px;
	width: 360px;	
	box-shadow: 0px 0px 24px #5C5696;
}

.screen__content {
	z-index: 1;
	position: relative;	
	height: 100%;
}

.screen__background {		
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 0;
	-webkit-clip-path: inset(0 0 0 0);
	clip-path: inset(0 0 0 0);	
}

.screen__background__shape {
	transform: rotate(45deg);
	position: absolute;
}

.screen__background__shape1 {
	height: 520px;
	width: 520px;
	background: #FFF;	
	top: -50px;
	right: 120px;	
	border-radius: 0 72px 0 0;
}

.screen__background__shape2 {
	height: 220px;
	width: 220px;
	background: #6C63AC;	
	top: -172px;
	right: 0;	
	border-radius: 32px;
}

.screen__background__shape3 {
	height: 540px;
	width: 190px;
	background: linear-gradient(270deg, #5D54A4, #6A679E);
	top: -24px;
	right: 0;	
	border-radius: 32px;
}

.screen__background__shape4 {
	height: 400px;
	width: 200px;
	background: #7E7BB9;	
	top: 420px;
	right: 50px;	
	border-radius: 60px;
}

.login {
	width: 320px;
	padding: 30px;
	padding-top: 50px;
}

.login__field {
	padding: 20px 0px;	
	position: relative;	
}

.login__icon {
	position: absolute;
	top: 30px;
	color: #7875B5;
}

.login__input {
	border: none;
	border-bottom: 2px solid #D1D1D4;
	background: none;
	padding: 10px;
	padding-left: 24px;
	font-weight: 700;
	width: 75%;
	transition: .2s;
}

.login__input:active,
.login__input:focus,
.login__input:hover {
	outline: none;
	border-bottom-color: #6A679E;
}

.login__submit {
	background: #fff;
    font-size: 14px;
    margin-top: 30px;
    padding: 14px 20px;
    border-radius: 26px;
    border: 1px solid #D4D3E8;
    text-transform: uppercase;
    font-weight: 700;

  
    width: 74%;
    color: #4C489D;
    box-shadow: 0px 2px 2px #5c5696;
    cursor: pointer;
    transition: .2s;
}

.login__submit:active,
.login__submit:focus,
.login__submit:hover {
	border-color: #6A679E;
	outline: none;
}

.button__icon {
	font-size: 24px;
	margin-left: auto;
	color: #7875B5;
}

.social-login {	
	position: absolute;
	height: 140px;
	width: 160px;
	text-align: center;
	bottom: 0px;
	right: 0px;
	color: #fff;
}

.social-icons {
	display: flex;
	align-items: center;
	justify-content: center;
}

.social-login__icon {
	padding: 20px 10px;
	color: #fff;
	text-decoration: none;	
	text-shadow: 0px 0px 8px #7875B5;
}

.social-login__icon:hover {
	transform: scale(1.5);	
}
span.button__text {
    text-align: center;
    width: 100%;
}
.login__field h2 {
  color: #e8c101;
    font-weight: 600;
    font-size: 26px;
}
.login__box {
    margin-top: 10px;
}
.login__field h2 span{
    color: #5f40a8;
}
.projectname {
    width: 100%;
    float: left;
    font-size: 27px;
    color: #fff;

    text-align: center;
    padding: 25px 0px 20px 0px;
    position: relative;
    top: 5px;
}
.projectname h2{
    font-weight: 600;
    cursor: pointer;
}
.login-form {
    width: 100%;
    float: left;
        display: flex;
    justify-content: center;
}
	
</style>
</head>

<body>
<div class="container">
<div class="projectname">
	<h2 onclick="loadLoginPage();">HEALTH CARE GIVER</h2> 
</div>
	<div class="login-form">
	<div class="screen">
	
		<div class="screen__content">
			<form:form class="login" name="signInform" id="signInformId">
						<div class="login__field">
							<h2>
								Forgot  Password
							</h2>
						</div>
						<div class="login__box" id="mobileDivId">
							<div class="login__field">
								<label>Mobile No</label>
								<input type="text" name="username" class="login__input" placeholder="mobile no">
							</div>
							<input type="button" class="button login__submit" id="otpSendId" value="Send Otp" onclick="loadVerifyContent()">
						</div>
						<fieldset id="otpdivId" style="display: none;">
							<div class="login__box">
								<div class="login__field">
									<label>OTP</label>
									<input type="text" name="username" class="login__input" placeholder="OTP">
									<input type="button" class="button login__submit" value="Verify OTP" onclick="forgotPassword()">
									<input type="button" class="button login__submit" value="Resend" onclick="resendOtp()">
								</div>
							</div>
						</fieldset>
						<fieldset id="forgotPasswordDivId" style="display: none;">
							<div class="login__box">
								<div class="login__field">
									<label>Password</label>
									<input type="text" name="username" class="login__input" placeholder="Password">
								</div>
							</div>
							<div class="login__field">
									<label>Confirm Password</label>
									<input type="password" name="password" class="login__input" placeholder="Confirm Password">
									<input type="button" class="button login__submit" value="Submit" onclick="loadLoginPage()">
							</div>
						</fieldset>
						
						<!-- 					<span class="button__text">Log In Now</span> -->
			</form:form>
			<!-- <div class="social-login">
				<h3>log in via</h3>
				
			</div> -->
		</div>
		<div class="screen__background">
			<span class="screen__background__shape screen__background__shape4"></span>
			<span class="screen__background__shape screen__background__shape3"></span>		
			<span class="screen__background__shape screen__background__shape2"></span>
			<span class="screen__background__shape screen__background__shape1"></span>
		</div>		
	</div>
	</div>
</div>
</body>
<script type="text/javascript">
function loadVerifyContent() {
	$('#mobileDivId').hide();
	$('#otpSendId').attr("disabled","disabled");
	$('#otpdivId').show();
}
function forgotPassword() {
	$('#forgotPasswordDivId').show();
	$('#otpSendId').attr("disabled","disabled");
	$('#otpdivId').hide();
}
function loadLoginPage() {
	document.signInform.action="${pageContext.request.contextPath}/login/loginPage";
	document.signInform.submit();
}
function resendOtp() {
	$('#otpSendId').removeAttr("disabled","disabled");
	$('#mobileDivId').show();
	$('#otpdivId').hide();
}
</script>
</html>