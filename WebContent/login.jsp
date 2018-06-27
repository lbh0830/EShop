<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>登入會員</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header"> <a href="index.jsp" class="logo"><strong>首頁>登入</strong></a>
				</header>

				<!-- Banner -->
				<section id="banner"> <!-- Form -->
				<form method="post" action="Login">
					<div class="row gtr-uniform">
						<div class="col-12 col-12-xsmall">
							<input type="text" id="demo-name" name="valUser"
								placeholder="帳號" required/>
						</div>
						<div class="col-12 col-12-xsmall">
							<input type="password" id="demo-name" name="valPwd"
								placeholder="密碼(6~12個字)" minlength="6" maxlength="12" required/>
						</div>
					</div>
					<br>
					<div class="col-12">
						<ul class="actions">
							<li><input type="submit" value="登入"
								class="primary" /></li>
							<li><input type="reset" value="清空	" /></li>
						</ul>
					</div>
				</form>
				<!-- Break --> </section>
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section> <header>
				<h2>妮琪姊的購物天堂</h2>
				</header> </section>

				<!-- Menu -->
				<nav id="menu"> <header class="major">
				<h2>Menu</h2>
				</header>
				<ul>
					<li><a href="index.jsp">回首頁</a></li>
					<li><a href="login.jsp">登入</a> <a href="signup.jsp">註冊會員</a></li>
					<li><a href="cart.jsp">購物車</a></li>
						<li><span class="opener">商品分類</span>
							<ul>
								<li><a href="commodity.jsp?item=accessories">配件</a></li>
								<li><a href="commodity.jsp?item=shoes">鞋款</a></li>
								<li><a href="commodity.jsp?item=backpacks">背包</a></li>
								<li><a href="commodity.jsp?item=hats">帽子</a></li>
							</ul></li>
						<li><a href="order.jsp">訂單管理</a></li>
						<li><a href="backend.jsp">後台管理</a></li>
				</ul>
				</nav>

				<!-- Footer -->
				<footer id="footer">
				<p class="copyright">&copy; Untitled. All rights reserved.</p>
				</footer>

			</div>
		</div>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>