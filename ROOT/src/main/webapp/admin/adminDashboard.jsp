<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
        <div class="card">
            <h3>오늘 매출</h3>
            <p class="value">1,230,000<span class="unit">원</span></p>
        </div>
        <div class="card">
            <h3>신규 가입</h3>
            <p class="value">15<span class="unit">명</span></p>
        </div>
        <div class="card">
            <h3>처리 대기 주문</h3>
            <p class="value">5<span class="unit">건</span></p>
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