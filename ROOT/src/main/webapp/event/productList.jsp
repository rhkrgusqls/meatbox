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
  실제 프로젝트 경로에 맞게 CSS 파일 경로를 수정해야 합니다. 
  '${pageContext.request.contextPath}'는 프로젝트의 최상위 경로를 자동으로 잡아줍니다.
--%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/renew.min.css" type="text/css">

<style>
    /* 간단한 스타일 추가 (실제 사이트와 유사하게) */
    .prd_list {
        list-style: none;
        padding: 0;
        margin: 0 -10px;
        display: flex;
        flex-wrap: wrap;
    }
    .prd_list li {
        width: 25%; /* 한 줄에 4개씩 */
        padding: 10px;
        box-sizing: border-box;
    }
    .prd_list li a {
        display: block;
        text-decoration: none;
        color: #333;
        border: 1px solid #eee;
        padding: 15px;
    }
    .prd_list .img_box {
        position: relative;
        width: 100%;
        padding-top: 100%; /* 1:1 비율 */
        overflow: hidden;
    }
    .prd_list .img_box img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover; /* 이미지가 잘리지 않고 꽉 차게 */
    }
    .prd_list .prd_name_info {
        margin-top: 10px;
    }
    .prd_list .prd_name {
        font-size: 16px;
        font-weight: bold;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
        height: 48px; /* 2줄 높이 */
    }
    .prd_list .pric_stock {
        display: block;
        margin-top: 8px;
        font-size: 18px;
    }
    .no_result {
        text-align: center;
        padding: 100px 0;
        font-size: 18px;
        color: #888;
    }
</style>

</head>
<body>
    
    <%-- 헤더 include --%>
    <jsp:include page="/include/header.jsp" />

    <div id="container" style="padding: 20px;">
        <div id="contents">
            <div class="sub_content">
                <div class="location" style="margin-bottom: 20px; font-size: 14px; color: #666;">
                    <span><a href="${pageContext.request.contextPath}/">홈</a> &gt;</span>
                    <%-- TODO: 실제 카테고리명을 DB에서 조회하여 표시해야 합니다. --%>
                    <span>카테고리 ${categoryId}</span>
                </div>

                <div class="prd_list_wrap">
                    <h2>상품 목록</h2>

                    <%-- 상품 목록이 비어있지 않을 경우 --%>
                    <c:if test="${not empty productList}">
                        <ul class="prd_list">
                            <%-- JSTL forEach를 사용하여 상품 목록을 반복 출력 --%>
                            <c:forEach var="product" items="${productList}">
                                <li>
                                    <a href="productViewPage.do?productSeq=${product.productId}">
                                        <div class="img_box">
                                            <c:choose>
                                                <%-- 상품 이미지가 DB에 저장되어 있는 경우 --%>
                                                <c:when test="${not empty product.productImage}">
                                                    <img src="${pageContext.request.contextPath}${product.productImage}" alt="${product.productName}">
                                                </c:when>
                                                <%-- 상품 이미지가 없는 경우, 기본 이미지 표시 --%>
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

                    <%-- 상품 목록이 비어있을 경우 --%>
                    <c:if test="${empty productList}">
                        <div class="no_result">
                            <p>해당 카테고리에 등록된 상품이 없습니다.</p>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
    
    <%-- 푸터는 필요 시 include --%>
    
</body>
</html>