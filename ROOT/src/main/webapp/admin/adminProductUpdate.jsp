<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<main class="main-content">
    <div class="page-header">
        <h1>상품 수정</h1>
    </div>
    <div class="content-box">
        <h2>[${product.product_id}] ${product.name}</h2>

        <form action="/admin/AdminProductUpdate.ac" method="post">
            <input type="hidden" name="productId" value="${product.product_id}">

            <table class="order-table">
                <tr>
                    <th>상품명</th>
                    <td><input type="text" name="productName" value="${product.name}" style="width: 90%;"></td>
                </tr>
                <tr>
                    <th>기본 가격</th>
                    <td><input type="number" name="price" value="${product.price}"> 원</td>
                </tr>
                <tr>
                    <th>카테고리</th>
                    <td>
                        <select id="parentCategory" style="min-width:180px;"></select>
                        <select id="childCategory" name="categoryId" style="min-width:220px; margin-left:8px;"></select>
                    </td>
                </tr>
            </table>

            <h3 style="margin-top: 30px; margin-bottom: 10px;">옵션별 재고 및 가격 관리</h3>
		<table class="order-table">
  		  <thead>
      		  <tr>
         		   <th>옵션 ID</th>
          		  <th>옵션명</th>
          		  <th>옵션 상세</th>
         		   <th>옵션 가격 (원)</th> <%-- 컬럼 추가 --%>
         		   <th>재고 수량 (개)</th>
      		  </tr>
  		  </thead>
 		   <tbody>
   		     <c:forEach var="opt" items="${product.optionList}">
        		    <tr>
             		   <td>${opt.option_id}</td>
              		  <td>${opt.option_name}</td>
              		  <td>${opt.option_detail}</td>
            		    <td>
           		         <input type="number" name="price_of_option_${opt.option_id}" value="${opt.price_of_option}">
          		      </td>
         		       <td>
            		        <input type="number" name="quantity_${opt.option_id}" value="${opt.quantity}">
            		    </td>
         		   </tr>
       		 </c:forEach>
    		</tbody>
			</table>

            <div style="margin-top: 20px; text-align: center;">
                <button type="submit" class="btn btn-primary">수정 완료</button>
                <a href="/admin/AdminProductList.ac" class="btn">취소</a>
            </div>
        </form>

        <script>
        (function() {
            var currentParentId = ${currentParentId == null ? "null" : currentParentId};
            var currentCategoryId = ${currentCategoryId == null ? "null" : currentCategoryId};

            var parentSel = document.getElementById('parentCategory');
            var childSel = document.getElementById('childCategory');

            function fetchCategories(parentId) {
                var url = parentId == null ? '/GetCategories.cbo' : ('/GetCategories.cbo?parentId=' + parentId);
                return fetch(url).then(function(r){return r.json();});
            }

            function fillSelect(select, items, selectedId) {
                select.innerHTML = '';
                var placeholder = document.createElement('option');
                placeholder.value = '';
                placeholder.textContent = select === parentSel ? '상위 카테고리 선택' : '하위 카테고리 선택';
                select.appendChild(placeholder);
                items.forEach(function(it){
                    var opt = document.createElement('option');
                    opt.value = it.id;
                    opt.textContent = it.name;
                    if (selectedId !== null && selectedId !== undefined && String(it.id) === String(selectedId)) {
                        opt.selected = true;
                    }
                    select.appendChild(opt);
                });
            }

            parentSel.addEventListener('change', function() {
                var pid = parentSel.value ? parseInt(parentSel.value, 10) : null;
                childSel.innerHTML = '';
                if (pid == null) return;
                fetchCategories(pid).then(function(list){
                    fillSelect(childSel, list, null);
                });
            });

            // 초기 로드: 상위 카테고리 채우기 -> 자식 채우기
            fetchCategories(null).then(function(top){
                fillSelect(parentSel, top, currentParentId);
                var pid = parentSel.value ? parseInt(parentSel.value, 10) : null;
                if (pid != null) {
                    return fetchCategories(pid).then(function(children){
                        fillSelect(childSel, children, currentCategoryId);
                    });
                }
            });
        })();
        </script>
    </div>
</main>