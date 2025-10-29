<%-- adminProducts.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%-- 숫자 포맷팅을 위해 추가 --%>

<main class="main-content">
    <div class="page-header">
        <h1>상품 관리</h1>
    </div>
    <div class="content-box">
        <h2>상품 목록</h2>
        <table class="order-table">
            <thead>
                <tr>
                    <th>상품 ID</th>
                    <th>상품명</th>
                    <th>카테고리</th>
                    <th>가격</th>
                    <th>재고</th>
                    <th>상태</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty productList}">
                        <c:forEach var="product" items="${productList}">
                            <tr>
                                <td>${product.productId}</td>
                                <td>${product.productName}</td>
                                <td>${product.categoryName}</td>
                                <td><fmt:formatNumber value="${product.price}" pattern="#,###" />원</td>
                                <td>${product.quantity}개</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${product.quantity > 0}">
                                            <span class="status completed">판매중</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status cancelled">품절</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="/admin/AdminProductUpdate.ac?productId=${product.productId}" class="btn-small btn-edit">수정</a>
                                    <a href="/admin/AdminProductDelete.ac?productId=${product.productId}" class="btn-small btn-delete" onclick="return confirm('정말로 이 상품을 삭제하시겠습니까?');">삭제</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="7">등록된 상품이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</main>