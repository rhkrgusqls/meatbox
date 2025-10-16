<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="common-two-btn after">
    <c:choose>
        <c:when test="${empty cartList}">
            <button type="button" class="common-btn-style common-btn-gray" onclick="location.href='/'">상품 담으러 가기</button>
        </c:when>
        <c:otherwise>
            <button type="button" class="common-btn-style common-btn-gray" onclick="location.href='/'">계속 쇼핑하기</button>
            <button style="background-color: #D34D4A" type="button" class="common-btn-style common-btn-gray" onclick="submitOrder()">주문하기</button>
        </c:otherwise>
    </c:choose>
</div>