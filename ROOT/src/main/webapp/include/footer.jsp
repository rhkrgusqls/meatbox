<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="newVer" id="footer">
    <section class="footer-inner-wrap">
        <article class="support grid-col-gap016 f-size14-700">
            <div class="logo flex-col">
                <a href="javascript:;" onclick="WebTool.goHome();"><img src="https://static-cdn.meatbox.co.kr/img/renew/logo-row-en.svg" alt="미트박스 로고" width="134px" height="27px" loading="lazy"></a>
            </div>
            <div class="oprt flex-col">
                <ul class="flex-col-gap8">
                    <li>
                        <span class="ico-inner-wrap">
                            <i class="left icon"><img src="https://static-cdn.meatbox.co.kr/img/renew/icon-customer-center.svg" alt="고객센터" width="16px" height="16px" loading="lazy"></i>
                            <em>고객센터</em>
                        </span>
                        <h3 class="f-size32-700"><a href="tel:1644-6689">1644-6689</a></h3>
                    </li>
                    <li>
                        <dl class="f-size12-400">
                            <dt>평일</dt><dd>오전 9시 - 오후 7시</dd>
                            <dt>토요일</dt><dd>오전 9시 - 오후 1시</dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="inqry flex-col">
                <ul class="flex-col-gap16">
                    <li>
                        <span class="ico-inner-wrap" onclick="WebTool.go('/fo/applyAdmission/applicationFormPage.do');">
                            <i class="left icon"><img src="https://static-cdn.meatbox.co.kr/img/renew/icon-document-edit.svg" alt="입점 제휴 문의" width="16px" height="16px" loading="lazy"></i>
                            <em>입점 제휴 문의</em>
                            <i class="right shortcut"><img src="https://static-cdn.meatbox.co.kr/img/renew/icon-chevron-r-babec4.svg" alt="바로가기 이미지" width="12px" height="12px" loading="lazy"></i>
                        </span>
                    </li>
                    <li>
                        <span class="ico-inner-wrap" onclick="FoTool.go('/fo/myInquiry/myInquiryListPage.do');">
                            <i class="left icon"><img src="https://static-cdn.meatbox.co.kr/img/renew/icon-bubbles-question.svg" alt="1:1 문의" width="16px" height="16px" loading="lazy"></i>
                            <em>1:1 문의</em>
                            <i class="right shortcut"><img src="https://static-cdn.meatbox.co.kr/img/renew/icon-chevron-r-babec4.svg" alt="바로가기 이미지" width="12px" height="12px" loading="lazy"></i>
                        </span>
                    </li>
                    <li>
                        <span class="ico-inner-wrap" onclick="WebTool.go ('/fo/faq/faqListPage.do');">
                            <i class="left icon"><img src="https://static-cdn.meatbox.co.kr/img/renew/icon-ask.svg" alt="자주 묻는 질문" width="16px" height="16px" loading="lazy"></i>
                            <em>자주 묻는 질문</em>
                            <i class="right shortcut"><img src="https://static-cdn.meatbox.co.kr/img/renew/icon-chevron-r-babec4.svg" alt="바로가기 이미지" width="12px" height="12px" loading="lazy"></i>
                        </span>
                    </li>
                </ul>
            </div>
        </article>
        <article class="notice-news-area flex-row-gap032">
            <div class="flex-col-gap12 notice">
                <a href="javascript:;" class="f-size14-700 tit" id="noticeClass" onclick="WebTool.go ('/fo/notice/noticeListPage.do');"><span class="txt">공지사항</span></a>
                <a href="javascript:;" class="flex-row-gap012 cont-wrap" id="noticeItem">
                    <p class="cont f-size14-400" id="noticeList"></p>
                    <span class="date" id="noticeDate"></span>
                </a>
            </div>
            <div class="flex-col-gap12 news">
                <a href="javascript:;" class="f-size14-700 tit" id="newsClass" onclick="WebTool.go ('/fo/meatboxInfo/meatboxNewsPage.do');"><span class="txt">언론보도</span></a>
                <a href="javascript:;" target="_blank" class="flex-row-gap012 cont-wrap" id="newsItem">
                    <p class="cont f-size14-400" id="newsList"></p>
                    <span class="date" id="newsDate"></span>
                </a>
            </div>
        </article>
        <article class="fnb flex-space-between">
            <div class="corp f-size14-500">
                <ul class="flex-row-gap16">
                    <li><a href="javascript:;" target="" class="emphasis" onclick="WebTool.open ('/mo/misc/terms.do?typeCd=TC04', '_privacyPolicyPage_', {resizable:1, scrollbars:'yes', width:520, height:720} );" style="font-weight: 700">개인정보 처리방침</a></li>
                    <li><a href="javascript:;" target="" class="" onclick="window.open ('https://meatbox.career.greetinghr.com','_blank');">회사소개</a></li>
                    <li><a href="javascript:;" target="" class="" onclick="window.open ('https://meatbox.career.greetinghr.com/newsroomir','_blank');">투자정보</a></li>
                    <li><a href="javascript:;" target="" class="" onclick="HeaderMgr.goAppDownLoadPage();">앱 다운로드</a></li>
                    <li><a href="javascript:;" target="" class="" onclick="WebTool.open ('/mo/misc/terms.do?typeCd=TC01', '_buyerClausePage_', {resizable:1, scrollbars:'yes', width:520, height:720});">이용약관</a></li>
                    <li><a href="javascript:;" target="" class="" onclick="WebTool.open ('/mo/misc/terms.do?typeCd=TC03', '_paidServiceTermsAndConditionsPage_', {resizable:1, scrollbars:'yes', width:520, height:720});">유료서비스 이용약관</a></li>
                    <li><a href="javascript:;" target="" class="" onclick="WebTool.open ('/fo/misc/emailCollectionRefusalPage.do', '_emailCollectionRefusalPage_', {resizable:1, scrollbars:'yes', width:520, height:720});">이메일 무단수집거부</a></li>
                </ul>
            </div>
            <div class="sns">
                <ul class="flex-row-gap16">
                    <li><a href="https://www.facebook.com/meatbox.co.kr" target="_blank"><img src="https://static-cdn.meatbox.co.kr/img/renew/sns-facebook-rnd.svg" alt="페이스북" width="24px" height="24px" loading="lazy"></a></li>
                    <li><a href="https://blog.naver.com/globalnetworks" target="_blank"><img src="https://static-cdn.meatbox.co.kr/img/renew/sns-blog-rnd.svg" alt="네이버 블로그" width="24px" height="24px" loading="lazy"></a></li>
                    <li><a href="https://www.instagram.com/meatbox_official/" target="_blank"><img src="https://static-cdn.meatbox.co.kr/img/renew/sns-instagram-rnd.svg" alt="인스타그램" width="24px" height="24px" loading="lazy"></a></li>
                    <li><a href="https://www.youtube.com/channel/UCBsRC2BjY5V7_tP9U5FXrxA" target="_blank"><img src="https://static-cdn.meatbox.co.kr/img/renew/sns-youtube-rnd.svg" alt="유튜브" width="24px" height="24px" loading="lazy"></a></li>
                </ul>
            </div>
        </article>
        <article class="cmpn-area flex-space-between">
            <div class="cmpn">
                <ul class="flex-col-gap4">
                    <li class="meatbox f-size12-700"><b class="emphasis">(주)미트박스글로벌</b></li>
                    <li class="cmpn-info f-size11-400">
                        <p><span class="separate">서울특별시 강남구 테헤란로 34길 22</span><span class="separate">대표이사 : 김기봉</span><span class="separate">사업자 등록번호 : 129-86-87864  <button type="button" onclick="WebTool.open ('http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1298687864');">사업자정보 확인</button></span></p>
                        <p>통신판매업신고 : 제 2021-서울강남-04128호</p>
                        <p>NICEPAY 구매안전서비스 : 고객님 안전거래를 위해 현금 결제 시 저희 쇼핑몰이 가입한 에스크로 (구매안전서비스)를 이용하실 수 있습니다. <button type="button" onclick="WebTool.open ('https://pg.nicepay.co.kr/issue/IssueEscrow.jsp?Mid=gbnet0001m&CoNo=1298687864');">가입사실 확인</button></p>
                        <p><span class="separate">고객센터 : 1644-6689</span><span class="separate">E-mail : meatbox@meatbox.co.kr</span></p>
                    </li>
                    <li class="copyright f-size11-400">
                        <p>© MEATBOX All rights reserved</p>
                    </li>
                </ul>
            </div>
            <div class="crtfc">
                <ul class="f-size10-400">
                    <li>
                        <p>[인증범위] 미트박스 온라인 축산물 직거래 쇼핑몰</p>
                        <p>[유효기간] 2023.11.15- 2026.11.14</p>
                    </li>
                    <li><img src="https://static-cdn.meatbox.co.kr/img/fo/main/isms.png" alt="ISMS" width="45px" height="40px" loading="lazy"></li>
                    <li><img src="https://static-cdn.meatbox.co.kr/img/fo/main/footer_abl.png" alt="2020 소비자대상 수장 엠블럼" width="58px" height="40px" loading="lazy"></li>
                </ul>
            </div>
        </article>
        <article class="caution">
            <div class="caution-cont f-size10-400">
                <p>㈜미트박스글로벌의 사전 동의 없이 미트박스 사이트 내 UI, 정보, 콘텐츠의 무단 전재, 복사, 스크랩, 배포를 금합니다.</p>
                <p>미트박스는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 미트박스는 상품 ∙ 거래정보 및 거래에 대하여 책임을 지지 않습니다.</p>
            </div>
        </article>
    </section>
</footer>