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
    /* ===== 공통 리셋 & 타이포 ===== */
    body, h1, h2, h3, ul, p, table, th, td { margin: 0; padding: 0; }
    body { font-family: 'Malgun Gothic', '맑은 고딕', sans-serif; background: #f6f7fb; color: #2c3e50; overflow: hidden; }
    ul { list-style: none; }
    a { text-decoration: none; color: inherit; }

    /* ===== 레이아웃 ===== */
    .admin-wrapper { display: flex; height: 100vh; width: 100%; }
    .main-content { flex: 1; padding: 28px; overflow-y: auto; height: 100vh; box-sizing: border-box; }
    .main-header, .page-header { margin-bottom: 22px; }
    .page-header { display: flex; align-items: center; justify-content: space-between; }
    .page-header h1 { font-size: 24px; letter-spacing: -0.2px; }

    /* ===== 카드(컨텐츠 박스) ===== */
    .content-box { background: #ffffff; padding: 22px; border-radius: 12px; box-shadow: 0 6px 18px rgba(22,34,51,0.06); margin-bottom: 24px; border: 1px solid #eef0f4; }
    .content-box h2 { font-size: 20px; margin-bottom: 16px; color: #1f2d3d; }

    /* ===== 테이블 ===== */
    .order-table { width: 100%; border-collapse: collapse; border-spacing: 0; }
    .order-table thead th { background: #fafbff; color: #5a6a85; font-weight: 600; border-bottom: 1px solid #e8ecf3; padding: 12px 14px; text-align: left; font-size: 14px; }
    .order-table tbody td { border-bottom: 1px solid #f0f2f6; padding: 12px 14px; font-size: 14px; color: #2c3e50; }
    .order-table tbody tr:hover { background: #fafcff; }

    /* ===== 배지 ===== */
    .status { padding: 4px 10px; border-radius: 10px; font-size: 12px; font-weight: 700; color: #fff; display: inline-block; }
    .status.completed { background-color: #2ecc71; }
    .status.pending { background-color: #f1c40f; color: #553e00; }
    .status.cancelled { background-color: #e74c3c; }
    .status.shipping { background-color: #3498db; }

    /* ===== 버튼 ===== */
    .btn { padding: 9px 16px; border: none; border-radius: 8px; cursor: pointer; font-weight: 700; text-decoration: none; display: inline-flex; align-items: center; justify-content: center; gap: 6px; transition: all .18s ease; box-shadow: 0 2px 6px rgba(0,0,0,0.06); }
    .btn:active { transform: translateY(1px); }
    .btn-primary { background: #F0504F; color: #fff; }
    .btn-primary:hover { background: #e04342; }
    .btn-edit { background: #3a8dde; color: #fff; }
    .btn-edit:hover { background: #2f7cc6; }
    .btn-delete { background: #e74c3c; color: #fff; }
    .btn-delete:hover { background: #cf3e2f; }
    .btn-detail { background: #2ecc71; color: #fff; }
    .btn-detail:hover { background: #27b863; }
    .btn-small { font-size: 12px; padding: 6px 10px; border-radius: 6px; }

    /* ===== 폼 요소 ===== */
    .filter-form { display: flex; gap: 10px; align-items: center; flex-wrap: wrap; }
    .filter-form select, .filter-form input[type="text"], .filter-form input[type="date"], input[type="number"], input[type="text"], select {
        padding: 10px 12px; border: 1px solid #dfe3eb; border-radius: 8px; font-size: 14px; outline: none; background: #fff; transition: border-color .15s ease; }
    .filter-form select:focus, .filter-form input[type="text"]:focus, .filter-form input[type="date"]:focus, input[type="number"]:focus, input[type="text"]:focus, select:focus { border-color: #a9b8ff; box-shadow: 0 0 0 3px rgba(92, 124, 250, 0.12); }
    .filter-form input[type="text"] { flex: 1; }

    /* ===== 스크롤바 ===== */
    .main-content::-webkit-scrollbar { width: 8px; }
    .main-content::-webkit-scrollbar-thumb { background: #d2d7e3; border-radius: 8px; }
    .main-content::-webkit-scrollbar-track { background: transparent; }

    /* ===== 사이드바 개선 (include된 요소에 적용) ===== */
    .sidebar { border-right: 1px solid #eef0f4; }
    .sidebar-nav ul li a { letter-spacing: 0.1px; }
    .sidebar-nav ul li.active a { position: relative; }
    .sidebar-nav ul li.active a::before { content: ''; position: absolute; left: 0; top: 0; bottom: 0; width: 4px; background: #ffffff; opacity: 0.5; }
</style>
</head>
<body>
    <div class="admin-wrapper">
        <%-- 사이드바 포함 --%>
        <%@ include file="adminSidebar.jsp" %>

         <c:choose>
        <c:when test="${not empty contentPage}">
            <jsp:include page="${contentPage}" />
        </c:when>

        <c:when test="${param.page == 'categories'}">
            <jsp:include page="adminCategories.jsp" />
        </c:when>
        <c:when test="${param.page == 'products'}">
            <jsp:include page="adminProducts.jsp" />
        </c:when>
        <c:when test="${param.page == 'orders'}">
            <jsp:include page="adminOrders.jsp" />
        </c:when>
         <c:when test="${param.page == 'request'}">
            <jsp:include page="adminRequest.jsp" />
        </c:when>
        <c:otherwise>
            <jsp:include page="adminDashboard.jsp" />
        </c:otherwise>
    </c:choose>
    </div>
</body>
</html>