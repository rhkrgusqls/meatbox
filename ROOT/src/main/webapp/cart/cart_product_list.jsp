<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
		<style type="text/css">
		/* 전체 컨테이너 */
		.select-container {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 12px 20px;
		    border-bottom: 2px solid #ccc;
		    background-color: #f9f9f9;
		}
		
		/* 왼쪽 체크박스 + 라벨 */
		.select-left {
		    display: flex;
		    align-items: center;
		    gap: 10px;
		}
		
		.select-left input[type="checkbox"] {
		    width: 16px;
		    height: 16px;
		    cursor: pointer;
		}
		
		.select-left label {
		    font-weight: bold;
		    font-size: 14px;
		    cursor: pointer;
		}
		
		/* 오른쪽 버튼 */
		.select-right button {
		    background-color: #7f8c8d;
		    color: white;
		    border: none;
		    padding: 10px 16px;
		    border-radius: 6px;
		    font-weight: bold;
		    cursor: pointer;
		    transition: all 0.3s ease;
		    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
		}
		
		/* 버튼 호버 효과 */
		.select-right button:hover {
		    background-color: #6c7a7b;
		    transform: translateY(-2px);
		    box-shadow: 0 4px 8px rgba(0,0,0,0.3);
		}
		</style>
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
                <%-- (✅ 수정) 상품 개수를 동적으로 표시 --%>
                일반신선 ${fn:length(productList)}개
            </span>
            <span>(주)빈컴퍼니</span>
        </div>
        
        <c:set var="totalPrice" value="0" /> <!-- 총합 초기화 -->
		
		<div class="select-container">
    <!-- 왼쪽: 전체 선택 -->
    <div class="select-left">
        <input type="checkbox" id="selectAll">
        <label for="selectAll">모두 선택</label>
    </div>

    <!-- 오른쪽: 선택 삭제 버튼 -->
    <div class="select-right">
        <button onclick="deleteSelectedItems()">선택상품 삭제</button>
    </div>
</div>
		
		<c:forEach var="product" items="${productList}" varStatus="status">
		    <div style="display: flex; align-items: center; padding: 20px; border-bottom: 1px solid #eee;">
		        
		        
		        
		        <div style="margin-right: 15px;">
				    <%-- (✅ 추가) 다중 삭제를 위해 data-cart-id 속성을 추가합니다. --%>
				    <input type="checkbox" class="item-checkbox" 
				           data-product-id="${cartList[status.index].productId}"
				           data-option-id="${cartList[status.index].optionId}">
				</div>
						
		        <div style="margin-right: 20px;">
	            <c:choose>
	                <c:when test="${not empty product.imageList}">
	                    <%-- (✅ 수정) productDetail.jsp와 동일한 방식으로 이미지 경로를 가져옵니다. --%>
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
		        
				<%-- 주문 버튼과 삭제 버튼이 함께 있는 div --%>
				
				
		        <%-- =============================================================================== --%>
                <%--  (✅ 추가) 상품 삭제 버튼                                                      --%>
                <%-- =============================================================================== --%>
                <div style="width: 50px; text-align: center;">
                    <%-- (✅ 수정) JavaScript 함수를 호출하도록 변경 --%>
                    <a href="javascript:void(0);"
                       onclick="deleteCartItem(${cartList[status.index].productId}, ${cartList[status.index].optionId});"
                       style="display: inline-block; width: 24px; height: 24px; line-height: 24px; border: 1px solid #ddd; border-radius: 4px; text-align: center; background-color: #fafafa; color: #777; text-decoration: none; font-weight: bold; font-size: 14px;">
                       X
                    </a>
                </div>
		    </div>
		
		    <%-- (✅ 수정) 총합 계산 로직 수정: 각 상품의 가격을 totalPrice에 누적합니다. --%>
            <c:set var="totalPrice" value="${totalPrice + (productOptionList[status.index].price_of_option * cartList[status.index].quantity)}" />
		</c:forEach>
        <div style="text-align: right; padding: 20px; font-size: 18px; background-color: #f9f9f9;">
         	<strong style="color: #d92d2d; font-size: 22px;">
                총 결제 금액:&nbsp;<fmt:formatNumber value="${totalPrice}" pattern="#,###" />원
            </strong>
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

// 선택된 상품 아이디와 옵션 아이디 추출 & 동기 POST 요청
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
    form.action = '/order.do';
    
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
/**
  * (✅ 수정) 단일 상품 삭제 함수를 POST 방식으로 변경
  * @param {number} productId - 삭제할 상품의 ID
  * @param {number} optionId - 삭제할 상품의 옵션 ID
  */
 function deleteCartItem(productId, optionId) {
     if (confirm('이 상품을 장바구니에서 삭제하시겠습니까?')) {
         const form = document.createElement('form');
         form.method = 'POST';
         form.action = '/cart/cartDeleteAction.do';

         // productId를 위한 input
         const productInput = document.createElement('input');
         productInput.type = 'hidden';
         productInput.name = 'productId';
         productInput.value = productId;
         form.appendChild(productInput);

         // optionId를 위한 input
         const optionInput = document.createElement('input');
         optionInput.type = 'hidden';
         optionInput.name = 'optionId';
         optionInput.value = optionId;
         form.appendChild(optionInput);

         document.body.appendChild(form);
         form.submit();
     }
 }

/**
 * 장바구니에서 선택된 여러 상품을 삭제하는 함수 (POST 방식)
 */
function deleteSelectedItems() {
    const checkedBoxes = document.querySelectorAll('.item-checkbox:checked');
    if (checkedBoxes.length === 0) {
        alert('삭제할 상품을 선택해주세요.');
        return;
    }

    if (confirm(`선택한 ${checkedBoxes.length}개의 상품을 장바구니에서 삭제하시겠습니까?`)) {
        const form = document.createElement('form');
        form.method = 'POST';
        // (수정) 서버의 Action 경로와 일치시킵니다.
        form.action = '/cart/cartDeleteAction.do';

        Array.from(checkedBoxes).forEach(cb => {
            // (수정) productId를 위한 input 추가
            const productInput = document.createElement('input');
            productInput.type = 'hidden';
            productInput.name = 'productId';
            productInput.value = cb.dataset.productId;
            form.appendChild(productInput);

            // (수정) optionId를 위한 input 추가
            const optionInput = document.createElement('input');
            optionInput.type = 'hidden';
            optionInput.name = 'optionId';
            optionInput.value = cb.dataset.optionId;
            form.appendChild(optionInput);
        });

        document.body.appendChild(form);
        form.submit();
    }
}

</script>

</body>
</html>

