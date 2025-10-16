<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        
        <%-- 장바구니에 상품이 있을 경우 하드코딩 --%>
        <div style="display: flex; justify-content: space-between; align-items: center; padding: 15px; background-color: #f9f9f9; border-bottom: 1px solid #eee;">
            <span style="font-weight: bold; color: #00b343;">
                <img src="icon_fresh.png" alt="" style="vertical-align: middle; margin-right: 5px;">
                일반신선 2개  <%-- 하드코딩: 상품 개수 --%>
            </span>
            <span>(주)미트박스글로벌</span> <%-- 하드코딩: 판매사명 --%>
        </div>

        <%-- 장바구니 상품 1 --%>
        <div style="display: flex; align-items: center; padding: 20px; border-bottom: 1px solid #eee;">
            <div style="margin-right: 20px;">
                <img src="images/default_product.png" alt="샘플 상품 1" width="100" height="100"> <%-- 하드코딩: 상품 이미지 --%>
            </div>
            <div style="flex-grow: 1;">
                <p style="margin: 0 0 10px 0; font-weight: bold; font-size: 16px;">
                    샘플 상품 1 | 브랜드A <%-- 하드코딩: 상품명, 브랜드 --%>
                </p>
                <p style="margin: 0; font-size: 14px; color: #666;">
                    1박스 가격: <fmt:formatNumber value="10000" pattern="#,###" />원 | 수량: 2박스 <%-- 하드코딩: 가격, 수량 --%>
                </p>
            </div>
            <div style="width: 150px; text-align: right; font-weight: bold; font-size: 16px; margin-right: 30px;">
                소계: <fmt:formatNumber value="20000" pattern="#,###" />원 <%-- 하드코딩: 소계 --%>
            </div>
        </div>

        <%-- 장바구니 상품 2 --%>
        <div style="display: flex; align-items: center; padding: 20px; border-bottom: 1px solid #eee;">
            <div style="margin-right: 20px;">
                <img src="images/default_product.png" alt="샘플 상품 2" width="100" height="100"> <%-- 하드코딩: 상품 이미지 --%>
            </div>
            <div style="flex-grow: 1;">
                <p style="margin: 0 0 10px 0; font-weight: bold; font-size: 16px;">
                    샘플 상품 2 | 브랜드B <%-- 하드코딩: 상품명, 브랜드 --%>
                </p>
                <p style="margin: 0; font-size: 14px; color: #666;">
                    1박스 가격: <fmt:formatNumber value="15000" pattern="#,###" />원 | 수량: 1박스 <%-- 하드코딩: 가격, 수량 --%>
                </p>
            </div>
            <div style="width: 150px; text-align: right; font-weight: bold; font-size: 16px; margin-right: 30px;">
                소계: <fmt:formatNumber value="15000" pattern="#,###" />원 <%-- 하드코딩: 소계 --%>
            </div>
        </div>

        <%-- 총 결제 금액 요약 --%>
        <div style="text-align: right; padding: 20px; font-size: 18px; background-color: #f9f9f9;">
            상품금액 35,000원 + 배송/포장비 0원 = 
            <strong style="color: #d92d2d; font-size: 22px;">총 35,000원</strong> <%-- 하드코딩: 총 결제 금액 --%>
        </div>

    </div>
</div>

</body>
</html>