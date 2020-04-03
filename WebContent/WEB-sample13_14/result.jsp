<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%-- 購入結果画面 --%>
<!DOCTYPE html>
<html>
	<head>
		<title>購入結果画面</title>
		<link href="/schoo/WEB-sample13_14/css/shopping.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		<h1>購入結果</h1>
		<p>購入しました。<img src="/schoo/WEB-sample13_14/img/omocha_game.png" width="100" height="100"/></p>
		<form action="./ShoppingServlet" method="post">
			<input class="common_button" type="submit" value="一覧に戻る">
		</form>
	</body>
</html>