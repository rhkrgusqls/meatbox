<%-- src/main/webapp/admin/adminCategories.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 스타일시트 수정 --%>
<style>
    /* 전체 컨텐츠 영역 */
    .admin-content {
        width: 100%;
        padding: 25px;
        color: #333;
        background-color: #f9f9f9;
        box-sizing: border-box;
    }

    /* 페이지 메인 제목 */
    .admin-content h2 {
        font-size: 26px;
        margin-bottom: 25px;
        padding-bottom: 15px;
        border-bottom: 2px solid #eee;
        font-weight: 600;
    }

    /* 각 섹션(폼, 목록)의 제목 */
    .admin-content h3 {
        font-size: 18px;
        margin-bottom: 15px;
        font-weight: 600;
    }

    /* 폼과 목록을 감싸는 카드 스타일 */
    .category-add-form, .category-list {
        background-color: #ffffff;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        margin-bottom: 30px;
    }

    /* 카테고리 추가 폼 */
    .category-add-form form {
        display: flex;
        gap: 10px;
    }

    /* 텍스트 입력창 */
    .category-add-form input[type="text"] {
        flex-grow: 1;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 15px;
        transition: border-color 0.3s;
    }

    .category-add-form input[type="text"]:focus {
        border-color: #007bff;
        outline: none;
    }

    /* 추가 버튼 */
    .category-add-form button {
        padding: 12px 25px;
        border: none;
        background-color: #28a745;
        color: white;
        font-size: 15px;
        font-weight: bold;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .category-add-form button:hover {
        background-color: #218838;
    }

    /* ======== 스크롤 기능 추가 ======== */
    /* 테이블을 감싸는 래퍼 */
    .table-wrapper {
        max-height: 500px; /* 테이블의 최대 높이 지정, 이 높이를 넘으면 스크롤 생성 */
        overflow-y: auto;  /* 세로 스크롤을 자동으로 표시 */
        border: 1px solid #eaeaea;
        border-radius: 5px;
    }

    /* 카테고리 목록 테이블 */
    .category-list table {
        width: 100%;
        border-collapse: collapse;
        font-size: 15px;
    }

    .category-list th, .category-list td {
        padding: 14px 10px;
        text-align: left;
        border-bottom: 1px solid #eaeaea;
    }

    /* 테이블 헤더 - 상단에 고정 */
    .category-list thead th {
        position: sticky; /* 스크롤 시 위치 고정 */
        top: 0;           /* 가장 상단에 고정 */
        background-color: #f8f9fa;
        color: #555;
        font-weight: 600;
        z-index: 10;      /* 다른 요소 위에 보이도록 설정 */
    }

    /* 테이블 행 호버 효과 */
    .category-list tbody tr:hover {
        background-color: #f1f8ff;
    }
    
    .category-list td:nth-child(1), .category-list th:nth-child(1) { width: 10%; text-align: center; }
    .category-list td:nth-child(2), .category-list th:nth-child(2) { width: 70%; }
    .category-list td:nth-child(3), .category-list th:nth-child(3) { width: 20%; text-align: center; }


    /* 수정/삭제 링크 */
    .category-list td a {
        color: #007bff;
        text-decoration: none;
        margin: 0 10px;
        padding: 5px 10px;
        border-radius: 4px;
        transition: background-color 0.2s, color 0.2s;
    }

    .category-list td a:hover {
        background-color: #007bff;
        color: #fff;
    }

    .category-list td a[href*="Delete"] {
        color: #dc3545;
    }
    .category-list td a[href*="Delete"]:hover {
        background-color: #dc3545;
        color: #fff;
    }
</style>

<div class="admin-content">
    <h2>카테고리 관리</h2>

    <div class="category-add-form">
        <h3>새 카테고리 추가</h3>
        <form id="addCategoryForm" onsubmit="addCategory(event)">
            <input type="text" name="categoryName" id="categoryNameInput" placeholder="카테고리 이름" required>
            <button type="submit">추가</button>
        </form>
    </div>

    <div class="category-list">
        <h3>카테고리 목록</h3>
        <%-- 테이블을 div로 한번 감싸줍니다. --%>
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>이름</th>
                        <th>작업</th>
                    </tr>
                </thead>
                <tbody id="categoryTableBody">
                    <c:forEach var="category" items="${categoryList}">
                        <tr>
                            <td>${category.categoryId}</td>
                            <td>${category.categoryName}</td>
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

<script>
function addCategory(event) {
    event.preventDefault();

    const categoryNameInput = document.getElementById('categoryNameInput');
    const categoryName = categoryNameInput.value.trim();

    if (!categoryName) {
        alert('카테고리 이름을 입력하세요.');
        return;
    }

    const formData = new URLSearchParams();
    formData.append('categoryName', categoryName);

    fetch('${pageContext.request.contextPath}/AdminCategoryAdd.ac', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('서버 응답에 문제가 있습니다. 상태: ' + response.status);
        }
        if (response.redirected) {
            return { status: 'success', url: response.url };
        }
        return response.text().then(text => {
            throw new Error('예상치 못한 응답입니다: ' + text);
        });
    })
    .then(data => {
        if (data.status === 'success') {
            alert('카테고리가 성공적으로 추가되었습니다.');
            location.reload();
        } else {
            alert('카테고리 추가에 실패했습니다.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('카테고리 추가 중 오류가 발생했습니다. 개발자 콘솔을 확인해주세요.');
    });
}
</script>