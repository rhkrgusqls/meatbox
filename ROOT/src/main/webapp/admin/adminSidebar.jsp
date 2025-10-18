<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- URL의 'page' 파라미터를 확인하여 현재 페이지를 변수에 저장.
없으면 'dashboard'를 기본값으로. --%>
<c:set var="currentPage" value="${empty param.page ? 'dashboard' : param.page}" />

<style>
    /* ===== 사이드바 스타일 ===== */
    .sidebar {
        width: 230px;
        background-color: #F0504F;
        color: #ecf0f1;
        display: flex;
        flex-direction: column;
        flex-shrink: 0; /* 사이드바 너비 고정 */
    }
    .sidebar-header {
        padding: 3px;
        display: flex;
        justify-content: center;
        align-items: center;
        border-bottom: 1px solid #D34D4A;
        height: 80px;
    }
    .sidebar-logo {
        max-width: 100%;
        height: auto;
        transition: transform 0.3s ease;
    }
    .sidebar-logo:hover {
        transform: scale(1.05);
    }
    .sidebar-nav {
        flex-grow: 1;
    }
    .sidebar-nav ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }
    .sidebar-nav ul li a {
        text-align: center;
        display: block;
        padding: 15px 20px;
        color: #fff;
        font-weight: bold;
        -webkit-text-stroke: 0.4px #000;
        transition: background-color 0.2s;
    }
    /* 현재 선택된 메뉴 스타일 */
    .sidebar-nav ul li.active a,
    .sidebar-nav ul li a:hover {
        background-color: #E76A67;
    }
    .sidebar-footer {
        padding: 20px;
        text-align: center;
        font-size: 15px;
        border-top: 1px solid #E34E4A;
        background-color: #D34D4A;
        color: #ffffff;
        transition: all 0.3s ease;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        font-weight: bold;
    }
    .sidebar-footer:hover {
        background-color: #BF3C39;
        box-shadow: 0 6px 12px rgba(0,0,0,0.35);
        transform: translateY(-3px);
    }
</style>

<aside class="sidebar">
    <div class="sidebar-header">
        <a href="adminHome.jsp">
            <img src="https://static-cdn.meatbox.co.kr/img/renew/logo-row-ko.svg" alt="미트박스 로고" class="sidebar-logo">
        </a>
    </div>

    <nav class="sidebar-nav">
        <ul>
            <li class="${currentPage == 'categories' ? 'active' : ''}"><a href="adminHome.jsp?page=categories">카테고리 관리</a></li>
            <li class="${currentPage == 'products' ? 'active' : ''}"><a href="adminHome.jsp?page=products">상품 관리</a></li>
            <li><a href="AdminOrderViewAction.ac">주문 관리</a></li>
            <li class="${currentPage == 'request' ? 'active' : ''}"><a href="adminHome.jsp?page=request">상품등록 요청 관리</a></li>
        </ul>
    </nav>

    <div class="sidebar-footer">
        <a href="/logout.do;">로그아웃</a>
    </div>
</aside>