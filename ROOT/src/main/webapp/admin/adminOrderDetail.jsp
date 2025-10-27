<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 주문 상세</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Poppins:wght@900&display=swap" rel="stylesheet">
<style>
    /* === 기존 adminOrders.jsp 스타일과 동일 === */
    body, h1, h2, h3, p, table, th, td, dl, dt, dd { margin: 0; padding: 0; }
    body { font-family: 'Malgun Gothic', '맑은 고딕', sans-serif; background-color: #f4f7f6; color: #333; }
    a { text-decoration: none; color: inherit; }

    /* adminHome.jsp에 include될 경우 이 스타일은 adminHome.jsp에 있어야 할 수 있습니다 */
    /* .admin-wrapper { display: flex; min-height: 100vh; } */
    .main-content { flex-grow: 1; padding: 30px; } 
    
    .content-box { background-color: #fff; padding: 20px 30px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.05); margin-bottom: 30px; }
    .content-box h2 { font-size: 20px; margin-bottom: 25px; border-bottom: 1px solid #eee; padding-bottom: 15px; }
    
    /* 주문 상품 테이블 */
    .product-table { width: 100%; border-collapse: collapse; margin-top: 10px; }
    .product-table th, .product-table td { padding: 10px; text-align: center; border: 1px solid #ecf0f1; vertical-align: middle; /* 세로 중앙 정렬 추가 */ }
    .product-table th { background-color: #fdfdfd; font-weight: normal; font-size: 13px; color: #555; }
    .product-table td { font-size: 14px; }
    .product-table .product-name { text-align: left; }
    .product-table .product-image { width: 80px; height: 80px; object-fit: cover; /* 이미지 비율 유지하며 채우기 */ } /* 이미지 스타일 추가 */

    /* 상태 표시 스타일 */
    .status { padding: 4px 10px; border-radius: 12px; font-size: 12px; font-weight: bold; color: #fff; display: inline-block; text-align: center; min-width: 60px; }
    .status.pending { background-color: #f1c40f; } 
    .status.completed { background-color: #2ecc71; } 
    .status.shipping { background-color: #3498db; } 
    .status.delivered { background-color: #9b59b6; } 
    .status.cancelled { background-color: #e74c3c; } 
    .status.unknown { background-color: #95a5a6; } 

    /* 버튼 스타일 */
    .btn-group { margin-top: 30px; text-align: right; }
    .btn { padding: 9px 18px; border: none; border-radius: 5px; cursor: pointer; font-weight: bold; text-decoration: none; display: inline-block; text-align: center; transition: background-color 0.2s; margin-left: 8px; }
    .btn-primary { background-color: #F0504F; color: white; }
    .btn-primary:hover { background-color: #d94342; }
    .btn-secondary { background-color: #7f8c8d; color: white; }
    .btn-secondary:hover { background-color: #6c7a7b; }
    .btn-danger { background-color: #e74c3c; color: white; }
    .btn-danger:hover { background-color: #c0392b; }
    
    /* 상세 정보 테이블 레이아웃 */
    .detail-table { width: 100%; border-collapse: collapse; }
    .detail-table th, .detail-table td { padding: 12px 0; border-bottom: 1px solid #ecf0f1; vertical-align: middle; }
    .detail-table th { font-weight: 600; text-align: left; width: 150px; color: #555; padding-right: 15px; /* 오른쪽 여백 추가 */ }
    .detail-table td { color: #333; }
    .detail-table strong { color: #F0504F; font-size: 1.1em; } /* 최종 금액 강조 */

</style>
</head>
<body>

<%-- adminHome.jsp에 포함될 경우 이 div는 제거 --%>
<%-- <div class="admin-wrapper"> --%>
   	<main class="main-content">
        <header class="main-header">
            <h1>주문 상세 정보</h1>
        </header>

        <%-- 주문 기본 정보 --%>
        <div class="content-box">
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
        <div class="content-box">
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
                                <c:when test="${orderDetail.paymentMethodId == 1}">다빈카드</c:when> 
                                <c:when test="${orderDetail.paymentMethodId == 2}">동건카드</c:when>
                                <c:when test="${orderDetail.paymentMethodId == 3}">지섭카드</c:when>
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
            <button type="button" class="btn btn-danger" onclick="confirmDelete()">주문 삭제</button>
            <%-- AdminOrderViewAction.ac 컨트롤러 경로 확인 필요 --%>
            <button type="button" class="btn btn-secondary" onclick="window.history.go(-1)">뒤로가기</button>
        </div>
        
    </main>
<%-- </div> --%> <%-- adminHome.jsp에 포함될 경우 이 div는 제거 --%>

<script>
    function confirmDelete() {
        if (confirm("정말로 이 주문을 삭제하시겠습니까? 삭제 후 복구할 수 없습니다.")) {
            // ✅ Action에서 전달된 pageNum 변수 사용 확인
            // AdminOrderDelete.ac 컨트롤러 경로 확인 필요
            location.href = 'AdminOrderDelete.ac?orderId=${orderDetail.orderId}&pageNum=${pageNum}'; 
        }
    }
</script>

</body>
</html>