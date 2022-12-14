<%@page import="kr.co.tomato.member.model.vo.Member"%>
<%@page import="kr.co.tomato.noitceMTM.model.vo.NoticeMTM"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<NoticeMTM> list = (ArrayList<NoticeMTM>) request.getAttribute("list");
	Member m = (Member) session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<style>
.noticeMTM_wrap {
	width: 1000px;
	margin: 0 auto;
	margin-top: 10px;
}

.noticeMTM_header {
	width: 100%;
	height: 44px;
	text-align: center;
}

.noticeMTM_article {
	width: 100%;
}

.noticeMTM_main_category select {
	width: 100%;
	margin-top: 10px;
	padding: 3px;
}

.noticeMTM_sub_category select {
	width: 100%;
	margin-top: 10px;
	padding: 3px;
}

.noticeMTM_content {
	margin-top: 10px;
}

.noticeMTM_content textarea {
	padding: 10px;
}

.content {
	width: 100%;
	height: 300px;
}

.file {
	display: inline;
}

.file button {
	width: 150px;
	height: 35px;
	cursor: pointer;
}

.submit {
	float: right;
}

.submit button {
	width: 150px;
	height: 35px;
	cursor: pointer;
}

.noticeMTM_title {
	width: 50%;
	float: left;
	height: 44px;
	line-height: 44px;
}

.subject {
	padding: 5px;
	border-top: 1px solid #ededed;
	border-bottom: 1px solid #ededed;
	border-top: 1px solid #ededed;
}

.subject_anwser {
	border-bottom: 1px solid #ededed;
}

.subject_anwser_final {
	border-bottom: 1px solid #ededed;
}

.subject p span:last-child {
	float: right;
}

.noticeMTM {
	width: 100%;
	margin: 0 auto;
	margin-top: 10px;
	height: 47px;
}

.subject_content {
	display: none;
}

#complete {
	color: #C42026;
}
select {
background-color: white;
}
</style>

<script>
	$(document).ready(
			function() {
				$(".noitceMTM").hide();
				$(".noticeMTM_title").css("border-bottom", "none").css("color",
						"black");

				$(".noticeMTM_title").click(
						function() {
							$(".noticeMTM_title").css("border-bottom", "none")
									.css("color", "black");
							$(this).css("border-bottom", "2px solid #C42026")
									.css("color", "#C42026");
							$(".noticeMTM").hide();
							var index = $(".noticeMTM_title").index(this);
							$(this).parent().siblings().children().eq(index)
									.show();

						});

				$(".noticeMTM_title").eq(0).click();

				$(".subject").click(function() {
					var index = $(".subject").index(this);
					$(this).siblings(".subject_content").eq(index).toggle();

				});

			});
</script>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<section  style="width: 100%; margin: 0 auto; height: 1200px;"> 
	<div class="noticeMTM_wrap">

		<div class="noticeMTM_header">
			<div class="noticeMTM_title">1:1 ????????????</div>
			<div class="noticeMTM_title">????????????</div>
		</div>

		<script>
			$(document).ready(
					function() {
						$(".noticeMTM_sub_category").children().children(
								"select").hide();
						//sub ????????? 
						$(".1t").show();

						//????????? 
						$.ajax({
							url : "/ajaxCategory",
							type : "get",
							data : {
								sub : $(".1-1").val()
							},
							success : function(data) {
								$(".content").html(data);
							},
							error : function() {

							}
						});

						$(".total").change(
								function() {

									var array = new Array("????????????", "??????(??????)",
											"????????????", "???????????????", "??????/????????????",
											"???????????????", "??????", "????????????");

									var index = $(this).val();

									for (var i = 0; i < array.length; i++) {
										if (index === array[i]) {
											index = i + 1;
										}
									}
									$(".noticeMTM_sub_category").children()
											.children("select").hide();
									$("." + index + "t").show();

									if (index == 2) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".2-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 3) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".3-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 4) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".4-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 5) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".5-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 6) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".6-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 7) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".7-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 8) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".8-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									}
								});

						//?????? ???????????? ?????? ??? ????????? content ???

						$(".1t").change(function() {
							var array = new Array("????????????", "?????????", "??????", "??????");

							var index = $(this).val();

							for (var i = 0; i < array.length; i++) {
								if (index === array[i]) {
									index = i + 1;
								}
							}

							if (index == 1) {
								$.ajax({
									url : "/ajaxCategory",
									type : "get",
									data : {
										sub : $(".1-1").val()
									},
									success : function(data) {
										$(".content").html(data);
									},
									error : function() {

									}
								});
							} else if (index == 2) {
								$.ajax({
									url : "/ajaxCategory",
									type : "get",
									data : {
										sub : $(".1-2").val()
									},
									success : function(data) {
										$(".content").html(data);
									},
									error : function() {

									}
								});
							} else if (index == 3) {
								$.ajax({
									url : "/ajaxCategory",
									type : "get",
									data : {
										sub : $(".1-3").val()
									},
									success : function(data) {
										$(".content").html(data);
									},
									error : function() {

									}
								});
							} else if (index == 4) {
								$.ajax({
									url : "/ajaxCategory",
									type : "get",
									data : {
										sub : $(".1-4").val()
									},
									success : function(data) {
										$(".content").html(data);
									},
									error : function() {

									}
								});
							}
						});

						// sub 2

						$(".2t").change(function() {
							var array = new Array("????????????", "??????????????????", "??????");

							var index = $(this).val();

							for (var i = 0; i < array.length; i++) {
								if (index === array[i]) {
									index = i + 1;
								}
							}

							if (index == 1) {
								$.ajax({
									url : "/ajaxCategory",
									type : "get",
									data : {
										sub : $(".2-1").val()
									},
									success : function(data) {
										$(".content").html(data);
									},
									error : function() {

									}
								});
							} else if (index == 2) {
								$.ajax({
									url : "/ajaxCategory",
									type : "get",
									data : {
										sub : $(".2-2").val()
									},
									success : function(data) {
										$(".content").html(data);
									},
									error : function() {

									}
								});
							} else if (index == 3) {
								$.ajax({
									url : "/ajaxCategory",
									type : "get",
									data : {
										sub : $(".1-4").val()
									},
									success : function(data) {
										$(".content").html(data);
									},
									error : function() {

									}
								});
							}
						});

						// sub 3

						$(".3t").change(
								function() {
									var array = new Array("?????????", "??????", "????????????",
											"??????", "?????????", "??????");

									var index = $(this).val();

									for (var i = 0; i < array.length; i++) {
										if (index === array[i]) {
											index = i + 1;
										}
									}

									if (index == 1) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".3-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 2) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".3-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 3) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".3-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 4) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".3-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 5) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".3-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 6) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".1-4").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									}
								});

						// sub 4

						$(".4t").change(
								function() {
									var array = new Array("????????????", "??????.??????",
											"???????????????(??????)", "??????");

									var index = $(this).val();

									for (var i = 0; i < array.length; i++) {
										if (index === array[i]) {
											index = i + 1;
										}
									}

									if (index == 1) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".4-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 2) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".4-2").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 3) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".4-2").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 4) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".1-4").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									}
								});

						// sub 5

						$(".5t").change(function() {
							var array = new Array("??????", "????????????", "??????");

							var index = $(this).val();

							for (var i = 0; i < array.length; i++) {
								if (index === array[i]) {
									index = i + 1;
								}
							}

							if (index == 1) {
								$.ajax({
									url : "/ajaxCategory",
									type : "get",
									data : {
										sub : $(".5-1").val()
									},
									success : function(data) {
										$(".content").html(data);
									},
									error : function() {

									}
								});
							} else if (index == 2) {
								$.ajax({
									url : "/ajaxCategory",
									type : "get",
									data : {
										sub : $(".5-1").val()
									},
									success : function(data) {
										$(".content").html(data);
									},
									error : function() {

									}
								});
							} else if (index == 3) {
								$.ajax({
									url : "/ajaxCategory",
									type : "get",
									data : {
										sub : $(".1-4").val()
									},
									success : function(data) {
										$(".content").html(data);
									},
									error : function() {

									}
								});
							}
						});

						// sub 6

						$(".6t").change(
								function() {
									var array = new Array("???", "??????", "??????????????????",
											"????????????", "??????");

									var index = $(this).val();

									for (var i = 0; i < array.length; i++) {
										if (index === array[i]) {
											index = i + 1;
										}
									}

									if (index == 1) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".6-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 2) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".6-2").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 3) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".6-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 4) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".6-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 5) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".1-4").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									}
								});

						// sub 7

						$(".7t").change(function() {
							var array = new Array("????????????", "??????");

							var index = $(this).val();

							for (var i = 0; i < array.length; i++) {
								if (index === array[i]) {
									index = i + 1;
								}
							}

							if (index == 1) {
								$.ajax({
									url : "/ajaxCategory",
									type : "get",
									data : {
										sub : $(".7-1").val()
									},
									success : function(data) {
										$(".content").html(data);
									},
									error : function() {

									}
								});
							} else if (index == 2) {
								$.ajax({
									url : "/ajaxCategory",
									type : "get",
									data : {
										sub : $(".1-4").val()
									},
									success : function(data) {
										$(".content").html(data);
									},
									error : function() {

									}
								});
							}
						});

						// sub 8

						$(".8t").change(
								function() {
									var array = new Array("????????????", "??????????????????",
											"????????????", "??????", "??????");

									var index = $(this).val();

									for (var i = 0; i < array.length; i++) {
										if (index === array[i]) {
											index = i + 1;
										}
									}

									if (index == 1) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".8-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 2) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".8-2").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 3) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".8-1").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 4) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".8-4").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									} else if (index == 5) {
										$.ajax({
											url : "/ajaxCategory",
											type : "get",
											data : {
												sub : $(".1-4").val()
											},
											success : function(data) {
												$(".content").html(data);
											},
											error : function() {

											}
										});
									}
								});
					});
		</script>

		<div class="noticeMTM_article">
			<div class="noticeMTM">
				<form method="post" action="/noticeMTMInsert"
					enctype="multipart/form-data">
					<div class="noticeMTM_main_category">
						<div>

							<select class="total" name="main">
								<option selected class="1" value="????????????">????????????</option>
								<option class="2" value="??????(??????)">??????(??????)</option>
								<option class="3" value="????????????">????????????</option>
								<option class="4" value="???????????????">???????????????</option>
								<option class="5" value="??????/????????????">??????/????????????</option>
								<option class="6" value="???????????????">???????????????</option>
								<option class="7" value="??????">??????</option>
								<option class="8" value="????????????">????????????</option>
							</select>
						</div>
					</div>
					<div class="noticeMTM_sub_category">
						<div>
							<select class="1t" name="sub">
								<option selected class="1-1" value="????????????">????????????</option>
								<option class="1-2" value="?????????">?????????</option>
								<option class="1-3" value="??????">??????</option>
								<option class="1-4" value="??????">??????</option>
							</select>
							 <select class="2t" name="sub">
								<option class="2-1" value="????????????">????????????</option>
								<option class="2-2" value="??????????????????">??????????????????</option>
								<option class="2-3" value="??????">??????</option>
							</select>
							 <select class="3t" name="sub">
								<option class="3-1" value="?????????">?????????</option>
								<option class="3-2" value="??????">??????</option>
								<option class="3-3" value="????????????">????????????</option>
								<option class="3-4" value="??????">??????</option>
								<option class="3-5" value="?????????">?????????</option>
								<option class="3-6" value="??????">??????</option>
							</select>
							 <select class="4t" name="sub">
								<option class="4-1" selected value="????????????">????????????</option>
								<option class="4-2" value="??????.??????">??????.??????</option>
								<option class="4-3" value="???????????????(??????)">???????????????(??????)</option>
								<option class="4-4" value="??????">??????</option>
							</select> 
							<select class="5t" name="sub">
								<option class="5-1" value="??????">??????</option>
								<option class="5-2" value="????????????">????????????</option>
								<option class="5-3" value="??????">??????</option>
							</select> 
							<select class="6t" name="sub">
								<option class="6-1" value="???">???</option>
								<option class="6-2" value="??????">??????</option>
								<option class="6-3" value="??????????????????">??????????????????</option>
								<option class="6-4" value="????????????">????????????</option>
								<option class="6-5" value="??????">??????</option>
							</select>
							 <select class="7t" name="sub">
								<option class="7-1" value="????????????">????????????</option>
								<option class="7-2" value="??????">??????</option>
							</select> 
							<select class="8t" name="sub">
								<option class="8-1"  value="??????">????????????</option>
								<option class="8-2" value="??????????????????">??????????????????</option>
								<option class="8-3" value="????????????">????????????</option>
								<option class="8-4" value="??????">??????</option>
								<option class="8-5" value="??????">??????</option>
							</select>
						</div>

					</div>

					<div class="noticeMTM_content">
						<textarea class="content" name="content"></textarea>
					</div>
					<script>
						var sel_file = [];
						$(document).ready(function() {
							$(".input_img").on("change", handleImgFileSelect);
						});

						function handleImgFileSelect(e) {
							var files = e.target.files;
							var filesArr = Array.prototype.slice.call(files);

							filesArr
									.forEach(function(f) {
										if (!f.type.match("image.*")) {
											alert("???????????? ????????? ???????????? ???????????????.");
											return;
										}

										sel_file.push(f);

										var reader = new FileReader();
										reader.onload = function(e) {
											var img_html = "<img src=\"" +e.target.result+"\" />";
											$(".image").append(img_html);
										}
										reader.readAsDataURL(f);
									});
						}
					</script>
					<style>
.image img {
	width: 200px;
}
</style>
					<div class="footer">
						<div class="image" style="width: 1000px;"></div>
						<div class="file">
							<input type="file" name="filename"
								class="input_img" value="????????????">
						</div>
						<input type="hidden" name="no" value="<%=m.getMemberNo()%>">
						<div class="submit" style="margin: ">
						 <input type="submit" style="background-color: #285226; width: 100px; color: #EAEAEA; border-radius: 3px;"  value="????????????" class="btn btn-primary">
							<!-- <button type="submit" style="background-color: white;">????????????</button> -->
						</div>

					</div>
				</form>
			</div>

			<div class="noticeMTM">
				<%
					for (NoticeMTM mtm : list) {
				%>
				<%
					if (mtm.getMemberMTMNo() == m.getMemberNo()) {
				%>
				<div class="subject">
					<p>
						<%
							if (mtm.getNoticeMTMAnswerState() == 0) {
						%>
						<span><%=mtm.getNoticeMTMMainCategory()%> > <%=mtm.getNoticeMTMSubCategory()%></span>
						<span> ????????? </span>
						<%
							} else {
						%>
						<span><%=mtm.getNoticeMTMMainCategory()%> > <%=mtm.getNoticeMTMSubCategory()%></span>
						<span id=complete> ????????????(1) </span>
						<%
							}
						%>
					</p>
					<p><%=mtm.getNoticeMTMDate()%></p>
				</div>

				<div class="subject_content">
					<div class="subject_anwser_wrap">

						<%
							if (mtm.getNoticeMTMAnswerState() == 1) {
						%>
						<div class="subject_anwser" style="padding: 10px;">
							<img src="/img/tomatoMarketLogo.png"
								style="width: 30px; height: 35px; vertical-align: top;">
							<div class="su_an_wrap"
								style="display: inline-block; padding-left: 10px;">
								<span style="color: #C42026; display: block;"> ??????????????? ????????????
									??????</span> <span style="color: #C42026; display: block;"><%=mtm.getNoticeMTMAnswerDate()%></span>
							</div>
						</div>
						<div class="subject_anwser_final">
							<pre style="border: 0px;"><%=mtm.getNoticeMTMAnswerContent()%></pre>
						</div>
						<%
							}
						%>
					</div>

					<div class="subject_content_wrap">
						<div class="subject_content1" style="padding-top: 10px;">
							<span style="padding-left: 5px;">????????????</span>
							<p style="padding-left: 5px;"><%=mtm.getNoticeMTMDate()%></p>
						</div>
						<div class="subject_content_final">
							<pre style="border: 0px;"><%=mtm.getNoticeMTMContent()%></pre>
						</div>
					</div>
				</div>
				<%
					}
				%>
				<%
					}
				%>
			</div>

		</div>
	</div>
</section>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>