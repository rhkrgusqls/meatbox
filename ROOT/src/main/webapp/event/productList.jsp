<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>상품 목록 - 미트박스</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <%-- 모든 필수 CSS 파일을 직접 선언합니다. --%>
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/font/spoqaHanSans.min.css" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/common.min.css?20251001124312135" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/style.min.css?20251001124312135" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/renew.min.css?20251001124312135" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://www.meatbox.co.kr/_next/static/css/5daa461e9f2acd13.css" />

    <%-- 필수 JavaScript 파일 선언 --%>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery-1.12.4.min.js" charset="UTF-8"></script>
	<style>
	    .sub-category-container {
	        width: 100%;
	        max-width: 1200px; /* 사이트 전체 너비에 맞게 조절 */
	        margin: 20px auto;
	        padding: 20px;
	        box-sizing: border-box;
	    }
	    .sub-category-nav h2 {
	        font-size: 28px;
	        font-weight: bold;
	        margin-bottom: 20px;
	        border-bottom: 2px solid #333;
	        padding-bottom: 15px;
	    }
	    .sub-category-nav ul {
	        list-style: none;
	        padding: 0;
	        margin: 0;
	        display: flex;
	        flex-wrap: wrap; /* 메뉴가 길어지면 다음 줄로 넘어가도록 설정 */
	        gap: 10px 25px; /* 세로, 가로 간격 */
	    }
	    .sub-category-nav li a {
	        text-decoration: none;
	        color: #555;
	        font-size: 16px;
	        padding: 8px 12px;
	        border-radius: 5px;
	        transition: background-color 0.2s, color 0.2s;
	    }
	    .sub-category-nav li a:hover {
	        background-color: #f0f0f0;
	        color: #000;
	    }
	    /* 현재 활성화된(보고있는) 하위 카테고리 스타일 */
	    .sub-category-nav li.active a {
	        background-color: #333;
	        color: #fff;
	        font-weight: bold;
	    }
	</style>
	
	
	<div class="sub-category-container">
	    <%-- ProductListAction에서 넘겨준 topLevelParent가 있을 때만 이 메뉴 영역을 표시합니다. --%>
	    <c:if test="${not empty topLevelParent}">
	        <nav class="sub-category-nav">
	            <%-- 최상위 카테고리 이름을 제목으로 표시 (예: 소고기) --%>
	            <h2>${topLevelParent.categoryName}</h2>
	            
	            <%-- 하위 카테고리 목록을 <ul> 태그로 표시 --%>
	            <ul>
	                <c:forEach var="sub" items="${subCategoryList}">
	                    <%-- 현재 보고 있는 페이지의 카테고리면 'active' 클래스를 추가하여 강조 --%>
	                    <li <c:if test="${sub.categoryId == currentCategoryId}">class="active"</c:if>>
	                        <a href="${pageContext.request.contextPath}/ProductList.pr?displayCategorySeq=${sub.categoryId}">
	                            ${sub.categoryName}
	                        </a>
	                    </li>
	                </c:forEach>
	            </ul>
	        </nav>
	    </c:if>
	</div>
</head>
<body>

<%-- 공통 상단/하단 메뉴를 include 합니다. --%>
<jsp:include page="/include/header.jsp" />

<main id="meatboxContent" class="promotion meatbox_container contents_wrapper">
    <div class="inner_global">
    
    	<%-- ✅ [추가] 카테고리 목록 표시 영역 --%>
        <div class="category_tab_wrap" style="margin-top: 24px; margin-bottom: 24px;">
            <ul style="display: flex; gap: 8px; list-style: none; padding: 0; flex-wrap: wrap;">
                <li>
                    <a href="#" class="category_tab active" style="display: block; padding: 8px 16px; border: 1px solid #ddd; border-radius: 16px; text-decoration: none; color: #333; background-color: #f5f5f5;">
                        <strong>전체</strong>
                    </a>
                </li>
                <c:forEach var="category" items="${subCategoryList}">
                    <li>
                        <a href="productList.do?category=${category.categoryId}" class="category_tab" style="display: block; padding: 8px 16px; border: 1px solid #ddd; border-radius: 16px; text-decoration: none; color: #333;">
                            <span>${category.categoryName}</span>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        
        <div class="location" style="margin-top: 20px; margin-bottom: 20px; font-size: 14px; color: #666;">
            <span><a href="${pageContext.request.contextPath}/">홈</a> &gt;</span>
            <span>기획전</span>
        </div>

        <div class="stack_horizontal gap_32 mt_16">
            
            <%-- ✅ [복원] 왼쪽: 기존 동적 필터 영역 --%>
            <div class="aside_sticky" style="width: 250px;">
                <div class="flex_1">
                    <section>
                        <form name="filterForm" id="filterForm" method="get" action="productList.do">
                            <div class="aside_filter aside_y_scroll" style="max-height:calc(100vh - 100px)">
                                
                                <%-- 품목 필터 (동적 생성) --%>
                                <c:if test="${not empty itemCategoryList}">
                                    <dl class="filter_wrap">
                                        <dt class="filter_title"><strong>품목</strong></dt>
                                        <dd class="filter_item">
                                            <div class="options_area">
                                                <ul class="options_list">
                                                    <li>
                                                        <span class="box_choice">
                                                            <input type="checkbox" id="itemCatCd-all" class="inp_choice" onchange="$('input[name=itemCategory]').prop('checked', this.checked); filterForm.submit();" />
                                                            <label for="itemCatCd-all" class="lab_choice">
                                                                <span class="circle_choice"><span class="ico_choice"></span></span>
                                                                <span class="txt_choice"><span class="txt_l">전체</span></span>
                                                            </label>
                                                        </span>
                                                    </li>
                                                    <c:forEach var="category" items="${itemCategoryList}">
                                                        <li>
                                                            <span class="box_choice">
                                                                <input type="checkbox" name="itemCategory" id="itemCatCd-${category.code}" value="${category.code}" class="inp_choice" onchange="filterForm.submit();"
                                                                    <c:if test="${selectedFilters.contains(category.code)}">checked</c:if> />
                                                                <label for="itemCatCd-${category.code}" class="lab_choice">
                                                                    <span class="circle_choice"><span class="ico_choice"></span></span>
                                                                    <span class="txt_choice"><span class="txt_l">${category.name}</span><small class="txt_choice">${category.count}</small></span>
                                                                </label>
                                                            </span>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </dd>
                                    </dl>
                                </c:if>

                                <%-- 보관방법 필터 (동적 생성) --%>
                                <c:if test="${not empty storageTypeList}">
                                    <dl class="filter_wrap">
                                        <dt class="filter_title"><strong>보관방법</strong></dt>
                                        <dd class="filter_item">
                                            <div class="options_area">
                                                <div class="options_list flex_wrap_list">
                                                    <c:forEach var="storage" items="${storageTypeList}">
                                                        <button type="button" class="btn btn_init btn_outline_round--type1 <c:if test='${selectedStorage == storage.code}'>active</c:if>"
                                                            onclick="location.href='productList.do?storageType=${storage.code}'">
                                                            <span class="txt_box">${storage.name}</span>
                                                        </button>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </dd>
                                    </dl>
                                </c:if>
                                
                            </div>
                        </form>
                    </section>
                </div>
            </div>

            <%-- 오른쪽: 상품 목록 및 정렬 --%>
            <div id="mainAreaWrapper" class="max_w_1280 px_16" style="flex: 1;">
                
                <div id="SortingFilterContainer" class="sorting_button_wrap none_under_line">
                    <div class="sorting_btn_list">
                        <li><div class="shrink-0"><button class="clear_button button_sort active" type="button"><span class="txt_box">추천순</span></button></div></li>
                        <li><div class="shrink-0"><button class="clear_button button_sort" type="button"><span class="txt_box">낮은 가격순</span></button></div></li>
                        <li><div class="shrink-0"><button class="clear_button button_sort" type="button"><span class="txt_box">높은 가격순</span></button></div></li>
                    </div>
                    <span class="category_total">총 <em>${productList.size()}</em>개의 상품</span>
                </div>

                <div class="thin_gray_rounded_box type4 px_16 py_24 none_border">
                    <div style="position:relative">
                        <article class="list_5_cols">
						    <c:forEach var="product" items="${productList}">
						        <div class="swiper-slide">
						            <%-- ✅ [수정] a 태그에 target="_blank"와 rel="noopener noreferrer" 속성을 추가했습니다. --%>
						            <a href="${pageContext.request.contextPath}/productViewPage.do?productSeq=${product.productId}" class="product_card type1 stack_vertical false" style="text-decoration: none; color: inherit;" target="_blank" rel="noopener noreferrer">
						                <div class="bgInherit" style="cursor:pointer">
						                    <div role="button">
						                        
						                        <div class="img_wrap">
						                            <div class="bg_wrap">
						                                <p class="absolute_full">
						                                    <c:choose>
						                                        <c:when test="${not empty product.productImage}">
						                                            <img src="${pageContext.request.contextPath}${product.productImage}" alt="${product.productName}" class="full_image">
						                                        </c:when>
						                                        <c:otherwise>
						                                            <img src="${pageContext.request.contextPath}/images/default_image.png" alt="이미지 준비중" class="full_image">
						                                        </c:otherwise>
						                                    </c:choose>
						                                </p>
						                            </div>
						                        </div>
						                        
						                        <div class="txt_wrap mt_8" style="overflow:hidden">
						                            <div class="flex_side">
						                                <span class="none_style_btn btn_brand_name"><span class="txt_box">미트박스</span></span>
						                            </div>
						                            <p class="product_name">${product.productName}</p>
						                            <div class="price_wrap">
						                                <span class="price_info">
						                                    <em><fmt:formatNumber value="${product.price}" pattern="#,###" />원</em>
						                                </span>
						                            </div>
						                        </div>
						                    </div>
						                </div>
						            </a>
						        </div>
						    </c:forEach>
						</article>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/include/footer.jsp" />

</body>
</html>