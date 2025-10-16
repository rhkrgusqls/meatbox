<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/common.min.css" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/style.min.css" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/renew.min.css" type="text/css" media="all" charset="UTF-8" />
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery-1.12.4.min.js" charset="UTF-8"></script>

<style>
    /* 드롭다운 메뉴 스타일 (수정 없음) */
    .category-menu, .dseries-menu {
        position: relative;
    }
    .category-dropdown {
        display: none;
        position: absolute;
        background-color: #ffffff;
        min-width: 200px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1000;
        border: 1px solid #ddd;
    }
    .category-dropdown a, .category-dropdown span {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
        cursor: pointer;
        border-bottom: 1px solid #eee;
    }
    .category-dropdown a:last-child, .category-dropdown span:last-child {
        border-bottom: none;
    }
    .category-dropdown a:hover, .category-dropdown span:hover {
        background-color: #f1f1f1;
    }
    .category-menu-item:hover > .category-dropdown {
        display: block;
    }
    .category-menu-item {
        position: relative;
    }
    .category-dropdown .category-menu-item .category-dropdown {
        top: 0;
        left: 100%;
        margin-top: -1px; /* 테두리 겹침 방지 */
    }
</style>

<script>
$(function() {
    const contextPath = "${pageContext.request.contextPath}";

    function createDropdown(parentId, $parentElement) {
        if ($parentElement.children('.category-dropdown').length > 0) {
            return;
        }

        const parentIdParam = parentId === null ? 'null' : parentId;
        const url = contextPath + '/GetCategories.cbo?parentId=' + parentIdParam;
        
        $.ajax({
            url: url,
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                if (data && data.length > 0) {
                    const $dropdown = $('<div class="category-dropdown"></div>');

                    $.each(data, function(index, category) {
                        const $item = $('<div class="category-menu-item"></div>');
                        let $element;

                        if (category.isLeaf) {
                            // [수정된 부분] 클릭 시 이동할 경로를 '/productList.do'로 변경했습니다.
                            $element = $('<a></a>')
                                .attr('href', contextPath + '/productList.do?category=' + category.id)
                                .text(category.name);
                        } else {
                            $element = $('<span></span>').text(category.name);
                            $item.on('mouseover', function(e) {
                                e.stopPropagation();
                                createDropdown(category.id, $(this));
                            });
                        }
                        
                        $item.append($element);
                        $dropdown.append($item);
                    });

                    $parentElement.append($dropdown);
                    $dropdown.show();
                }
            },
            error: function(xhr, status, error) {
                console.error("AJAX Error:", status, error);
            }
        });
    }

    // '카테고리' 메뉴: parentId를 null로 하여 최상위 카테고리 호출
    $('.category-menu').on('mouseover', function() {
        createDropdown(null, $(this));
    });

    // '당당시리즈' 메뉴: 별개의 ID로 호출
    $('.dseries-menu').on('mouseover', function() {
        // DB의 category_hierarchy 테이블에서 '당당시리즈'의 실제 category_id를 확인하여 아래 값을 수정해야 합니다.
        const dangdangSeriesCategoryId = 2; // <- '당당시리즈'의 실제 ID로 수정
        createDropdown(dangdangSeriesCategoryId, $(this));
    });
    
    // 메뉴에서 마우스가 벗어났을 때 드롭다운 제거
    $('.category-menu, .dseries-menu').on('mouseleave', function() {
        const $menuElement = $(this);
        setTimeout(function() {
            if (!$menuElement.is(':hover')) {
                $menuElement.find('.category-dropdown').remove();
            }
        }, 300);
    });
});
</script>

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
                        <c:if test="${empty sessionScope.userIndex}">
                            <button type="button" class="inline-round join" onclick="location.href='/fo/member/memberAddPage.do';"> <span>회원가입</span> </button>
                        </c:if>
                    </li>
                </ul>
            </div>
            <div class="logo flex-col">
                <a href="/">
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
                             <a href="/login.do" class="f-size12-600 flex-col-gap2">
                                <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-person.svg" alt="로그인" width="24px" height="24px">
                                <span class="des">로그인</span>
                            </a>
                        </c:if>
                        <c:if test="${not empty sessionScope.userIndex}">
                             <a href="/myMenu/myMenuMainPage.do" class="f-size12-600 flex-col-gap2">
                                <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-person.svg" alt="내 정보" width="24px" height="24px">
                                <span class="des">MY</span>
                            </a>
                        </c:if>
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
                        <a href="주문배송_URL" class="f-size12-600 flex-col-gap2">
                            <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-truck.svg" alt="주문/배송" width="24px" height="24px"><span class="des">주문배송</span>
                        </a>
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
                    
                    <%-- ================== [수정된 부분 1] ================== --%>
                    <li class="gnb-all category-menu">
                        <a href="javascript:;">
                            <span class="alt">카테고리 전체보기</span>
                        </a>
                    </li>
                    
                    <%-- ================== [수정된 부분 2] ================== --%>
                    <li class="gnb-tab more dseries-menu">
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