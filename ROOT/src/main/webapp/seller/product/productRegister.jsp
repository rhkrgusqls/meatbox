<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.product.seller.db.*" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*, org.apache.commons.fileupload.servlet.*" %>
<%@ page import="java.io.*, java.util.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    int userIndex = (int) session.getAttribute("userIndex");
    String uploadPath = application.getRealPath("/uploads/" + userIndex);
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) uploadDir.mkdirs();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 요청</title>
<style>
body { font-family: 'Segoe UI', sans-serif; background:#fff5f5; color:#4d0000; }
h2 { background:#b30000; color:#fff; text-align:center; padding:15px; border-radius:6px; }
form { max-width:700px; margin:0 auto; padding:30px; background:#ffe6e6; border-radius:10px; box-shadow:0 4px 10px rgba(0,0,0,0.15);}
label { display:block; margin-top:15px; font-weight:bold;}
input, textarea, select { width:100%; padding:8px 10px; margin-top:5px; border:1px solid #cc0000; border-radius:5px; box-sizing:border-box;}
input[type="submit"] { margin-top:20px; background:#b30000; color:#fff; padding:12px 20px; border:none; border-radius:8px; cursor:pointer; font-size:16px; transition:0.3s;}
input[type="submit"]:hover { background:#800000;}
.option-row { display:flex; gap:10px; margin-top:10px;}
.option-row input { flex:1; }
.add-option { margin-top:10px; background:#ff6666; color:#fff; border:none; padding:5px 10px; cursor:pointer; border-radius:5px;}
.add-option:hover { background:#cc0000; }
</style>

<script>
let optionCount = 0;
function addOptionRow() {
    const container = document.getElementById('option-container');
    const row = document.createElement('div');
    row.className = 'option-row';
    row.innerHTML = `
        <input type="text" name="option_name_${optionCount}" placeholder="옵션명" required>
        <input type="text" name="option_detail_${optionCount}" placeholder="옵션 상세" required>
        <input type="text" name="option_price_${optionCount}" placeholder="가격" required>
        <input type="text" name="option_qty_${optionCount}" placeholder="수량" required>
        <button type="button" onclick="this.parentElement.remove()">삭제</button>
    `;
    container.appendChild(row);
    optionCount++;
}
</script>
</head>
<body>
<h2>상품 등록 요청</h2>
<form action="sellerProductRegister.do" method="post" enctype="multipart/form-data">
    <label>상품명:</label> <input type="text" name="productName" required>
    <label>저장방식:</label>
    <select name="storageType">
        <option value="REFRIGERATED">냉장</option>
        <option value="FROZEN">냉동</option>
    </select>
    <label>판매태그:</label> <input type="text" name="saleTag">
    <label>형태:</label>
    <select name="productForm">
        <option value="CHOPPED">다진</option>
        <option value="WHOLE">전체</option>
        <option value="INDIVIDUAL">개별포장</option>
        <option value="PROCESSED_MEAT">가공육</option>
    </select>
    <label>배송비:</label> <input type="text" name="deliveryFee">
    <label>허용 등급:</label> <input type="text" name="allowedMemberLv">
    <label>규격 가격:</label> <input type="text" name="price">
    <label>규격:</label> <input type="text" name="unitPrice">
    <label>판매자 메모:</label> <input type="text" name="sellerNote">
    <label>카테고리:</label> <input type="text" name="categoryName">
    <label>세부 항목:</label> <input type="text" name="detailCategoryName">
    <label>주의사항:</label> <input type="text" name="cautionsText">

    <label>옵션:</label>
    <div id="option-container"></div>
    <button type="button" class="add-option" onclick="addOptionRow()">옵션 추가</button>

    <label>이미지 업로드:</label>
    <input type="file" name="images" multiple accept=".jpg,.png,.jpeg"><br><br>

    <input type="submit" value="요청 등록">
</form>
</body>
</html>



