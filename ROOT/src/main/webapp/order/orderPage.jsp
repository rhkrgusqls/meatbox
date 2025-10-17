<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 사용을 위한 태그 라이브러리 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>미트박스 :: 1등 고기 직거래</title>
    <meta property="og:image" content="https://www.meatbox.co.kr/img/co/meatboxOgImage.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="육류 4,500 + 식재료 2,000개! 미트박스와 최대 30% 원가절감 해볼까요?" />

</head>
<body>

<%-- 헤더 인클루드 --%>
<jsp:include page="/include/header.jsp" />

<%-- =============================================================================== --%>
<%--  HTML 본문 내용 시작 (orderPage.html 기반)                                     --%>
<%-- =============================================================================== --%>
<div class="container tossPay_newUser_page">
    <div id="contents" class="inner">
        <div id="myOrderPage" class="common-pay-style">
            <div class="cart_order">
                <div class="cart_top">
                    <div class="cart_title top_title after">
                        <strong class="cart_order_title"><img src="https://static-cdn.meatbox.co.kr/img/fo/cart_order/cart_top_title02.png" alt="주문/결제"></strong>
                        <ul class="after">
                            <li><span><img src="https://static-cdn.meatbox.co.kr/img/fo/cart_order/order_step01.png" alt="01"></span><em>장바구니</em></li>
                            <li class="on"><span><img src="https://static-cdn.meatbox.co.kr/img/fo/cart_order/order_step02.png" alt="02"></span><em>주문/결제</em></li>
                            <li><span><img src="https://static-cdn.meatbox.co.kr/img/fo/cart_order/order_step03.png" alt="03"></span><em>주문완료</em></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="pay_form">
                <%-- 배송지 정보 --%>
                <div class="section">
                    <table class="pay_td">
                        <colgroup><col width="180px"/><col width="*"/></colgroup>
                        <tbody>
                            <tr class="_deliveryAD09">
                                <th class="deliv_select">배송지 선택
                                    <button type="button" class="common-box-btn dist_edit" onclick="FoTool.openAddrSetupListPage(1, 'order');">설정</button>
                                </th>
                                <td class="deliv_select_td">
                                    <ul class="radio_box after" id="addrList">
                                        <%-- 장바구니에 담긴 주소 정보가 동적으로 이곳에 추가됩니다. --%>
                                    </ul>
                                </td>
                            </tr>
                            <tr class="_deliveryAddr _deliveryAD09">
                                <th>주소</th>
                                <td>
                                    <div class="addr_info">
                                        <input type="hidden" value="" name="recv_zip_cd" id="recv_zip_cd"/>
                                        <input type="text" class="addr addr1" value="${addressInfo.city} ${addressInfo.district} ${addressInfo.neighborhood}" name="recv_addr1" id="recv_addr1" style="display: none;"/>
                                        <input type="text" class="addr addr2" value="${addressInfo.detailAddress}" name="recv_addr2" id="recv_addr2" style="display: none;"/>
                                        <span class="my_addr" id="addr_text">${addressInfo.city} ${addressInfo.district} ${addressInfo.neighborhood} ${addressInfo.detailAddress}</span>
                                        <button type="button" class="btn-ty2 gray" style="margin-left: 10px;">주소검색</button>
                                    </div>
                                </td>
                            </tr>
                             <tr class="_deliveryAddr _deliveryAlways">
                                <th class="line_height"><em>받는 분</em></th>
                                <td>
                                    <input type="text" class="width200 input_wid order_name" name="recv_nm" maxlength="20" placeholder="이름을 입력하세요" value="${user_name}"/>
                                </td>
                            </tr>
                            <tr class="_notDeliveryAD09">
                                <th class="line_height"><em>연락처</em></th>
                                <td>
                                    <input type="tel" class="width200 input_wid ph_num" value="${user_phone}" name="recv_cell_no" maxlength="13" placeholder="숫자만 입력하세요"/>
                                </td>
                            </tr>
                             <tr>
                                <th class="line_height"><em>배송 메모</em></th>
                                <td>
                                    <div class="deliv_memo">
                                        <span class="memo">
                                            <textarea maxlength="200" placeholder="배송 시 요청사항을 입력해주세요. (최대 200자)" name="recv_msg"></textarea>
                                        </span>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <%-- 주문상품 정보 --%>
                <div class="cart_order">
                    <div class="cart_info_wrap">
                        <div class="cart_info">
                            <div class="order_list_wrap">
                                <div class="order_title">
                                    <h3>주문상품</h3>
                                </div>
                                <div class="new_table_wrap">
                                    <table class="cart_td_wrap">
                                        <colgroup>
                                            <col width="*">
                                            <col width="120px">
                                            <col width="100px">
                                            <col width="140px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th>상품정보</th>
                                                <th>판매가</th>
                                                <th>수량</th>
                                                <th>주문금액</th>
                                            </tr>
                                        </thead>
                                        <tbody class="common-pay-td">
    <%-- 장바구니 상품 목록 (동적 생성) --%>
    <c:forEach var="item" items="${order_product_list}" varStatus="status">
        <tr class="cart_item">
            <td class="item_info_td">
                <div class="item_info_opt">
                    
                    <%-- [핵심 수정] 'product' 변수를 'item'으로 변경 --%>
                    <c:choose>
                        <c:when test="${not empty item.imageList and not empty item.imageList[0].dir}">
                            <img src="${item.imageList[0].dir}" alt="${item.name}" width="100" height="100">
                        </c:when>
                        <c:otherwise>
                            <%-- 대표 이미지가 없을 경우 표시할 기본 이미지 --%>
                            <img src="https://via.placeholder.com/100" alt="${item.name}" width="100" height="100">
                        </c:otherwise>
                    </c:choose>
                    
                    <strong class="prd_name">${item.name}</strong>
                    <input type="hidden" name="product_id" value="${item.product_id}">
                    <input type="hidden" name="product_option_id" value="${cart_list[status.index].optionId}">
                </div>
            </td>
            <td class="price">
                <span><fmt:formatNumber value="${order_option_list[status.index].price_of_option}" pattern="#,###" /></span>원
            </td>
            <td class="quantity">
                <span>${cart_list[status.index].quantity}</span>개
            </td>
            <td class="total_price">
                <span><fmt:formatNumber value="${order_option_list[status.index].price_of_option * cart_list[status.index].quantity}" pattern="#,###" /></span>원
            </td>
        </tr>
    </c:forEach>
</tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- 결제정보 --%>
                <div class="my-order-info">
                    <div class="my-order-price mPoint_price after">
                        <dl class="amount_area mPoint_payment">
                            <dt>총 상품금액</dt>
                            <dd><span id="total_product_price">0</span><span>원</span></dd>
                        </dl>
                        <dl class="amount_area mPoint_payment">
                            <dt>배송비</dt>
                            <dd><span>+</span><span id="delivery_fee">0</span><span>원</span></dd>
                        </dl>
                        <dl class="amount_area mPoint_payment total">
                            <dt>총 결제금액</dt>
                            <dd><span id="total_payment_price">0</span><span>원</span></dd>
                        </dl>
                    </div>
                </div>

                <%-- 결제수단 선택 --%>
                <div class="section">
                     <table class="pay_td">
                        <colgroup><col width="180px"/><col width="*"/></colgroup>
                        <tbody>
                            <tr>
                                <th class="line_height"><em>결제수단 선택</em></th>
                                <td>
                                    <div class="pay_choice">
                                        <ul class="method_list">
                                            <c:if test="${not empty paymentMethods}">
                                                <c:forEach var="paymentMethod" items="${paymentMethods}">
                                                    <li><label><input type="radio" name="payment_method" value="${paymentMethod.payment_method_id}"> ${paymentMethod.provider}</label></li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${empty paymentMethods}">
                                                <li>등록된 결제수단이 없습니다.</li>
                                            </c:if>
                                        </ul>
                                        <button type="button" onclick="location.href='/payment/register.do'" class="common-btn-red" style="margin-top: 10px; padding: 5px 10px; font-size: 12px;">결제수단 등록</button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <%-- 약관동의 및 결제하기 --%>
                <div class="last_pay_step">
                    <div class="agree_box">
                         <input type="checkbox" id="agree_all">
                        <label for="agree_all">주문내역 확인 및 결제 진행에 동의합니다.</label>
                    </div>
                    <button type="button" class="common-big common-btn-style common-btn-red pay btn_order"><span class="orderBtn">결제하기</span></button>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- =============================================================================== --%>
<%--  HTML 본문 내용 끝                                                             --%>
<%-- =============================================================================== --%>


<%-- 푸터 인클루드 --%>
<jsp:include page="/include/footer.jsp" />

<form id="orderForm" action="/orderAction.do" method="post"></form>

<%-- Daum 주소 API 스크립트 --%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div id="___postLayer" style="display:none;border:5px solid;position:fixed;left:1%;margin-left:0;top:50px;margin-top:0;-webkit-overflow-scrolling:touch;z-index:19999;background-color:#FFFFFF;">
    <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" style="width:30px;height:30px;z-index:9999;cursor:pointer;position:absolute;right:-5px;top:-35px" alt="닫기 버튼">
</div>

<script>
// Daum 주소 API 매니저 (기존 HTML의 DaumMgr 활용)
(function() {
    var me = window.DaumMgr = {
        startup: function() {
            me.setVariables();
            me.setEvents();
        },
        setVariables: function() {
            me.$layerFld = $('#___postLayer');
        },
        setEvents: function() {
            me.$layerFld.find('IMG').click(function() { me.hide(); });
        },
        show: function (json, callback) {
            var daumPostcode = new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    $('#recv_zip_cd').val(data.zonecode); // 우편번호
                    $('#recv_addr1').val(data.roadAddress); // 도로명 주소
                    $('#addr_text').text(data.roadAddress); // 주소 텍스트 업데이트
                    $('#recv_addr2').focus(); // 상세주소로 포커스
                    
                    if (typeof(callback) === 'function') {
                        callback();
                    }
                    me.hide();
                },
                width : '100%',
                height : '100%',
                onclose: function() {
                    me.hide();
                }
            });
            daumPostcode.embed(me.$layerFld[0], { 'autoClose': true });
            me.$layerFld.show();
        },
        hide: function() {
            me.$layerFld.hide();
        }
    };
    $(function() {
        DaumMgr.startup();
        // 주소검색 버튼 이벤트
        $('.btn-ty2.gray').click(function(){
             DaumMgr.show();
        });
    });
})();


// 주문 페이지 관련 스크립트
$(document).ready(function(){
    function calculateTotalPrice() {
        let totalProductPrice = 0;
        $('.cart_item').each(function(){
            // JSTL로 생성된 가격 정보에서 콤마를 제거하고 숫자로 변환
            let priceText = $(this).find('.price span').text().replace(/,/g, '');
            let quantityText = $(this).find('.quantity span').text().replace(/,/g, '');
            
            let price = parseInt(priceText) || 0;
            let quantity = parseInt(quantityText) || 0;
            
            totalProductPrice += price * quantity;
        });

        let deliveryFee = totalProductPrice >= 50000 || totalProductPrice === 0 ? 0 : 3000;
        let totalPaymentPrice = totalProductPrice + deliveryFee;

        $('#total_product_price').text(totalProductPrice.toLocaleString());
        $('#delivery_fee').text(deliveryFee.toLocaleString());
        $('#total_payment_price').text(totalPaymentPrice.toLocaleString());
    }

    calculateTotalPrice();

    $('.btn_order').click(function(){
        if (!$('#agree_all').is(':checked')) {
            alert('주문내역 확인 및 결제 진행에 동의해주세요.');
            return;
        }

        let form = $('#orderForm');
        form.empty(); // 이전 데이터 제거

        // 상품 정보 추가
        $('.cart_item').each(function(index){
            let productId = $(this).find('input[name="product_id"]').val();
            let optionId = $(this).find('input[name="product_option_id"]').val();
            let quantity = parseInt($(this).find('.quantity span').text());

            for (let i = 0; i < quantity; i++) {
                form.append('<input type="hidden" name="product_id" value="' + productId + '">');
                form.append('<input type="hidden" name="product_option_id" value="' + optionId + '">');
            }
        });

        // 결제 수단 추가
        let paymentMethod = $('input[name="payment_method"]:checked').val();
        form.append('<input type="hidden" name="payment_method" value="' + paymentMethod + '">');

        form.submit();
    });
});
</script>

</body>
</html>