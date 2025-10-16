<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>미트박스 :: 사업자 회원가입 (2단계)</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/common.min.css">
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/style.min.css">
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/renew.min.css">
</head>
<body>
<div class="container white_box">
    <div class="content">
        <div id="join_login" class="join_form">
            <div class="join-form-comm">
                <div class="join-tit">
                    <h4>사업자 회원가입 (2/2)</h4>
                    <h2>거의 다왔어요!<br><em class="ce853">개인 정보</em>를 입력해주세요</h2>
                </div>
            </div>
            <div class="form_box">
                <div class="form-wrap">
                    <!-- [수정] action 경로를 상위 폴더 기준으로 변경했습니다. -->
                    <form action="../registerSellerAction.do" method="post">
                        <!-- 
                            [핵심 2] 이 div는 비어있지만, 아래 자바스크립트가
                            1단계에서 URL로 넘어온 사업자 정보를 <input type="hidden"> 형태로 채워넣을 공간입니다.
                        -->
                        <div id="business-info-hidden-fields"></div>

                        <div class="input_form">
                            <ul>
                                <li>
                                    <div class="input-wrap">
                                        <input type="text" id="memberId" name="id" placeholder="아이디" data-focus="아이디(영문,숫자/4~18자 이내)" required>
                                        <span class="placeholder">아이디</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="input-wrap">
                                        <input type="password" id="passwd" name="password" placeholder="비밀번호" data-focus="비밀번호(영문,숫자,특수문자/28자 이내)" required>
                                        <span class="placeholder">비밀번호</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="input-wrap">
                                        <input type="text" id="realName" name="name" placeholder="이름" data-focus="이름(국,영문/30자 이내)" required>
                                        <span class="placeholder">이름</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="btn_box">
                            <button type="submit" class="comm_btn">회원가입 완료</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- [핵심 3] 페이지 로드 시 URL 파라미터를 읽어 숨겨진 필드를 만드는 스크립트 -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const urlParams = new URLSearchParams(window.location.search);
        const hiddenFieldsContainer = document.getElementById('business-info-hidden-fields');

        // URL에 있는 모든 파라미터(companyName, businessNumber 등)를 반복합니다.
        urlParams.forEach((value, key) => {
            // 각 파라미터에 대해 <input type="hidden"> 요소를 생성합니다.
            const hiddenInput = document.createElement('input');
            hiddenInput.type = 'hidden';
            hiddenInput.name = key;
            hiddenInput.value = value;
            
            // 생성된 hidden input을 form 안의 div에 추가합니다.
            hiddenFieldsContainer.appendChild(hiddenInput);
        });
    });
</script>

</body>
</html>

