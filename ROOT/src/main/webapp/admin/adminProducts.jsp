<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<main class="main-content">
    <div class="page-header">
        <h1>상품 관리</h1>
        <a href="#" class="btn btn-primary">+ 신규 상품 등록</a>
    </div>
    <div class="content-box">
        <h2>상품 목록</h2>
        <table class="order-table">
            <thead>
                <tr>
                    <th>상품 ID</th>
                    <th>상품명</th>
                    <th>카테고리</th>
                    <th>가격</th>
                    <th>재고</th>
                    <th>상태</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>P001</td>
                    <td>국내산 냉장 삼겹살 500g</td>
                    <td>돼지고기</td>
                    <td>15,900원</td>
                    <td>120개</td>
                    <td><span class="status completed">판매중</span></td>
                    <td>
                        <a href="#" class="btn-small btn-edit">수정</a>
                        <a href="#" class="btn-small btn-delete">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td>P002</td>
                    <td>호주산 냉동 부채살 1kg</td>
                    <td>소고기</td>
                    <td>28,000원</td>
                    <td>0개</td>
                    <td><span class="status cancelled">품절</span></td>
                    <td>
                        <a href="#" class="btn-small btn-edit">수정</a>
                        <a href="#" class="btn-small btn-delete">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td>P003</td>
                    <td>국내산 닭볶음탕용 닭 1kg</td>
                    <td>닭고기</td>
                    <td>8,900원</td>
                    <td>50개</td>
                    <td><span class="status completed">판매중</span></td>
                    <td>
                        <a href="#" class="btn-small btn-edit">수정</a>
                        <a href="#" class="btn-small btn-delete">삭제</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</main>