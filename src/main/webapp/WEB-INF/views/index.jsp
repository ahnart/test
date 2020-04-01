<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/main_style.css">
<link rel="stylesheet" type="text/css" href="resources/b_board_style.css">
<style type="text/css">
body {
	background-color: #0086b3;
}

body>.grid {
	height: 100%;
}

.image {
	margin-top: -100px;
}

.column {
	max-width: 450px;
}

.column span {
	font-weight: 300;
	color: #fff;
}

span.user_name {
	font-weight: 300;
	color: #fff;
	font-size: 30px;
	padding: 10px;
}

.ui .column p.logo_main {
	background-image: url(resources/syscuss_logo.png);
	width: 240px;
	height: 90px;
	background-size: cover;
	z-index: 1000;
	margin-left: 80px;
	display: block;
}

button {
	border: 0;
	background: 0;
	color: #fff;
	font-weight: bold;
	font-size: 18px;
}

h6 .loginon {
	border: 1px solid #fff;
	width: 200px;
	height: 40px;
	display: block;
}

#login_btn_out:hover {
	background: #004d66;
}
</style>
</head>
<body>
	<div class="ui middle aligned center aligned grid">
		<div class="column">
			<p class="logo_main"></p>
			<h2 class="ui teal image header">
				로그인<span>페이지</span>
			</h2>
			<c:if test="${member == null}">
				<form role="form" autocomplete="off" class="ui large form" method="post" action="signin">
					<div class="ui stacked segment">
						<div class="field">
							<div class="ui left icon input">
								<input type="text" id="u_id" name="u_id" placeholder="아이디" required="required">
							</div>
						</div>
						<div class="field">
							<div class="ui left icon input">
								<input type="password" id="u_pw" name="u_pw" placeholder="비밀번호" required="required">
							</div>
						</div>
						<div class="ui fluid large teal submit button" id="login_btn">
							<button class=" button" type="submit">로그인</button>

							<!-- <a type="submit" href="/signin">로그인</a>  -->

						</div>

					</div>
					<c:if test="${msg == false}">
						<h6 style="color: yellow; font-size: 14px;">로그인에 실패했습니다.</h6>
					</c:if>
					<div class="ui error message"></div>
				</form>
				<a href="/signup"><button class="ui fluid large teal submit button">회원가입 하기</button></a>
			</c:if>

			<c:if test="${member != null}">
				<p class="loginon" style="color: yellow; font-size: 18px;">
					<span class="user_name">${member.u_id}</span>님환영합니다!
				</p>
				<div class="ui stacked segment goods_View">

					<c:if test="${member.level == 9}">
						<div>
							<a class="ui fluid large teal submit button" href="/user/admin">관리자 페이지</a><br>
						</div>
						<!-- 게시물 작성 -->
						<a href="/user/register"><button class="ui fluid large teal submit button">상품등록</button></a>
					</c:if>

					<div id="login_btn_out" class="goods_view">
						<a href="/user/goods_list?num=1">
							<button class="">쇼핑 하기</button>
						</a>
					</div>

					<div id="login_btn_out" class="">
						<a href="/signout"><button class="ui fluid large teal submit button">로그아웃</button></a>
						<!-- 	<button type="signout">로그아웃</button> -->

					</div>
				</div>
			</c:if>

		</div>
	</div>
</body>
</html>