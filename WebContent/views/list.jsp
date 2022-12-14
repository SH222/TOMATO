<%@page import="kr.co.tomato.member.model.vo.Member"%>
<%@ page import="kr.co.tomato.vo.Item"%>
<%@ page import="kr.co.tomato.vo.BuySellItem"%>
<%@ page import="kr.co.tomato.vo.PageData"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% Member m = (Member)session.getAttribute("member"); %>
<% Item i = (Item)session.getAttribute("item"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>물품 관리</title>
<link rel="stylesheet" href="/css/product/list.css" type="text/css">
<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script>
	$(function() {
		var sBtn = $(".e-nav > li");
		sBtn.find("#e-menu_select").click(function() {
			sBtn.removeClass("e-active");
			$(this).parent().addClass("e-active");
		});
	});
</script>
</head>
<body>
	<div class="e-sidebar">
		<nav class="e-navbar">
			<div>
				<ul class="e-nav">
					<li class="e-nav-header">
						<div>
							<a href="/">
								<img src="/img/tomatoLogo.png" width="100%" height="100%">
							</a>
							<br><br>
							<a href="/myshopView?email=${sessionScope.member.email}&memberNo=${sessionScope.member.memberNo}" class="e-MyShopImg">
								<img src="/upload/member/<%=m.getFilePath() %>" width="70px" height="70px">
							</a>
							<br><br>
							<a href="/myshopView?email=${sessionScope.member.email}&memberNo=${sessionScope.member.memberNo}" class="e-MyShopTag">MyShop</a>
						</div>
					</li>
					<li>
						<a href="/" id="e-menu_select">
							<span>홈</span>
						</a>
					</li>
					<li>
						<a href="/views/enroll.jsp" id="e-menu_select">
							<span>물품 등록</span>
						</a>
					</li>
					<li>
						<a href="/itemList?memberNo=<%=m.getMemberNo() %>" id="e-menu_select" class="e-active">
							<span>물품관리</span>
						</a>
					</li>
					<li>
						<a href="/buyItem?memberNo=<%=m.getMemberNo() %>" id="e-menu_select" id="e-menu_select">
							<span>구매/판매내역</span>
						</a>
					</li>
					<li>
						<a href="/deleteMember?email=${sessionScope.member.email} " id="e-menu_select">
							<span>탈퇴하러가기</span>
						</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="e-con">
	<div class="e-con-nav">
    </div>
	<div class="e-con-header">
	</div>
	<div class="e-main">
		<input type="hidden" name="memberNo" value="<%=m.getMemberNo() %>">
		<div class="e-div_bg">
			<div class="e-main_head">
				<div class="e-main_head_top">
					<h2>물품 목록</h2>
					<ol class="e-main_head_title">
						<li>
							<a href="/">Home</a>
						</li> /
						<li>
							<strong>물품 목록</strong>
						</li>
					</ol>
					<form action="/searchKeyword">
						<select name="type" class="e-select_status">
							<c:if test="${empty type }">
								<option value="allItem">전체</option>
								<option value="onsaleItem">판매중</option>
								<option value="soldItem">판매완료</option>
							</c:if>
							<c:if test="${not empty type && type == 'allItem' }">
								<option value="allItem" selected="selected">전체</option>
								<option value="onsaleItem">판매중</option>
								<option value="soldItem">판매완료</option>
							</c:if>
							<c:if test="${not empty type && type == 'onsaleItem' }">
								<option value="allItem">전체</option>
								<option value="onsaleItem" selected="selected">판매중</option>
								<option value="soldItem">판매완료</option>
							</c:if>
							<c:if test="${not empty type && type == 'soldItem' }">
								<option value="allItem">전체</option>
								<option value="onsaleItem">판매중</option>
								<option value="soldItem" selected="selected">판매완료</option>
							</c:if>
						</select>
						<input type="text" class="e-search_name" name="keyword" value="${keyword }">
						<button type="submit" class="e-search_name_btn">검색</button>
					</form>
					
				</div>
			</div>
			<div class="e-main_body">
				<br>
				<div class="e-main_body_btn">
					<a href="/views/enroll.jsp"><button class="e-enroll_btn">물품등록</button></a>
				</div>
				<br>
				<div class="e-main_body_menu">
					<form action="/deleteItem" method="post">
						<input type="hidden" name="i.itemNo">
						<table class="e-main_body_table">
							<thead>
								<tr class="e-main_body_list">
									<th>상품번호</th>
									<th>사진</th>
									<th>상태</th>
									<th>물품명</th>
									<th>가격</th>
									<th>등록일</th>
									<th>기능</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${itemAll }" var="i" varStatus="status">
									<tr class="e-main_body_list" style="text-align: center;">
										<td>${i.itemNo }</td>
										<td>
											<input type="hidden" id="status" name="status" value="stay">
											<c:choose>
												<c:when test="${empty i.itemThumFilepath }">
													<a href = "/sellPage?itemNo=${i.itemNo}"><img src="/img/TomatoImg.jpg" style="width:100px; height:100px;"></a>
												</c:when>
												<c:otherwise>
													<a href = "/sellPage?itemNo=${i.itemNo}"><img src="/upload/product/${i.itemThumFilepath }" style="width:100px; height:100px;"></a>
												</c:otherwise>
											</c:choose>
										</td>
										<td>${i.itemDealState }</td>
										<td>${i.itemName }</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${i.itemPrice }" />원</td>
										<td>${i.itemEnrollDate }</td>
										<td>
											<c:if test="${i.itemDealState != '거래중' }">
												<button type="button" class="e-delete_btn" onclick="location.href='/deleteItem?itemNo=${i.itemNo }&memberNo=${sessionScope.member.memberNo }'">삭제</button>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
					
					<br>
				</div>
			</div>
			<br>
		</div>
		<br>
	</div>
	</div>
</body>
</html>