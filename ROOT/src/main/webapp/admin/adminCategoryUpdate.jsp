<%-- /admin/adminCategoryUpdate.jsp (전체 교체) --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 수정</title>
<style>
    body { font-family: 'Noto Sans KR', sans-serif; background-color: #f9f9f9; padding: 20px; }
    .update-container { max-width: 800px; margin: 40px auto; background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.05); }
    h2, h3 { font-weight: 600; }
    h2 { font-size: 26px; text-align: center; margin-bottom: 25px; padding-bottom: 15px; border-bottom: 2px solid #eee; }
    h3 { font-size: 20px; margin-top: 30px; margin-bottom: 15px; padding-bottom: 10px; border-bottom: 1px solid #f0f0f0;}
    .form-group { margin-bottom: 15px; }
    label { font-size: 16px; font-weight: 600; display: block; margin-bottom: 5px; }
    input[type="text"] { width: 100%; box-sizing: border-box; padding: 12px; border: 1px solid #ccc; border-radius: 5px; font-size: 15px; }
    .child-item { display: flex; align-items: center; gap: 10px; margin-bottom: 10px; }
    .child-item input[type="text"] { flex-grow: 1; }
    .delete-btn { width: 30px; background-color: #dc3545; color: white; padding: 10px 15px; text-decoration: none; border-radius: 5px; font-size: 14px; transition: background-color 0.3s; }
    .delete-btn:hover { background-color: #c82333; }
    .button-group { display: flex; justify-content: flex-end; gap: 10px; margin-top: 30px; }
    button { padding: 12px 25px; border: none; font-size: 15px; font-weight: bold; border-radius: 5px; cursor: pointer; transition: background-color 0.3s; }
    .submit-btn { background-color: #007bff; color: white; }
    .submit-btn:hover { background-color: #0056b3; }
    .cancel-btn { background-color: #6c757d; color: white; }
    .cancel-btn:hover { background-color: #5a6268; }
</style>
</head>
<body>
    <div class="update-container">
        <form action="${pageContext.request.contextPath}/AdminCategoryUpdatePro.ac" method="post">
            <h2>카테고리 수정</h2>
            
            <%-- 부모 카테고리 ID는 hidden으로 전송 --%>
            <input type="hidden" name="id" value="${category.categoryId}">
            
            <%-- 부모 카테고리 이름 수정 --%>
            <div class="form-group">
                <label for="categoryName">상위 카테고리 이름</label>
                <input type="text" id="categoryName" name="categoryName" value="${category.categoryName}" required>
            </div>
            
            <%-- 자식 카테고리 목록 수정 및 삭제 --%>
            <c:if test="${not empty childList}">
                <h3>하위 카테고리 관리</h3>
                <div class="child-list">
                    <c:forEach var="child" items="${childList}">
                        <div class="child-item">
                            <%-- 각 자식의 ID와 이름을 전송하기 위한 input --%>
                            <input type="hidden" name="childId" value="${child.categoryId}">
                            <input type="text" name="childName" value="${child.categoryName}" required>
                            <a href="${pageContext.request.contextPath}/AdminChildCategoryDelete.ac?id=${child.categoryId}&parentId=${category.categoryId}"
                               class="delete-btn"
                               onclick="return confirm('[${child.categoryName}] 카테고리를 정말로 삭제하시겠습니까?');">삭제</a>
                        </div>
                    </c:forEach>
                </div>
            </c:if>

            <div class="button-group">
                <button type="button" class="cancel-btn" onclick="location.href='${pageContext.request.contextPath}/AdminHome.ac?page=categories'">목록으로</button>
                <button type="submit" class="submit-btn">전체 저장</button>
            </div>
        </form>
    </div>
</body>
</html>