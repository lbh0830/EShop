<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.shop.model.AccountBean,java.util.*"%>
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
					<a href="index.jsp" class="logo"><strong>首頁>後台管理>會員管理</strong></a>
				</header>


				<br> <br>
				<h3>會員資料清單</h3>
				<div class="table-wrapper">
					<%
						List<AccountBean> list = (ArrayList<AccountBean>) session.getAttribute("member");
					%>

					<table class="alt">
						<thead>
							<tr>
								<th class="sort"><a class="logo" href="javascript: void(0)"><strong>會員編號</strong></a></th>
								<th class="sort"><a class="logo" href="javascript: void(0)"><strong>帳號</strong></a></th>
								<th><strong>姓名</strong></th>
								<th><strong>地址</strong></th>
								<th><strong>聯絡電話</strong></th>
								<th><strong>e-mail</strong></th>
								<th class="sort"><a class="logo" href="javascript: void(0)"><strong>權限</strong></a></th>
							</tr>
						</thead>
						<tbody>
							<%
								for (AccountBean account : list) {
									String accountHref = "commodityUpdate.jsp?id=" + Integer.toString(account.getUid());
							%>
							<tr>
								<td style="vertical-align: middle;"><%=account.getUid()%></td>
								<td style="vertical-align: middle;"><a class="logo"
									href=<%=accountHref%>><strong><%=account.getAccount()%></strong></a></td>
								<td style="vertical-align: middle;"><%=account.getName()%></td>
								<td style="vertical-align: middle;"><%=account.getAddr()%></td>
								<td style="vertical-align: middle;"><%=account.getTel()%></td>
								<td style="vertical-align: middle;"><%=account.getEmail()%></td>
								<td style="vertical-align: middle;"><%=account.getPrivilege()%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
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
	<script>
		$(document).on(
				'click',
				'th.sort',
				function() {
					var table = $(this).parents('table').eq(0);
					var rows = table.find('tr:gt(0)').toArray().sort(
							comparer($(this).index()));
					this.asc = !this.asc;
					if (!this.asc) {
						rows = rows.reverse();
					}
					table.children('tbody').empty().html(rows);
				});
		function comparer(index) {
			return function(a, b) {
				var valA = getCellValue(a, index), valB = getCellValue(b, index);
				return $.isNumeric(valA) && $.isNumeric(valB) ? valA - valB
						: valA.localeCompare(valB);
			};
		}
		function getCellValue(row, index) {
			return $(row).children('td').eq(index).text();
		}
	</script>

</body>
</html>