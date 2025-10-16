<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="cart-tab">
    <ul>
        <li class="on" id="typeA">
            <button type="button" onclick="FoTool.go('/fo/cart/cartPage.do?type=A')">일반 상품 (0)</button>
        </li>
        <li id="typeB">
            <button type="button" onclick="FoTool.go('/fo/cart/cartPage.do?type=B')">배송일 지정 상품 (0)</button>
        </li>
    </ul>
</div>