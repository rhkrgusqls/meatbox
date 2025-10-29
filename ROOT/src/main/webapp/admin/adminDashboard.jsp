<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- 숫자 포맷팅을 위해 추가 --%>

<style>
    /* 대시보드 전용 KPI 카드 스타일 */
    .kpi-cards {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
        margin-bottom: 30px;
    }
    .card {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }
    .card h3 {
        font-size: 16px;
        color: #7f8c8d;
        margin-bottom: 10px;
    }
    .card .value {
        font-size: 28px;
        font-weight: bold;
    }
    .card .value .unit {
        font-size: 16px;
        font-weight: normal;
        margin-left: 5px;
    }
</style>

<main class="main-content">
    <header class="main-header">
        <h1>관리자 대시보드</h1>
    </header>

    <div class="kpi-cards">
        <div>
            <h2>📊 매출 현황</h2>
            <p>총 매출액 (배송 완료 기준):
                <strong><fmt:formatNumber value="${totalSales}" pattern="#,###" /> 원</strong>
            </p>
        </div>

        <hr>

        <div>
            <h2>📋 주문 현황</h2>
            <ul>
                <li>결제 대기: <strong><c:out value="${pendingCount}" /></strong> 건</li>
                <li>배송 중: <strong><c:out value="${shippedCount}" /></strong> 건</li>
                <li>배송 완료: <strong><c:out value="${deliveredCount}" /></strong> 건</li>
                <li>주문 취소: <strong><c:out value="${cancelledCount}" /></strong> 건</li>
            </ul>
        </div>
        <div class="card">
            <h3>전체 상품 수</h3>
            <p class="value">250<span class="unit">개</span></p>
        </div>
    </div>

    <div class="content-box">
        <h2>최근 주문 목록</h2>
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
                <tr>
                    <td>ORD20251017-001</td>
                    <td>user01</td>
                    <td>국내산 냉장 삼겹살 500g 외 1건</td>
                    <td>43,900원</td>
                    <td>2025-10-17 10:30</td>
                    <td><span class="status completed">결제 완료</span></td>
                </tr>
                 <tr>
                    <td>ORD20251017-002</td>
                    <td>user03</td>
                    <td>호주산 냉동 부채살 1kg</td>
                    <td>28,000원</td>
                    <td>2025-10-17 09:15</td>
                    <td><span class="status shipping">배송 중</span></td>
                </tr>
                <tr>
                    <td colspan="6" style="text-align:center; padding: 50px;">더 이상 최근 주문 내역이 없습니다.</td>
                </tr>
            </tbody>
        </table>
    </div>
</main>