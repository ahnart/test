<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/b_board_style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main_style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/reset.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>

<title>전체 소감글 보기</title>
</head>
<body>
	<div class="ui middle aligned center aligned grid">
		<div class="column">
			<h2 class="ui teal image header">전체 소감글 리스트</h2>
			<div class="ui large form">
				<h2 class="ui teal image header btitle">
					소감글 <span>전체 목록 </span>
				</h2>
			<form role="form" method="post" autocomplete="off">
				<div class="ui stacked segment">
					<table class="ui celled table">
						<thead>
							<tr>
								<th>품번</th>
								<th>작성자</th>
								<th>작성 상품</th>
								<th>소감글 내용</th>
								<th>작성일자</th>
								<th>삭제</th>
							</tr>
						</thead>

						<tbody id="list">
							<c:forEach items="${list}" var="reply">
								<tr>
									<td>${reply.g_no}</td>
									<td>${reply.u_Id}</td>
									<td class="goods_code"><a href="/user/goods/view?g_no=${reply.g_no}">${reply.g_name} </a></td>
									<td>${reply.reCon}</td>
									<td><fmt:formatDate value="${reply.reDate}" pattern="yyyy-MM-dd" /></td>

									<td class="del_btn"><input type="hidden" name="reNum" value="${reply.reNum }"> <a href="deleteReply?reNum=${reply.reNum}">삭제 </a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="page_Num">
						<c:forEach begin="1" end="${pageNum2}" var="num">
							<span> <a class="pageNum" href="/user/admin/allReply?num=${num}">${num}</a></span>
						</c:forEach>
					</div>
					<a href="/" class="ui fluid large teal submit button  ">홈으로</a>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>