<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>미트박스 :: 1등 고기 직거래</title>
    <meta property="og:image" content="https://www.meatbox.co.kr/img/co/meatboxOgImage.png" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="육류 4,500 + 식재료 2,000개! 미트박스와 최대 30% 원가절감 해볼까요?" />

    <%-- =============================================================================== --%>
    <%--  미트박스 사이트 CSS 및 JS 라이브러리 링크 (경로는 서버 환경에 맞게 절대경로 사용) --%>
    <%-- =============================================================================== --%>
    <link rel="shortcut icon" href="https://static-cdn.meatbox.co.kr/img/fo/favicon.ico?t=20240409" type="image/x-icon" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/common.min.css" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/style.min.css" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/renew.min.css" type="text/css" media="all" charset="UTF-8" />
    <link type="text/css" rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/swiper/5.2.1/swiper.min.css" media="screen" charset="UTF-8" />
    
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery-1.12.4.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery-ui-1.12.1.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery.bpopup-0.11.0.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery.cookie-1.4.1.js" charset="UTF-8"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/constant/Const.min.js"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/tool/CommonTools.min.js"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/tool/ProductTool.min.js"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/tool/FoTool.min.js"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/swiper/5.2.1/swiper-7.4.1.min.js" charset="UTF-8"></script>
</head>
<body>

<%-- 헤더 인클루드 --%>

<jsp:include page="/include/header.jsp" />

<div class="container">
    <div id="contents" class="inner">
        <h2>결제수단 등록</h2>
        <form action="/payment/registerAction.do" method="post" style="width: 500px; margin: 20px auto; padding: 20px; border: 1px solid #ddd;">
            
            <%-- [✅ 핵심 수정 2] 컨트롤러로 돌아올 주소를 넘겨주기 위한 hidden input 추가 --%>
            <input type="hidden" name="returnUrl" value="${param.returnUrl}">

            <div style="margin-bottom: 15px;">
                <label for="provider" style="display: inline-block; width: 120px; font-weight: bold;">결제 제공사</label>
                <input type="text" id="provider" name="provider" required class="width200 input_wid">
            </div>
            <div style="text-align: center;">
                <button type="submit" class="common-big common-btn-style common-btn-red">등록</button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="/include/footer.jsp" />

</body>
</html>