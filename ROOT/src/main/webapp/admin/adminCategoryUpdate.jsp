<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<main class="main-content">
    <div class="page-header">
        <h1>카테고리 수정</h1>
    </div>
    <div class="content-box narrow" style="padding-right: 32px;">
        <form action="${pageContext.request.contextPath}/admin/AdminCategoryUpdatePro.ac" method="post">
            <input type="hidden" name="id" value="${category.categoryId}">

            <div class="form-group" style="margin-bottom: 15px;">
                <label for="categoryName" style="display:block;font-weight:600;margin-bottom:6px;">상위 카테고리 이름</label>
                <input type="text" id="categoryName" name="categoryName" value="${category.categoryName}" required style="width:100%;padding:10px;border:1px solid #ccc;border-radius:5px;">
            </div>

            <c:if test="${not empty childList}">
                <h3 style="font-size:18px;margin:20px 0 10px;">하위 카테고리 관리</h3>
                <div class="child-list">
                    <c:forEach var="child" items="${childList}">
                        <div class="child-item" style="display:flex;gap:10px;align-items:center;margin-bottom:10px;">
                            <input type="hidden" name="childId" value="${child.categoryId}">
                            <input type="text" name="childName" value="${child.categoryName}" required style="flex:1;padding:10px;border:1px solid #ccc;border-radius:5px;">
                            <a href="${pageContext.request.contextPath}/admin/AdminChildCategoryDelete.ac?id=${child.categoryId}&parentId=${category.categoryId}"
                               class="delete-btn"
                               onclick="return confirm('[${child.categoryName}] 카테고리를 정말로 삭제하시겠습니까?');"
                               style="background:#dc3545;color:#fff;padding:10px 14px;border-radius:5px;text-decoration:none;">삭제</a>
                        </div>
                    </c:forEach>
                </div>
            </c:if>

            <div class="button-group" style="display:flex;justify-content:flex-end;gap:10px;margin-top:20px;">
                <button type="button" class="cancel-btn" onclick="location.href='${pageContext.request.contextPath}/admin/AdminCategories.ac'" style="background:#6c757d;color:#fff;padding:10px 16px;border:none;border-radius:5px;cursor:pointer;">목록으로</button>
                <button type="submit" class="submit-btn" style="background:#007bff;color:#fff;padding:10px 16px;border:none;border-radius:5px;cursor:pointer;">전체 저장</button>
            </div>
        </form>
    </div>
</main>