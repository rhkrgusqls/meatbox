<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 사용을 위한 태그 라이브러리 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <%-- =============================================================================== --%>
    <%--  공통 CSS 및 JS 라이브러리 링크                                                 --%>
    <%--  이 경로들은 실제 프로젝트 구조에 맞게 수정해야 할 수 있습니다.                 --%>
    <%-- =============================================================================== --%>
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/common.min.css" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/style.min.css" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/renew.min.css" type="text/css" media="all" charset="UTF-8" />
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery-1.12.4.min.js" charset="UTF-8"></script>
    <%-- 필요한 추가 JS 파일들을 여기에 링크할 수 있습니다. --%>
</head>
<body>

<header class="newVer">
    <section class="header-main">
        <article class="main-wrap flex-row-gap032">
            <div class="inquiry flex-space-between">
                <ul class="flex-row-gap12">
                    <li>
                        <button type="button" class="ico-inner-wrap inline-round js-dropbox-btn" onclick="location.href='고객센터_URL';">
                            <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-customer-center.svg" alt="고객센터" width="16px" height="16px">
                            <em>고객센터</em>
                        </button>
                    </li>
                    <li>
                        <a href="tel:1644-6689" class="tel">주문 문의 1644-6689</a>
                    </li>
                    <li class="member">
                        <%-- 로그인 여부에 따라 분기 처리 --%>
                        <c:if test="${empty sessionScope.userIndex}">
                            <button type="button" class="inline-round join" onclick="location.href='/fo/member/memberAddPage.do';"> <span>회원가입</span> </button>
                        </c:if>
                    </li>
                </ul>
            </div>
            <div class="logo flex-col">
                <a href="/"> <%-- 메인 페이지 URL로 변경 --%>
                    <img src="https://static-cdn.meatbox.co.kr/img/renew/logo-row-ko.svg" alt="미트박스 로고" width="139px" height="32px">
                </a>
            </div>
            <div class="search-area">
                <input type="text" class="search-input f-size16-400" placeholder="상품명 혹은 브랜드 입력" autocomplete="off" id="search_word">
                <div class="btn-wrap flex-row-gap012">
                    <button type="button" class="delete">삭제</button>
                    <button type="button" class="search" id="search_btn">검색</button>
                </div>
            </div>
            <div class="user-area">
                <ul class="flex-row-gap04">
                    <li>
                        <c:if test="${empty sessionScope.userIndex}">
                             <a href="/ROOT/login.do" class="f-size12-600 flex-col-gap2">
                                <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-person.svg" alt="로그인" width="24px" height="24px">
                                <span class="des">로그인</span>
                            </a>
                        </c:if>
                        <c:if test="${not empty sessionScope.userIndex}">
                             <a href="마이페이지_URL" class="f-size12-600 flex-col-gap2">
                                <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-person.svg" alt="내 정보" width="24px" height="24px">
                                <span class="des">MY</span>
                            </a>
                        </c:if>
                    </li>
                    <li>
                        <a href="주문배송_URL" class="f-size12-600 flex-col-gap2">
                            <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-truck.svg" alt="주문/배송" width="24px" height="24px"><span class="des">주문배송</span>
                        </a>
                    </li>
                    <li>
                    	<c:if test="${not empty sessionScope.userIndex}">
                        <a href="javascript:;" class="f-size12-600 flex-col-gap2" onclick="location.href='/logout.do';">
                            <img src="https://www.shutterstock.com/image-vector/logout-vector-icon-illustration-web-260nw-1888955368.jpg" alt="로그아웃" width="24px" height="24px" loading="lazy">
                            <span class="des">Logout</span>
                        </a>
                        </c:if>
                    </li>
                    <li>
                        <a href="/cart/cartPage.do" class="f-size12-600 flex-col-gap2">
                            <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-cart.svg" alt="장바구니" width="24px" height="24px">
                            <span class="badge _newCartCount"></span>
                            <span class="des">장바구니</span>
                        </a>
                    </li>
                </ul>
            </div>
        </article>
    </section>
    <section class="header-gnb">
        <article class="gnb-wrap">
            <nav class="flex-row-gap032 f-size16-700">
                <ul class="depth01 depth-main flex-row-gap016 f-size16-700">
                    <li class="gnb-all">
                        <a href="javascript:;">
                            <span class="alt">카테고리 전체보기</span>
                        </a>
                    </li>
                    <li class="gnb-tab more ">
                        <a href="당당시리즈_URL" class="dangdang"><span class="txt">당당시리즈</span></a>
                    </li>
                    <li class="gnb-tab">
                        <a href="멤버십전용_URL">
                            <em class="sm-txt">멤버십 전용</em>
                        </a>
                    </li>
                    <li class="gnb-tab">
                        <a href="낱개상품_URL"><span class="txt">낱개</span></a>
                    </li>
                    <li class="gnb-tab">
                        <a href="세절상품_URL"><span class="txt">세절</span></a>
                    </li>
                    <li class="gnb-tab">
                        <a href="대량특가_URL"><span class="txt">대량특가</span></a>
                    </li>
                    <li class="gnb-tab icon-dotted">
                        <a href="랭킹_URL"><span class="txt">랭킹</span></a>
                    </li>
                </ul>
                <ul class="depth01 depth-sub flex-row-gap016 f-size14-500">
                    <li class="gnb-tab">
                        <a href="기획전_URL"><span class="txt">기획전</span></a>
                    </li>
                    <li class="gnb-tab">
                        <a href="식자재_URL"><span class="txt">식자재</span></a>
                    </li>
                    <li class="gnb-tab">
                        <a href="개인베스트_URL"><span class="txt">개인BEST</span></a>
                    </li>
                </ul>
            </nav>
        </article>
    </section>
</header>

</body>
</html>