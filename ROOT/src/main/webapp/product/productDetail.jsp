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
                                   <p>배송 정보를 표시하는 영역입니다.</p>
                                </div>
                            </li>
                            <li>
                                배송비: <fmt:formatNumber value="${productDetail.delivery_fee}" pattern="#,###" />원
                            </li>
                            <li class="bott_info">
                                <dl>
                                    <dt>상품평</dt>
                                    <dd><em id="mainReviewCnt">0</em> 건</dd>
                                </dl>
                            </li>
                        </ul>

                        <%-- JavaScript가 값을 가져갈 수 있도록 각 요소에 id를 부여합니다. --%>
                        <input type="hidden" id="productId" name="productId" value="${productDetail.product_id}">

                        <div class="select_box select_top">
                            <c:if test="${not empty productDetail.optionList}">
                                <select id="optionId" name="optionId" style="width:100%; padding:10px; font-size:16px; margin-bottom:10px;">
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
                        </div>

                        <div style="margin-bottom: 20px;">
                            <label for="quantity">수량:</label>
                            <input type="number" id="quantity" name="quantity" value="1" min="1" style="width: 60px; text-align: center;">
                        </div>

                        <div class="btn_box">
                            <a href="javascript:;" class="btn heart_btn">관심상품</a>
                            <button type="button" class="btn cart" onclick="addToCart()">장바구니</button>
                            <button type="button" class="btn buy" onclick="buyNow()">구매하기</button>
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
    <jsp:include page="/include/footer.jsp" />

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
        
     // 페이지 하단의 <script> 태그 안의 addToCart 함수를 이걸로 교체해주세요.

        function addToCart() {
            console.log("1. '장바구니' 버튼 클릭됨. addToCart 함수 실행 시작.");

            // 2. 각 HTML 요소를 찾아서 변수에 담습니다.
            const productElement = document.getElementById('productId');
            const optionElement = document.getElementById('optionId');
            const quantityElement = document.getElementById('quantity');

            // 3. 각 요소가 제대로 찾아졌는지 콘솔에서 확인합니다.
            console.log("찾아온 productId 요소:", productElement);
            console.log("찾아온 optionId 요소:", optionElement);
            console.log("찾아온 quantity 요소:", quantityElement);

            // 4. 요소가 하나라도 없다면 에러 메시지를 보여주고 중단합니다.
            if (!productElement || !optionElement || !quantityElement) {
                alert('페이지에 필요한 id를 가진 요소(productId, optionId, quantity)가 없습니다. JSP 코드를 확인해주세요.');
                console.error("필수 요소를 찾지 못했습니다.");
                return;
            }

            // 5. 각 요소의 값을 가져옵니다.
            const productId = productElement.value;
            const optionId = optionElement.value;
            const quantity = quantityElement.value;

            console.log("추출된 productId 값:", productId);
            console.log("추출된 optionId 값:", optionId);
            console.log("추출된 quantity 값:", quantity);

            // 6. 옵션을 선택했는지 확인합니다.
            if (!optionId) {
                alert('옵션을 선택해주세요.');
                return;
            }

            // 7. 최종 URL을 만듭니다.
            const url = "/cart/cartAddAction.do?productId=" + productId
          + "&optionId=" + optionId
          + "&quantity=" + quantity;
            
            console.log("8. 생성된 최종 URL:", url);

            // 9. 페이지를 이동시킵니다.
            location.href = url;
        }
        function buyNow() {
            console.log("1. '구매하기' 버튼 클릭됨. buyNow 함수 실행 시작.");

            // 2. 페이지에서 상품 ID, 옵션 ID, 수량 정보를 가져옵니다.
            const productId = document.getElementById('productId').value;
            const optionId = document.getElementById('optionId').value;
            const quantity = document.getElementById('quantity').value;

            console.log("추출된 productId 값:", productId);
            console.log("추출된 optionId 값:", optionId);
            console.log("추출된 quantity 값:", quantity);

            // 3. 옵션을 선택했는지 반드시 확인합니다.
            if (!optionId) {
                alert('옵션을 선택해주세요.');
                return;
            }

            // 4. OrderController의 /buyNow.do로 보낼 URL을 생성합니다.
            // 컨트롤러가 받는 파라미터 이름(productSeq)에 맞춰서 URL을 만듭니다.
            const url = "/buyNow.do?productSeq=" + productId
                      + "&optionId=" + optionId
                      + "&quantity=" + quantity;
            
            console.log("5. 생성된 최종 '바로 구매' URL:", url);

            // 6. 생성된 URL로 페이지를 이동시켜 주문을 시작합니다.
            location.href = url;
        }
    </script>
    </script>
</body>
</html>