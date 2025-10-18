<%-- src/main/webapp/admin/adminCategories.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    /* ... 이전 CSS 코드는 그대로 사용 ... */
    .admin-content { width: 100%; padding: 25px; color: #333; background-color: #f9f9f9; box-sizing: border-box; }
    .admin-content h2 { font-size: 26px; margin-bottom: 25px; padding-bottom: 15px; border-bottom: 2px solid #eee; font-weight: 600; }
    .admin-content h3 { font-size: 18px; margin-bottom: 15px; font-weight: 600; }
    .category-add-form, .category-list { background-color: #ffffff; padding: 25px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.05); margin-bottom: 30px; }
    .category-add-form form { display: flex; gap: 10px; align-items: center; }
    .category-add-form input[type="text"], .category-add-form select { flex-grow: 1; padding: 12px; border: 1px solid #ccc; border-radius: 5px; font-size: 15px; transition: border-color 0.3s; }
    .category-add-form input[type="text"]:focus, .category-add-form select:focus { border-color: #007bff; outline: none; }
    .category-add-form button { padding: 12px 25px; border: none; background-color: #28a745; color: white; font-size: 15px; font-weight: bold; border-radius: 5px; cursor: pointer; transition: background-color 0.3s; flex-shrink: 0; }
    .category-add-form button:hover { background-color: #218838; }
    .table-wrapper { max-height: 600px; overflow-y: auto; border: 1px solid #eaeaea; border-radius: 5px; }
    .category-list table { width: 100%; border-collapse: collapse; font-size: 15px; }
    .category-list th, .category-list td { padding: 14px 10px; text-align: left; border-bottom: 1px solid #eaeaea; }
    .category-list thead th { position: sticky; top: 0; background-color: #f8f9fa; color: #555; font-weight: 600; z-index: 10; }
    .category-list tbody tr:hover { background-color: #f1f8ff; }
    .category-list td:nth-child(1), .category-list th:nth-child(1) { width: 10%; text-align: center; } /* ID */
    .category-list td:nth-child(2), .category-list th:nth-child(2) { width: 40%; } /* 이름 */
    .category-list td:nth-child(3), .category-list th:nth-child(3) { width: 30%; } /* 부모 카테고리 */
    .category-list td:nth-child(4), .category-list th:nth-child(4) { width: 20%; text-align: center; } /* 작업 */
    .category-list td.child-category { padding-left: 30px; } /* 자식 카테고리 들여쓰기 */
    .category-list td a { color: #007bff; text-decoration: none; margin: 0 10px; padding: 5px 10px; border-radius: 4px; transition: background-color 0.2s, color 0.2s; }
    .category-list td a:hover { background-color: #007bff; color: #fff; }
    .category-list td a[href*="Delete"] { color: #dc3545; }
    .category-list td a[href*="Delete"]:hover { background-color: #dc3545; color: #fff; }
</style>

<div class="admin-content">
    <h2>카테고리 관리</h2>

    <div class="category-add-form">
        <h3>카테고리 추가</h3>
        <form action="${pageContext.request.contextPath}/AdminCategoryAddTop.ac" method="post">
            <input type="text" name="categoryName" placeholder="새 카테고리 이름" required>
            <button type="submit">추가</button>
        </form>
    </div>

    <div class="category-add-form">
        <h3>하위 카테고리 추가</h3>
        <form action="${pageContext.request.contextPath}/AdminCategoryAddChild.ac" method="post">
            <select name="parentId" required>
                <option value="">-- 상위 카테고리 선택 --</option>
                <c:forEach var="topCat" items="${topLevelCategories}">
                    <option value="${topCat.categoryId}">${topCat.categoryName}</option>
                </c:forEach>
            </select>
            <input type="text" name="childCategoryName" placeholder="새 카테고리 이름" required>
            <button type="submit">추가</button>
        </form>
    </div>

	<div class="category-list">
	        <h3>카테고리 목록</h3>
	        <div class="table-wrapper">
	            <table>
	                <thead>
	                    <tr>
	                        <%-- <th>ID</th> --%> <%-- ID 컬럼 제거 --%>
	                        <th>이름</th>
	                        <th>하위 카테고리</th>
	                        <th>작업</th>
	                    </tr>
	                </thead>
	                <tbody id="categoryTableBody">
	                    <%-- 이제 categoryList는 최상위 카테고리만 담고 있습니다. --%>
	                    <c:forEach var="category" items="${categoryList}">
	                        <tr>
	                            <%-- <td>${category.categoryId}</td> --%> <%-- ID 데이터 제거 --%>
	                            <td><b>${category.categoryName}</b></td>
	                            <td>
	                                <%-- 자식 카테고리 목록을 쉼표로 구분하여 출력 --%>
	                                <c:forEach var="child" items="${category.children}" varStatus="status">
	                                    ${child.categoryName}<c:if test="${not status.last}">, </c:if>
	                                </c:forEach>
	                            </td>
	                            <td>
	                                <a href="${pageContext.request.contextPath}/AdminCategoryUpdate.ac?id=${category.categoryId}">수정</a>
	                                <a href="${pageContext.request.contextPath}/AdminCategoryDelete.ac?id=${category.categoryId}" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
	                            </td>
	                        </tr>
	                    </c:forEach>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>