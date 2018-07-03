<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.shop.model.AccountBean"%>
<!DOCTYPE html>
<html>
<head>
<title>會員管理</title>
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
					<a href="index.jsp" class="logo"><strong>首頁>會員管理</strong></a>
				</header>

			
					<br><br><h3>會員資料清單</h3>
					<div class="table-wrapper">
					<% AccountBean account = (AccountBean)session.getAttribute("login");%>
					
						<table class="alt">
							<tbody>
								<tr>
									<td>帳號</td>
									<td><%=account.getAccount() %></td>
								</tr>
								<tr>
									<td>姓名</td>
									<td><%=account.getName() %></td>

								</tr>
								<tr>
									<td>地址</td>
									<td><%=account.getAddr() %></td>

								</tr>
								<tr>
									<td>電話</td>
									<td><%=account.getTel() %></td>

								</tr>
								<tr>
									<td>電子信箱</td>
									<td><%=account.getEmail() %></td>
								</tr>
							</tbody>
						</table>
						<a href="memberUpdate.jsp" class="button primary">修改個人資料</a>
					</div>
			
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

</body>
</html>