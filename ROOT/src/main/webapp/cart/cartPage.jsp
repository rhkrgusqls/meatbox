<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>미트박스 :: 1등 고기 직거래</title>
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/common.min.css" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/style.min.css" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/renew.min.css" />
    <script src="https://static-cdn.meatbox.co.kr/js/jquery/jquery-1.12.4.min.js"></script>
</head>
<body>

    <%-- ✅ 헤더 인클루드 --%>
    <jsp:include page="/include/header.jsp" />

    <div class="container">
        <div id="contents" class="inner">
            <div id="myOrderPage" class="basketPage">
                <div class="cart_order">

                    <%-- ✅ 장바구니 상단 타이틀 영역 --%>
                    <div class="cart_top">
                        <div class="cart_title top_title after">
                            <strong class="cart_order_title">
                                <img src="https://static-cdn.meatbox.co.kr/img/fo/cart_order/cart_top_title.png" alt="장바구니" />
                            </strong>
                            <ul class="after">
                                <li class="on"><span><img src="https://static-cdn.meatbox.co.kr/img/fo/cart_order/order_step01.png" alt="01" /></span><em>장바구니</em></li>
                                <li><span><img src="https://static-cdn.meatbox.co.kr/img/fo/cart_order/order_step02.png" alt="02" /></span><em>주문/결제</em></li>
                                <li><span><img src="https://static-cdn.meatbox.co.kr/img/fo/cart_order/order_step03.png" alt="03" /></span><em>주문완료</em></li>
                            </ul>
                        </div>
                    </div>

                    <%-- ✅ 배송지 선택 영역 인클루드 --%>
                    <jsp:include page="/cart/cart_delivery.jsp" />

                    <%-- ✅ 상품 탭 영역 인클루드 --%>
                    <jsp:include page="/cart/cart_tab.jsp" />

                    <%-- ✅ 상품 리스트 (product_list.jsp) 인클루드 --%>
                    <div class="common-pay-style">
                        <div class="cart_info_wrap">
                            <jsp:include page="/cart/cart_product_list.jsp" />
                            <jsp:include page="/cart/cart_button.jsp" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- ✅ 푸터 인클루드 --%>
    <jsp:include page="/include/footer.jsp" />

</body>
</html>