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
					<strong>首頁>後台管理>會員管理>權限更改</strong>
				</header>
<%
						AccountBean account = (AccountBean) session.getAttribute("privilege");
					%>
				<!-- Banner -->
				<br><br>
				<div class="col-12 col-12-small" style="color: #880000;font-size: 2em;">
					uid:<%=account.getUid() %> 
					帳號名稱:<%=account.getAccount() %>
					</div>
					<br><br>
					<!-- Form -->
					<%
						String[] checked = {"","","",""};
						int privilege = account.getPrivilege();
						int twopower = 1;
						for(int i=0;i<checked.length;i++){
							if((privilege & twopower)!=0)
								checked[i] = "checked";
							twopower*=2;
						}
					%>
		
					<form method="post" action="MemberPrivilegeUpdate?action=update">
							<input type="hidden" name="uid" value=<%=account.getUid() %>>
							<div class="col-12 col-12-small">
								<input type="checkbox" id="commodity" name="privilege" value="1" <%=checked[0] %>>
								<label for="commodity">商品管理</label>
							</div>
							<div class="col-12 col-12-small">
								<input type="checkbox" id="order" name="privilege" value="2" <%=checked[1] %>>
								<label for="order">訂單管理</label>
							</div>
							<div class="col-12 col-12-small">
								<input type="checkbox" id="member" name="privilege" value="4" <%=checked[2] %>>
								<label for="member">會員管理</label>
							</div>
							<div class="col-12 col-12-small">
								<input type="checkbox" id="marquee" name="privilege" value="8" <%=checked[3] %>>
								<label for="marquee">跑馬燈管理</label>
							</div>
						<br>
						<div class="col-12">
							<ul class="actions">
								<li><input type="submit" value="修改確認" class="primary" /></li>
								<li><a href="MemberAdmin" class="button">回上一頁</a></li>
							</ul>
						</div>
					</form>
					<!-- Break -->
	
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