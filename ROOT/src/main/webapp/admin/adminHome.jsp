<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@900&family=Poppins:wght@900&display=swap" rel="stylesheet">
<style>
    /* ===== 공통 스타일 ===== */
    /* 기본 스타일 초기화 */
    body, h1, h2, h3, ul, p, table, th, td {
        margin: 0;
        padding: 0;
    }
    body {
        font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
        background-color: #f4f7f6;
        color: #333;
        overflow: hidden; /* 스크롤바 숨김 */
    }
    ul { list-style: none; }
    a { text-decoration: none; color: inherit; }

    /* 전체 레이아웃 */
    .admin-wrapper {
        display: flex;
        height: 100vh;
        width: 100%;
    }

    /* ===== 메인 컨텐츠 영역 ===== */
    .main-content {
        flex-grow: 1;
        padding: 30px;
        overflow-y: auto; /* 컨텐츠가 길어지면 스크롤 생성 */
        height: 100vh;
        box-sizing: border-box;
    }
    .main-header, .page-header {
        font-size: 15px;
        margin-bottom: 30px;
    }
    .page-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    /* 컨텐츠 박스 (카드 UI) */
    .content-box {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        margin-bottom: 30px;
    }
    .content-box h2 {
        font-size: 20px;
        margin-bottom: 20px;
    }

    /* 테이블 스타일 */
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

    /* 상태 표시 (Status Badge) */
    .status {
        padding: 4px 10px;
        border-radius: 12px;
        font-size: 12px;
        font-weight: bold;
        color: #fff;
        display: inline-block;
    }
    .status.completed { background-color: #2ecc71; } /* 완료, 정상, 판매중 */
    .status.pending { background-color: #f1c40f; } /* 휴면, 대기 */
    .status.cancelled { background-color: #e74c3c; } /* 삭제, 품절, 취소 */
    .status.shipping { background-color: #3498db; } /* 배송 중 */


    /* 버튼 스타일 */
    .btn {
        padding: 9px 18px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: bold;
        text-decoration: none;
        display: inline-block;
        text-align: center;
        transition: background-color 0.2s;
    }
    .btn-primary {
        background-color: #F0504F;
        color: white;
    }
    .btn-primary:hover {
        background-color: #d94342;
    }
    .btn-small {
        font-size: 12px;
        padding: 4px 8px;
        color: white !important;
        border-radius: 4px;
    }
    .btn-edit { background-color: #3498db; }
    .btn-delete { background-color: #e74c3c; }
    .btn-detail { background-color: #2ecc71; }

    /* 검색/필터 폼 */
    .filter-form {
        display: flex;
        gap: 10px;
        align-items: center;
    }
    .filter-form select,
    .filter-form input[type="text"],
    .filter-form input[type="date"] {
        padding: 8px 12px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 14px;
        font-family: inherit;
    }
    .filter-form input[type="text"] {
        flex-grow: 1;
    }
</style>
</head>
<body>
    <div class="admin-wrapper">
        <%-- 사이드바 포함 --%>
        <%@ include file="adminSidebar.jsp" %>

        <%-- 메인 컨텐츠: URL 파라미터에 따라 동적으로 페이지 포함 --%>
        <c:choose>
            <c:when test="${param.page == 'categories'}">
            	<jsp:include page="adminCategories.jsp" />
            </c:when>
            <c:when test="${param.page == 'products'}">
                <jsp:include page="adminProducts.jsp" />
            </c:when>
            <c:when test="${param.page == 'orders'}">
                <jsp:include page="adminOrders.jsp" />
            </c:when>
            <%-- 기본 페이지 또는 'dashboard' 요청 시 대시보드 표시 --%>
            <c:otherwise>
                <jsp:include page="adminDashboard.jsp" />
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>