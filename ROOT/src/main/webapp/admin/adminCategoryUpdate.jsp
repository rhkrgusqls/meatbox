<%-- /admin/adminCategoryUpdate.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 수정</title>
<style>
    /* adminCategories.jsp와 동일한 스타일을 적용하여 일관성 유지 */
    body { font-family: 'Noto Sans KR', sans-serif; background-color: #f9f9f9; padding: 20px; }
    .update-container { max-width: 600px; margin: 40px auto; background-color: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.05); }
    h2 { font-size: 26px; margin-bottom: 25px; padding-bottom: 15px; border-bottom: 2px solid #eee; font-weight: 600; text-align: center; }
    form { display: flex; flex-direction: column; gap: 15px; }
    label { font-size: 16px; font-weight: 600; }
    input[type="text"] { padding: 12px; border: 1px solid #ccc; border-radius: 5px; font-size: 15px; }
    .button-group { display: flex; justify-content: flex-end; gap: 10px; margin-top: 20px; }
    button { padding: 12px 25px; border: none; font-size: 15px; font-weight: bold; border-radius: 5px; cursor: pointer; transition: background-color 0.3s; }
    .submit-btn { background-color: #007bff; color: white; }
    .submit-btn:hover { background-color: #0056b3; }
    .cancel-btn { background-color: #6c757d; color: white; }
    .cancel-btn:hover { background-color: #5a6268; }
</style>
</head>
<body>
    <div class="update-container">
        <h2>카테고리 수정</h2>
        <form action="${pageContext.request.contextPath}/AdminCategoryUpdatePro.ac" method="post">
            <%-- categoryId는 화면에 보이지 않게 hidden 타입으로 전송합니다. --%>
            <input type="hidden" name="id" value="${category.categoryId}">
            
            <div>
                <label for="categoryName">카테고리 이름</label>
                <input type="text" id="categoryName" name="categoryName" value="${category.categoryName}" required>
            </div>
            
            <div class="button-group">
                <button type="button" class="cancel-btn" onclick="history.back()">취소</button>
                <button type="submit" class="submit-btn">저장</button>
            </div>
        </form>
    </div>
</body>
</html>