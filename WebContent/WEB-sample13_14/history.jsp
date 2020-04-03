<%@ page import="java.util.ArrayList"%>
<%@ page import="websample13_14.HistoryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="user_db" scope="session" class="websample13_14.LoginUserBean"/>

<%-- 購入履歴画面 --%>
<!DOCTYPE html>
<html>
	<head>
		<title>購入履歴画面</title>
		<link href="/schoo/WEB-sample13_14/css/shopping.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		<h1><jsp:getProperty property="name" name="user_db"/>さんの購入履歴</h1>
		<%-- リクエストスコープからBeanクラスの配列を取得--%>
		<% ArrayList<HistoryBean> historyList = (ArrayList<HistoryBean>)request.getAttribute("history"); %>
		<table class="table_list">
			<tbody>
				<tr>
					<th>商品ID</th>
					<th>商品名</th>
					<th>購入数</th>
				</tr>
				<%-- リクエストスコープから表示する値を取得 --%>
				<% for(HistoryBean bean : historyList) { %>
					<tr>
						<%-- 商品ID --%>
						<td><%= bean.getItemId() %></td>
						<%-- 商品名 --%>
						<td><%= bean.getItemName() %></td>
						<%-- 数量（在庫） --%>
						<td class="int"><%= bean.getQuantity() %></td>
					</tr>
				<% } %>
			</tbody>
		</table>
		<form action="./ShoppingServlet" method="post">
			<input class="common_button" type="submit" value="一覧に戻る">
		</form>
	</body>
</html>