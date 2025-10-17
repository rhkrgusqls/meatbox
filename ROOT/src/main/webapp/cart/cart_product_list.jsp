<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<body>

<%@ include file="/include/header.jsp" %>

<div class="cart-tab" style="width: 900px; margin: 20px auto;">
    <ul>
        <li class="on" id="typeA">
            <button type="button" onclick="location.href='/cart/cartPage.do?type=A'">일반 상품 (${fn:length(productList)})</button>
        </li>
        <li id="typeB">
            <button type="button" onclick="location.href='/cart/cartPage.do?type=B'">배송일 지정 상품 (0)</button>
        </li>
    </ul>
</div>

<div style="width: 900px; margin: 20px auto; font-family: sans-serif; color: #333;">

    <h2 style="font-size: 24px; border-bottom: 2px solid #333; padding-bottom: 10px;">일반상품</h2>
    
    <div style="border: 1px solid #eee;">
        
        <div style="display: flex; justify-content: space-between; align-items: center; padding: 15px; background-color: #f9f9f9; border-bottom: 1px solid #eee;">
            <span style="font-weight: bold; color: #00b343;">
                <img src="icon_fresh.png" alt="" style="vertical-align: middle; margin-right: 5px;">
                일반신선 ${fn:length(productList)}개
            </span>
            <span>(주)미트박스글로벌</span>
        </div>
        
        <c:set var="totalPrice" value="0" />
		
		<div style="padding: 10px 20px; border-bottom: 2px solid #ccc; display: flex; align-items: center;">
		    <input type="checkbox" id="selectAll" style="margin-right: 10px;">
		    <label for="selectAll" style="font-weight: bold;">모두 선택</label>
		</div>
		
		<c:forEach var="product" items="${productList}" varStatus="status">
		    <div style="display: flex; align-items: center; padding: 20px; border-bottom: 1px solid #eee;">
		        
		        <div style="margin-right: 15px;">
		            <input type="checkbox" class="item-checkbox" 
		                   data-product-id="${cartList[status.index].productId}"
		                   data-option-id="${cartList[status.index].optionId}">
		        </div>
		
		        <div style="margin-right: 20px;">
		            <c:choose>
		                <c:when test="${not empty product.imageList}">
		                    <%-- (✅ 수정) product 객체에 포함된 imageList의 첫 번째 이미지(.dir)를 사용합니다. --%>
		                    <img src="${product.imageList[0].dir}" alt="${product.name}" width="100" height="100">
		                </c:when>
		                <c:otherwise>
		                    <img src="https://via.placeholder.com/100" alt="${product.name}" width="100" height="100">
		                </c:otherwise>
		            </c:choose>
		        </div>
		
		        <div style="flex-grow: 1;">
		            <p style="margin: 0 0 10px 0; font-weight: bold; font-size: 16px;">
		                ${product.name}
		            </p>
		           	<p style="margin: 0; font-size: 14px; color: #666;">
					    중량 : ${productOptionList[status.index].option_detail}&nbsp; 개수 : ${cartList[status.index].quantity}
					</p>
		        </div>
		
		        <div style="width: 150px; text-align: right; font-weight: bold; font-size: 16px; margin-right: 30px;">
		           금액: <fmt:formatNumber value="${productOptionList[status.index].price_of_option * cartList[status.index].quantity}" pattern="#,###" />원
		        </div>
		    </div>
		
            <c:set var="totalPrice" value="${totalPrice + (productOptionList[status.index].price_of_option * cartList[status.index].quantity)}" />
		</c:forEach>

        <div style="text-align: right; padding: 20px; font-size: 18px; background-color: #f9f9f9;">
            총 결제 금액:
            <strong style="color: #d92d2d; font-size: 22px;">
                <fmt:formatNumber value="${totalPrice}" pattern="#,###" />원
            </strong>
        </div>

        <div style="text-align: right; padding: 20px;">
            <button onclick="submitOrder()">선택상품 주문</button>
        </div>

    </div>
</div>

<script>
document.getElementById('selectAll').addEventListener('change', function() {
    const itemCheckboxes = document.querySelectorAll('.item-checkbox');
    itemCheckboxes.forEach(cb => cb.checked = this.checked);
});

function submitOrder() {
    const checkedBoxes = document.querySelectorAll('.item-checkbox:checked');
    if (checkedBoxes.length === 0) {
        alert('주문할 상품을 선택해주세요.');
        return;
    }

    const selectedItems = Array.from(checkedBoxes).map(cb => {
        return {
            productId: cb.dataset.productId,
            optionId: cb.dataset.optionId
        };
    });
    
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/order/orderPage.do';
    
    selectedItems.forEach(item => {
        const productInput = document.createElement('input');
        productInput.type = 'hidden';
        productInput.name = 'productId';
        productInput.value = item.productId;
        form.appendChild(productInput);

        const optionInput = document.createElement('input');
        optionInput.type = 'hidden';
        optionInput.name = 'optionId';
        optionInput.value = item.optionId;
        form.appendChild(optionInput);
    });

    document.body.appendChild(form);
    form.submit();
}
</script>

<%@ include file="/include/footer.jsp" %>
</body>
</html>

