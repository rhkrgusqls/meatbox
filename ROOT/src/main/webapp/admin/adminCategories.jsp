<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="admin-content">
    <h2>카테고리 관리</h2>

    <div class="category-add-form">
        <h3>새 카테고리 추가</h3>
        <form action="./AdminCategoryAdd.ac" method="post">
            <input type="text" name="categoryName" placeholder="카테고리 이름" required>
            <button type="submit">추가</button>
        </form>
    </div>

    <div class="category-list">
        <h3>카테고리 목록</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>이름</th>
                    <th>작업</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="category" items="${categoryList}">
                    <tr>
                        <td>${category.categoryId}</td>
                        <td>${category.categoryName}</td>
                        <td>
                            <a href="./AdminCategoryUpdate.ac?id=${category.categoryId}">수정</a>
                            <a href="./AdminCategoryDelete.ac?id=${category.categoryId}" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>