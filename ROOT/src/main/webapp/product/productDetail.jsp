<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>${productDetail.name} - 미트박스</title>
    <%-- =============================================================================== --%>
    <%--  미트박스 페이지의 CSS 및 JS 라이브러리를 그대로 가져옵니다.                      --%>
    <%--  실제 프로젝트에서는 이 파일들을 다운로드하여 프로젝트 내부에 포함시켜야 합니다. --%>
    <%-- =============================================================================== --%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="https://static-cdn.meatbox.co.kr/img/fo/favicon.ico?t=20240409" type="image/x-icon" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/common.min.css" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/style.min.css" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/renew.min.css" type="text/css" media="all" charset="UTF-8" />
    <link type="text/css" rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/swiper/5.2.1/swiper.min.css" media="screen" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/lightslider/lightslider-1.1.6.min.css" type="text/css" media="screen" />

    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery-1.12.4.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/lightslider/lightslider-1.1.6.min.js" charset="UTF-8" ></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/elevatezoom/elevateZoom-3.0.8.min.js"></script>

    <style>
        /* 일부 스타일은 실제 사이트와 다를 수 있으므로, 필요에 따라 CSS 파일을 직접 참조하거나 수정해야 합니다. */
    </style>
</head>
<body>

    <%-- 헤더 부분은 생략하고 메인 컨텐츠에 집중합니다. --%>
    <%-- 실제 프로젝트에서는 header.jsp 등으로 분리하여 include 하는 것이 좋습니다. --%>

    <div id="white_box" class="container sub_inner">
        <div id="contents">
            <div id="view_wrap">
                <div class="prd_view after">
                    <div class="left_box">
                        <div class="item">
                            <%-- =============================================================================== --%>
                            <%--  상품 이미지 갤러리 (동적 데이터 적용)                                          --%>
                            <%-- =============================================================================== --%>
                            <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                                <c:forEach var="image" items="${productDetail.imageList}" varStatus="status">
                                    <li data-thumb="${image.dir}">
                                        <img src="${image.dir}" alt="${productDetail.name} 이미지 ${status.count}" />
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <div class="right_box">
                         <%-- =============================================================================== --%>
                         <%--  상품 기본 정보 (동적 데이터 적용)                                             --%>
                         <%-- =============================================================================== --%>
                        <ul class="top_info">
                            <li>
                                <strong class="prd_name malgun_st">${productDetail.name}</strong>
                                <span class="prd_price">
                                    <em>kg당&nbsp;<strong><fmt:formatNumber value="${productDetail.price}" pattern="#,###" />원</strong></em>
                                </span>
                            </li>
                            <li class="delivery_information">
                                <span class="absolute_txt">배송안내</span>
                                <div class="align_box">
                                   <%-- 배송 관련 정보는 복잡하므로 여기서는 간단히 표시합니다. --%>
                                   <p>배송 정보를 표시하는 영역입니다.</p>
                                </div>
                            </li>
                            <li>
                                배송비: <fmt:formatNumber value="${productDetail.delivery_fee}" pattern="#,###" />원
                            </li>
                            <li class="bott_info">
                                <dl>
                                    <dt>상품평</dt>
                                    <dd>
                                        <%-- 상품평 개수는 동적으로 가져와야 합니다. --%>
                                        <em id="mainReviewCnt">0</em> 건
                                    </dd>
                                </dl>
                            </li>
                        </ul>

                        <%-- =============================================================================== --%>
                        <%--  상품 옵션 선택 (동적 데이터 적용)                                             --%>
                        <%-- =============================================================================== --%>
                        <div class="select_box select_top">
                             <c:if test="${not empty productDetail.optionList}">
                                <select name="options" style="width:100%; padding:10px; font-size:16px;">
                                    <option value="">옵션을 선택해주세요.</option>
                                    <c:forEach var="option" items="${productDetail.optionList}">
                                        <option value="${option.option_id}">
                                            ${option.option_name} - ${option.option_detail}
                                            <c:if test="${option.price_of_option > 0}">
                                                (+<fmt:formatNumber value="${option.price_of_option}" pattern="#,###" />원)
                                            </c:if>
                                        </option>
                                    </c:forEach>
                                </select>
                            </c:if>
                            <c:if test="${empty productDetail.optionList}">
                                <p>선택 가능한 옵션이 없습니다.</p>
                            </c:if>
                        </div>

                        <div class="btn_box" style="margin-top: 30px;">
                            <a href="javascript:;" class="btn heart_btn">관심상품</a>
                            <button type="button" class="btn cart">장바구니</button>
                            <button type="button" class="btn buy">구매하기</button>
                        </div>
                    </div>
                </div>

                <%-- =============================================================================== --%>
                <%--  상품 상세 정보 탭 (구조만 적용)                                                --%>
                <%-- =============================================================================== --%>
                <div class="prd_detail_info">
                    <div class="tab_wrap">
                        <ul class="tab_style prd_top after _tabMain">
                            <li class="on"><a href="javascript:;">상품설명</a></li>
                            <li><a href="javascript:;">상품평<span>0</span></a></li>
                            <li><a href="javascript:;">상품문의</a></li>
                            <li><a href="javascript:;">유의사항</a></li>
                        </ul>
                    </div>
                    <div class="tab_con">
                        <div class="tab_con1 _tab">
                            <div class="explanation">
                                <div class="section_comm section_2">
                                    <%-- 상세 설명 이미지 (동적 데이터 적용) --%>
                                    <img src="${productDetail.detailDir}" alt="상품 상세 설명" style="width: 100%;" />
                                </div>
                                <div class="section_comm section_3">
                                    <h4>상세정보</h4>
                                    <table class="section_td">
                                        <%-- 상세정보 테이블 내용은 DB 데이터에 맞게 추가해야 합니다. --%>
                                        <tbody>
                                            <tr>
                                                <th class="first">판매자 노트</th>
                                                <td class="first">${productDetail.seller_note}</td>
                                            </tr>
                                             <tr>
                                                <th>재고</th>
                                                <td>${productDetail.quantity} 개</td>
                                            </tr>
                                            <%-- 기타 등등... --%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="tab_con3 _tab" style="display: none;">
                            상품평 내용이 여기에 표시됩니다.
                        </div>
                        <div class="comm_wr tab_con2 _tab" style="display: none;">
                            상품문의 내용이 여기에 표시됩니다.
                        </div>
                        <div class="tab_con4 _tab" style="display: none;">
                            주문전 유의사항 내용이 여기에 표시됩니다.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- 푸터 부분은 생략합니다. --%>

    <script type="text/javascript">
        // 페이지 로드 시 이미지 갤러리 초기화
        $(document).ready(function() {
            $('#image-gallery').lightSlider({
                gallery: true,
                item: 1,
                thumbItem: 5,
                slideMargin: 0,
                speed: 500,
                auto: true,
                loop: true,
                onSliderLoad: function() {
                    $('#image-gallery').removeClass('cS-hidden');
                }
            });

            // 탭 클릭 이벤트
            $('._tabMain li').on('click', function(e) {
                e.preventDefault();
                var index = $(this).index();
                $(this).addClass('on').siblings().removeClass('on');
                $('._tab').hide().eq(index).show();
            });
        });
    </script>
</body>
</html>