<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<jsp:include page="header.jsp" />
</head>
<body class="be-splash-screen">
	<div class="be-wrapper be-login">
		<div class="be-content">
			<div class="main-content container-fluid">
				<div class="splash-container">
					<div
						class="panel panel-default panel-border-color panel-border-color-primary">
						<div class="panel-heading">
							<img
								src="<%=request.getContextPath()%>/resources/img/logo-xx.png"
								alt="logo" width="102" height="27" class="logo-img"> <span
								id="ketqua" class="splash-description">Please enter your
								user information.</span>
						</div>
						<div class="panel-body">

							<div class="form-group">
								<input id="username" name="username" type="text"
									placeholder="Email" autocomplete="off" class="form-control">
							</div>
							<div class="form-group">
								<input id="password" name="password" type="password"
									placeholder="Password" class="form-control">
							</div>
							<div class="form-group row login-tools">
								<div class="col-xs-6 login-remember">
									<div class="be-checkbox">
										<input type="checkbox" id="remember"> <label
											for="remember">Remember Me</label>
									</div>
								</div>
								<div class="col-xs-6 login-forgot-password">
									<a href="pages-login.html#">Forgot Password?</a>
								</div>
							</div>
							<div class="form-group login-submit">
								<button id="btndangnhap" data-dismiss="modal"
									class="btn btn-primary btn-xl">Sign me in</button>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>