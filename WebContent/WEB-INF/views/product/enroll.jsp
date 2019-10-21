<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>물품 관리</title>
    <link rel="stylesheet" href="/css/product/enroll.css" type="text/css">
    <script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
    <script>
        $(function() {
            var sBtn = $(".e-nav > li");
            sBtn.find("a").click(function() {
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
                            <a href="#">
                                <img src="/WebContent/img/tomatoLogo.png" width="100%" height="100%">
                            </a>
                            <br>
                            <a href="#">
                                <img src="/WebContent/img/instagram.png" width="100%" height="100%">
                            </a>
                            <span>상점이름 - E05</span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <span>홈</span>
                        </a>
                    </li>
                    <li>
                        <a href="enroll.html" class="e-active">
                            <span>물품 등록</span>
                        </a>
                    </li>
                    <li>
                        <a href="list.html">
                            <span>물품 관리</span>
                        </a>
                    </li>
                    <li>
                        <a href="order.html">
                            <span>구매/판매 내역</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span>탈퇴하러가기</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="e-main">
        <div class="e-div_bg">
            <div class="e-main_head">
                <div class="e-main_head_top">
                    <h2>물품 등록</h2>
                    <ol class="e-main_head_title">
                        <li>
                            <a href="메인화면">Home</a>
                        </li>
                        /
                        <li>
                            <strong>물품 등록</strong>
                        </li>
                    </ol>
                    <select class="e-select_count">
                        <option value="10">10개씩</option>
                        <option value="20">20개씩</option>
                        <option value="30">30개씩</option>
                    </select>
                    <select class="e-select_status">
                        <option value="10">전체</option>
                        <option value="20">판매중</option>
                        <option value="30">판매완료</option>
                    </select>
                    <input type="text" class="e-search_name">
                    <button onclick="#" class="e-search_name_btn">검색</button>
                </div>
            </div>
            <div class="e-main_body">
                <div>
                    <div class="e-main_body_img">
                        <div class="e-main-body_imgcontent">
                            <h2>이미지 등록</h2>
                            <br>
                            <form action="" method="post" id="e-enrollimg">
                                <div class="e-enroll_img_btn">
                                    <span>이미지 업로드</span>
                                    <input type="file" name="file" class="e-enroll_box" multiple="multiple">
                                </div>
                            </form>
                            <br>
                            <div class="e-main_img">
                                <!--사진 여기 들어감!!!!-->
                                <img height="420" style="max-width: 592px; max-height: 500px;" src="" onerror="this.src=''">
                                <button id="e-img_del" class="e-img_del_btn">
                                    지우기
                                </button>
                            </div>
                            <ul class="e-img_list">
                                <li style="float:left;">
                                    <img class="e-input_img" src="">
                                </li>
                                <li>

                                </li>
                            </ul>
                            <h2>
                                <br>
                            </h2>
                            <br>
                            <span class="e-text_position">
                                * 상품 이미지는 640x640에 최적화 되어 있습니다.
                                <br>
                                - 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.
                                <br>
                                - 확대하기를 누를 경우 원본이미지를 확인할 수 있습니다.
                                <br>
                                - 사진을 클릭 후 이동하여 등록순서를 변경할 수 있습니다.
                                <br>
                                - 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.
                                <br>
                                최대 지원 사이즈인 640 X 640 으로 리사이즈 해서 올려주세요.
                                <br>
                            </span>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="e-item_status_back">
            <!-- 상품 기본정보 들어감!!! -->
            <div class="e-item_status_set">
                <div>
                    <h2>물품정보</h2>
                    <div>
                        <div class="e-item_main_back">
                            <fieldset class="e-item_main">
                                <div class="e-item_menu">
                                    <label class="e-item_menu_label">카테고리 : </label>
                                    <div class="e-item_menu_cate">
                                        <select class="e-category_select">
                                            <option>카테고리를 선택해주세요</option>
                                            <option>a</option>
                                            <option>b</option>
                                            <option>c</option>
                                            <option>d</option>
                                            <option>e</option>
                                            <option>f</option>
                                        </select>
                                    </div>
                                </div>
                                <br>
                                <div class="e-item_menu">
                                    <br>
                                    <label class="e-item_menu_label">거래지역 :</label>
                                    <div class="e-item_menu_addr">
                                        <input type="text" class="e-form_control" placeholder="선호 거래 지역">
                                    </div>
                                </div>
                                <div class="e-item_menu">
                                    <br><br>
                                    <label class="e-item_menu_label">상태 :</label>
                                    <div class="e-item_menu_state">
                                        <select class="e-menu_state_form_control">
                                            <option>a</option>
                                            <option>b</option>
                                            <option>c</option>
                                            <option>d</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="e-item_menu">
                                    <br><br>
                                    <label class="e-item_menu_label">제목 :</label>
                                    <div class="e-item_menu_title">
                                        <input type="text" class="e-form_control_title" placeholder="제목(최대 40자)">
                                    </div>
                                </div>
                                <div class="e-item_menu">
                                    <br><br>
                                    <label class="e-item_menu_label">가격 :</label>
                                    <div class="e-item_menu_price">
                                        <input type="number" class="e-form_control_price" placeholder="10000(가격은 숫자로만 입력)">
                                        <div class="e-service_check">
                                            <label class="e-checkbox_inline">
                                                <input id="input_service_check" type="checkbox">
                                                택배비 포함
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="e-item_menu">
                                    <br>
                                    <label class="e-item_menu_label">설명 :</label>
                                    <div class="e-item_menu_comment">
                                        <textarea class="e-form_comment" rows="7" placeholder="상품설명은 2000자 까지 가능합니다."></textarea>
                                        <div>
                                            <span style="float: right;">/2000</span>
                                            <span id="e-comment_count" style="float: right; color: rgb(0,0,0);">0</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="e-item_menu">
                                    <br>
                                    <label class="e-item_menu_label">수량 :</label>
                                    <div class="e-item_menu_count">
                                        <input type="text" class="e-item_count" placeholder="1" value="1">
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div class="e-item_pay">
                        <div class="e-item_upload">
                            <form action="" method="post" class="e-upload_btn">
                                <div class="e-upload_text">
                                    물품 등록
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body></html>
