<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 주문 관리</title>

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

    /* 메인 컨텐츠 스타일 */
    .main-content {
        flex-grow: 1;
        padding: 30px;
    }
    .content-box {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        margin-bottom: 30px;
    }
    .content-box h2 { font-size: 20px; margin-bottom: 20px; }
    .order-table { width: 100%; border-collapse: collapse; }
    .order-table th, .order-table td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ecf0f1; }
    .order-table th { background-color: #f9f9f9; font-weight: 600; }
    .order-table tbody tr:hover { background-color: #f5f5f5; }
    .status { padding: 4px 8px; border-radius: 12px; font-size: 12px; font-weight: bold; color: #fff; }
    .status.pending { background-color: #f1c40f; }
    .status.completed { background-color: #2ecc71; }
    .status.cancelled { background-color: #e74c3c; }
    
    /* 검색/필터 폼 스타일 */
    .filter-form { display: flex; gap: 10px; align-items: center; }
    .filter-form select,
    .filter-form input[type="date"] {
        padding: 8px 12px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px; font-family: inherit;
    }
    .btn { padding: 9px 18px; border: none; border-radius: 5px; cursor: pointer; font-weight: bold; text-decoration: none; display: inline-block; text-align: center; transition: background-color 0.2s; }
    .btn-primary { background-color: #F0504F; color: white; }
    .btn-primary:hover { background-color: #d94342; }
    .btn-small { font-size: 12px; padding: 4px 8px; color: white !important; border-radius: 4px; }
    .btn-detail { background-color: #2ecc71; }
</style>
</head>
<body>

<div class="admin-wrapper">
   	<main class="main-content">
        <header class="main-header">
            <h1>주문 관리</h1>
        </header>
        <div class="content-box">
             <form class="filter-form">
                <label>주문일:</label>
                <input type="date">
                <span>~</span>
                <input type="date">
                <select name="order_status">
                    <option value="">전체 상태</option>
                    <option value="pending">결제 대기</option>
                    <option value="completed">결제 완료</option>
                    <option value="shipping">배송 중</option>
                    <option value="delivered">배송 완료</option>
                    <option value="cancelled">주문 취소</option>
                </select>
                <button type="button" class="btn btn-primary">조회</button>
            </form>
        </div>
        <div class="content-box">
            <h2>주문 목록</h2>
            <table class="order-table">
                <thead>
                    <tr>
                        <th>주문번호</th>
                        <th>구매자 ID</th>
                        <th>결제 금액</th>
                        <th>주문일시</th>
                        <th>상태</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>ORD20251017-001</td>
                        <td>user01</td>
                        <td>43,900원</td>
                        <td>2025-10-17 10:30</td>
                        <td><span class="status completed">결제 완료</span></td>
                        <td><a href="#" class="btn-small btn-detail">상세보기</a></td>
                    </tr>
                    <tr>
                        <td>ORD20251017-002</td>
                        <td>user03</td>
                        <td>15,900원</td>
                        <td>2025-10-17 09:15</td>
                        <td><span class="status" style="background-color: #3498db;">배송 중</span></td>
                        <td><a href="#" class="btn-small btn-detail">상세보기</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </main>
</div>

</body>
</html>