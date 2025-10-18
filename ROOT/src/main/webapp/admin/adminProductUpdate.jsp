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
    </div>
</main>