<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품 등록 요청</title>
    <style>
        body {
            font-family: '맑은 고딕', sans-serif;
            background: #f9f9f9;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            width: 600px;
            margin: 20px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"], textarea, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 5px;
        }
        input[type="submit"] {
            margin-top: 20px;
            width: 100%;
            background: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
<h2>🛒 상품 등록 요청 폼</h2>

<form action="ProductRegisterRequestServlet" method="post">
    <label>판매자 User Index</label>
    <input type="number" name="userIndex" required>

    <label>상품명</label>
    <input type="text" name="productName" required>

    <label>보관 방식</label>
    <select name="storageType" required>
        <option value="REFRIGERATED">냉장</option>
        <option value="FROZEN">냉동</option>
        <option value="ROOM_TEMP">상온</option>
    </select>

    <label>판매 태그</label>
    <input type="text" name="saleTag" placeholder="예: 신상품, 세일" required>

    <label>상품 형태</label>
    <input type="text" name="productForm" placeholder="예: CHOPPED, WHOLE" required>

    <label>배송비</label>
    <input type="number" name="deliveryFee" value="3000" required>

    <label>허용 회원 등급</label>
    <input type="number" name="allowedMemberLv" value="1" required>

    <label>가격(원)</label>
    <input type="number" name="price" required>

    <label>단가(원)</label>
    <input type="number" name="unitPrice" required>

    <label>판매자 메모</label>
    <textarea name="sellerNote" rows="3" placeholder="상품에 대한 간단한 설명"></textarea>

    <label>카테고리명</label>
    <input type="text" name="categoryName" placeholder="예: 소고기" required>

    <label>상세 카테고리명</label>
    <input type="text" name="detailCategoryName" placeholder="예: 한우" required>

    <label>주의사항</label>
    <textarea name="cautionsText" rows="2" placeholder="예: 개봉 후 냉장 보관"></textarea>

    <label>상품 옵션(JSON 형식)</label>
    <textarea name="productOptionsJson" rows="2">[{"option_name":"사이즈","option_detail":"L","priceOfOption":0,"quantity":10}]</textarea>

    <label>상품 이미지(JSON 형식)</label>
    <textarea name="productImagesJson" rows="2">[{"dir":"/images/product1.jpg"}]</textarea>

    <label>상품 상세(JSON 형식)</label>
    <textarea name="productDetailsJson" rows="2">[{"dir":"/details/product1.pdf"}]</textarea>

    <input type="submit" value="상품 등록 요청하기">
</form>

</body>
</html>
