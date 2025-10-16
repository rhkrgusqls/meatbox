<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
</head>
<body>

<div style="width: 900px; margin: 20px auto; font-family: sans-serif; color: #333;">

    <h2 style="font-size: 24px; border-bottom: 2px solid #333; padding-bottom: 10px;">일반상품</h2>
    
    <div style="border: 1px solid #eee;">
        
        <div style="display: flex; justify-content: space-between; align-items: center; padding: 15px; background-color: #f9f9f9; border-bottom: 1px solid #eee;">
            <span style="font-weight: bold; color: #00b343;">
                <img src="icon_fresh.png" alt="" style="vertical-align: middle; margin-right: 5px;">
                일반신선 2개
            </span>
            <span>(주)미트박스글로벌</span>
        </div>
        
        <c:set var="totalPrice" value="0" /> <!-- 총합 초기화 -->
		
		<!-- ✅ 전체 선택 체크박스 -->
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
		                    <img src="han1.jpg" alt="${product.name}" width="100" height="100">
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
					    중량 : ${productOptionList[status.index].option_detail}
					</p>
		        </div>
		
		        <div style="width: 150px; text-align: right; font-weight: bold; font-size: 16px; margin-right: 30px;">
		           금액: <fmt:formatNumber value="${productOptionList[status.index].price_of_option}" pattern="#,###" />원
		        </div>
		    </div>
		
		    <c:set var="totalPrice" value="0" /> <!-- 초기값 0 설정 -->

			<c:forEach var="productOption" items="${productOptionList}" varStatus="status">
			    <c:set var="totalPrice" 
			           value="${totalPrice + productOption.price_of_option}" />
			</c:forEach>
		</c:forEach>

        <div style="text-align: right; padding: 20px; font-size: 18px; background-color: #f9f9f9;">
            총 결제 금액:
            <strong style="color: #d92d2d; font-size: 22px;">
                <fmt:formatNumber value="${totalPrice}" pattern="#,###" />원
            </strong>
        </div>

        <!-- ✅ 주문 버튼 -->
        <div style="text-align: right; padding: 20px;">
            <button onclick="submitOrder()">선택상품 주문</button>
        </div>

    </div>
</div>

<!-- ✅ 모두선택 & 주문 JS -->
<script>
// 모두선택 체크박스
document.getElementById('selectAll').addEventListener('change', function() {
    const itemCheckboxes = document.querySelectorAll('.item-checkbox');
    itemCheckboxes.forEach(cb => cb.checked = this.checked);
});

// 선택된 상품 아이디 추출 & 동기 POST 요청
// 선택된 상품 아이디와 옵션 아이디 추출 & 동기 POST 요청
function submitOrder() {
    const checkedBoxes = document.querySelectorAll('.item-checkbox:checked');
    if (checkedBoxes.length === 0) {
        alert('주문할 상품을 선택해주세요.');
        return;
    }

    // ✅ 변경점 1: 선택된 상품 정보를 객체 배열로 만들기
    // productId와 optionId를 한 쌍으로 묶어서 관리합니다.
    const selectedItems = Array.from(checkedBoxes).map(cb => {
        return {
            productId: cb.dataset.productId,
            optionId: cb.dataset.optionId // data-option-id 값을 추가로 추출
        };
    });
    
    // 동기용 form 생성
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = '/order.do'; // action 경로는 실제 환경에 맞게 확인해주세요.
    
    // ✅ 변경점 2: hidden input으로 productId와 optionId 배열을 각각 추가
    // selectedItems 배열을 순회하며 각 상품의 productId와 optionId input을 생성합니다.
    selectedItems.forEach(item => {
        // 1. productId를 위한 input
        const productInput = document.createElement('input');
        productInput.type = 'hidden';
        productInput.name = 'productId';
        productInput.value = item.productId;
        form.appendChild(productInput);

        // 2. optionId를 위한 input
        const optionInput = document.createElement('input');
        optionInput.type = 'hidden';
        optionInput.name = 'optionId'; // name을 "optionId"로 지정
        optionInput.value = item.optionId;
        form.appendChild(optionInput);
    });

    document.body.appendChild(form);
    form.submit(); // 동기 요청
}
</script>

</body>
</html>