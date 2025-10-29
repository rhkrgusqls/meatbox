<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- 숫자 포맷팅을 위해 추가 --%>

<style>
    /* 대시보드 전체 레이아웃 */
    .dashboard-container {
        padding: 20px;
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        min-height: 100vh;
        width: 100%;
        max-width: none;
        margin: 0;
    }
    
    .main-content {
        width: 100% !important;
        max-width: none !important;
        margin: 0 !important;
        padding: 0 !important;
    }
    
    /* 전체 화면 사용을 위한 강제 설정 */
    .dashboard-container * {
        box-sizing: border-box;
    }
    
    .dashboard-container {
        margin-left: 0 !important;
        margin-right: 0 !important;
        padding-left: 20px !important;
        padding-right: 20px !important;
    }
    
    /* KPI 카드 그리드 */
    .kpi-cards {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 24px;
        margin-bottom: 32px;
        width: 100% !important;
        max-width: none !important;
    }
    
    /* 개별 KPI 카드 */
    .kpi-card {
        background: linear-gradient(145deg, #ffffff, #f0f0f0);
        padding: 24px;
        border-radius: 16px;
        box-shadow: 
            0 8px 32px rgba(0,0,0,0.1),
            0 2px 8px rgba(0,0,0,0.05);
        border: 1px solid rgba(255,255,255,0.2);
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
    }
    
    .kpi-card:hover {
        transform: translateY(-4px);
        box-shadow: 
            0 12px 40px rgba(0,0,0,0.15),
            0 4px 12px rgba(0,0,0,0.1);
    }
    
    .kpi-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
    }
    
    .kpi-card h3 {
        font-size: 14px;
        color: #64748b;
        margin-bottom: 12px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    
    .kpi-card .value {
        font-size: 32px;
        font-weight: 700;
        color: #1e293b;
        margin-bottom: 8px;
        line-height: 1.2;
    }
    
    .kpi-card .value .unit {
        font-size: 18px;
        font-weight: 500;
        color: #64748b;
        margin-left: 8px;
    }
    
    .kpi-card .icon {
        font-size: 24px;
        margin-bottom: 12px;
        opacity: 0.8;
    }
    
    /* 매출 현황 카드 */
    .sales-card {
        background: linear-gradient(145deg, #667eea, #764ba2);
        color: white;
    }
    
    .sales-card h3,
    .sales-card .value,
    .sales-card .value .unit {
        color: white;
    }
    
    /* 주문 현황 카드 */
    .order-status-card {
        background: linear-gradient(145deg, #f093fb, #f5576c);
        color: white;
    }
    
    .order-status-card h3,
    .order-status-card li {
        color: white;
    }
    
    .order-status-card ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    
    .order-status-card li {
        padding: 8px 0;
        border-bottom: 1px solid rgba(255,255,255,0.2);
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    
    .order-status-card li:last-child {
        border-bottom: none;
    }
    
    .order-status-card strong {
        font-size: 18px;
        font-weight: 700;
    }
    
    /* 상품 수 카드 */
    .product-count-card {
        background: linear-gradient(145deg, #4facfe, #00f2fe);
        color: white;
    }
    
    .product-count-card h3,
    .product-count-card .value,
    .product-count-card .value .unit {
        color: white;
    }
    
    /* 최근 주문 테이블 */
    .recent-orders {
        background: white;
        border-radius: 16px;
        padding: 24px;
        box-shadow: 
            0 8px 32px rgba(0,0,0,0.1),
            0 2px 8px rgba(0,0,0,0.05);
        border: 1px solid rgba(255,255,255,0.2);
        width: 100% !important;
        max-width: none !important;
    }
    
    .recent-orders h2 {
        color: #1e293b;
        font-size: 20px;
        font-weight: 700;
        margin-bottom: 20px;
        padding-bottom: 12px;
        border-bottom: 2px solid #e2e8f0;
    }
    
    .order-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 16px;
    }
    
    .order-table th {
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: white;
        padding: 16px 12px;
        text-align: left;
        font-weight: 600;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    
    .order-table th:first-child {
        border-top-left-radius: 8px;
    }
    
    .order-table th:last-child {
        border-top-right-radius: 8px;
    }
    
    .order-table td {
        padding: 16px 12px;
        border-bottom: 1px solid #e2e8f0;
        color: #475569;
        font-size: 14px;
    }
    
    .order-table tbody tr:hover {
        background-color: #f8fafc;
    }
    
    .order-table tbody tr:last-child td {
        border-bottom: none;
    }
    
    /* 주문 상태별 스타일 */
    .status {
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        display: inline-block;
    }
    
    .status.pending {
        background: linear-gradient(135deg, #fef3c7, #fbbf24);
        color: #92400e;
    }
    
    .status.shipping {
        background: linear-gradient(135deg, #dbeafe, #3b82f6);
        color: #1e40af;
    }
    
    .status.completed {
        background: linear-gradient(135deg, #d1fae5, #10b981);
        color: #065f46;
    }
    
    .status.cancelled {
        background: linear-gradient(135deg, #fee2e2, #ef4444);
        color: #991b1b;
    }
    
    /* 반응형 디자인 */
    @media (max-width: 1200px) {
        .kpi-cards {
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }
        
        .kpi-card:nth-child(3) {
            grid-column: 1 / -1;
            max-width: 50%;
            margin: 0 auto;
        }
    }
    
    @media (max-width: 768px) {
        .kpi-cards {
            grid-template-columns: 1fr;
            gap: 16px;
        }
        
        .kpi-card:nth-child(3) {
            grid-column: 1;
            max-width: 100%;
        }
        
        .dashboard-container {
            padding: 16px;
        }
        
        .order-table {
            font-size: 12px;
        }
        
        .order-table th,
        .order-table td {
            padding: 12px 8px;
        }
    }
    
    @media (max-width: 480px) {
        .kpi-card {
            padding: 16px;
        }
        
        .kpi-card .value {
            font-size: 24px;
        }
        
        .kpi-card .value .unit {
            font-size: 14px;
        }
    }
    
    /* 애니메이션 */
    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    .kpi-card,
    .recent-orders {
        animation: fadeInUp 0.6s ease-out;
    }
    
    .kpi-card:nth-child(2) {
        animation-delay: 0.1s;
    }
    
    .kpi-card:nth-child(3) {
        animation-delay: 0.2s;
    }
    
    .recent-orders {
        animation-delay: 0.3s;
    }
</style>

<div class="dashboard-container">
    <main class="main-content">
        <header class="main-header">
            <h1>관리자 대시보드</h1>
        </header>

        <div class="kpi-cards">
            <!-- 매출 현황 카드 -->
            <div class="kpi-card sales-card">
                <div class="icon">💰</div>
                <h3>총 매출액</h3>
                <p class="value">
                    <fmt:formatNumber value="${totalSales}" pattern="#,###" />
                    <span class="unit">원</span>
                </p>
                <p style="font-size: 12px; opacity: 0.8; margin: 0;">배송 완료 기준</p>
            </div>

            <!-- 주문 현황 카드 -->
            <div class="kpi-card order-status-card">
                <div class="icon">📋</div>
                <h3>주문 현황</h3>
                <ul>
                    <li>
                        <span>결제 대기</span>
                        <strong><c:out value="${pendingCount}" /> 건</strong>
                    </li>
                    <li>
                        <span>배송 중</span>
                        <strong><c:out value="${shippedCount}" /> 건</strong>
                    </li>
                    <li>
                        <span>배송 완료</span>
                        <strong><c:out value="${deliveredCount}" /> 건</strong>
                    </li>
                    <li>
                        <span>주문 취소</span>
                        <strong><c:out value="${cancelledCount}" /> 건</strong>
                    </li>
                </ul>
            </div>

            <!-- 상품 수 카드 -->
            <div class="kpi-card product-count-card">
                <div class="icon">📦</div>
                <h3>전체 상품 수</h3>
                <p class="value">
                    <c:out value="${totalProductCount}" />
                    <span class="unit">개</span>
                </p>
            </div>
        </div>

        <!-- 최근 주문 목록 -->
        <div class="recent-orders">
            <h2>📋 최근 주문 목록</h2>
        <table class="order-table">
            <thead>
                <tr>
                    <th>주문번호</th>
                    <th>구매자</th>
                    <th>상품명</th>
                    <th>결제 금액</th>
                    <th>주문일시</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty recentOrders}">
                        <c:forEach var="order" items="${recentOrders}">
                            <tr>
                                <td>ORD${order.orderId}</td>
                                <td>user${order.userIndex}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty order.productList}">
                                            <c:forEach var="product" items="${order.productList}" varStatus="status">
                                                <c:out value="${product.productName}" />
                                                <c:if test="${!status.last}">, </c:if>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            상품 정보 없음
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><fmt:formatNumber value="${order.finalPrice}" pattern="#,###" />원</td>
                                <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm" /></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${order.deliveryStatus == 'PENDING'}">
                                            <span class="status pending">결제 대기</span>
                                        </c:when>
                                        <c:when test="${order.deliveryStatus == 'SHIPPED'}">
                                            <span class="status shipping">배송 중</span>
                                        </c:when>
                                        <c:when test="${order.deliveryStatus == 'DELIVERED'}">
                                            <span class="status completed">배송 완료</span>
                                        </c:when>
                                        <c:when test="${order.deliveryStatus == 'CANCELLED'}">
                                            <span class="status cancelled">주문 취소</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status">${order.deliveryStatus}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="6" style="text-align:center; padding: 50px;">최근 주문 내역이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
        </div>
    </main>
</div>