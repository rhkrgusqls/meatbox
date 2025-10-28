<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<main class="main-content order-detail">
    <header class="page-header">
        <h1>주문 상세 정보</h1>
    </header>
    <style>
    /* 주문 상세 보기 - 여백 및 가독성 개선 */
    .order-detail .content-box { padding: 24px; }
    .order-detail .content-box + .content-box { margin-top: 18px; }
    .order-detail .detail-table th, .order-detail .detail-table td { padding: 10px 16px; line-height: 1.55; }
    .order-detail .detail-table th { color: #5a6a85; width: 160px; }
    .order-detail .product-table { width: 100%; border-collapse: separate; border-spacing: 0 10px; }
    .order-detail .product-table thead th { color: #5a6a85; font-weight: 600; padding: 10px 12px; }
    .order-detail .product-table tbody td { background: #fff; padding: 12px 14px; border-top: 1px solid #eef0f4; border-bottom: 1px solid #eef0f4; }
    .order-detail .product-table tbody tr td:first-child { border-left: 1px solid #eef0f4; border-radius: 8px 0 0 8px; }
    .order-detail .product-table tbody tr td:last-child { border-right: 1px solid #eef0f4; border-radius: 0 8px 8px 0; }
    .order-detail .product-image { width: 120px; height: 120px; object-fit: cover; border-radius: 8px; }
    .order-detail .btn-group { margin-top: 24px; }
    </style>

        <%-- 주문 기본 정보 --%>
        <div class="content-box narrow">
            <h2>주문 요약</h2>
            <%-- ✅ Action에서 전달된 orderDetail 객체 사용 --%>
            <c:if test="${not empty orderDetail}">
                <table class="detail-table">
                    <tr>
                        <th>주문번호</th>
                        <td>${orderDetail.orderId}</td>
                    </tr>
                    <tr>
                        <th>주문일시</th>
                        <td><fmt:formatDate value="${orderDetail.orderDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    </tr>
                    <tr>
                        <th>구매자 이름</th>
                         <%-- ✅ Action에서 전달된 userName 변수 사용 --%>
                         <td>${userName}</td> 
                    </tr>
                    <tr>
                        <th>주문 상태</th>
                        <td>
                            <c:choose>
                                <c:when test="${orderDetail.deliveryStatus == 'pending'}"><span class="status pending">결제 대기</span></c:when>
                                <c:when test="${orderDetail.deliveryStatus == 'completed'}"><span class="status completed">결제 완료</span></c:when>
                                <c:when test="${orderDetail.deliveryStatus == 'shipping'}"><span class="status shipping">배송 중</span></c:when>
                                <c:when test="${orderDetail.deliveryStatus == 'delivered'}"><span class="status delivered">배송 완료</span></c:when>
                                <c:when test="${orderDetail.deliveryStatus == 'cancelled'}"><span class="status cancelled">주문 취소</span></c:when>
                                <c:otherwise><span class="status unknown">${orderDetail.deliveryStatus}</span></c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </table>
            </c:if>
            <c:if test="${empty orderDetail}">
                <p>주문 정보를 불러올 수 없습니다.</p>
            </c:if>
        </div>

        <%-- 주문 상품 정보 --%>
        <div class="content-box">
            <h2>주문 상품</h2>
            <table class="product-table">
                <colgroup>
                    <col style="width: 140px;">   <%-- 이미지 --%>
                    <col>                          <%-- 상품명 --%>
                    <col style="width: 180px;">   <%-- 옵션명 --%>
                    <col style="width: 90px;">    <%-- 수량 --%>
                    <col style="width: 130px;">   <%-- 옵션 가격 --%>
                    <col style="width: 130px;">   <%-- 합계 --%>
                </colgroup>
                <thead>
                    <tr>
                        <th>이미지</th>
                        <th>상품명</th>
                        <th>옵션명</th>
                        <th>수량</th> 
                        <th>옵션 가격</th>
                        <th>합계</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="totalProductPrice" value="0" /> 
                    <c:choose>
                         <%-- ✅ Action에서 수정한 productDetailList를 직접 사용하도록 변경 --%>
                        <c:when test="${not empty productDetailList}"> 
                            <c:forEach var="productDetail" items="${productDetailList}">
                                <%-- 🚨 주의: 이 로직은 상품 1개당 옵션 1개, 수량 1개라고 가정합니다. --%>
                                <%--    정확한 수량/옵션별 가격을 표시하려면 DAO 수정이 필요합니다. --%>
                                <c:set var="quantity" value="1" /> <%-- 임시 수량 --%>
                                <c:set var="pricePerItem" value="${productDetail.price}" /> <%-- 상품 기본 가격 사용 --%>
                                <c:set var="itemTotalPrice" value="${pricePerItem * quantity}" /> 
                                <c:set var="totalProductPrice" value="${totalProductPrice + itemTotalPrice}" />
                                
                                <tr>
                                     <td>
                                        <c:choose>
                                            <c:when test="${not empty productDetail.imageList}">
                                                <img src="${productDetail.imageList[0].dir}" alt="${productDetail.name} 이미지" class="product-image">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="https://via.placeholder.com/80x80" alt="${productDetail.name}" class="product-image">
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="product-name">${productDetail.name}</td> 
                                    <td>(옵션 정보 없음)</td> <%-- 옵션 정보 표시 불가 --%>
                                    <td>${quantity}</td> 
                                    <td><fmt:formatNumber value="${pricePerItem}" type="currency" currencySymbol=""/>원</td>
                                    <td><fmt:formatNumber value="${itemTotalPrice}" type="currency" currencySymbol=""/>원</td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                 <%-- ✅ colspan 수정 확인 --%>
                                <td colspan="6">주문된 상품 정보가 없습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

        <%-- 결제 정보 --%>
        <div class="content-box narrow">
            <h2>결제 정보</h2>
            <%-- ✅ orderDetail 객체 null 체크 확인 --%>
            <c:if test="${not empty orderDetail}">
                <table class="detail-table">
                     <tr>
                        <th>총 상품 금액</th>
                        <td><fmt:formatNumber value="${totalProductPrice}" type="currency" currencySymbol="₩"/></td>
                    </tr>
                     <tr>
                        <th>배송비</th>
                         <%-- ✅ orderDetail에서 배송비 가져오기 확인 --%>
                        <td><fmt:formatNumber value="${orderDetail.shippingFee}" type="currency" currencySymbol="₩"/></td> 
                    </tr>
                    <tr>
                        <th>총 할인 금액</th>
                        <td><fmt:formatNumber value="${orderDetail.discountAmount}" type="currency" currencySymbol="₩"/></td>
                    </tr>
                     <tr>
                        <th>사용 포인트</th>
                        <td><fmt:formatNumber value="${orderDetail.usedPoints}" type="number" groupingUsed="true"/> P</td>
                    </tr>
                     <tr>
                        <th>사용 예치금</th>
                         <td><fmt:formatNumber value="${orderDetail.usedDeposit}" type="currency" currencySymbol="₩"/></td>
                    </tr>
                     <tr>
                        <th>최종 결제 금액</th>
                         <%-- ✅ orderDetail의 finalPrice 사용 확인 (DAO에서 조회됨) --%>
                         <td><strong><fmt:formatNumber value="${orderDetail.finalPrice}" type="currency" currencySymbol="₩"/></strong></td>
                    </tr>
                     <tr>
                        <th>결제 수단</th>
                        <td>
                            <c:choose>
                                <c:when test="${orderDetail.paymentMethodId == 1}">신용카드</c:when> 
                                <c:when test="${orderDetail.paymentMethodId == 2}">계좌이체</c:when>
                                <c:when test="${orderDetail.paymentMethodId == 3}">휴대폰결제</c:when>
                                <c:otherwise>알 수 없음 (${orderDetail.paymentMethodId})</c:otherwise> 
                            </c:choose>
                        </td>
                    </tr>
                </table>
            </c:if>
             <c:if test="${empty orderDetail}">
                 <p>결제 정보를 표시할 수 없습니다.</p>
             </c:if>
        </div>

        <%-- 버튼 그룹 --%>
        <div class="btn-group">
            <%-- ✅ Action에서 전달된 pageNum 변수 사용 확인 --%>
            <%-- AdminOrderModifyForm.ac 컨트롤러 경로 확인 필요 --%>
            <button type="button" class="btn btn-primary" onclick="location.href='/admin/AdminOrderModify.ac?orderId=${orderDetail.orderId}&pageNum=${pageNum}'">주문 수정</button> 
            <button type="button" class="btn btn-danger" onclick="confirmDelete()">주문 삭제</button>
            <%-- AdminOrderViewAction.ac 컨트롤러 경로 확인 필요 --%>
            <button type="button" class="btn btn-secondary" onclick="window.history.go(-1)">뒤로가기</button>
        </div>
        
    
<script>
    function confirmDelete() {
        if (confirm("정말로 이 주문을 삭제하시겠습니까? 삭제 후 복구할 수 없습니다.")) {
            // ✅ Action에서 전달된 pageNum 변수 사용 확인
            // AdminOrderDelete.ac 컨트롤러 경로 확인 필요
            location.href = '/admin/AdminOrderDelete.ac?orderId=${orderDetail.orderId}&pageNum=${pageNum}'; 
        }
    }
</script>
</main>