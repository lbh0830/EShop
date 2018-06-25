<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.shop.model.AccountBean"%>
<!DOCTYPE html>
<html>
<head>
<title>修改會員資料</title>
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
				<header id="header">
					<a href="index.jsp" class="logo"><strong>首頁>會員管理>修改會員資料</strong></a>
				</header>

				<!-- Banner -->
				<section id="banner">
					<!-- Form -->
					<%
						AccountBean account = (AccountBean) session.getAttribute("login");
					%>
					<form method="post" action="MemberUpdate"
						onsubmit="return check_passwd()">
						<div class="row gtr-uniform">
							<div class="col-12 col-12-xsmall">
								帳號:<input style="background-color: #ffe6ff;" type="text"
									id="acc" name="valUser" value=<%=account.getAccount()%>
									readonly="true" />
							</div>
							<div class="col-12 col-12-xsmall">
								密碼(6~12個字):<input type="password" id="pwd" name="valPwd"
									minlength="6" maxlength="12" value=<%=account.getPassword()%>
									required />
							</div>
							<div class="col-12 col-12-xsmall">
								確認密碼(6~12個字):<input type="password" id="pwdC" name="valPwdCheck"
									minlength="6" maxlength="12" value=<%=account.getPassword()%>
									required />
							</div>
							<div class="col-12 col-12-xsmall">
								姓名:<input type="text" id="name" name="valName"
									value=<%=account.getName()%> required />
							</div>
							<div class="col-12 col-12-xsmall">
								住址:<input type="text" id="addr" name="valAddr"
									value=<%=account.getAddr()%> required />
							</div>
							<div class="col-12 col-12-xsmall">
								聯絡電話:<input type="text" id="tel" name="valPhone"
									value=<%=account.getTel()%> required />
							</div>
							<div class="col-12 col-12-xsmall">
								Email:<input type="email" id="email" name="valEmail"
									value=<%=account.getEmail()%> required />
							</div>
						</div>
						<br>
						<div class="col-12">
							<ul class="actions">
								<li><input type="submit" value="完成" class="primary" /></li>
								<li><a href="member.jsp" class="button">回上一頁</a></li>
							</ul>
						</div>
					</form>
					<!-- Break -->
				</section>
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section>
					<header>
						<h2>妮琪姊的購物天堂</h2>
					</header>
				</section>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="index.jsp">回首頁</a></li>
						<%
							if (session.getAttribute("login") == null)
								out.print("<li><a href='login.jsp'>登入</a> <a href='signup.jsp'>註冊會員</a></li>");
							else
								out.print("<li><a href='logout.jsp'>登出</a> <a href='member.jsp'>會員管理</a></li>");
						%>
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
	<script>
		function check_passwd(form) {
			if (pwd.value !== pwdC.value) {
				alert("密碼與確認密碼不同");
				return false;
			} else
				return true;
		}
	</script>
</body>
</html>