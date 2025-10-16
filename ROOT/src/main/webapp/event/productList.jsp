<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<%-- 
  실제 미트박스 사이트에서 사용하는 주요 CSS 파일들을 모두 연결합니다.
--%>
<link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/common.min.css" type="text/css">
<link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/style.min.css" type="text/css">
<link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/renew.min.css" type="text/css">
<link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/swiper/5.2.1/swiper.min.css" type="text/css">

<style>
    /* 추가적인 스타일은 필요 시 여기에 작성할 수 있습니다. */
</style>

</head>
<body>
    
    <%-- 헤더 include --%>
    <jsp:include page="/include/header.jsp" />

    <%-- 실제 사이트와 유사한 구조로 감싸기 --%>
    <div id="container">
        <div id="contents" class="inner">
            <div class="sub_content">
                <div class="location" style="margin-bottom: 20px; font-size: 14px; color: #666;">
                    <span><a href="${pageContext.request.contextPath}/">홈</a> &gt;</span>
                    <span>당당한돈</span>
                </div>

                <div class="prd_list_wrap">
                    <%-- 실제 사이트의 h2 클래스를 적용해 볼 수 있습니다. --%>
                    <h2 class="sub_title">당당한돈 상품</h2>

                    <c:if test="${not empty productList}">
                        <%-- 실제 사이트는 'prd_list type4' 클래스를 사용합니다. --%>
                        <ul class="prd_list type4">
                            <c:forEach var="product" items="${productList}">
                                <li>
                                    <a href="productViewPage.do?productSeq=${product.productId}">
                                        <div class="img_box">
                                            <c:choose>
                                                <c:when test="${not empty product.productImage}">
                                                    <img src="${pageContext.request.contextPath}${product.productImage}" alt="${product.productName}">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${pageContext.request.contextPath}/images/default_image.png" alt="이미지 준비중">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="prd_name_info">
                                            <strong class="prd_name">${product.productName}</strong>
                                            <em class="pric_stock">
                                                <span>
                                                    <strong><fmt:formatNumber value="${product.price}" pattern="#,###" />원</strong>
                                                </span>
                                            </em>
                                        </div>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>

                    <c:if test="${empty productList}">
                        <div class="no_result">
                            <p>해당 카테고리에 등록된 상품이 없습니다.</p>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    
    <%-- 푸터 include --%>
    <jsp:include page="/include/footer.jsp" />
    
</body>
</html>