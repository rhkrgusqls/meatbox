<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<main class="main-content">
    <header class="main-header">
        <h1>회원 관리</h1>
    </header>
    <div class="content-box">
        <form class="filter-form">
            <select name="search_field">
                <option value="user_id">회원 ID</option>
                <option value="user_name">이름</option>
                <option value="email">이메일</option>
            </select>
            <input type="text" placeholder="검색어를 입력하세요">
            <button type="button" class="btn btn-primary">검색</button>
        </form>
    </div>
    <div class="content-box">
        <h2>회원 목록</h2>
        <table class="order-table">
            <thead>
                <tr>
                    <th>회원 ID</th>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>가입일</th>
                    <th>상태</th>
                    <th>관리</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>user01</td>
                    <td>홍길동</td>
                    <td>hong@example.com</td>
                    <td>2025-10-17</td>
                    <td><span class="status completed">정상</span></td>
                    <td>
                        <a href="#" class="btn-small btn-edit">수정</a>
                        <a href="#" class="btn-small btn-delete">삭제</a>
                    </td>
                </tr>
                <tr>
                    <td>user02</td>
                    <td>김철수</td>
                    <td>kim@example.com</td>
                    <td>2025-10-16</td>
                    <td><span class="status pending">휴면</span></td>
                    <td>
                        <a href="#" class="btn-small btn-edit">수정</a>
                        <a href="#" class="btn-small btn-delete">삭제</a>
                    </td>
                </tr>
                 <tr>
                    <td>user03</td>
                    <td>박영희</td>
                    <td>park@example.com</td>
                    <td>2025-10-15</td>
                    <td><span class="status completed">정상</span></td>
                    <td>
                        <a href="#" class="btn-small btn-edit">수정</a>
                        <a href="#" class="btn-small btn-delete">삭제</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</main>