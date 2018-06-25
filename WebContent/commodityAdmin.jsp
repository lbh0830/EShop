<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.shop.model.AccountBean,com.shop.model.CommodityBean,java.util.*"%>
<%
	List<CommodityBean> list = (ArrayList<CommodityBean>) session.getAttribute("commodity");
%>
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


				<br> <br>
				<h3>商品一覽</h3>
				<div class="col-12">
					<ul class="actions">
						<li><a href="Commodity?do=add" class="button small">新增商品</a></li>
						<li><a href="Commodity?do=update" class="button small">修改商品</a></li>
						<li><a href="Commodity?do=delete" class="button small">刪除商品</a></li>
					</ul>
				</div>
				<div class="table-wrapper">
					<%
						if (list != null) {
					%>
					<table class="alt">
						<thead>
							<tr>
								<th class="sort"><a class="logo" href="#"><strong>商品編號</strong></a></th>
								<th class="sort"><a class="logo" href="#"><strong>商品名稱</strong></a></th>
								<th><strong>縮圖</strong></th>
								<th><strong>分類</strong></th>
								<th class="sort"><a class="logo" href="#"><strong>單價</strong></a></th>
								<th class="sort"><a class="logo" href="#"><strong>數量</strong></a></th>
								<th><strong>詳細資訊</strong></th>
								<th class="sort"><a class="logo" href="#"><strong>規格</strong></a></th>
							</tr>
						</thead>
						<tbody>
							<%
								for (CommodityBean comm : list) {
							%>
							<tr>
								<td><%=comm.getId()%></td>
								<td><%=comm.getName()%></td>
								<td><%=comm.getImage()%></td>
								<td><%=comm.getCategory()%></td>
								<td><%=comm.getPrice()%></td>
								<td><%=comm.getQuantity()%></td>
								<%
								String str;
								if(comm.getDetail().length()>12) 
									 str = comm.getDetail().substring(0,12)+"...";
								else
									 str = comm.getDetail();
								%>
								<td><%=str%></td>
								<td><%=comm.getSpec()%></td>
							</tr>
							<%
								}
								} else {
									out.print("目前尚無商品");
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
						<%
							AccountBean account = (AccountBean) session.getAttribute("login");
							if (account.getPrivilege() != 0) {
								out.print("<li><span class='opener'>後台管理</span><ul>");
								if ((account.getPrivilege() & 1) != 0)
									out.print("<li><a href='Commerdity?do=admin'>商品管理</a></li>");
								if ((account.getPrivilege() & 2) != 0)
									out.print("<li><a href='orderAdmin.jsp'>訂單管理</a></li>");
								if ((account.getPrivilege() & 4) != 0)
									out.print("<li><a href='memberAdmin.jsp'>會員管理</a></li>");
								if ((account.getPrivilege() & 8) != 0)
									out.print("<li><a href='copyrightAdmin.jsp'>頁尾版權管理</a></li>");
								if ((account.getPrivilege() & 16) != 0)
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
	<script>
		$(document).on('click','th.sort',function() {
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