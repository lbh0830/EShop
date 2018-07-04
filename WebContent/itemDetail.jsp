<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.shop.model.*,java.util.*"%>
<%
	CommodityBean cb = new CommodityBean();
	for (CommodityBean ele : (ArrayList<CommodityBean>) session.getAttribute("commodity")) {
		if (ele.getId().equals(request.getParameter("id")))
			cb = ele;
	}
%>
<!DOCTYPE html>
<html>
<head>
<title><%=cb.getName()%></title>
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
				<%
					MarqueeBean marquee = (MarqueeBean) application.getAttribute("showMarquee");
				%>
				<header id="header">
					<strong>首頁>商品分類><%=cb.getCategory()%>>商品詳細資訊
					</strong>
					<marquee direction="left" height="30" scrollamount="5" style="color:red;"><%=marquee.getContext() %></marquee>
				</header>
				<br> <br>
				<h2><%=cb.getName()%></h2>
				<%
					String picSrc = "images/" + cb.getImage();
				%>
				<p style="font-size: 18px;">
					<span class="image left"><img src=<%=picSrc%> alt="" /></span> 分類:
					<%=cb.getCategory()%>
					<br> 價格:
					<%=cb.getPrice()%><br> 庫存:
					<%=cb.getQuantity()%><br> 詳細說明:
					<%=cb.getDetail()%>
				</p>
				<form action="CartAdd" method="post">
				<input type="hidden" value=<%=cb.getId()%> name="valId">
				<input type="hidden" value=<%=cb.getName()%> name="valName">
				<input type="hidden" value=<%=cb.getCategory()%> name="valCategory">
				<input type="hidden" value=<%=cb.getDetail()%> name="valDetail">
				<input type="hidden" value=<%=cb.getSpec()%> name="valSpec">
				<input type="hidden" value=<%=cb.getImage()%> name="valImage">
				<input type="hidden" value=<%=cb.getPrice()%> name="valPrice">
					<select name="valQuantity" required>
						<option value="">請選擇數量</option>
						<%
							for (int i = 1; i <= cb.getQuantity(); i++) {
						%>
						<option value=<%=i%>><%=i%></option>
						<%
							if (i == 10)
									break;
							}
						%>
					</select><br> <input type="submit" value="放入購物車">
				</form>


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
						<%
							int cartNum = 0;
							if(session.getAttribute("cart")==null){}else{
								ArrayList<CommodityBean> cartList = (ArrayList<CommodityBean>) session.getAttribute("cart");
								cartNum = cartList.size();
							}
						%>
						<li><a href="cart.jsp">購物車(<%=cartNum %>)</a></li>
						<li><span class="opener">商品分類</span>
							<ul>
								<li><a href="Commodity?item=配件&account=member">配件</a></li>
								<li><a href="Commodity?item=鞋款&account=member">鞋款</a></li>
								<li><a href="Commodity?item=背包&account=member">背包</a></li>
								<li><a href="Commodity?item=帽子&account=member">帽子</a></li>
							</ul></li>
						<li><a href="Order">訂單查詢</a></li>
						<%
						if(session.getAttribute("login")!=null){
							AccountBean account =(AccountBean) session.getAttribute("login");
							if(account.getPrivilege()!=0){
								out.print("<li><span class='opener'>後台管理</span><ul>");
								if((account.getPrivilege()&1)!=0)	
									out.print("<li><a href='Commodity?account=admin'>商品管理</a></li>");
								if((account.getPrivilege()&2)!=0)
									out.print("<li><a href='OrderAdmin'>訂單管理</a></li>");
								if((account.getPrivilege()&4)!=0)	
									out.print("<li><a href='MemberAdmin'>會員管理</a></li>");
								if((account.getPrivilege()&8)!=0)
									out.print("<li><a href='MarqueeAdmin?do=get'>跑馬燈內容管理</a></li>");
								out.print("</ul></li>");
							}
						}
						%>
					</ul>
				</nav>

				<!-- Footer -->
				<footer id="footer">
					<div>在線人數:<%=OnlineCounter.getOnline() %></div>
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