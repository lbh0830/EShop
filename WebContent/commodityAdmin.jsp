<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.shop.model.AccountBean" %>
<!DOCTYPE html>
<html>
<head>
<title>商品管理</title>
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
					<strong>首頁>商品管理</strong>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h1>Title</h1>
						</header>
						<p>在這裡扯一些五四三</p>
						<ul class="actions">
							<li><a href="#" class="button big">開始購物</a></li>
						</ul>
					</div>
					<span class="image object"> <img src="images/HomePic.png"
						alt="購物圖" />
					</span>
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
							if(session.getAttribute("login")==null)
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
						<%
							AccountBean account =(AccountBean) session.getAttribute("login");
							if(account.getPrivilege()!=0){
								out.print("<li><span class='opener'>後台管理</span><ul>");
								if((account.getPrivilege()&1)!=0)	
									out.print("<li><a href='commodityAdmin.jsp'>商品管理</a></li>");
								if((account.getPrivilege()&2)!=0)
									out.print("<li><a href='orderAdmin.jsp'>訂單管理</a></li>");
								if((account.getPrivilege()&4)!=0)	
									out.print("<li><a href='memberAdmin.jsp'>會員管理</a></li>");
								if((account.getPrivilege()&8)!=0)
									out.print("<li><a href='copyrightAdmin.jsp'>頁尾版權管理</a></li>");
								if((account.getPrivilege()&16)!=0)
									out.print("<li><a href='newsAdmin.jsp'>最新消息管理</a></li>");
								out.print("</ul></li>");
							}
						%>
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