<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 대시보드</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Poppins:wght@900&display=swap" rel="stylesheet">
<style>
    /* 기본 스타일 초기화 */
    body, h1, h2, h3, ul, p, table, th, td { margin: 0; padding: 0; }
    body { font-family: 'Malgun Gothic', '맑은 고딕', sans-serif; background-color: #f4f7f6; color: #333; }
    ul { list-style: none; }
    a { text-decoration: none; color: inherit; }

    /* 전체 레이아웃 */
    .admin-wrapper { display: flex; min-height: 100vh; }

    /* 사이드바 스타일 */
    .sidebar {
        width: 230px;
        background-color: #F0504F; /* 붉은색 테마 */
        color: #ecf0f1;
        display: flex;
        flex-direction: column;
    }
    
    /* (✅ 수정) 사이드바 헤더를 이미지에 맞게 변경 */
    .sidebar-header {
        padding: 3px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-bottom: 1px solid #D34D4A;
        height: 80px; /* 로고 높이에 맞게 헤더 높이 고정 */
    }
    .sidebar-logo {
        max-width: 100%; /* 사이드바 너비에 맞게 최대 너비 설정 */
        height: auto; /* 이미지 비율 유지 */
        transition: transform 0.3s ease; /* 부드러운 전환 효과 */
    }
    .sidebar-logo:hover {
        transform: scale(1.05); /* 호버 시 살짝 확대 */
    }
    
    .sidebar-nav { flex-grow: 1; }
    .sidebar-nav ul li a {
        display: block;
        padding: 15px 20px;
        transition: background-color 0.2s;
    }
    .sidebar-nav ul li a:hover, .sidebar-nav ul li.active a {
        background-color: #E76A67;
    }
    .sidebar-footer {
        padding: 20px;
        text-align: center;
        font-size: 12px;
        border-top: 1px solid #E34E4A;
        background-color: #D34D4A;
        color: #ffffff;
        transition: all 0.3s ease;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.2);
	}
	.sidebar-footer:hover {
	    background-color: #BF3C39;
	    box-shadow: 0 6px 12px rgba(0,0,0,0.35);
	    transform: translateY(-3px);
	}

    /* 메인 컨텐츠 스타일 */
    .main-content {
        flex-grow: 1;
        padding: 30px;
    }
    .main-header h1 {
        font-size: 28px;
        margin-bottom: 30px;
    }

    /* KPI 카드 스타일 */
    .kpi-cards {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
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

    /* 최근 주문 테이블 스타일 */
    .recent-orders {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }
    .recent-orders h2 {
        font-size: 20px;
        margin-bottom: 20px;
    }
    .order-table {
        width: 100%;
        border-collapse: collapse;
    }
    .order-table th, .order-table td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ecf0f1;
    }
    .order-table th {
        background-color: #f9f9f9;
        font-weight: 600;
    }
    .order-table tbody tr:hover {
        background-color: #f5f5f5;
    }
    .status {
        padding: 4px 8px;
        border-radius: 12px;
        font-size: 12px;
        font-weight: bold;
    }
    .status.pending { background-color: #f1c40f; color: #fff; }
    .status.completed { background-color: #2ecc71; color: #fff; }
    .status.cancelled { background-color: #e74c3c; color: #fff; }
</style>
</head>
<body>

<div class="admin-wrapper">
    <aside class="sidebar">
        
        <div class="sidebar-header">
            <a href="/admin/dashboard.do">
                
                <img src="	https://static-cdn.meatbox.co.kr/img/renew/logo-row-ko.svg" alt="미트박스 로고" class="sidebar-logo">
            </a>
        </div>
        <nav class="sidebar-nav">
            <ul>
                <li class="active"><a href="/admin/dashboard.do">대시보드</a></li>
                <li><a href="/admin/users.do">회원 관리</a></li>
                <li><a href="/admin/products.do">상품 관리</a></li>
                <li><a href="/admin/orders.do">주문 관리</a></li>
                <li><a href="/admin/stats.do">통계</a></li>
            </ul>
        </nav>
        <div class="sidebar-footer">
            <a href="/logout.do">로그아웃</a>
        </div>
    </aside>

    <main class="main-content">
        <header class="main-header">
            <h1>관리자 대시보드</h1>
        </header>

        <div class="kpi-cards">
            <div class="card">
                <h3>오늘 매출</h3>
                <p class="value"><span class="unit">원</span></p>
            </div>
            <div class="card">
                <h3>신규 가입</h3>
                <p class="value"><span class="unit">명</span></p>
            </div>
            <div class="card">
                <h3>처리 대기 주문</h3>
                <p class="value"><span class="unit">건</span></p>
            </div>
            <div class="card">
                <h3>전체 상품 수</h3>
                <p class="value"><span class="unit">개</span></p>
            </div>
        </div>

        <div class="recent-orders">
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
                            <td colspan="6" style="text-align:center; padding: 50px;">최근 주문 내역이 없습니다.</td>
                        </tr>
                    
                </tbody>
            </table>
        </div>
    </main>
</div>

</body>
</html>

