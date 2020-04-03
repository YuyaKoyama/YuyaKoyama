<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="user_db" scope="session" class="websample13_14.LoginUserBean" />

<%-- ログイン画面 --%>
<!DOCTYPE html>
<html>
	<head>
		<title>ログイン画面</title>
		<link href="/schoo/WEB-sample13_14/css/shopping.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="login_pane">
			<h1>ようこそゲームショッピング風サイトへ！</h1>
			<p>ログインIDとパスワードを入力して下さい</p>
			<form action="../LoginServletShopping" method="post">
				<table class="table_form">
					<tbody>
						<tr>
							<%-- ログイン済みの場合はIDを表示 --%>
							<th>ログインID</th>
							<td><input type="text" name="id" value="<%=user_db.getId()%>" placeholder="ログインID"/></td>
						</tr>
						<tr>
							<th>パスワード</th>
							<td><input type="password" name="pass" placeholder="パスワード"/></td>
						</tr>
					</tbody>
				</table>
				<input class="common_button" type="submit" name="submit"  value="ログイン"/>
				<%-- ログイン済みの場合はログアウトボタンを表示 --%>
				<% if("login".equals(session.getAttribute("login_db"))) { %>
					<input class="common_button" type="submit" name="submit" value="ログアウト"/>
				<% } %>
			</form>
		</div>
	</body>
</html>