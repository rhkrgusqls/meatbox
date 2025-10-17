<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 사용을 위해 태그 라이브러리 선언이 필요합니다. --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="cart-tab">
    <ul>
        <li class="on" id="typeA">
            <%-- (✅ 수정) fn:length() 함수로 productList의 크기를 가져와 표시합니다. --%>
            <button type="button" onclick="location.href='/cart/cartPage.do?type=A'">일반 상품 (${fn:length(productList)})</button>
        </li>
        <li id="typeB">
             <%-- 배송일 지정 상품은 별도의 리스트가 있다면 동일한 방식으로 개수를 표시할 수 있습니다. --%>
            <button type="button" onclick="location.href='/cart/cartPage.do?type=B'">배송일 지정 상품 (0)</button>
        </li>
    </ul>
</div>
