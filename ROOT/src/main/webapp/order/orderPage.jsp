<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 사용을 위한 태그 라이브러리 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>미트박스 :: 1등 고기 직거래</title>
    <%-- =============================================================================== --%>
    <%--  공통 CSS 및 JS 라이브러리 링크 (프로젝트 내부 경로)                              --%>
    <%-- =============================================================================== --%>
    <link rel="stylesheet" href="<c:url value='/www.meatbox.co.kr/_next/static/css/5daa461e9f2acd13.css'/>" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="<c:url value='/www.meatbox.co.kr/_next/static/css/301e6ae4682e6b6b.css'/>" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="<c:url value='/www.meatbox.co.kr/_next/static/css/b7f7e2f11f5ab5a9.css'/>" type="text/css" media="all" charset="UTF-8" />
    <script type="text/javascript" src="<c:url value='/www.meatbox.co.kr/_next/static/chunks/fd9d1056-12c7034d2a06563c.js'/>" charset="UTF-8"></script>
</head>
<body>

<%-- 헤더 인클루드 --%>
<jsp:include page="/include/header.jsp" />

<main id="meatboxContent" class="meatbox_container">
    <div class="inner_global">
        <h2 class="page_title">주문/결제</h2>
        <div class="order_wrap">
            <div class="order_content">
                <%-- 주문자 정보 --%>
                <div class="order_section">
                    <h3 class="section_title">주문자 정보</h3>
                    <div class="order_table">
                        <table>
                            <colgroup>
                                <col style="width:150px;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>주문자</th>
                                    <td>${sessionScope.user_name}</td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>${sessionScope.user_email}</td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td>${sessionScope.user_phone}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <%-- 배송지 정보 --%>
                <div class="order_section">
                    <h3 class="section_title">배송지 정보</h3>
                    <div class="order_table">
                        <table>
                            <colgroup>
                                <col style="width:150px;">
                                <col>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>받는사람</th>
                                    <td><input type="text" name="recipient_name" value="${sessionScope.user_name}"></td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td><input type="text" name="recipient_phone" value="${sessionScope.user_phone}"></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>
                                        <input type="text" name="recipient_zipcode" placeholder="우편번호">
                                        <button type="button" class="btn_search_zipcode">주소검색</button>
                                        <input type="text" name="recipient_address1" placeholder="기본주소">
                                        <input type="text" name="recipient_address2" placeholder="상세주소">
                                    </td>
                                </tr>
                                <tr>
                                    <th>배송메모</th>
                                    <td><textarea name="delivery_memo"></textarea></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <%-- 주문상품 정보 --%>
                <div class="order_section">
                    <h3 class="section_title">주문상품</h3>
                    <div class="cart_list">
                        <%-- 장바구니 상품 목록을 반복문으로 표시 (JSTL 사용) --%>
                        <c:forEach var="item" items="${cart_list}">
                            <div class="cart_item">
                                <div class="item_info">
                                    <div class="item_thumb">
                                        <img src="${item.product_image}" alt="${item.product_name}">
                                    </div>
                                    <div class="item_desc">
                                        <p class="name">${item.product_name}</p>
                                        <p class="option">${item.product_option}</p>
                                    </div>
                                </div>
                                <div class="item_price">
                                    <span class="price">${item.price}</span>원
                                </div>
                                <div class="item_quantity">
                                    <span class="quantity">${item.quantity}</span>개
                                </div>
                                <div class="item_total">
                                    <span class="total">${item.price * item.quantity}</span>원
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <%-- 결제 정보 --%>
                <div class="order_section">
                    <h3 class="section_title">결제 정보</h3>
                    <div class="payment_info">
                        <dl>
                            <dt>총 상품금액</dt>
                            <dd><span id="total_product_price">0</span>원</dd>
                        </dl>
                        <dl>
                            <dt>배송비</dt>
                            <dd><span id="delivery_fee">0</span>원</dd>
                        </dl>
                        <dl class="total">
                            <dt>총 결제금액</dt>
                            <dd><span id="total_payment_price">0</span>원</dd>
                        </dl>
                    </div>
                    <div class="payment_method">
                        <h4>결제수단</h4>
                        <ul class="method_list">
                            <li><input type="radio" name="payment_method" value="card" checked> 신용카드</li>
                            <li><input type="radio" name="payment_method" value="bank"> 무통장입금</li>
                            <li><input type="radio" name="payment_method" value="kakao"> 카카오페이</li>
                        </ul>
                    </div>
                </div>

                <%-- 약관 동의 --%>
                <div class="order_section">
                    <div class="terms_agree">
                        <input type="checkbox" id="agree_all">
                        <label for="agree_all">주문내역 확인 및 결제 진행에 동의합니다.</label>
                    </div>
                    <div class="btn_wrap">
                        <button type="button" class="btn_order">결제하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%-- 푸터 인클루드 (푸터 파일이 있다면) --%>
<%-- <jsp:include page="/include/footer.jsp" /> --%>

<script>
// 간단한 스크립트 예시 (실제 구현 시에는 더 많은 기능이 필요합니다.)
$(document).ready(function(){
    // 총 상품금액, 배송비, 총 결제금액 계산 로직
    function calculateTotalPrice() {
        let totalProductPrice = 0;
        $('.cart_item').each(function(){
            let price = parseInt($(this).find('.price').text());
            let quantity = parseInt($(this).find('.quantity').text());
            totalProductPrice += price * quantity;
        });

        let deliveryFee = 3000; // 예시 배송비
        if (totalProductPrice >= 50000) { // 5만원 이상 무료배송
            deliveryFee = 0;
        }

        let totalPaymentPrice = totalProductPrice + deliveryFee;

        $('#total_product_price').text(totalProductPrice.toLocaleString());
        $('#delivery_fee').text(deliveryFee.toLocaleString());
        $('#total_payment_price').text(totalPaymentPrice.toLocaleString());
    }

    calculateTotalPrice();

    // 결제하기 버튼 클릭
    $('.btn_order').click(function(){
        if (!$('#agree_all').is(':checked')) {
            alert('주문내역 확인 및 결제 진행에 동의해주세요.');
            return;
        }

        // 결제 로직 추가
        alert('결제를 진행합니다.');
    });
});
</script>

</body>
</html>