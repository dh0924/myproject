<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_slide.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_paging.css" rel="stylesheet">
<script	src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/theme_1/js/wai_jquery.js"></script>


</head>
<body>
	<div id="all-container">
		<div id="user-header">
			<c:if test="${sessionScope.user == null}">
		<ul>
			<li><a href="login">로그인</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="gonoticeboard?user=UserA&page=1">공지사항</a></li>
			<li><a href="#">1:1문의</a></li>
		</ul>
	</c:if>
	<c:if test="${sessionScope.user != null}">
		<ul>
			<li><a href="#">로그아웃</a></li>
			<li><a href="#">마이페이지</a></li>
			<li><a href="gonoticeboard?user=${sessionScope.user}&page=1">공지사항</a></li>
			<li><a href="#">1:1문의</a></li>
		</ul>
	</c:if>
		</div>
		<div id="user-sidebar">
			<h1 style="font-size: 50px; text-align: center; cursor: pointer; text-decoration: none">
		<a href="gohome">WAI</a>
		</h1>
	<ul>
		<li class="menu" style="cursor: pointer;"><a>MAN</a>
			<ul>
				<li><a href="#">상의</a></li>
				<li><a href="#">하의</a></li>
				<li><a href="#">가방</a></li>
				<li><a href="#">신발</a></li>
				<li><a href="#">액세서리</a></li>
			</ul></li>
	</ul>
	<hr>
	<ul>
		<li class="menu" style="cursor: pointer;"><a>WOMAN</a>
			<ul>
				<li><a href="#">상의</a></li>
				<li><a href="#">하의</a></li>
				<li><a href="#">가방</a></li>
				<li><a href="#">신발</a></li>
				<li><a href="#">액세서리</a></li>
			</ul></li>
	</ul>
	<hr>
	<div id="all-search">
		<input type="text" placeholder="상품명 입력">
		<button>검색</button>
	</div>
	<br> (주)WAI
	<br>
	<br> 1000-1000
	<br>
	<br> wai@email.com
	<br>
	<br>
	<a href="goaboutcompany">회사 소개</a>
	<br>
	<a href="gonoticeboard?user=admin&page=1">임시 admin Q&A게시판</a>
	<br>
	<a href="goqnaboard?user=UserA&page=1">임시 user Q&A게시판</a>
		</div>
		<div id="all-content">
			<br>
			<h1	style="font-size: 50px; text-align: center; cursor: pointer; text-decoration: none">공지사항</h1><br><br>
			<table id="main_list" class="table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				<c:forEach var="imsi" items="${list1 }">
					<tr>
						<td>${imsi.noticeno }</td>
						<td><a href="noticeview?noticeno=${imsi.noticeno }">${imsi.noticesubject }</a></td>
						<td>${imsi.noticedate }</td>
					</tr>
				</c:forEach>
			</table>
		<c:if test="${sessionScope.user == 'admin'}">
			<table align="right">
			<tr>
				<td colspan = 6><input class="button" type="button" value="작성하기" onclick="location.href='gonoticeinsert'"></td>
			</tr>
		</table>
		</c:if>

	<div id="all-paging">
		<c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
			<li><a href="gonoticeboard?page=${i }">${i }</a></li>
		</c:forEach>
	</div>
	</div>
	</div>
</body>
</html>