<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
        // 세션에서 사용자 정보를 가져옵니다.
        String userName = (String) session.getAttribute("userName");
        System.out.println("=== 로그인한 유저: " + userName + " ===");
        Object roleObject = session.getAttribute("role");
        String userRole = (roleObject != null) ? roleObject.toString() : null;

        // 로그인 여부를 판단합니다.
        boolean isLoggedIn = (userName != null && !userName.isEmpty());
        %>
<!DOCTYPE html>
<html>
<head>

    <title>미트박스 :: 1등 고기 직거래</title>
    <meta property="og:image"				content="https://www.meatbox.co.kr/img/co/meatboxOgImage.png"	/>
    <meta http-equiv="Content-Type"		content="text/html; charset=UTF-8" />
    <meta http-equiv="Cache-Control"	content="no-cache" />
    <meta http-equiv="Pragma"			content="no-cache" />
    <meta http-equiv="X-UA-Compatible"	content="IE=edge" />
    <meta name="description"			content="육류 4,500 + 식재료 2,000개! 미트박스와 최대 30% 원가절감 해볼까요?" />
    <meta name="facebook-domain-verification" content="p46h98ig4xxu7rwip506zt00a2kypb" />

    <!--[if IE]><html class="comm_ie"><![endif]-->

    <link rel="shortcut icon"	href="https://static-cdn.meatbox.co.kr/img/fo/favicon.ico?t=20240409" type="image/x-icon" />
    <link rel="icon"			href="https://static-cdn.meatbox.co.kr/img/fo/favicon.ico?t=20240409" type="image/x-icon" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/font/spoqaHanSans.min.css" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/font/notoSanskr.min.css" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/font/pretendard.css" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/common.min.css?20251001124312135" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/style.min.css?20251001124312135" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/renew.min.css?20251001124312135" type="text/css" media="all" charset="UTF-8" />
    <link type="text/css" rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/swiper/5.2.1/swiper.min.css" media="screen" charset="UTF-8" />
    <script type="application/ld+json">
        {
            "@context": "https://schema.org/",
            "@type": "Organization",
            "name": "미트박스",
            "url": "https://www.meatbox.co.kr",
            "sameAs": [
                "https://blog.naver.com/globalnetworks",
                "https://www.instagram.com/meatbox_official",
                "https://www.facebook.com/meatbox.co.kr/",
                "https://www.youtube.com/c/미트박스"
            ]
        }
    </script>



    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery-1.12.4.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery-ui-1.12.1.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery.bpopup-0.11.0.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery.cookie-1.4.1.js" charset="UTF-8"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/constant/Const.min.js?ver=20251001124312135"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/constant/Operation.min.js?ver=20251001124312135"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/tool/CommonTools.min.js?ver=20251001124312135"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/tool/ProductTool.min.js?ver=20251001124312135"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/tool/FoTool.min.js?ver=20251001124312135"></script>
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/swiper/5.2.1/swiper-7.4.1.min.js" charset="UTF-8"></script>
    <script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script><!-- gnb 로띠 -->

    <script type="text/javascript">

        // JSP 변수를 JavaScript 변수로 넘겨줍니다.
        var _LOGINED_         = <%= isLoggedIn %>;
        var _MEMBER_ROLE_     = "<%= userRole != null ? userRole : "" %>";
        var _USER_NAME_       = "<%= userName != null ? userName : "" %>";

        // ▼▼▼▼▼ 수정된 부분 ▼▼▼▼▼
        // var _LOGINED_ = true;  <- 이 줄을 삭제합니다.
        var _LOCATION_        = 'RELEASE';
        var _IS_PRODUCTION_    = 'true' === 'true';
        var _SITE_TYPE_       = 'FO';

        // var _MEMBER_ROLE_ = 'B004'; <- 이 줄을 삭제합니다.
        var _MEMBER_DIVISION_ = 'HD10';

        var memberKindListStr = '[MJ02]';

        var memberKindList =[];

        if (memberKindListStr ){
            var memberKindStr = memberKindListStr.replace('[','').replace(']','');
            memberKindStr = memberKindStr.replace(/ /gi,'');
            memberKindList =	memberKindStr.split(',');
        }

        var _MEMBER_KIND_MK01_ = -1 < memberKindList.indexOf('MK01')? 'MK01':'';
        var _MEMBER_KIND_MK02_ = -1 < memberKindList.indexOf('MK02')? 'MK02':'';
        var _MEMBER_KIND_MK03_ = -1 < memberKindList.indexOf('MK03')? 'MK03':'';
        var _MEMBER_KIND_MK04_ = -1 < memberKindList.indexOf('MK04')? 'MK04':'';
        var _MEMBER_KIND_MK05_ = -1 < memberKindList.indexOf('MK05')? 'MK05':'';
        var _MEMBER_KIND_MK06_ = -1 < memberKindList.indexOf('MK06')? 'MK06':'';
        var _MEMBER_KIND_MK07_ = -1 < memberKindList.indexOf('MK07')? 'MK07':'';
        var _MEMBER_KIND_MK08_ = -1 < memberKindList.indexOf('MK08')? 'MK08':'';
        var _MEMBER_KIND_MK09_ = -1 < memberKindList.indexOf('MK09')? 'MK09':'';
        var _MEMBER_KIND_MK10_ = -1 < memberKindList.indexOf('MK10')? 'MK10':'';
        var _MEMBER_KIND_MK11_ = -1 < memberKindList.indexOf('MK11')? 'MK11':'';
        var _MEMBER_KIND_MK12_ = -1 < memberKindList.indexOf('MK12')? 'MK12':'';
        var _MEMBER_KIND_MK13_ = -1 < memberKindList.indexOf('MK13')? 'MK13':'';
        var _MEMBER_KIND_MK14_ = -1 < memberKindList.indexOf('MK14')? 'MK14':'';
        var _MEMBER_KIND_MK15_ = -1 < memberKindList.indexOf('MK15')? 'MK15':'';
        var _MEMBER_KIND_MK16_ = -1 < memberKindList.indexOf('MK16')? 'MK16':'';
        var _MEMBER_KIND_MK17_ = -1 < memberKindList.indexOf('MK17')? 'MK17':'';
        var _MEMBER_KIND_MK18_ = -1 < memberKindList.indexOf('MK18')? 'MK18':'';
        var _MEMBER_KIND_MK19_ = -1 < memberKindList.indexOf('MK19')? 'MK19':'';
        var _MEMBER_KIND_MK20_ = -1 < memberKindList.indexOf('MK20')? 'MK20':'';
        var _MEMBER_KIND_MK21_ = -1 < memberKindList.indexOf('MK21')? 'MK21':'';
        var _MEMBER_KIND_MK22_ = -1 < memberKindList.indexOf('MK22')? 'MK22':'';
        var _MEMBER_KIND_MK23_ = -1 < memberKindList.indexOf('MK23')? 'MK23':'';
        var _MEMBER_KIND_MK24_ = -1 < memberKindList.indexOf('MK24')? 'MK24':'';
        var _MEMBER_KIND_MK25_ = -1 < memberKindList.indexOf('MK25')? 'MK25':'';
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.js"></script>
    <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    <!-- Mirae Script Ver 2.0 -->
    <script async="true" src="//log1.toup.net/mirae_log_chat_common.js?adkey=srudh" charset="UTF-8"></script>
    <!-- Mirae Script END Ver 2.0 -->
    <script type="text/javascript">
        !function(){"use strict";!function(e,t){var n=e.amplitude||{_q:[],_iq:{}}
        ;if(n.invoked)e.console&&console.error&&console.error("Amplitude snippet has been loaded.")
        ;else{var r=function(e,t){e.prototype[t]=function(){return this._q.push({name:t,args:Array.prototype.slice.call(arguments,0)})
            ,this}},s=function(e,t,n){return function(r){e._q.push({name:t,args:Array.prototype.slice.call(n,0),resolve:r})}}
            ,o=function(e,t,n){e[t]=function(){if(n)return{promise:new Promise(s(e,t,Array.prototype.slice.call(arguments)))}}}
            ,i=function(e){for(var t=0;t<y.length;t++)o(e,y[t],!1)
            ;for(var n=0;n<g.length;n++)o(e,g[n],!0)};n.invoked=!0;var a=t.createElement("script")
        ;a.type="text/javascript",a.integrity="sha384-TPZhteUkZj8CAyBx+GZZytBdkuKnhKsSKcCoVCq0QSteWf/Kw5Kb9oVFUROLE1l3"
            ,a.crossOrigin="anonymous",a.async=!0,a.src="https://cdn.amplitude.com/libs/analytics-browser-1.9.1-min.js.gz"
            ,a.onload=function(){e.amplitude.runQueuedFunctions||console.log("[Amplitude] Error: could not load SDK")}
        ;var c=t.getElementsByTagName("script")[0];c.parentNode.insertBefore(a,c);for(var u=function(){return this._q=[],this}
                                                                                          ,l=["add","append","clearAll","prepend","set","setOnce","unset","preInsert","postInsert","remove","getUserProperties"]
                                                                                          ,p=0;p<l.length;p++)r(u,l[p]);n.Identify=u;for(var d=function(){return this._q=[],this}
                                                                                                                                             ,f=["getEventProperties","setProductId","setQuantity","setPrice","setRevenue","setRevenueType","setEventProperties"]
                                                                                                                                             ,v=0;v<f.length;v++)r(d,f[v]);n.Revenue=d
        ;var y=["getDeviceId","setDeviceId","getSessionId","setSessionId","getUserId","setUserId","setOptOut","setTransport","reset"]
            ,g=["init","add","remove","track","logEvent","identify","groupIdentify","setGroup","revenue","flush"]
        ;i(n),n.createInstance=function(e){return n._iq[e]={_q:[]},i(n._iq[e]),n._iq[e]},e.amplitude=n}}(window,document)}();



        amplitude.init("0053d5a7613b1784c0627c1c65c5c49a", null, {
            defaultTracking: {
                attribution: {
                    trackNewCampaigns: true
                }
            },
            minIdLength : 2
        });
    </script>
    <script type="text/javascript">


        (function () {

            var me = window.GoogleTagMgr = {

                startup: function () {
                    me.setVariables();
                    me.setEvents();
                    me.initialize();
                },

                setVariables: function () {
                },

                setEvents: function () {
                },

                initialize: function () {

                    window.dataLayer = window.dataLayer || [];
                    window.dataLayer.push({
                        'userId' : 'kakao793884',
                        'member_type' : 'HD10'
                    });


                    (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
                        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
                        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
                    })(window,document,'script','dataLayer','GTM-P69GLNK');

                },

                pushDataLayer: function(data) {

                    try {
                        dataLayer.push(data);
                    }
                    catch(err) {
                        console.log( err );
                    }

                },

                nothing:null
            };

        })();


        (function () {

            var me = window.SmartLookMgr = {

                startup: function () {
                    me.setVariables();
                    me.setEvents();
                    me.initialize();
                },

                setVariables: function () {
                    me.pcKey = '4e8e3390523b3544e6abdd659763ccbbfe76f75b';
                    me.mobileKey = '54231b2dc60a9e5d4675b7fa2a2cccc7841a8998';
                },

                setEvents: function () {
                },

                initialize: function () {
                    window.smartlook||(function(d) {
                        var o=smartlook=function(){ o.api.push(arguments)},h=d.getElementsByTagName('head')[0];
                        var c=d.createElement('script');o.api=new Array();c.async=true;c.type='text/javascript';
                        c.charset='utf-8';c.src='https://rec.smartlook.com/recorder.js';h.appendChild(c);
                    })(document);

                    var key = (_SITE_TYPE_ === 'FO' ? me.pcKey : me.mobileKey);
                    smartlook('init', key);

                    smartlook('identify', 457296, {
                        'id': 'kakao793884',
                        'email': 'sjsong1019@naver.com',
                        'name': '송지섭',
                        'role': 'B004'
                    });

                },

                nothing: null
            };

        })();



        (function () {
            var me = window.AmplitudeMgr = {

                startup: function () {
                    me.setVariables();
                    me.setEvents();
                    me.initialize();
                },

                setVariables: function () {
                },

                setEvents: function () {
                },

                initialize: function () {
                    if (window.amplitude) {
                        amplitude.setUserId('457296');
                    }
                    if ($.cookie(Const.COOKIE_AMPLITUDE_UPDATED) != 1) {
                        WebTool.setUserProperties();
                        $.cookie(Const.COOKIE_AMPLITUDE_UPDATED, 1, {'path': '/', 'domain': 'meatbox.co.kr', 'expires': 1});
                    }
                },

                // 구매완료
                completePurchase: function(orderInfo, orderProductList) {
                    if (window.amplitude) {
                        var eventProperties = {
                            orderSeq: orderInfo.orderSeq
                            ,orderItemSeqList:[]
                            ,productSeqList: []
                            ,productNmList: []
                            ,itemKindNmList: []
                            ,itemCatNmList: []
                            ,originNmList: []
                            ,brandNmList: []
                            ,gradeNmList: []
                            ,procNmList: []
                            ,keepingNmList: []
                            ,sellerIdList: []
                            ,recommendProductYnList: []
                            ,priceList: []
                            ,quantityList: []
                            ,couponNmList: []
                            ,largeYnList: []
                            ,paymentGatewayCd: orderInfo.paymentGatewayCd
                            ,orderPrice: orderInfo.orderPrice
                            ,orderDate: orderInfo.orderDate
                            ,paymentGatewayNm: orderInfo.paymentGatewayNm
                            ,firstOrderYn: orderInfo.firstOrderYn
                        };

                        var cursor = 0;
                        var productsLocation = [];
                        for (var i = 0; i < orderProductList.length; i++) {
                            var orderProduct = orderProductList[i];
                            cursor = productsLocation.indexOf(orderProduct.productSeq);
                            if (cursor === -1) {
                                productsLocation.push(orderProduct.productSeq);

                                var recommendProductYn = 'N';
                                if (localStorage[Const.LS_RECENT_VIEW_RECOMMEND_PRODUCT]) {
                                    recommendProductYn = JSON.parse(localStorage[Const.LS_RECENT_VIEW_RECOMMEND_PRODUCT]).includes(orderProduct.productSeq) ? 'Y' : 'N';
                                }

                                eventProperties.orderItemSeqList.push(orderProduct.orderItemSeq);
                                eventProperties.productSeqList.push(NumberTool.toInt(orderProduct.productSeq));
                                eventProperties.productNmList.push(orderProduct.productName);
                                eventProperties.itemKindNmList.push(orderProduct.itemKindNm);
                                eventProperties.itemCatNmList.push(orderProduct.itemCatNm);
                                eventProperties.originNmList.push(orderProduct.originNm);
                                eventProperties.brandNmList.push(orderProduct.brandNm);
                                eventProperties.gradeNmList.push(orderProduct.gradeNm);
                                eventProperties.procNmList.push(orderProduct.procNm);
                                eventProperties.keepingNmList.push(orderProduct.keepingNm);
                                eventProperties.sellerIdList.push(orderProduct.sellerId);
                                eventProperties.recommendProductYnList.push(recommendProductYn);
                                eventProperties.priceList.push(NumberTool.toInt(orderProduct.price));
                                eventProperties.quantityList.push(NumberTool.toInt(orderProduct.orderBoxCnt));
                                eventProperties.couponNmList.push(orderProduct.couponName);
                                eventProperties.largeYnList.push(orderProduct.largeYn);
                            } else {
                                eventProperties.priceList[cursor] += NumberTool.toInt(orderProduct.price);
                                eventProperties.quantityList[cursor] += NumberTool.toInt(orderProduct.orderBoxCnt);
                            }
                        }

                        me.sendValidApplication('EV_ORDER_COMPLETE', eventProperties);

                        // var eventProperties = $.extend({}, eventProperties);
                        //window.amplitude.logEvent('EV_ORDER_COMPLETE', eventProperties)
                    }
                },

                setUserProperties: function(userProperties) {
                    if (window.amplitude) {
                        const identifyEvent = new amplitude.Identify();
                        identifyEvent.set('success', userProperties.success);
                        identifyEvent.set('userId', userProperties.userId);
                        identifyEvent.set('userSeq', userProperties.userSeq);
                        identifyEvent.set('memberDivisionCd', userProperties.memberDivisionCd);
                        identifyEvent.set('memberDivisionNm', userProperties.memberDivisionNm);
                        identifyEvent.set('coName', userProperties.coName);
                        identifyEvent.set('addr1', userProperties.addr1);
                        identifyEvent.set('addr2', userProperties.addr2);
                        identifyEvent.set('createDate', userProperties.createDate);
                        identifyEvent.set('memberKindList', userProperties.memberKindList);
                        identifyEvent.set('standardMenuList', userProperties.standardMenuList);
                        identifyEvent.set('role', userProperties.role);
                        identifyEvent.set('roleName', userProperties.roleName);

                        amplitude.identify(identifyEvent);
                    }
                },

                setWalkThroughUserProperties: function(userProperties) {
                    if (window.amplitude) {
                        const identifyEvent = new amplitude.Identify();
                        identifyEvent.set('memberKindList', userProperties.memberKindList);
                        identifyEvent.set('standardMenuList', userProperties.standardMenuList);

                        amplitude.identify(identifyEvent);
                    }
                },

                clickTossPayRegister: function() {
                    me.sendValidApplication('EV_CLICK_TOSSPAY_REGISTER');
                    //window.amplitude.logEvent('EV_CLICK_TOSSPAY_REGISTER');
                },

                callbackTossPayRegister: function() {
                    me.sendValidApplication('EV_CALLBACK_TOSSPAY_REGISTER');
                    //window.amplitude.logEvent('EV_CALLBACK_TOSSPAY_REGISTER');
                },

                amplitudeEventCommonSend: function(eventName, dataset) {
                    if (window.amplitude) {
                        var eventProperties = $.extend({}, dataset);
                        me.sendValidApplication(eventName, eventProperties);
                        //window.amplitude.logEvent(eventName, eventProperties);
                    }
                },

                /*이벤트 페이지 진입 이벤트*/
                clickEventPageEntry: function(dataset) {
                    if (window.amplitude) {
                        var eventProperties = $.extend({}, dataset);
                        eventProperties.backUrl =  document.referrer;
                        eventProperties.url =  window.location.href;
                        me.sendValidApplication('EV_EVENTPAGE_CLICK', eventProperties);
                        //window.amplitude.logEvent('EV_EVENTPAGE_CLICK', eventProperties);
                    }
                },

                // 모바일 메인페이지 추천상품 클릭
                clickMainRecommendProduct: function(dataset) {
                    if (window.amplitude) {
                        var eventProperties = $.extend({}, dataset);
                        me.sendValidApplication('EV_MAIN_RECOMMEND_PRODUCT_CLICK', eventProperties);
                        //window.amplitude.logEvent('EV_MAIN_RECOMMEND_PRODUCT_CLICK', eventProperties);
                    }
                },

                /*메인 페이지 진입 이벤트*/
                clickMainPageEntry: function() {
                    if (window.amplitude) {
                        me.sendValidApplication('EV_MAIN_ENTRY', {'backUrl':document.referrer});
                        //window.amplitude.logEvent('EV_MAIN_ENTRY', eventProperties);
                    }
                },

                /*찜 상품 추가 이벤트*/
                clickInterestProductAdd: function(dataset) {
                    if (window.amplitude) {
                        var eventProperties = $.extend({}, dataset);
                        me.sendValidApplication('EV_INTEREST_PRODUCT_ADD', eventProperties);
                        //window.amplitude.logEvent('EV_MAIN_ENTRY', eventProperties);
                    }
                },
                /*찜 상품 추가 이벤트*/
                clickInterestProductRemove: function(dataset) {
                    if (window.amplitude) {
                        var eventProperties = $.extend({}, dataset);
                        me.sendValidApplication('EV_INTEREST_PRODUCT_REMOVE', eventProperties);
                        //window.amplitude.logEvent('EV_MAIN_ENTRY', eventProperties);
                    }
                },

                /*찜 상품 추가 이벤트*/
                orderPageEntry: function(dataset) {
                    if (window.amplitude) {
                        var eventProperties = $.extend({}, dataset);
                        me.sendValidApplication('EV_ORDERPAGE_ENTRY', eventProperties);
                        //window.amplitude.logEvent('EV_MAIN_ENTRY', eventProperties);
                    }
                },

                /*장바구니 담기*/
                completeAddToCartClick: function(dataset) {
                    if (window.amplitude) {
                        var eventProperties = $.extend({}, dataset);
                        me.sendValidApplication('EV_CART_CLICK', eventProperties);
                        //window.amplitude.logEvent('EV_MAIN_ENTRY', eventProperties);
                    }
                },

                /*썸네일에서 장바구니 담기*/
                completeListThumnailAddToCartClick: function(dataset) {
                    if (window.amplitude) {
                        var eventProperties = $.extend({}, dataset);
                        me.sendValidApplication('EV_LIST_THUMBNAIL_CART_CLICK', eventProperties);
                        //window.amplitude.logEvent('EV_MAIN_ENTRY', eventProperties);
                    }
                },

                /*썸네일에서 장바구니 담기*/
                completeListThumnailAddToOptionClick: function(dataset) {
                    if (window.amplitude) {
                        var eventProperties = $.extend({}, dataset);
                        me.sendValidApplication('EV_LIST_THUMBNAIL_OPTION_CLICK', eventProperties);
                        //window.amplitude.logEvent('EV_MAIN_ENTRY', eventProperties);
                    }
                },

                /*검색어*/
                searchTextToAmplitude: function(dataset) {
                    if (window.amplitude) {
                        var eventProperties = $.extend({}, dataset);
                        eventProperties.backUrl =  document.referrer;
                        eventProperties.url =  window.location.href;
                        me.sendValidApplication('EV_SEARCH_TEXT', eventProperties);
                        //window.amplitude.logEvent('EV_MAIN_ENTRY', eventProperties);
                    }
                },

                /*사업자 회원가입완료에서 구매형태 선택*/
                completeBsnsPurchaseTypeClick: function(dataset) {
                    if (window.amplitude) {
                        var eventProperties = $.extend({}, dataset);
                        me.sendValidApplication('EV_BSNS_PURCHASE_TYPE_CLICK', eventProperties);
                    }
                },

                /*ios/Android/webview 분기처리*/
                sendValidApplication: function(eventName, eventProperties) {
                    try{
                        if(eventProperties) {
                            window.amplitude.logEvent(eventName, eventProperties);
                        } else {
                            window.amplitude.logEvent(eventName);
                        }
                    } catch(e) {
                        console.log("Hybrid Amplitude Error : " + e);
                    }
                },

                nothing:null
            };

        })();


        $(function() {
            AmplitudeMgr.startup();
        });

        (function() {

            var me = window.TraceMgr = {

                startup: function () {
                    me.setVariables();
                    me.setEvents();
                    me.initialize();
                },

                setVariables: function () {
                },

                setEvents: function () {
                },

                initialize: function () {
                    try {

                        window.BiginMgr = window.BiginMgr || null;

                        window.SmartLookMgr = window.SmartLookMgr || null;

                        GoogleTagMgr.startup();

                        if (BiginMgr) BiginMgr.startup();
                        if (SmartLookMgr) SmartLookMgr.startup();

                    }
                    catch (err) {
                        console.trace(err);
                    }
                },

                completePurchase: function (orderInfo, orderProductList) {
                    try {

                        if (window.AmplitudeMgr) AmplitudeMgr.completePurchase(orderInfo, orderProductList);
                    }
                    catch (err) {
                        console.trace(err);
                    }
                },

                completePurchase2: function(options) {
                    var paymentInfo = options.paymentInfo;
                    try {
                        var actionLogProductSeq = [];

                        for (var i = 0; i < paymentInfo.productList.length; i++) {
                            var product = paymentInfo.productList[i];
                            for (var j = 0; j < product.itemList.length; j++) {
                                var item = product.itemList[j];
                                actionLogProductSeq.push(product.productSeq + '_' + item.itemSeq);
                            }
                        }

                        me.sendActionLog({
                            'action':'purchase',
                            'section':'com',
                            'productSeq': actionLogProductSeq,
                            'url':window.location.href,
                            'targetUrl':window.location.href
                        });
                    } catch(e) {
                        console.error(e);
                    }
                },

                completeAddToCart: function () {
                    try {

                    }
                    catch (err) {
                        console.trace(err);
                    }
                },

                //
                impressionsView: function (products) {
                    var data = {
                        'event': 'ImpressionsView',
                        'ecommerce': {
                            'currencyCode': 'KRW',
                            'impressions': products
                        }
                    };

                    GoogleTagMgr.pushDataLayer(data);
                },

                productDetail: function (products) {
                    var data = {
                        'event': 'detail',
                        'ecommerce': {
                            'detail': {
                                'products': products
                            }
                        }
                    };

                    GoogleTagMgr.pushDataLayer(data);
                },

                addToCart: function(dataList) {
                    try {
                        var items = [];
                        var price = 0;
                        for (var i = 0; i < dataList.length; i++) {
                            var data = dataList[i];
                            var product = {
                                'item_name': data.productName,
                                'item_variant': '', // option
                                'quantity': 0,
                                'price': 0,

                                'id': data.productSeq,
                                'brand': data.brandNm,
                                'category': data.itemKindNm,
                                'list': data.itemCatNm,
                            };

                            var orderList = data.orderList;
                            if (orderList != null && Object.keys(orderList).length > 0) {
                                for (var j = 0; j < orderList.length; j++) {
                                    product.quantity += orderList[j].itemCount;
                                    product.price += (orderList[j].itemBoxPrice * orderList[j].itemCount)
                                }
                            }


                            items.push(product);
                        }

                        var data = {
                            'event': 'add_to_cart',
                            'button_name': '장바구니',
                            'ecommerce': {
                                'items': items,
                                'value': price,
                            }
                        };

                        GoogleTagMgr.pushDataLayer({ ecommerce: null });
                        GoogleTagMgr.pushDataLayer(data);
                    } catch(err) {
                        console.trace(err);
                    }
                },

                addToCartList: function(options) {
                    try {
                        var actionLogProductSeq = [];
                        var dataList = options.dataList;

                        for (var i = 0; i < dataList.length; i++) {
                            var data = dataList[i];
                            actionLogProductSeq.push(data.productSeq + '_' + (data.itemSeq || '0'));
                        }

                        me.sendActionLog({
                            'action':'add_cart',
                            'section':'com',
                            'productSeq': actionLogProductSeq,
                            'url':window.location.href,
                            'targetUrl':window.location.href
                        });
                    } catch(e) {
                        console.error(e);
                    }
                },

                addToMenukitCart: function (item) {
                    var data = {
                        'event': 'menukit_add2_click',
                        'item_name': item.productName,
                        'food_name': item.menuName,
                        'location': '메뉴키트 상세'
                    };

                    window.GoogleTagMgr.pushDataLayer(data);
                },

                orderStep: function(step, products) {
                    var checkout = {
                        'actionField': {},
                        'products': []
                    };

                    if (step === 1) {
                        checkout.actionField = {'step': step, 'option': '장바구니'};
                    }

                    if (step === 2) {
                        checkout.actionField = {'step': step, 'option': '주문서작성'};
                    }

                    if (step === 3) {
                        checkout.actionField = {'step': step, 'option': '주문완료'};
                    }

                    checkout.products = products;

                    var data = {
                        'event': 'checkout',
                        'ecommerce': {
                            'checkout': checkout
                        }
                    };

                    GoogleTagMgr.pushDataLayer(data);
                },

                orderComplete: function(actionField, products) {
                    try {
                        var purchase = {
                            'actionField': actionField,
                            'products': products
                        };

                        var data = {
                            'event': 'purchase',
                            'ecommerce': {
                                'currencyCode': 'KRW',
                                'purchase': purchase
                            }
                        };

                        GoogleTagMgr.pushDataLayer(data);

                    } catch(err) {
                        console.trace(err);
                    }
                },

                payment: function(options) {
                    try {
                        var actionLogProductSeq = [];
                        var paymentInfo = options.paymentInfo;
                        var dataList = paymentInfo.productList;

                        for (var i = 0; i < dataList.length; i++) {
                            var data = dataList[i];
                            var itemList = data.itemList;
                            for (var j = 0; j < itemList.length; j++) {
                                var item = itemList[j];
                                actionLogProductSeq.push(data.productSeq + '_' + item.itemSeq);
                            }
                        }

                        me.sendActionLog({action: 'purchase', section: 'com', productSeq: actionLogProductSeq, url: window.location.href, targetUrl: window.location.href});
                    } catch(e) {
                        console.error(e);
                    }
                },

                clickTossPayRegister: function() {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.clickTossPayRegister();
                    } catch(err) {
                        console.error(err);
                    }
                },

                callbackTossPayRegister: function() {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.callbackTossPayRegister();
                    } catch(err) {
                        console.error(err);
                    }
                },

                amplitudeEventCommonSend: function(eventName, options) {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.amplitudeEventCommonSend(eventName, options);
                    } catch(err) {
                        console.error(err);
                    }
                },

                clickEventPageEntry: function(options) {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.clickEventPageEntry(options);
                    } catch(err) {
                        console.error(err);
                    }
                },

                setWalkThroughUserProperties: function(options) {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.setWalkThroughUserProperties(options);
                    } catch(err) {
                        console.error(err);
                    }
                },

                clickMainRecommendProduct: function(options) {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.clickMainRecommendProduct(options);
                    } catch(err) {
                        console.error(err);
                    }
                },

                clickMainPageEntry: function() {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.clickMainPageEntry();
                    } catch(err) {
                        console.error(err);
                    }
                },

                clickInterestProductAdd: function(options) {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.clickInterestProductAdd(options);
                        me.sendActionLog({'action':'like', 'section':'com', 'productSeq':[options.productSeq + '_0'], 'url':window.location.href, 'targetUrl':window.location.href});
                    } catch(err) {
                        console.error(err);
                    }
                },

                clickInterestProductRemove: function(options) {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.clickInterestProductRemove(options);
                    } catch(err) {
                        console.error(err);
                    }
                },

                orderPageEntry: function(options) {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.orderPageEntry(options);
                    } catch(err) {
                        console.error(err);
                    }
                },

                completeAddToCartClick: function(options) {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.completeAddToCartClick(options);
                    } catch(err) {
                        console.error(err);
                    }
                },

                completeListThumnailAddToCartClick: function(data) {
                    try {
                        var product = {
                            'name': data.productName,
                            'id': data.productSeq,
                            'price': 0,
                            'brand': data.brandNm,
                            'category': data.itemKindNm,
                            'list': data.itemCatNm,
                            'quantity': 0
                        };

                        var orderList = data.orderList;
                        for (var i = 0; i < orderList.length; i++) {
                            product.quantity += orderList[i].itemCount;
                            product.price += (orderList[i].itemBoxPrice * orderList[i].itemCount)
                        }

                        if (window.AmplitudeMgr) AmplitudeMgr.completeListThumnailAddToCartClick(product);
                    } catch(err) {
                        console.error(err);
                    }
                },

                completeListThumnailAddToOptionClick: function(options) {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.completeListThumnailAddToOptionClick(options);
                    } catch(err) {
                        console.error(err);
                    }
                },

                searchTextToAmplitude: function(options) {
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.searchTextToAmplitude(options);
                    } catch(err) {
                        console.error(err);
                    }
                },

                completeBsnsPurchaseTypeClick: function(options){
                    try {
                        if (window.AmplitudeMgr) AmplitudeMgr.completeBsnsPurchaseTypeClick(options);
                    } catch(err) {
                        console.error(err);
                    }
                },

                /* 행위 이력 데이터 수집 */
                sendActionLog : function(options) {
                    if (!options || !options.action || !options.url || !options.targetUrl) {
                        console.log('필수 파라미터가 누락되었습니다. action, url, targetUrl은 필수값입니다');
                        return;
                    }

                    var data = {
                        keyword: options.keyword || '',
                        productSeq: options.productSeq || [],
                        action: options.action,
                        url: options.url,
                        targetUrl: options.targetUrl
                    };

                    $.ajax({
                        url: '/co/search/action/log.json',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(data),
                        error: function (xhr, status, error) {
                            console.log('액션 로그 전송 실패:', error);
                        }
                    });

                },

                addReview: function(options) {
                    if (window.GoogleTagMgr) {
                        window.GoogleTagMgr.pushDataLayer({'event':'review_write_compt'});
                    }

                    me.sendActionLog({action: 'star', section: 'com', productSeq: [options.productSeq + '_0'], url: window.location.href, targetUrl: window.location.href});
                },

                gift: function(options) {
                    try {
                        var actionLogProductSeq = [];
                        var orderInfo = options.orderInfo;
                        for (var i = 0; i < orderInfo.productList.length; i++) {
                            var product = orderInfo.productList[i];
                            for (var j = 0; j < product.itemList.length; j++) {
                                var item = product.itemList[j];
                                actionLogProductSeq.push(product.productSeq + '_' + item.itemSeq);
                            }
                        }
                        me.sendActionLog({action: 'gift', section: 'com', productSeq: actionLogProductSeq, url: window.location.href, targetUrl: window.location.protocol + '//' + window.location.hostname + options.targetUrl});
                    } catch(e) {
                        console.error(e);
                    }
                },

                nothing: null
            };

        })();



        /*
  +function(a,p,P,b,y){a.appboy={};a.appboyQueue=[];for(var s="DeviceProperties Card Card.prototype.dismissCard Card.prototype.removeAllSubscriptions Card.prototype.removeSubscription Card.prototype.subscribeToClickedEvent Card.prototype.subscribeToDismissedEvent Banner CaptionedImage ClassicCard ControlCard ContentCards ContentCards.prototype.getUnviewedCardCount Feed Feed.prototype.getUnreadCardCount ControlMessage InAppMessage InAppMessage.SlideFrom InAppMessage.ClickAction InAppMessage.DismissType InAppMessage.OpenTarget InAppMessage.ImageStyle InAppMessage.Orientation InAppMessage.TextAlignment InAppMessage.CropType InAppMessage.prototype.closeMessage InAppMessage.prototype.removeAllSubscriptions InAppMessage.prototype.removeSubscription InAppMessage.prototype.subscribeToClickedEvent InAppMessage.prototype.subscribeToDismissedEvent InAppMessage.fromJson FullScreenMessage ModalMessage HtmlMessage SlideUpMessage User User.Genders User.NotificationSubscriptionTypes User.prototype.addAlias User.prototype.addToCustomAttributeArray User.prototype.addToSubscriptionGroup User.prototype.getUserId User.prototype.incrementCustomUserAttribute User.prototype.removeFromCustomAttributeArray User.prototype.removeFromSubscriptionGroup User.prototype.setAvatarImageUrl User.prototype.setCountry User.prototype.setCustomLocationAttribute User.prototype.setCustomUserAttribute User.prototype.setDateOfBirth User.prototype.setEmail User.prototype.setEmailNotificationSubscriptionType User.prototype.setFirstName User.prototype.setGender User.prototype.setHomeCity User.prototype.setLanguage User.prototype.setLastKnownLocation User.prototype.setLastName User.prototype.setPhoneNumber User.prototype.setPushNotificationSubscriptionType InAppMessageButton InAppMessageButton.prototype.removeAllSubscriptions InAppMessageButton.prototype.removeSubscription InAppMessageButton.prototype.subscribeToClickedEvent display display.automaticallyShowNewInAppMessages display.destroyFeed display.hideContentCards display.showContentCards display.showFeed display.showInAppMessage display.toggleContentCards display.toggleFeed changeUser destroy getDeviceId initialize isPushBlocked isPushGranted isPushPermissionGranted isPushSupported logCardClick logCardDismissal logCardImpressions logContentCardsDisplayed logCustomEvent logFeedDisplayed logInAppMessageButtonClick logInAppMessageClick logInAppMessageHtmlClick logInAppMessageImpression logPurchase openSession registerAppboyPushMessages removeAllSubscriptions removeSubscription requestContentCardsRefresh requestFeedRefresh requestImmediateDataFlush resumeWebTracking setLogger setSdkAuthenticationSignature stopWebTracking subscribeToContentCardsUpdates subscribeToFeedUpdates subscribeToInAppMessage subscribeToNewInAppMessages subscribeToSdkAuthenticationFailures toggleAppboyLogging trackLocation unregisterAppboyPushMessages wipeData".split(" "),i=0;i<s.length;i++){for(var m=s[i],k=a.appboy,l=m.split("."),j=0;j<l.length-1;j++)k=k[l[j]];k[l[j]]=(new Function("return function "+m.replace(/\./g,"_")+"(){window.appboyQueue.push(arguments); return true}"))()}window.appboy.getCachedContentCards=function(){return new window.appboy.ContentCards};window.appboy.getCachedFeed=function(){return new window.appboy.Feed};window.appboy.getUser=function(){return new window.appboy.User};(y=p.createElement(P)).type='text/javascript';
    y.src='https://js.appboycdn.com/web-sdk/5.3/braze.min.js';
    y.async=1;(b=p.getElementsByTagName(P)[0]).parentNode.insertBefore(y,b)
  }(window,document,'script');
*/
        +function(a,p,P,b,y){a.braze={};a.brazeQueue=[];for(var s="BrazeSdkMetadata DeviceProperties Card Card.prototype.dismissCard Card.prototype.removeAllSubscriptions Card.prototype.removeSubscription Card.prototype.subscribeToClickedEvent Card.prototype.subscribeToDismissedEvent Card.fromContentCardsJson ImageOnly CaptionedImage ClassicCard ControlCard ContentCards ContentCards.prototype.getUnviewedCardCount Feed Feed.prototype.getUnreadCardCount ControlMessage InAppMessage InAppMessage.SlideFrom InAppMessage.ClickAction InAppMessage.DismissType InAppMessage.OpenTarget InAppMessage.ImageStyle InAppMessage.Orientation InAppMessage.TextAlignment InAppMessage.CropType InAppMessage.prototype.closeMessage InAppMessage.prototype.removeAllSubscriptions InAppMessage.prototype.removeSubscription InAppMessage.prototype.subscribeToClickedEvent InAppMessage.prototype.subscribeToDismissedEvent InAppMessage.fromJson FullScreenMessage ModalMessage HtmlMessage SlideUpMessage User User.Genders User.NotificationSubscriptionTypes User.prototype.addAlias User.prototype.addToCustomAttributeArray User.prototype.addToSubscriptionGroup User.prototype.getUserId User.prototype.getUserId User.prototype.incrementCustomUserAttribute User.prototype.removeFromCustomAttributeArray User.prototype.removeFromSubscriptionGroup User.prototype.setCountry User.prototype.setCustomLocationAttribute User.prototype.setCustomUserAttribute User.prototype.setDateOfBirth User.prototype.setEmail User.prototype.setEmailNotificationSubscriptionType User.prototype.setFirstName User.prototype.setGender User.prototype.setHomeCity User.prototype.setLanguage User.prototype.setLastKnownLocation User.prototype.setLastName User.prototype.setPhoneNumber User.prototype.setPushNotificationSubscriptionType InAppMessageButton InAppMessageButton.prototype.removeAllSubscriptions InAppMessageButton.prototype.removeSubscription InAppMessageButton.prototype.subscribeToClickedEvent FeatureFlag FeatureFlag.prototype.getStringProperty FeatureFlag.prototype.getNumberProperty FeatureFlag.prototype.getBooleanProperty FeatureFlag.prototype.getImageProperty FeatureFlag.prototype.getJsonProperty FeatureFlag.prototype.getTimestampProperty automaticallyShowInAppMessages destroyFeed hideContentCards showContentCards showFeed showInAppMessage deferInAppMessage toggleContentCards toggleFeed changeUser destroy getDeviceId getDeviceId initialize isPushBlocked isPushPermissionGranted isPushSupported logCardClick logCardDismissal logCardImpressions logContentCardImpressions logContentCardClick logCustomEvent logFeedDisplayed logInAppMessageButtonClick logInAppMessageClick logInAppMessageHtmlClick logInAppMessageImpression logPurchase openSession requestPushPermission removeAllSubscriptions removeSubscription requestContentCardsRefresh requestFeedRefresh refreshFeatureFlags requestImmediateDataFlush enableSDK isDisabled setLogger setSdkAuthenticationSignature addSdkMetadata disableSDK subscribeToContentCardsUpdates subscribeToFeedUpdates subscribeToInAppMessage subscribeToSdkAuthenticationFailures toggleLogging unregisterPush wipeData handleBrazeAction subscribeToFeatureFlagsUpdates getAllFeatureFlags logFeatureFlagImpression".split(" "),i=0;i<s.length;i++){for(var m=s[i],k=a.braze,l=m.split("."),j=0;j<l.length-1;j++)k=k[l[j]];k[l[j]]=(new Function("return function "+m.replace(/\./g,"_")+"(){window.brazeQueue.push(arguments); return true}"))()}window.braze.getDeferredInAppMessage=function(){return new window.braze.InAppMessage};window.braze.getCachedContentCards=function(){return new window.braze.ContentCards};window.braze.getCachedFeed=function(){return new window.braze.Feed};window.braze.getUser=function(){return new window.braze.User};window.braze.getFeatureFlag=function(){return new window.braze.FeatureFlag};(y=p.createElement(P)).type='text/javascript';
            y.src='https://js.appboycdn.com/web-sdk/5.3/braze.min.js';
            y.async=1;(b=p.getElementsByTagName(P)[0]).parentNode.insertBefore(y,b)
        }(window,document,'script');





        braze.initialize('31a89292-ca9c-4dec-a2d9-b399f4eebb91', {
            baseUrl: "sdk.iad-05.braze.com",
            allowUserSuppliedJavascript: true,
            openInAppMessagesInNewTab: true,
            requireExplicitInAppMessageDismissal: true,
            serviceWorkerLocation:"/js/service-worker.js"
        });


        // optionally show all In-App Messages without custom handling
        braze.automaticallyShowInAppMessages();

        // start (or continue) a session
        braze.openSession();
        //appboy.registerAppboyPushMessages()
        braze.requestPushPermission()


        $(function() {
            TraceMgr.startup();
        });

    </script>
    <script type="text/javascript">
        FoTool.sendBrazeEvent("braze.logCustomEvent","페이지 진입", {'페이지진입URL' : window.location.href});
    </script>

    <script>
        var env = '';
        var meatBoxUrl = '';
        var meatBoxUrl2 = '';

        env = 'release';
        meatBoxUrl = 'https://www.meatbox.co.kr/';
        meatBoxUrl2 = /https:\/\/.*\.www\.meatbox\.co\.kr/;


        var isDataDog = true;


        if(isDataDog) {
            (function (h, o, u, n, d) {
                h = h[d] = h[d] || {
                    q: [], onReady: function (c) {
                        h.q.push(c)
                    }
                }
                d = o.createElement(u);
                d.async = 1;
                d.src = n
                n = o.getElementsByTagName(u)[0];
                n.parentNode.insertBefore(d, n)
            })(window, document, 'script', 'https://www.datadoghq-browser-agent.com/us1/v6/datadog-rum.js', 'DD_RUM')
            window.DD_RUM.onReady(function () {
                window.DD_RUM.init({
                    clientToken: 'pub97d42f976f7766681eb1d43d2f4d7a00',
                    applicationId: '16e46b49-24a2-4dc0-a624-1b362141fbc8',
                    // `site` refers to the Datadog site parameter of your organization
                    // see https://docs.datadoghq.com/getting_started/site/
                    site: 'datadoghq.com',
                    service: 'meatbox',
                    env: env,
                    // Specify a version number to identify the deployed version of your application in Datadog
                    // version: '1.0.0',
                    sessionSampleRate: 100,
                    sessionReplaySampleRate: 60,
                    defaultPrivacyLevel: 'mask-user-input',
                    allowedTracingUrls: [
                        meatBoxUrl,
                        meatBoxUrl2,
                        (url) => url.startsWith(meatBoxUrl)
                    ],
                });
            })
        }
    </script></head>

<body>
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-P69GLNK"
                  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script src="https://static-cdn.meatbox.co.kr/js/tool/MemberTools.min.js?ver=20251001124312135"></script>

<script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/tool/ThumbnailTool.min.js?ver=1760161805866"></script>

<header class="newVer">
    <section class="header-main">
        <article class="main-wrap flex-row-gap032">
            <div class="inquiry flex-space-between">
                <ul class="flex-row-gap12">
                    <li>
                        <button type="button" class="ico-inner-wrap inline-round js-dropbox-btn" onclick="WebTool.go ('/fo/notice/noticeListPage.do');">
                            <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-customer-center.svg" alt="고객센터" width="16px" height="16px" loading="lazy">
                            <em>고객센터</em>
                        </button>
                        <div class="additional-category box-shadow js-dropbox">
                            <ul class="flex-col">
                                <li>
                                    <a href="javascript:;" onclick="WebTool.go ('/fo/notice/noticeListPage.do');">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-megaphone.svg" alt="공지사항" width="20px" height="20px" loading="lazy">
                                        <span class="txt">공지사항</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;" onclick="WebTool.go ('/fo/faq/faqListPage.do');">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-ask.svg" alt="자주묻는질문" width="20px" height="20px" loading="lazy">
                                        <span class="txt">자주묻는질문</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;" onclick="FoTool.go ('/fo/myInquiry/myInquiryListPage.do');">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-megaphone.svg" alt="1:1 문의" width="20px" height="20px" loading="lazy">
                                        <span class="txt">1:1 문의</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;" onclick="WebTool.go ('/fo/misc/deliveryInfoPage.do');">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-truck.svg" alt="배송안내" width="20px" height="20px" loading="lazy">
                                        <span class="txt">배송안내</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;" onclick="WebTool.go('/fo/applyAdmission/applicationFormPage.do');">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-document.svg" alt="입점신청" width="20px" height="20px" loading="lazy">
                                        <span class="txt">입점신청</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:;" class="tel">주문 문의 1644-6689</a>
                    </li>
                    <li class="member">
                        <button type="button" class="inline-round js-dropbox-btn">
                            <img src="" alt="등급" width="16px" height="16px" loading="lazy" id="gradeTopImg" class="gradeImg" style="display: none;"><!-- 등급 이미지: f / s / v / vp  -->
                            <span><b id="loginName"></b> <span id="loginNameSuffix"></span></span>
                        </button>
                        <div class="box-shadow user-info-dropbox js-dropbox">
                            <div class="user-info-wrap flex-col-gap8">
                                <div class="user-info flex-col-gap2">
                                    <div class="user-name flex-align-center">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-membership-admin.svg" alt="멤버쉽" width="24px" height="24px" loading="lazy" id="membershipImg"><!-- 멤버쉽 이미지: admin, member -->
                                        <strong><b id="membershipName"></b> <span id="membershipNameSuffix"></span></strong>
                                    </div>
                                    <div class="user-grade family flex-align-center" id="gradeArea" style="display: none;"><!-- 등급 클래스: family; silver; gold; vip; vvip; -->
                                        <img src="" alt="등급" width="14px" height="14px" loading="lazy" class="gradeImg" id="gradeInImage"><!-- 등급 이미지: f / s / v / vp  -->
                                        <span id="gradeClass"></span>
                                    </div>
                                    <button type="button" class="edit" onclick="FoTool.go ('/fo/myMenu/modifyMyInfoIntroPage.do');">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-edit-fff.svg" alt="회원정보수정" width="16px" height="16px" loading="lazy">
                                        <span class="alt">회원정보수정</span>
                                    </button>
                                </div>
                                <div class="user-member-amount">
                                    <ul class="flex">
                                        <li class="meatpoint flex-col">
                                            <b class="amount" id="meatPoint"></b>
                                            <span class="tit">미트포인트</span>
                                        </li>
                                        <li class="deposit flex-col">
                                            <b class="amount" id="meatMileage"></b>
                                            <span class="tit">예치금</span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="logout-wrap flex-flex-end">
                                    <button type="button" class="logout" onclick="HeaderMgr.logout()">로그아웃</button>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>

            </div>
            <div class="logo flex-col">
                <a href="javascript:;" onclick="WebTool.goHome();">
                    <img src="https://static-cdn.meatbox.co.kr/img/renew/logo-row-ko.svg" alt="미트박스 로고" width="139px" height="32px" loading="lazy">
                </a>
            </div>
            <div class="search-area">
                <input type="text" class="search-input f-size16-400" placeholder="상품명 혹은 브랜드 입력" value="" autocomplete="off" id="search_word">
                <div class="btn-wrap flex-row-gap012">
                    <button type="button" class="delete">삭제</button>
                    <button type="button" class="search" id="search_btn">검색</button>
                </div>
                <div class="search-result-area box-shadow">
                    <div class="search-wrapper">
                        <div class="search-keyword-not-result flex-justify-center" style="display: none;"><!-- 검색결과 없음 -->
                            <p>일치하는 검색어가 없습니다</p>
                        </div>
                        <div class="search-keyword-box" style="display: none;"><!-- 검색결과 -->
                            <ul class="search-keyword-inner"></ul>
                        </div>
                        <div class="search-defalut-box flex-col-gap24"><!-- 검색창 디폴트 -->
                            <div class="search-keyword-list">
                                <h6 class="search-title">최근 검색어 <button type="button" class="all-delete">전체삭제</button></h6><!-- 최근검색어 -->
                                <ul class="search-keyword-inner"></ul>
                                <button type="button" class="more-list none"><span>최근 검색어 더보기</span></button>
                            </div>
                            <div class="search-recommend-list">
                                <h6 class="search-title">추천 검색어</h6><!-- 추천검색어 -->
                                <ul class="search-list-inner flex-row-gap4"></ul>
                            </div>
                            <div class="search-exhibition-list">
                                <h6 class="search-title">기획전</h6><!-- 기획전 -->
                                <div class="swiper-container">
                                    <ul class="search-list-inner swiper-wrapper"></ul>
                                </div>
                                <div class="swiper-btn-wrap">
                                    <div class="swiper-button-prev"></div>
                                    <div class="swiper-button-next"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="search-close-box flex-flex-end">
                        <button type="button" class="close">닫기</button>
                    </div>
                </div>
            </div>
            <div class="user-area">
                <ul class="flex-row-gap04">
                    <li>
                        <a href="javascript:;" id="myLink" class="f-size12-600 flex-col-gap2 js-dropbox-btn">
                            <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-person.svg" alt="내 정보" width="24px" height="24px" loading="lazy">
                            <span class="des" id="myLinkText"></span>
                            <span class="des">MY</span>
                        </a>
                        <div class="additional-category box-shadow js-dropbox">
                            <ul>
                                <li>
                                    <a href="javascript:;" onclick="FoTool.go ('/fo/myMenu/myMileageManagementPage.do');">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-wallet.svg" alt="예치금" width="20px" height="20px" loading="lazy">
                                        <span class="txt">예치금</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;" onclick="FoTool.setupEasyPaymentManagement(null,'myPagePop');">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-card.svg" alt="간편결제 관리" width="20px" height="20px" loading="lazy">
                                        <span class="txt">간편결제 관리</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;" onclick="FoTool.go('/fo/myMenu/myCouponManagementPage.do');">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-coupon.svg" alt="쿠폰박스" width="20px" height="20px" loading="lazy">
                                        <span class="txt">쿠폰박스</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;" onclick="FoTool.go('/fo/myMenu/myInterestProductManagementPage.do');">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-heart.svg" alt="관심상품" width="20px" height="20px" loading="lazy">
                                        <span class="txt">관심상품</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:;" onclick="FoTool.go('/fo/myMenu/myReviewManagementPage.do');">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-edit.svg" alt="후기작성" width="20px" height="20px" loading="lazy">
                                        <span class="txt">후기작성</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li>
                        <a href="javascript:;" class="f-size12-600 flex-col-gap2" onclick="location.href='/logout.do';">
                            <img src="https://www.shutterstock.com/image-vector/logout-vector-icon-illustration-web-260nw-1888955368.jpg" alt="로그아웃" width="24px" height="24px" loading="lazy">
                            <span class="des">Logout</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;" class="f-size12-600 flex-col-gap2" onclick="FoTool.go ('/fo/myMenu/myOrderListPage.do');">
                            <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-truck.svg" alt="주문/배송" width="24px" height="24px" loading="lazy">
                            <span class="des">주문배송</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:;" class="f-size12-600 flex-col-gap2" onclick="FoTool.go ('/fo/cart/cartPage.do');">
                            <img src="https://static-cdn.meatbox.co.kr/img/renew/icon-cart.svg" alt="장바구니" width="24px" height="24px" loading="lazy">
                            <span class="badge _newCartCount"></span>
                            <span class="des">장바구니</span>
                        </a>
                    </li>
                </ul>
            </div>
        </article>
    </section>
    <section class="header-gnb">
        <article class="gnb-wrap">
            <nav class="flex-row-gap032 f-size16-700">
                <ul class="depth01 depth-main flex-row-gap016 f-size16-700">
                    <li class="gnb-all">
                        <a href="javascript:;">
                            <span class="alt">카테고리 전체보기</span>
                        </a>
                        <span class="bubble-msg top left" role="label">카테고리</span>
                        <div class="main-category">
                            <div class="main-category-wrapper flex box-shadow">
                                <div class="category-inner-wrap flex">
                                    <div class="category-list">
                                        <ul class="flex-col"></ul>
                                    </div>
                                    <div class="sub-category depth02">
                                        <ul class="flex-col-gap024"></ul>
                                    </div>
                                    <div class="sub-category depth03" style="display: none;">
                                        <ul class="flex-col-gap024"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="gnb-tab more ">
                        <a href="/fo/main/dangDangSeries.do" class="dangdang js-dropbox-btn"><span class="txt">당당시리즈</span></a>
                        <div class="additional-category box-shadow dangdang js-dropb2ox">
                            <ul class="img-only">
                                <li>
                                    <a href="/fo/event/productListPage.do?collectionSeq=4">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/dangdang-pig.svg" alt="당당한돈" width="36px" height="36px" loading="lazy">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/dangdang-pig-txt.svg" alt="당당한돈" width="auto" height="16px" loading="lazy">
                                        <span class="alt">당당한돈</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/fo/event/productListPage.do?collectionSeq=13">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/dangdang-cow.svg" alt="당당한우"  width="36px" height="36px" loading="lazy">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/dangdang-cow-txt.svg" alt="당당한우" width="auto" height="16px" loading="lazy">
                                        <span class="alt">당당한우</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/fo/event/productListPage.do?collectionSeq=6">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/dangdang-chick.svg" alt="당당한닭 width="36px" height="36px" loading="lazy">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/dangdang-chick-txt.svg" alt="당당한닭" width="auto" height="16px" loading="lazy">
                                        <span class="alt">당당한닭</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/fo/event/productListPage.do?collectionSeq=7">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/dangdang-cut.svg" alt="당당한컷" width="36px" height="36px" loading="lazy">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/dangdang-cut-txt.svg" alt="당당한컷" width="auto" height="16px" loading="lazy">
                                        <span class="alt">당당한컷</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="/fo/event/productListPage.do?collectionSeq=8">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/dangdang-taste.svg" alt="당당한맛" width="36px" height="36px" loading="lazy">
                                        <img src="https://static-cdn.meatbox.co.kr/img/renew/dangdang-taste-txt.svg" alt="당당한맛" width="auto" height="16px" loading="lazy">
                                        <span class="alt">당당한맛</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="gnb-tab">
                        <a href="/fo/meatmart/productList?displayCategorySeq=40002">
                            <em class="sm-txt">멤버십 전용</em>
                            <span class="lottie">
                                <dotlottie-player src="https://static-cdn.meatbox.co.kr/img/fo/ico/meatmart.lottie" background="transparent" speed="1" style="width: 54px; height: 24px" loop autoplay></dotlottie-player>
                            </span>
                        </a>
                    </li>
                    <!-- <li class="gnb-tab icon-dotted">
                        <a href="/fo/event/publicEventPage.do?year=2025&name=chuseokGift"><span class="txt">추석선물세트</span></a>
                    </li> -->
                    <li class="gnb-tab">
                        <a href="/fo/event/productListPage.do?collectionSeq=10"><span class="txt">낱개</span></a>
                    </li>
                    <li class="gnb-tab">
                        <a href="/fo/event/productListPage.do?collectionSeq=11"><span class="txt">세절</span></a>
                    </li>
                    <li class="gnb-tab">
                        <a href="/fo/product/largePurchaseProductListPage.do"><span class="txt">대량특가</span></a>
                    </li>
                    <li class="gnb-tab icon-dotted">
                        <a href="/fo/product/bestProductList.do"><span class="txt">랭킹</span></a>
                    </li>
                </ul>
                <ul class="depth01 depth-sub flex-row-gap016 f-size14-500">
                    <li class="gnb-tab">
                        <a href="/fo/event/hotEventPage.do"><span class="txt">기획전</span></a>
                    </li>
                    <li class="gnb-tab">
                        <a href="/fo/main/foodIngredients.do"><span class="txt">식자재</span></a>
                    </li>
                    <li class="gnb-tab">
                        <a href="/fo/event/productListPage.do?collectionSeq=9"><span class="txt">개인BEST</span></a>
                    </li>
                </ul>
            </nav>
        </article>
    </section>
</header>

<!-- 내 등급 정보 시작-->
<div class="grade_pop mypop popup_of">
    <h3>내 등급 정보  <a href="javascript:;" class="b-close"><img src="https://static-cdn.meatbox.co.kr/img/fo/xicon.png" alt=""></a></h3>
    <div class="pop_con grade_info">
        <h4>송지섭님의 현재 등급은 <span id="popupMyGrade" class="mb_grade"></span> 입니다.</h4>
        <div class="grade_wrap">
            <h5>등급별 혜택</h5>
            <table class="grade_td">
                <colgroup><col width="33.333%"/><col width="33.333%"/><col width="33.333%"/></colgroup>
                <thead>
                <tr>
                    <th>등급명</th>
                    <th>조건</th>
                    <th>쿠폰 혜택</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>FAMILY</th>
                    <td>없음</td>
                    <td>없음</td>
                </tr>
                <tr>
                    <th>SILVER</th>
                    <td>분기 중 월 1회 <br> 이상 구매</td>
                    <td>1천원 쿠폰<br> X 1장</td>
                </tr>
                <tr>
                    <th>GOLD</th>
                    <td>분기 중 100만원 <br> 이상 구매</td>
                    <td>1천원 쿠폰<br> X 3장</td>
                </tr>
                <tr>
                    <th>VIP</th>
                    <td>분기 중 월 300만원 <br> 이상 구매</td>
                    <td>2천원 쿠폰<br> X 6장</td>
                </tr>
                <tr>
                    <th>VVIP</th>
                    <td>분기 중 월 500만원 <br> 이상 구매</td>
                    <td>3천원 쿠폰<br> X 8장</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="my_grade">
            <ul>
                <li>- 이번 달 송지섭님의 구매금액 <strong id="popupMyPurchasedAmount"></strong> 입니다.</li>
                <li>- <strong id="popupMyNextGrade"></strong></li>
                <li>- 등급은 매월 1일 전월 결제 금액에 따라 산정됩니다.</li>
                <li>* 월말 시점 결제 금액(무통장입금 시 입금확인완료 기준)으로 선정</li>
                <li>- <strong>쿠폰은 매월 1일 ‘마이페이지 > 쿠폰박스’에서 다운로드하실 수 있습니다.</strong></li>
            </ul>
        </div>
        <a href="https://www.meatbox.co.kr/fo/myMenu/membershipInfoPage.do" class="grade_detail"><span>자세히 보러가기</span> &gt;</a>
        <a href="javascript:;" class="b-close grade_confirm"><img src="https://static-cdn.meatbox.co.kr/img/fo/main/grade_confirm.png" alt="확인"></a>
    </div>
</div>
<!-- 내 등급 정보  끝-->


<!-- 개인 회원 유형 선택 팝업 -->
<div class="join-purpose-type-pop" style="display: none;">
    <div class="pop_cont">
        <h3>고기를 어떤 용도로 사용하시나요?</h3>
        <p class="c8080">회원님의 유형을 선택해 주시면<br>딱 맞는 상품을 추천해 드릴게요. (최대 2개)</p>
        <form id="purposeTypeForm" name="purposeTypeForm" method="post">
            <div class="join-purpose-type">
                <ul>
                    <li>
                        <input type="checkbox" name="memberKindCd" id="join-type01" class="none" value="MJ01">
                        <label for="join-type01">
                            <img src="https://static-cdn.meatbox.co.kr/img/fo/tmp/join-type-psnl01.png" alt="헬스/건강" width="60px" height="60px" loading="lazy">
                            <strong>헬스/건강</strong>
                        </label>
                    </li>
                    <li>
                        <input type="checkbox" name="memberKindCd" id="join-type02" class="none" value="MJ03">
                        <label for="join-type02">
                            <img src="https://static-cdn.meatbox.co.kr/img/fo/tmp/join-type-psnl02.png" alt="캠핑" width="60px" height="60px" loading="lazy">
                            <strong>캠핑</strong>
                        </label>
                    </li>
                    <li>
                        <input type="checkbox" name="memberKindCd" id="join-type03" class="none" value="MJ02">
                        <label for="join-type03">
                            <img src="https://static-cdn.meatbox.co.kr/img/fo/tmp/join-type-psnl03.png" alt="가정식" width="60px" height="60px" loading="lazy">
                            <strong>가정식</strong>
                        </label>
                    </li>
                    <li>
                        <input type="checkbox" name="memberKindCd" id="join-type04" class="none" value="MJ04">
                        <label for="join-type04">
                            <img src="https://static-cdn.meatbox.co.kr/img/fo/tmp/join-type-psnl04.png" alt="선물" width="60px" height="60px" loading="lazy">
                            <strong>선물</strong>
                        </label>
                    </li>
                </ul>
            </div>
        </form>
    </div>
    <div class="btngroup">
        <button type="button" id="purposeTypeSaveBtn" class="btn-ty3 red" disabled>홈 화면에서 추천 상품 확인하기</button>
    </div>
</div>
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        // 'MY' 또는 '로그인' 버튼 클릭 시 동작 정의
        const myLink = document.getElementById('myLink');
        if (myLink) {
            myLink.addEventListener('click', function(e) {
                e.preventDefault();
                if (<%= isLoggedIn %>) {
                    // 로그인 상태이면 마이페이지로 이동
                    window.location.href = '/myMenu/myMenuMainPage.do';
                } else {
                    // 로그아웃 상태이면 로그인 페이지로 이동
                    window.location.href = '/login.do';
                }
            });
        }

        // 기존 HeaderMgr.getMember() 함수가 API를 호출하지 않도록 빈 함수로 덮어쓰기
        if (window.HeaderMgr) {
            window.HeaderMgr.getMember = function() {
                console.log("세션 데이터를 사용하므로 API 호출을 생략합니다.");
            };
        }

        // 페이지 로드 시 HeaderMgr의 다른 초기화 함수들은 그대로 호출
        if (window.HeaderMgr) {
            HeaderMgr.startup();
        }
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.js"></script>

<script>
    (function() {
        var me = window.MainMgr = {
            startup: function() {
                me.setVariables();
                me.setEvents();
                me.initialize();
            },
            setVariables: function() {

                me.$btnMoveToMyOrderListPage 	= $('button[name=btnMoveToMyOrderListPage]');

                me.urlMyOrderListPage 			= '/fo/myMenu/myOrderListPage.do';
                me.urlGetMyOrderDetail 			= '/fo/myMenu/getMyOrderDetail.doAjax';
                me.urlRequestDocIssuance		= '/fo/myMenu/requestDocIssuance.json';
                me.urlGetReviewPopup			= '/fo/myMenu/getReviewPopup.doAjax';
                me.urlAddReview					= '/fo/review/addReview.json';
                me.urlCancelOrder				= '/co/payment/orderCancel.json';
                me.urlCancelOrderItem			= '/co/payment/orderItemCancel.json';
                me.urlGetBackCart				= '/fo/cart/getBackCart.json';
                me.urlGetCashReceiptInfo		= '/fo/myMenu/getCashReceiptInfo.json';
                me.urlGetCardReceiptInfo		= '/fo/myMenu/getCardReceiptInfo.json';

                me.$selectOrderStage 			= $('select.order_list');
                me.$btnOrderDetail 				= $('a[name=btnOrderDetail]');
                me.$bPopupMyOrderDetail			= $('div[name=popupOrderDetail]');
                me.$bPopupReview				= $('div[name=popupReview]');
                me.$btnReview					= $('button[name=btnReviewWrite]');
                me.$btnRequestCashReceipt		= $('button[name=requestCashReceipt]');
                me.$btnRequestCardReceipt		= $('a[name=requestCardReceipt]');
                me.$btnMyOrderDeliveryInfo		= $('button[name=btnMyOrderDeliveryInfo]');
                me.$btnDownloadMonthlyOrderExcel= $('button[id=downloadMonthlyOrderExcel]');
                me.$selectDownloadExcelDates	= $('select[class=checkDate]');

                me.$btnCancelOrder				= $('a[name=btnCancelOrder]');
                me.$btnAllCancelOrder				= $('button[name=btnCancelOrder]');

                me.reviewData 					= {};


                me.urlRemoveMyInterestProduct 						= '/fo/myMenu/removeMyInterestProduct.json';
                me.$btnMoveToMyInterestProductManagementPage 		= $('button[name=btnMoveToMyInterestProductManagementPage]');
                me.$btnRemoveInterestProduct						= $('b[name=btnRemoveInterestProduct]');


            },
            setEvents: function() {

                me.$btnMoveToMyOrderListPage.on('click', function() {
                    WebTool.go('/fo/myMenu/myOrderListPage.do');
                });

                me.$selectOrderStage.on('change', function() {
                    var params = {};
                    params.orderStage = me.$selectOrderStage.val();

                    WebTool.go(me.urlMyOrderListPage, params);
                });

                me.$btnOrderDetail.on('click', function() {
                    me.getMyOrderDetail($(this).data('orderSeq'));
                });

                me.$btnCancelOrder.on('click', function() {
                    if($(this).data('orderStage') === 1){
                        if(confirm('입금 전 구매취소의 경우 결제 예정의 모든 상품이 취소됩니다. \n[구매취소] 하시겠습니까?')) {
                            me.cancelOrder($(this).data('orderSeq'), $(this).data('orderStage'));
                        }
                    }else if($(this).data('orderStage') === 2){
                        if($(this).data('bundleYn') === 'N'){
                            if(confirm('주문하신 상품을 구매취소 하시겠습니까?')) {
                                me.cancelOrderItem($(this).data('orderSeq'), $(this).data('orderStage'), $(this).data('orderItemSeq'), $(this).data('bundleYn'));
                            }
                        }else {
                            if(confirm('주문하신 상품을 구매취소 하시겠습니까? \n *묶음상품취소의 경우 묶음상품 전체가 취소됩니다.')) {
                                me.cancelOrderItem($(this).data('orderSeq'), $(this).data('orderStage'), $(this).data('orderItemSeq'), $(this).data('bundleYn'));
                            }
                        }
                    }
                });

                me.$btnAllCancelOrder.on('click', function() {

                    if (confirm('주문하신 상품을 전체 구매취소 하시겠습니까?')) {

                        if ($(this).data('orderStage') === 1) {
                            me.cancelOrder($(this).data('orderSeq'), $(this).data('orderStage'));
                        }
                        else if ($(this).data('orderStage') === 2) {
                            me.cancelOrderItem($(this).data('orderSeq'), $(this).data('orderStage'), null, 'Y', $(this).data('isOrderProductUse'), 'All');
                        }
                        else  {
                            alert("취소 불가한 상품입니다.");
                        }

                    }

                });

                $('button[name=btnMeatArrivalReviewWrite]').on('click', function() {

                    me.reviewData = {};
                    me.reviewData = {
                        orderSeq: 		$(this).data('orderSeq'),
                        orderDt: 		$(this).data('orderDt'),
                        productSeq: 	$(this).data('productSeq'),
                        productName: 	$(this).data('productName')
                    };

                    var url = '/fo/meatArrivalReview/myMeatArrivalReviewAddPage.do?orderSeq=' + me.reviewData.orderSeq + '&productSeq=' + me.reviewData.productSeq;
                    FoTool.go(url);
                    // me.getReviewPopup();
                });

                me.$btnReview.on('click', function() {

                    me.reviewData = {};
                    me.reviewData = {
                        orderSeq: $(this).data('orderSeq'),
                        orderDt: $(this).data('orderDt'),
                        productSeq: $(this).data('productSeq'),
                        productName: $(this).data('productName')
                    };

                    var url = '/fo/review/myReviewAddPage.do?orderSeq=' + me.reviewData.orderSeq + '&productSeq=' + me.reviewData.productSeq;
                    FoTool.go(url);
                    // me.getReviewPopup();
                });

                $('button[name=btnSampleReviewWrite]').on('click', function() {
                    var productSeq = $(this).data('productSeq');
                    var orderSeq = $(this).data('orderSeq');
                    var width = 767;
                    var height = window.innerHeight - 160;
                    var left = (window.innerWidth - width) / 2;   // 화면 가운데 정렬용
                    var top = (window.innerHeight - height) / 2;  // 화면 가운데 정렬용

                    // !TODO 샘플평 추가되면 연동
                    var url = '/fo/meatmart/sampleProductEval?' + 'productSeq=' + productSeq + '&orderSeq=' + orderSeq;
                    window.open(url, '_blank', 'resizable=yes, top='+top+', left='+left+', width='+width+', height='+height);
                });

                me.$btnRequestCashReceipt.on('click', function() {
                    me.requestCashReceiptInfo($(this).data('receiptSeqNo'), $(this).data('approvalCharge'), $(this).data('receiptCompanyType'));
                });

                me.$btnRequestCardReceipt.on('click', function() {
                    me.requestCardReceiptInfo($(this).data());
                });

                me.$btnMyOrderDeliveryInfo.on('click', function() {
                    var _deliveryInfo = {
                        olsRegionCd: 			$(this).data('olsRegionCd'),
                        parcelDeliveryCd: 		$(this).data('parcelDeliveryCd'),
                        distTypeCd: 			$(this).data('distTypeCd'),
                        inbdDate: 				$(this).data('inbdDate'),
                        invoiceNo: 				$(this).data('invoiceNo'),
                        deliveryManCell: 		$(this).data('deliveryManCell'),
                        orderSeq: 		$(this).data('orderSeq'),
                        orderItemSeq: 		$(this).data('orderItemSeq')
                    };

                    me.getMyOrderDeliveryInfo(_deliveryInfo);
                });

                me.$btnDownloadMonthlyOrderExcel.on('click', function(){

                    $('.month_popup').bPopup({
                        position: ['auto', 100] //x, y
                    });

                    var date = new Date();
                    date.setMonth(date.getMonth() - 1);		//직전 월 선택
                    $('select[name=downloadStartYear], select[name=downloadEndYear]').val(DateTool.formatDate(date).substring(0,4));
                    $('select[name=downloadStartMonth], select[name=downloadEndMonth]').val(DateTool.formatDate(date).substring(5,7));

                });

                $('img[id=downloadExcelBtn]').on('click', function() {

                    var startDate 	= $('select[name=downloadStartYear]').val() + '-' + $('select[name=downloadStartMonth]').val();
                    var endDate 	= $('select[name=downloadEndYear]').val() + '-' + $('select[name=downloadEndMonth]').val();

                    if (moment(startDate, 'yyyy-MM').isValid() == false){
                        alert("시작연월이 잘못되었습니다.");
                        return false;
                    }
                    else if (moment(endDate, 'yyyy-MM').isValid() == false) {
                        alert("종료연월이 잘못되었습니다.");
                        return false;
                    }

                    var params = {
                        startDate	:startDate,
                        endDate		:endDate
                    };

                    if (me.checkPeriodMonthlyOrder()) {
                        $.ajax ({
                            url: WebTool.getUrl('/fo/myMenu/getMonthlyOrderCount.json'),
                            dataType: 'json',
                            type: 'POST',
                            data: params,
                            async: false,
                            global: false,
                            success: function (result, textStatus, jqXHR) {
                                if (ResultTool.isSuccess(result)) {
                                    me.downloadMonthlyOrderExcel(params);
                                }
                                else {
                                    alert(result.message);
                                }
                            }
                        });
                    }
                    else {
                        alert("시작연월과 종료연월을 확인해주세요.");
                    }

                });


                $(document).on('click', 'a[name=requestDocIssuance]', function() {
                    me.requestDocIssuance($(this).data('orderSeq'));
                });

                $(document).on('change', 'select[name=emailUrl]', function() {
                    $('input[name=emailUrl]').val($(this).val());
                });

                $(document).on('click', 'a[name=addReview]', function() {
                    me.addReview();
                });

                $(document).on('click', '.star-input label', function(){
                    $('strong b').text($(this).text());
                });

                $(document).on('click', '.chk input', function(){
                    $('.chk input:checked').parent().addClass('selected');
                    $('.chk input:not(:checked)').parent().removeClass('selected');
                });


                me.$btnRemoveInterestProduct.on('click', function(event) {
                    event.preventDefault();
                    event.stopPropagation();

                    if(confirm('이 상품을 목록에서 삭제하시겠습니까?')) {
                        me.removeInterestProduct($(this).data('interestProductSeq'));
                    }
                });

                me.$btnMoveToMyInterestProductManagementPage.on('click', function() {
                    FoTool.go('/fo/myMenu/myInterestProductManagementPage.do');
                });

                //말풍선 툴팁
                $(document).ready(function(){
                    //다중배송지
                    setTimeout(function(){
                        $('.square-bollom.multi').fadeIn(800).delay(3000).fadeOut(800);
                    }, 1000);
                });
            },
            initialize: function() {
                window.name = 'orderListPage';


                // me.checkMarketingConsentDate();
            },



            getMyOrder: function(pageNo) {
                var params = {};
                if(pageNo > 1) {
                    params.pageNo = pageNo;
                }

                if(me.$selectOrderStage.val() && me.$selectOrderStage.val() != 0) {
                    params.orderStage = me.$selectOrderStage.val();
                }

                WebTool.go(me.urlMyOrderListPage, params);
            },

            getMyOrderDetail: function(orderSeq) {
                var url = me.urlGetMyOrderDetail;
                var params = {
                    orderSeq: orderSeq,
                    pageType: 'orderDetailPage'
                };

                $.post(url, params, function(result, textStatus) {
                    if(textStatus == 'success') {
                        me.setBPopupMyOrderDetail(result);
                    }
                }, 'html')
                    .fail(function() {
                        alert('error');
                    });

            },
            setBPopupMyOrderDetail: function(result) {
                me.$bPopupMyOrderDetail.empty().append(result);
                MyOrderDetailMgr.open(me.$bPopupMyOrderDetail);
            },


            requestDocIssuance: function(orderSeq) {

                var chooseEmail = false;
                if(me.$bPopupMyOrderDetail.find('input[name=emailId]').val() || me.$bPopupMyOrderDetail.find('input[name=emailUrl]').val()) {
                    chooseEmail = true;
                }

                var chooseFax = false;
                if(me.$bPopupMyOrderDetail.find('input[name=faxNumber]').val()) {
                    chooseFax = true;
                }

                if(me.$bPopupMyOrderDetail.find('input:checkbox[name="checkBoxRequestDocIssuance"]:checked').length < 1) {
                    alert('발급요청하실 서류를 선택하세요.');
                    return false;


                } else if(chooseEmail && !me.$bPopupMyOrderDetail.find('input[name=emailId]').val()) {
                    me.$bPopupMyOrderDetail.find('input[name=emailId]').focus();
                    alert('이메일 아이디를 입력하세요.');
                    return false;
                } else if(chooseEmail && !me.$bPopupMyOrderDetail.find('input[name=emailUrl]').val()) {
                    me.$bPopupMyOrderDetail.find('input[name=emailUrl]').focus();
                    alert('이메일 주소를 입력하세요.');
                    return false;
                } else if(chooseEmail && CheckTool.notAlphabetOrDigitOrSpecial(me.$bPopupMyOrderDetail.find('input[name=emailId]').val() + '@' + me.$bPopupMyOrderDetail.find('input[name=emailUrl]').val())) {
                    alert('이메일은 영문/숫자만 입력하세요.');
                    return false;


                } else if(chooseFax && !me.$bPopupMyOrderDetail.find('input[name=faxNumber]').val()) {
                    me.$bPopupMyOrderDetail.find('input[name=faxNumber]').focus();
                    alert('팩스번호를 입력하세요.');
                    return false;
                } else if(chooseFax && !$.isNumeric(me.$bPopupMyOrderDetail.find('input[name=faxNumber]').val())) {
                    $('input[name=faxNumber]').focus();
                    alert('팩스번호는 숫자만 입력하세요.');
                    return false;
                } else if(chooseFax && !me.$bPopupMyOrderDetail.find('input[name=faxNumber]').val().length > 13) {
                    me.$bPopupMyOrderDetail.find('input[name=faxNumber]').focus();
                    alert('팩스번호는 13자 이하만 입력하세요.');
                    return false;
                } else if(!chooseEmail && !chooseFax) {
                    alert('이메일 / 팩스 중 한가지 이상 반드시 입력하세요.');
                    return false;
                }

                var docIssuanceArray = [];
                var itemInfoArr = [];
                $.each(me.$bPopupMyOrderDetail.find('input:checkbox[name=checkBoxRequestDocIssuance]:checked'), function() {

                    var productSeq 			= $(this).data('productSeq');
                    var itemSeq 			= $(this).data('itemSeq');
                    var docIssuanceType 	= $(this).data('docIssuanceType');


                    var pushComplete = false;
                    var ItemInfo ={
                        itemSeq : itemSeq,
                        docIssuanceTypeArr : [docIssuanceType]
                    }

                    for (var i = 0; i < docIssuanceArray.length; i++) {
                        //같은 상품의 서류 발급 요청일때
                        if( docIssuanceArray[i].productSeq == productSeq ) {
                            var len = docIssuanceArray[i].itemInfoArr.length;
                            var itemInfoList = docIssuanceArray[i].itemInfoArr;
                            for (var k = 0; k < len; k++) {
                                //같은 상품에서 같은 옵션에 대한 요청일때
                                if( itemInfoList[k].itemSeq == itemSeq ){
                                    //중복되지 않는 요청서류 코드만 세팅
                                    if($.inArray(docIssuanceType, itemInfoList[k].docIssuanceTypeArr) === -1) {
                                        itemInfoList[k].docIssuanceTypeArr.push(docIssuanceType);
                                    }
                                }
                                else{
                                    //같은 상품에서 다른 옵션에 대한 서류 요청이라면 상품하위 옵션 리스트에 푸쉬
                                    var itemUnitInfo = {
                                        itemSeq: itemSeq,
                                        docIssuanceTypeArr: [ docIssuanceType ]
                                    }
                                    itemInfoList.push(itemUnitInfo);
                                }
                            }
                            pushComplete = true;
                        }
                    }

                    if(!pushComplete) {
                        var _docIssuanceArray = {
                            productSeq: productSeq,
                            itemInfoArr:[ItemInfo]
                        }

                        docIssuanceArray.push(_docIssuanceArray);
                    }

                });


                if(docIssuanceArray.length == 0) {
                    alert('발급요청하실 서류를 선택하세요.');
                    return false;
                }

                var url = me.urlRequestDocIssuance;
                var params = {
                    orderSeq: 			orderSeq,
                    docIssuance: 		JSON.stringify(docIssuanceArray)
                };

                if(chooseEmail) {
                    params.email = me.$bPopupMyOrderDetail.find('input[name=emailId]').val()+'@'+me.$bPopupMyOrderDetail.find('input[name=emailUrl]').val();
                }

                if(chooseFax) {
                    params.fax = $('input[name=faxNumber]').val();
                }

                $.post(url, params, function(result, textStatus) {
                    if(textStatus == 'success') {
                        if(ResultTool.isSuccess(result)) {
                            alert('발급 요청이 완료되었습니다.');
                            me.$bPopupMyOrderDetail.bPopup().close();
                        } else {
                            alert(ResultTool.getMessage(result));
                        }
                    } else {
                        alert('error');
                    }
                }, 'json')
                    .fail(function() {
                        alert('error');
                    });
            },

            cancelOrder: function(orderSeq , orderStage) {
                if(!orderSeq) {
                    alert('올바른 파라미터가 입력되지 않았습니다.\n관리자에게 문의하세요.');
                }

                var url = me.urlCancelOrder;
                var params = {
                    orderSeq: orderSeq
                }

                $.post(url, params, function(result, textStatus) {
                    if(textStatus == 'success') {
                        if(ResultTool.isSuccess(result)) {
                            if(orderStage  === 1){
                                WebTool.refresh();
                                // if(confirm("주문이 취소되었습니다. \n 장바구니에 다시 담으시겠습니까?")){
                                // 	me.getBackCart(params);
                                // }else {
                                //	WebTool.refresh();
                                // }
                            }else {
                                alert('주문이 취소되었습니다.');
                                WebTool.refresh();
                            }

                        }  else {
                            alert(ResultTool.getMessage(result));
                        }
                    } else {
                        alert('error');
                    }
                }, 'json')
                    .fail(function() {
                        alert('error');
                    });
            },getBackCart: function(params){
                var url = me.urlGetBackCart;

                $.post(url, params, function (result, textStatus) {
                    if (textStatus == 'success') {
                        alert('장바구니에 등록이 완료되었습니다.');
                        WebTool.refresh();
                    } else {
                        alert('error');
                    }
                }, 'json')
                    .fail(function () {
                        alert('error');
                    });
            },cancelOrderItem: function(orderSeq, orderStage, orderItemSeq, bundleYn, isOrderProductUse, cancelType = 'PartCancel') {

                if(!orderSeq) {
                    alert('올바른 파라미터가 입력되지 않았습니다.\n관리자에게 문의하세요.');
                }

                var url = me.urlCancelOrderItem;
                var params = {
                    orderSeq: orderSeq
                    , orderItemSeq: orderItemSeq
                    , bundleYn: bundleYn
                    , cancelType: cancelType
                    , isOrderProductUse: isOrderProductUse
                }

                $.post(url, params, function(result, textStatus) {

                    if(textStatus == 'success') {
                        if(ResultTool.isSuccess(result)) {

                            alert('주문이 취소되었습니다.');
                            WebTool.refresh();

                        } else {
                            alert(ResultTool.getMessage(result));
                        }
                    } else {
                        alert('error');
                    }
                }, 'json')
                    .fail(function() {
                        alert('error');
                    });
            },

            getReviewPopup: function() {
                var url = me.urlGetReviewPopup;

                $.post(url, function(result, textStatus) {
                    if(textStatus == 'success') {
                        me.setReviewPopup(result);
                    }
                }, 'html')
                    .fail(function() {
                        alert('error');
                    });
            },
            setReviewPopup: function(result) {
                me.$bPopupReview.empty().append(result);
                me.$bPopupReview.find('strong[name=reviewProductName]').text(me.reviewData.productName);
                me.$bPopupReview.bPopup({
                    position: ['auto', 100] //x, y
                });
            },
            addReview: function() {

                if(me.$bPopupReview.find('input:radio[name=star-input]:checked').length < 1) {
                    alert('별점을 선택하세요.');

                    return;
                } else if(!me.$bPopupReview.find('textarea[name=reviewContent]').val()) {
                    alert('후기 내용을 입력하세요.');
                    me.$bPopupReview.find('textarea[name=reviewContent]').focus();

                    return;
                } else if(me.$bPopupReview.find('textarea[name=reviewContent]').val().length < 10) {
                    alert('내용을 10자 이상 입력해 주세요.');
                    me.$bPopupReview.find('textarea[name=reviewContent]').focus();

                    return;
                }

                var url = me.urlAddReview;
                var params = {
                    orderSeq:		me.reviewData.orderSeq,
                    orderDt: 		me.reviewData.orderDt,
                    productSeq: 	me.reviewData.productSeq,
                    starPoint: 		me.$bPopupReview.find('input:radio[name=star-input]:checked').val(),
                    content: 		me.$bPopupReview.find('textarea[name=reviewContent]').val()
                };

                $.post(url, params, function(result, textStatus) {
                    if(textStatus == 'success') {
                        if(ResultTool.isSuccess(result)) {
                            alert('상품평 작성이 완료되었습니다.');

                            try {
                                var data = ResultTool.getData(result);
                                window.GoogleTagMgr.pushDataLayer({'event':'review_write_compt'});
                            }
                            catch(err) {
                                console.log( err );
                            }

                            WebTool.refresh();
                        } else {
                            alert(ResultTool.getMessage(result));
                        }
                    } else {
                        alert('error');
                    }
                }, 'json')
                    .fail(function() {
                        alert('error');
                    });
            },


            takeBackWrite: function(orderItemSeq, orderDt, productSeq, productName) {
                var url = '/fo/myMenu/takeBackWritePage.do'
                var params = {
                    orderItemSeq :	orderItemSeq,
                    orderDt : 		orderDt,
                    productSeq :	productSeq,
                    productName : 	productName
                };
                WebTool.go(url, params);
            },


            requestCashReceiptInfo: function(receiptSeqNo, approvalCharge, receiptCompanyType) {
                if(!receiptSeqNo || !approvalCharge) {
                    alert('필수 발행정보가 누락되었습니다.\n관리자에게 문의바랍니다.');

                    return;
                }

                if(receiptCompanyType == '1') {
                    var url = me.urlGetCashReceiptInfo;
                    var params = {
                        receiptSeqNo	: receiptSeqNo,
                        approvalCharge	: approvalCharge
                    }

                    $.post(url, params, function(result, textStatus) {
                        if(textStatus == 'success') {
                            if(ResultTool.isSuccess(result)) {
                                me.printCashReceipt(ResultTool.getData(result));
                            } else {
                                alert(ResultTool.getMessage(result));
                            }
                        } else {
                            alert('error');
                        }
                    }, 'json')
                        .fail(function() {
                            alert('error');
                        });
                }
                else {
                    WebTool.open('https://npg.nicepay.co.kr/issue/IssueLoader.do?TID='+receiptSeqNo+'&type=1');
                }
            },
            printCashReceipt: function(data) {

                var allatCashReceipt = window.open('', 'allat_cash_receipt', 'width=410, height=650, scrollbars=0');

                var $form = $('<form></form>');
                $form.attr('target', 'allat_cash_receipt');
                $form.attr('action', 'https://www.allatpay.com/servlet/AllatBizPop/member/pop_cash_receipt.jsp');
                $form.attr('method', 'post');

                $form.append($('<input type="hidden" name="shop_id">'));
                $form.append($('<input type="hidden" name="receipt_seq_number">'));
                $form.append($('<input type="hidden" name="amt">'));
                $form.append($('<input type="hidden" name="current_time">'));
                $form.append($('<input type="hidden" name="hash_value">'));

                $form.find('input[name=shop_id]').val				(data.shopId);
                $form.find('input[name=receipt_seq_number]').val	(data.receiptSeqNo);
                $form.find('input[name=amt]').val					(data.approvalCharge);
                $form.find('input[name=current_time]').val			(data.currentTimeMills);
                $form.find('input[name=hash_value]').val			(data.hashValue);

                $form.appendTo('body').submit();

            },

            requestCardReceiptInfo: function(data) {
                var orderSeq = data.orderSeq;
                var cardAmount = data.cardAmount;
                var tid = data.tid;
                var paymentGatewayCd = data.paymentGatewayCd;

                if (paymentGatewayCd === 'PG08') {
                    alert('네이버페이 결제 건은 네이버에서 확인하실 수 있습니다.');
                    return;
                }

                if (paymentGatewayCd == 'PG09') {
                    FoTool.tossCardReceiptInfo(orderSeq, tid)
                    return;
                }

                if(tid) {
                    WebTool.open('https://npg.nicepay.co.kr/issue/IssueLoader.do?TID='+tid+'&type=0');
                    return;
                }

                if(!orderSeq || !cardAmount) {
                    alert('필수 발행정보가 누락되었습니다.\n관리자에게 문의바랍니다.');

                    return;
                }

                var url = me.urlGetCardReceiptInfo;
                var params = {
                    orderSeq : orderSeq,
                    cardAmount : cardAmount
                }

                $.post(url, params, function(result, textStatus) {
                    if(textStatus == 'success') {
                        if(ResultTool.isSuccess(result)) {
                            me.printCardReceipt(ResultTool.getData(result));
                        } else {
                            alert(ResultTool.getMessage(result));
                        }
                    } else {
                        alert('error');
                    }
                }, 'json')
                    .fail(function() {
                        alert('error');
                    });
            },
            printCardReceipt: function(data) {

                var allatCardReceipt = window.open('', 'allat_card_receipt', 'width=410, height=650, scrollbars=0');

                var $form = $('<form></form>');
                $form.attr('target', 'allat_card_receipt');
                $form.attr('action', 'https://www.allatpay.com/servlet/AllatBizPop/member/pop_card_receipt.jsp');
                $form.attr('method', 'post');

                $form.append($('<input type="hidden" name="shop_id">'));
                $form.append($('<input type="hidden" name="order_number">'));
                $form.append($('<input type="hidden" name="current_time">'));
                $form.append($('<input type="hidden" name="hash_value">'));

                $form.find('input[name=shop_id]').val				(data.shopId);
                $form.find('input[name=order_number]').val			(data.orderSeq);
                $form.find('input[name=current_time]').val			(data.currentTimeMills);
                $form.find('input[name=hash_value]').val			(data.hashValue);

                $form.appendTo('body').submit();

            },

            checkPeriodMonthlyOrder: function(){
                var $startYear 	= $('select[name=downloadStartYear]');
                var $startMonth = $('select[name=downloadStartMonth]');
                var $endYear 	= $('select[name=downloadEndYear]');
                var $endMonth 	= $('select[name=downloadEndMonth]');

                if (moment($startYear.val() + '-' + $startMonth.val()) > moment($endYear.val() + '-' + $endMonth.val())) {
                    return false;
                }
                else {
                    return true;
                }
            },
            downloadMonthlyOrderExcel: function(data) {
                var $form = $('<form></form>');
                $form.attr('action', '/fo/myMenu/downloadMonthlyOrderExcel.do');
                $form.attr('method', 'post');
                $form.attr('encrypt', 'multipart/form-data');

                $form.append($('<input type="hidden" name="startDate">'));
                $form.append($('<input type="hidden" name="endDate">'));

                $form.find('input[name=startDate]').val(data.startDate);
                $form.find('input[name=endDate]').val(data.endDate);

                $form.appendTo('body').submit();
            },
            getMyOrderDeliveryInfo: function(deliveryInfo) {


                if(deliveryInfo.distTypeCd == 'AD03' || deliveryInfo.distTypeCd == 'AD04') {

                    var _html = '';


                    if(deliveryInfo.distTypeCd == 'AD03') {
                        var url = '/fo/myMenu/deliveryProcessPopupPage.do?orderSeq='+deliveryInfo.orderSeq+'&orderItemSeq='+deliveryInfo.orderItemSeq;
                        WebTool.openCenter (url, '',{resizable:1, scrollbars:'yes', width:500, height:600});

                    } else {
                        _html = '직접수령으로 주문한 상품입니다';
                        $('.pop_cont p').html(_html);


                        $('.delivery_upload').bPopup({
                            position: ['auto', 100] //x, y
                        });
                    }

                } else {

                    if(!deliveryInfo.invoiceNo) {

                        alert('아직 송장정보가 업데이트 되지 않았습니다.\n잠시 뒤에 다시 시도해 주세요.');

                    } else {

                        if(deliveryInfo.distTypeCd == 'AD01') {

                            window.open("https://ilogen.com/web/personal/trace/" + deliveryInfo.invoiceNo, "_blank");

                        } else if(deliveryInfo.distTypeCd == 'AD12') {

                            window.open("https://www.lotteglogis.com/open/tracking?invno=" + deliveryInfo.invoiceNo, "_blank");

                        } else if(deliveryInfo.distTypeCd == 'AD07' || deliveryInfo.distTypeCd == 'AD08') {

                            switch(deliveryInfo.parcelDeliveryCd) {
                                case 'BH01':
                                    window.open("https://ilogen.com/web/personal/trace/" + deliveryInfo.invoiceNo, "_blank");
                                    break;
                                case 'BH02':
                                    window.open("https://kdexp.com/rerere.asp?stype=1&yy=&mm=&p_item=" + deliveryInfo.invoiceNo, "_blank");
                                    break;
                                case 'BH03':
                                    window.open("https://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1=" + deliveryInfo.invoiceNo, "_blank");
                                    break;
                                case 'BH04':
                                    window.open("https://www.hlc.co.kr/hydex/jsp/tracking/trackingViewCus.jsp?InvNo=" + deliveryInfo.invoiceNo, "_blank");
                                    break;
                                case 'BH05':
                                    /* window.open("https://www.idreamlogis.com/delivery/delivery_result.jsp?item_no=" + deliveryInfo.invoiceNo, "_blank"); */
                                    break;
                                case 'BH06':
                                    window.open("https://trace.cjlogistics.com/next/tracking.html?wblNo=" + deliveryInfo.invoiceNo);
                                    break;
                                case 'BH07':
                                    window.open("https://www.hanjin.co.kr/kor/CMS/DeliveryMgr/WaybillResult.do?mCode=MN038&schLang=KR&wblnumText=&wblnum=" + deliveryInfo.invoiceNo, "_blank");
                                    break;
                                case 'BH08':
                                    /* window.open("https://www.idreamlogis.com/delivery/delivery_result.jsp?item_no=" + deliveryInfo.invoiceNo, "_blank"); */
                                    break;
                                case 'BH09':
                                    window.open("https://www.lotteglogis.com/open/tracking?invno=" + deliveryInfo.invoiceNo, "_blank");
                                    break;
                                case 'BH10':
                                    window.open("https://www.ds3211.co.kr/freight/internalFreightSearch.ht?billno=" + deliveryInfo.invoiceNo, "_blank");
                                    break;
                                default:

                                    $('.pop_cont p').html('지원하지 않는 택배사 입니다.<br>관리자에게 문의 하세요');


                                    $('.delivery_upload').bPopup({
                                        position: ['auto', 100] //x, y
                                    });
                            }
                        }
                    }
                }
            },
            removeMyInterestProduct: function(interestProductSeq) {

                if(!interestProductSeq) {
                    alert('올바른 파라미터가 입력되지 않았습니다.\n관리자에게 문의하세요.');
                    return;
                }

                if(confirm('이 상품을 목록에서 삭제하시겠습니까?')) {

                    var params = {
                        interestProductSeq: interestProductSeq
                    };

                    var url = me.urlRemoveMyInterestProduct;

                    $.post(url, params, function(result, textStatus) {
                        if(textStatus == 'success') {
                            if(ResultTool.isSuccess(result)) {

                                alert(ResultTool.getMessage(result));
                                WebTool.refresh();

                            } else {
                                alert(ResultTool.getMessage(result));
                            }
                        } else {
                            alert('error');
                        }
                    }, 'json')
                        .fail(function() {
                            alert('error');
                        });
                }

            },
            //
            reqTradeBillPrint: function(orderSeq) {
                WebTool.openPostCenter(
                    'https://web.meatbox.co.kr/delivery/tradeBillViewPage.do'
                    , undefined
                    , undefined
                    , {
                        orderSeq: orderSeq
                        , memberSeq: 'hKnE9yJ9IqI='
                        , includeBundleOrder : 'Y'
                    }
                );
            },
            docDown: function(docTypeCd, itemSeq) {
                var $form = $('<form></form>');
                $form.attr('action', '/fo/myMenu/downloadProductDoc.file');
                $form.attr('method', 'post');
                $form.attr('encrypt', 'multipart/form-data');

                $form.append($('<input type="hidden" name="docTypeCd">'));
                $form.append($('<input type="hidden" name="itemSeq">'));

                $form.find('input[name=docTypeCd]').val(docTypeCd);
                $form.find('input[name=itemSeq]').val(itemSeq);

                $form.appendTo('body').submit();
            },


            multiAddrAddPopup: function(orderSeq, orderStage, desiredYn, addByExcellYn){

                if (orderStage == 1) {
                    alert("입금확인 이후 등록 가능합니다.");
                    return;
                }

                MultiAddrPopMgr.initMultiAddrPopup({
                    orderSeq    : orderSeq,
                    desiredYn   : desiredYn,
                    isEdit      : ('Y' !== addByExcellYn) ? true : false,
                    isComplete  : (orderStage >= 3) ? true : false,
                });
            },


            checkMarketingConsentDate: function () {

                WebTool.get({
                    url: '/fo/myMenu/checkMarketingConsentDate.json',
                    data: {},
                    success: function (result) {
                        if (result.success) {

                            if (result.data.showPopup) {
                                me.updateMarketingConsentDate('N',7, false);
                                me.showMarketingConsentDatePopup();
                            }

                        } else {
                            alert(result.message);
                        }
                    }
                })
            },

            showMarketingConsentDatePopup: function() {

                let mktAreePop = $(".mrktRe_pop");


                mktAreePop.html('');
                mktAreePop.html(`<div class="pop_cont">
		<i class="ico"><img src="/img/mo/ico/ico_sms.png" alt=""></i>
		<p class="pop_tit">
			축산물 정보 및 구매 혜택을<br>SMS로 받아보시겠어요?
		</p>
		<p>수신 동의하시면 축산물 정보 및 구매 혜택을 받아보실 수 있어요.<br><span>'회원정보수정'에서 언제든 변경 가능해요.</span></p>
	</div>
	<div class="btngroup">
		<button type="button" class="btn-ty3 red agree" onclick="window.MainMgr.updateMarketingConsentDate('Y', 7, true)">동의하고 혜택 정보 받기</button>
		<button type="button" class="btn-ty3" onclick="window.MainMgr.updateMarketingConsentDate('N', 30, true)">30일 동안 보지 않기</button>
	</div>
	<button type="button" class="btn-ty3 b-close" onclick="window.MainMgr.updateMarketingConsentDate('N', 7, true)">닫기</button>`);

                let top = ($(window).scrollTop() + ($(window).height() - mktAreePop.height()) / 2 );
                mktAreePop.bPopup({
                    position: ['auto', top],
                    opacity: 0.6
                })

            },

            updateMarketingConsentDate: function(recvYn, afterDays) {
                $(".mrktRe_pop").bPopup().close();


                let d = new Date();
                d.setDate(d.getDate() + afterDays);
                let formattedDate = me.getFormattedDate(d);

                WebTool.post({
                    url: '/fo/myMenu/updateMarketingConsentDate.json',
                    data: {
                        type: 'SMS',
                        recvYn: recvYn,
                        date: formattedDate,
                    },
                    success: function (result) {
                        if (result.success) {
                            if (recvYn === 'Y') {
                                alert("2025. 10. 11 \n이벤트 소식 받기 문자(SMS) 수신 동의 하셨습니다. \n'회원정보수정'에서 변경 가능합니다.");
                            }
                        } else {
                            alert(result.message);
                        }

                    }
                })
            },

            padTwoDigits: function (num) {
                return num.toString().padStart(2, "0");
            },

            getFormattedDate: function (date) {
                return (
                    [
                        date.getFullYear(),
                        me.padTwoDigits(date.getMonth() + 1),
                        me.padTwoDigits(date.getDate()),
                    ].join("-") + " 00:00:00"
                );
            },

            callSampleCmplt: function() {
                alert('샘플 평가 등록이 완료되었어요.');
                window.name = '';
                WebTool.refresh();
            },

            nothing: null
        };
    })();

    $(function() {
        MainMgr.startup();
    });
</script>

<div id="mypage" class="container">
    <div id="contents">
        <!--//contents-->
        <div class="my_meatbox inner">

            <script>
                (function() {
                    var me = window.gradeMainMgr = {
                        startup: function() {
                            me.setVariables();
                            me.setEvents();
                            me.initialize();
                        },
                        setVariables: function() {

                        },
                        setEvents: function() {

                            //23.12.26 예치금 툴팁
                            $('.benefit-tit i.tooltip').click(function(){
                                $(this).closest('.my-main-grade').children('.tooltip-pop').css('display','block');

                                $('.tooltip-pop .close').click(function(){
                                    $(this).closest('.tooltip-pop').css('display','none');
                                });
                            });
                        },
                        initialize: function() {

                            $(".grade_banner_area").css("display", "none");
                            $(".benefit_btn").css("display", "none");
                            $(".grade_txt").css("display", "none");

                        },
                        levelInfoPage: function(){
                            WebTool.go('/fo/myMenu/membershipInfoPage.do');
                        },
                        newGradeInfoPage: function(){
                            WebTool.go('/fo/notice/noticeViewPage.do?boardSeq=55426');
                        },
                        setGradeProcessBar: function(){

                            var gradeProgressDividend = 0
                            var gradeProgressDivisor = 1
                            var gradeProgressRatio = '0%';
                            if(gradeProgressDivisor != 0 && gradeProgressDividend != 0) {
                                gradeProgressRatio = ((gradeProgressDividend / gradeProgressDivisor)*100).toFixed(0) + '%';
                            }


                            var totalWidth = 0;
                            $('.progress_comm').children().each(function (index) {
                                totalWidth += parseInt($(this).outerWidth());
                            });
                            $('.grade_branch').css({ "left": totalWidth + 6 });
                        },
                        nothing:null
                    }
                })();

                $(function() {
                    gradeMainMgr.startup();
                });
            </script>

            <section class="grade_wrap my_main_wrap my_meatbox">
                <div class="my-main-grade my_main dflex al_items ju_spb">
                    <div class="cont my_grade">
                        <!-- 등급 별 폰트 색상 g_vvip:vvip / g_vip:vip/ g_gold:gold / g_silver:silver / g_family:family  -->
                        <div class="my_info">
				<span class="grade_txt g_family">
					<a class="dflex al_items" href="javascript:;" onclick="gradeMainMgr.levelInfoPage();">
						<strong>FAMILY</strong>
						<em>4분기 (10~12월)</em>
					</a>
				</span>
                            <span class="my_name"><span class="my_name">
						    <span>
						        <% 
						            if (userName != null) { 
						        %>
						            <%= userName %>
						        <% 
						            } else { 
						        %>
						            고객
						        <% 
						            } 
						        %>
						    </span>
				</span></span>                        
						</div>
                    </div>
                    <div class="have_benefit dflex">
                        <dl>
                            <a class="al_items" href="javascript:;" onclick="FoTool.go('/fo/myMenu/myPointManagementPage.do');" >
                                <dt class="benefit-tit">미트포인트</dt>
                                <dd class="benefit-num">0원</dd>
                            </a>
                        </dl>
                        <dl>
                            <a class="al_items" href="javascript:;" onclick="FoTool.go('/fo/myMenu/myCouponManagementPage.do');" >
                                <dt class="benefit-tit">쿠폰 0장</dt>
                                <dd class="benefit-num">0원</dd>
                            </a>
                        </dl>
                        <dl>
                            <a class="al_items" href="javascript:;"  >
                                <dt class="benefit-tit"><i class="tooltip"></i>예치금 잔액</dt>
                                <dd class="benefit-num" onclick="FoTool.go('/fo/myMenu/myMileageManagementPage.do');">0원</dd>
                            </a>
                        </dl>
                    </div>
                    <div class="tooltip-pop">
                        <h6>예치금 안내</h6><button type="button" class="close">닫기</button>
                        <p>기존에 사용하시던 예치금은&nbsp;<b>일반 예치금</b>으로 명칭이 변경되었습니다. 미트박스 상품권을 구매하여 충전이나 선물을 하실 경우&nbsp;<b>상품권 예치금</b>으로 전환됩니다.</p>
                    </div>
                </div>
            </section>

            <div class="my_wrap inner">

                <script>
                    (function () {

                        var me = window.MainLeft = {
                            startup: function () {
                                me.setVariables();
                                me.setEvents();
                                me.initialize();
                            },
                            setVariables: function () {
                            },
                            setEvents: function () {
                                /*
		$('.my_list .leftSideMyboxShow').on('click', function () {
			$('.what_mybox').toggle();
		})
		*/
                            },
                            initialize: function () {
                                this.cardPaymentBadge();
                            },
                            cardPaymentBadge: function() {
                                // 카드결제내역 New Badge 표시
                                const now = new Date();
                                const thirtyDaysAgo = new Date(now.getTime() - (30 * 24 * 60 * 60 * 1000));
                                const startDate = thirtyDaysAgo.getFullYear() + '-' +
                                    StringTool.leftPad((thirtyDaysAgo.getMonth() + 1), 2, 0) + '-' +
                                    StringTool.leftPad(thirtyDaysAgo.getDate(), 2, 0);
                                const endDate = now.getFullYear() + '-' +
                                    StringTool.leftPad((now.getMonth() + 1), 2, 0) + '-' +
                                    StringTool.leftPad(now.getDate(), 2, 0);
                                var url = '/fo/myMenu/getLastCardOrderBadge.json';
                                var params = {
                                    startDate: 	startDate,
                                    endDate: 	endDate
                                }
                                $.post(url, params, function(result, textStatus) {
                                    if(textStatus == 'success') {
                                        if(ResultTool.isSuccess(result)) {
                                            const data = ResultTool.getData(result).myLastCardOrderBadgeYn;
                                            if (data === 'Y') {
                                                $(".small_list li").filter(function(index) {
                                                    const _obj = $(".small_list li").eq(index);
                                                    return _obj.children('a').text() === "카드결제내역";
                                                }).addClass('new_badge');
                                            }
                                        }
                                    }
                                }, 'json');
                            },
                            nothing: null
                        };
                    })();
                    $(function () {
                        MainLeft.startup();
                    });
                </script>

                <div class="my_list">
                    <em><a href="javascript:;" onclick="window.location.href='/myMenu/myMenuMainPage.do';"  class="on">나의 미트박스</a></em>
                    <ul>
                        <li>
                            <ul class="small_list">
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/myOrderListPage.do');" >주문/배송 내역</a></li>
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/myDeliveryInfoManagementPage.do');" >배송지 관리</a></li>
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/myInterestProductManagementPage.do');" >관심상품</a></li>
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/myCouponManagementPage.do');" >쿠폰박스</a></li>

                            </ul>
                        </li>
                        <li>
                            <ul class="small_list">
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/voucherLocker.do');" >상품권 보관함</a></li>
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/voucherPaymentHistoryPage.do');" >상품권 결제내역</a></li>
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/voucherGiving.do');" >상품권 선물내역</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="small_list">
                            </ul>
                        </li>
                        <li>
                            <ul class="small_list">
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/myReviewManagementPage.do');" >상품평</a></li>
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/myProductInquiryPage.do');" >나의 상품문의</a></li>
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/vocPage.do');" >고객의 소리</a></li>
                            </ul>
                        </li>
                        <li>
                            <ul class="small_list">
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/myMileageManagementPage.do');" >예치금 잔액조회/출금</a></li>
                                <li class=""><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/myCardPaymentInfoPage.do');" >카드결제내역</a></li>
                                <li><a href="javascript:;" onclick="FoTool.setupEasyPaymentManagement(null,'myPagePop');">간편결제 관리</a></li>
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/myPointManagementPage.do');" >미트포인트 내역</a></li>
                                <!-- <li><a href="javascript:;" onclick="FoTool.setupNiceEasyPay();">계좌 간편결제 등록/관리</a></li>
				<li><a href="javascript:;" onclick="FoTool.setupPayu();">카드 간편결제 등록/관리</a></li> -->
                            </ul>
                        </li>
                        <li>
                            <ul class="small_list">
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/modifyMyInfoIntroPage.do');" >회원정보수정</a></li>
                                <li><a href="javascript:;" onclick="FoTool.go('/fo/myMenu/modifyMyPasswdPage.do');" >비밀번호변경</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="lay_out">

                    <div class="my_step_wrap new_dsi after">
                        <ul class="my_step after">
                            <li>
                                <a href="javascript:" >
                                    <span>입금대기중</span>
                                    <em>
                                        0&nbsp;건
                                    </em>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:" >
                                    <span>입금확인</span>
                                    <em>
                                        0&nbsp;건
                                    </em>
                                </a>
                            </li>
                            <!-- <li>
								<a href="javascript:;">
									<span>배송준비중</span>
									<em>
										0 건
									</em>
								</a>
							</li> -->
                            <li>
                                <a href="javascript:" >
                                    <span>배송준비중</span>
                                    <em>
                                        0&nbsp;건
                                    </em>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:" >
                                    <span>배송중</span>
                                    <em>
                                        0&nbsp;건
                                    </em>
                                </a>
                            </li>
                            <li>
                                <a href="javascript:" >
                                    <span>배송완료</span>
                                    <em>
                                        0&nbsp;건
                                    </em>
                                </a>
                            </li>
                        </ul>
                        <div class="cancle_order" >
                            <a href="javascript:" >
                                <span>취소</span>
                                <em>
                                    0&nbsp;건
                                </em>
                            </a>
                        </div>
                    </div>

                    <div class="my_content cart_order">
                        <div class="cart_info">
                            <div class="title after">
                                <h4>최근주문/배송내역</h4>
                            </div>
                            <table class="cart_td_wrap">
                                <colgroup><col width="178px"/><col width="*"/><col width="102px"/></colgroup>
                                <thead>
                                <tr>
                                    <th>주문일/총금액</th>
                                    <th>상품정보</th>
                                    <th>상태</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td colspan="3" class="data_none_td">
                                        <div class="date_none">
                                            <p class="date_none_txt">주문/배송내역이 없습니다.</p>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="prd_list_wrap" class="lay_out interest">
                            <div class="title after">
                                <h4>관심상품 <span class="more_box"><button type="button" name="btnMoveToMyInterestProductManagementPage">더보기</button></span></h4>
                            </div>

                            <div class="lay_out">
                                <div class="comm_wr">
                                    <p class="wr_none">관심상품이 없습니다.</p>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>

                <div class="mypop detail_pop_type1" name="popupOrderDetail"></div>

                <div class="pop_comm input_pop" name="popupReview"></div>

                <div class="mypop delivery_upload">
                    <h3>배송정보 조회 <a href="javascript:;" class="b-close"><img src="https://static-cdn.meatbox.co.kr/img/fo/xicon.png" alt=""></a></h3>
                    <div class="pop_cont"><p></p></div>
                </div>
                <div class="pop_comm month_popup">
                    <div class="comm_table pop_cont">
                        <h4>월별 구매내역 다운로드 </h4>
                        <div class="my_pop">
                            <p>다운받으실 연도, 월을 선택해주세요.</p>
                            <table>
                                <colgroup><col width="120px"><col width="*"></colgroup>
                                <tbody>
                                <tr>
                                    <th><span>*</span> 시작 연월</th>
                                    <td>
                                        <select name="downloadStartYear" class="checkDate">
                                            <option value="2025">2025년</option>
                                            <option value="2024">2024년</option>
                                            <option value="2023">2023년</option>
                                            <option value="2022">2022년</option>
                                            <option value="2021">2021년</option>
                                            <option value="2020">2020년</option>
                                            <option value="2019">2019년</option>
                                            <option value="2018">2018년</option>
                                            <option value="2017">2017년</option>
                                            <option value="2016">2016년</option>
                                            <option value="2015">2015년</option>
                                        </select>
                                        <select name="downloadStartMonth" class="checkDate">
                                            <option value="01">1월</option>
                                            <option value="02">2월</option>
                                            <option value="03">3월</option>
                                            <option value="04">4월</option>
                                            <option value="05">5월</option>
                                            <option value="06">6월</option>
                                            <option value="07">7월</option>
                                            <option value="08">8월</option>
                                            <option value="09">9월</option>
                                            <option value="10">10월</option>
                                            <option value="11">11월</option>
                                            <option value="12">12월</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>*</span> 종료 연월</th>
                                    <td>
                                        <select name="downloadEndYear" class="checkDate">
                                            <option value="2025">2025년</option>
                                            <option value="2024">2024년</option>
                                            <option value="2023">2023년</option>
                                            <option value="2022">2022년</option>
                                            <option value="2021">2021년</option>
                                            <option value="2020">2020년</option>
                                            <option value="2019">2019년</option>
                                            <option value="2018">2018년</option>
                                            <option value="2017">2017년</option>
                                            <option value="2016">2016년</option>
                                            <option value="2015">2015년</option>
                                        </select>
                                        <select name="downloadEndMonth" class="checkDate">
                                            <option value="01">1월</option>
                                            <option value="02">2월</option>
                                            <option value="03">3월</option>
                                            <option value="04">4월</option>
                                            <option value="05">5월</option>
                                            <option value="06">6월</option>
                                            <option value="07">7월</option>
                                            <option value="08">8월</option>
                                            <option value="09">9월</option>
                                            <option value="10">10월</option>
                                            <option value="11">11월</option>
                                            <option value="12">12월</option>

                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <p>
                                * 배송완료된 내역만 다운로드 가능합니다. <br>
                                * 기준 날짜는 ‘상품 출고일’ 입니다. <br>
                                &nbsp;&nbsp;(예:2월28일 구매 후 3월 1일에 출고되었다면 3월 구매내역에 해당)
                            </p>
                        </div>
                        <div class="btn_box">
                            <a href="javascript:;"><img src="https://static-cdn.meatbox.co.kr/img/fo/mypage/month_down_down.png" id="downloadExcelBtn" alt="엑셀 다운로드 받기"/></a>
                            <a href="javascript:;" class="b-close"><img src="https://static-cdn.meatbox.co.kr/img/fo/mypage/month_down_close.png" alt="닫기"/></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--//contents-->
    </div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

    (function() {

        var me = window.DaumMgr = {


            startup: function()
            {
                me.setVariables();
                me.setEvents();
                me.initialize();
            },


            setVariables: function()
            {
                me.$layerFld		= $('#___postLayer');
            },


            setEvents: function()
            {
                me.$layerFld.find('IMG').click (function() {
                    me.hide();
                });
            },


            initialize: function()
            {
            },


            show: function (json, callback)
            {
                me.$layerFld.css ({
                    'width'	: '98%'
                    , 'height'	: '90%'
                });

                me.type				= json['type'];
                me.$postcodeFld		= (typeof (json['postcode']) == 'string') ? $('#' +json['postcode']) : json['postcode'];
                me.$postcode1Fld	= (typeof (json['postcode1']) == 'string') ? $('#' +json['postcode1']) : json['postcode1'];
                me.$postcode2Fld	= (typeof (json['postcode2']) == 'string') ? $('#' +json['postcode2']) : json['postcode2'];
                me.$address1Fld		= (typeof (json['address1']) == 'string') ? $('#' +json['address1']) : json['address1'];
                me.$address2Fld		= (typeof (json['address2']) == 'string') ? $('#' +json['address2']) : json['address2'];
                me.$roadAddressFld	= (typeof (json['roadAddress']) == 'string') ? $('#' +json['roadAddress']) : json['roadAddress'];
                me.$userSelectedTypeFld = (typeof (json['userSelectedType']) == 'string') ? $('#' +json['userSelectedType']) : json['userSelectedType'];
                me.$buildingNameFld = (typeof (json['buildingName']) == 'string') ? $('#' +json['buildingName']) : json['buildingName'];
                me.$viewAddrFld 	= (typeof (json['viewAddr']) == 'string') ? $('#' +json['viewAddr']) : json['viewAddr'];

                var daumPostcode = new daum.Postcode ({
                    oncomplete: function (data) {
                        $('.hidden-area').show(); //회원가입 - 주소검색

                        if(typeof me.$postcodeFld !== "undefined"){

                            if ($(me.$postcodeFld).prop('tagName') == 'TD'){
                                me.$postcodeFld.html (data.zonecode);
                                me.$postcodeFld.data('zipCd',data.zonecode);
                            }else if($(me.$postcodeFld).prop('tagName') == 'SPAN' && $(me.$postcodeFld).attr('data-zip-cd') == 'zipCd'){ //회원가입 - 주소검색
                                me.$postcodeFld.html (data.zonecode);
                                me.$postcodeFld.val (data.zonecode);
                                me.$postcodeFld.prev('input[name="zipCd"]').val(data.zonecode);
                                me.$postcodeFld.prev('input[type="text"]').removeAttr('readonly');
                            }else {
                                me.$postcodeFld.val (data.zonecode);
                            }

                        }


                        if(typeof me.$postcode1Fld !== "undefined" && typeof me.$postcode2Fld !== "undefined") {
                            if (data.postcode1 == '')
                            {

                                if ($(me.$postcode1Fld).prop('tagName') == 'TD'){
                                    me.$postcode1Fld.html (data.zonecode.substring(0,3));
                                    me.$postcode1Fld.data('zipCd1',data.zonecode.substring(0,3));
                                }
                                else {
                                    me.$postcode1Fld.val (data.zonecode.substring(0,3));
                                }

                                if ($(me.$postcode2Fld).prop('tagName') == 'TD'){
                                    me.$postcode2Fld.html (data.zonecode.substring(3,5));
                                    me.$postcode2Fld.data('zipCd2',data.zonecode.substring(3,5));
                                }
                                else {
                                    me.$postcode2Fld.val (data.zonecode.substring(3,5));
                                }

                            }
                            else
                            {

                                if ($(me.$postcode1Fld).prop('tagName') == 'TD'){
                                    me.$postcode1Fld.html (data.postcode1);
                                    me.$postcode1Fld.data('zipCd1',data.postcode1);
                                }
                                else {
                                    me.$postcode1Fld.val (data.postcode1);
                                }

                                if ($(me.$postcode2Fld).prop('tagName') == 'TD'){
                                    me.$postcode2Fld.html (data.postcode1);
                                    me.$postcode2Fld.data('zipCd2',data.postcode2);
                                }
                                else {
                                    me.$postcode2Fld.val (data.postcode2);
                                }
                            }
                        }

                        if (data.jibunAddress == null || data.jibunAddress == '')
                        {
                            if ($(me.$address1Fld).prop('tagName') == 'TD'){
                                me.$address1Fld.html (data.autoJibunAddress);
                                me.$address1Fld.data('addr1',data.autoJibunAddress);
                            }
                            else {
                                me.$address1Fld.val (data.autoJibunAddress).change();
                            }
                        }
                        else
                        {
                            if ($(me.$address1Fld).prop('tagName') == 'TD'){
                                me.$address1Fld.html (data.jibunAddress);
                                me.$address1Fld.data('addr1',data.jibunAddress);
                            }
                            else {
                                me.$address1Fld.val (data.jibunAddress).change();
                            }

                        }

                        /*도로명*/
                        if (data.roadAddress == null || data.roadAddress =='') {
                            if (typeof me.$roadAddressFld !== "undefined") {
                                if ($(me.$address1Fld).prop('tagName') == 'TD') {
                                    me.$roadAddressFld.html(data.autoRoadAddress);
                                    me.$roadAddressFld.data('roadAddr1', data.autoRoadAddress);
                                } else {
                                    me.$roadAddressFld.val(data.autoRoadAddress).change();
                                }
                            }
                        }
                        else
                        {
                            if (typeof me.$roadAddressFld !== "undefined") {
                                if ($(me.$address1Fld).prop('tagName') == 'TD') {
                                    me.$roadAddressFld.html(data.roadAddress);
                                    me.$roadAddressFld.data('roadAddr1', data.roadAddress);
                                } else {
                                    me.$roadAddressFld.val(data.roadAddress).change();
                                }
                            }
                        }

                        /*건물명*/
                        if(typeof me.$buildingNameFld !== "undefined") {
                            if ($(me.$address1Fld).prop('tagName') == 'TD'){
                                me.$buildingNameFld.html (data.buildingName);
                                me.$buildingNameFld.data('buildingName',data.buildingName);
                            } else {
                                me.$buildingNameFld.val (data.buildingName).change();
                            }
                        }

                        /*선택한 주소 유형*/
                        if(typeof me.$userSelectedTypeFld !== "undefined") {
                            if ($(me.$address1Fld).prop('tagName') == 'TD'){
                                me.$userSelectedTypeFld.html (data.userSelectedType);
                                me.$userSelectedTypeFld.data('addrSelectedType',data.userSelectedType);
                            } else {
                                me.$userSelectedTypeFld.val (data.userSelectedType).change();
                            }
                        }

                        /*화면에 보여지는 주소*/
                        if(typeof me.$viewAddrFld !== "undefined"){
                            var viewAddrTxt = WebTool.getDisplayAddress(me.$roadAddressFld.val(), me.$address1Fld.val(), '', me.$buildingNameFld.val());
                            if ($(me.$address1Fld).prop('tagName') == 'TD'){
                                me.$viewAddrFld.html (viewAddrTxt);
                                me.$viewAddrFld.data('viewAddr',viewAddrTxt);
                            } else {
                                me.$viewAddrFld.val (viewAddrTxt).change();
                            }
                        }

                        if( me.$address2Fld )
                        {
                            me.$address2Fld.val('');
                            me.$address2Fld.focus();
                        }

                        if (typeof(callback) === 'function') {
                            callback();
                        }
                    },
                    width : '100%',
                    height : '100%',
                    onclose: function() {
                        me.hide();
                    }
                });

                if (me.type == 'open')
                {
                    daumPostcode.open();
                }
                else	// @TODO
                {
                    daumPostcode.embed (me.$layerFld[0], {
                        'autoClose': true
                    });
                    me.$layerFld.show();
                }
            },

            hide: function()
            {
                me.$layerFld.hide();
            },


            convertData: function(data) {
                /* 우편번호 */
                var zipCd = data.zonecode;

                var zipCd1;
                var zipCd2;
                if (data.postcode1 == '') {
                    zipCd1 = data.zonecode.substring(0,3)
                    zipCd2 = data.zonecode.substring(3,5)
                } else {
                    zipCd1 = data.postcode1;
                    zipCd2 = data.postcode2;
                }

                /* 지번주소 */
                var jibunAddress;
                if (data.jibunAddress == null || data.jibunAddress == '') {
                    jibunAddress = data.autoJibunAddress;
                } else {
                    jibunAddress = data.jibunAddress;
                }

                /* 도로명 */
                var roadAddress;
                if (data.roadAddress == null || data.roadAddress =='') {
                    roadAddress = data.autoRoadAddress
                } else {
                    roadAddress = data.roadAddress;
                }

                /*건물명*/
                var buildingName = data.buildingName;

                /*선택한 주소 유형*/
                var userSelectedType = data.userSelectedType;

                var viewAddrText = WebTool.getDisplayAddress(roadAddress, jibunAddress, '', buildingName);

                return {
                    zipCd: zipCd,
                    zipCd1: zipCd1,
                    zipCd2: zipCd2,
                    jibunAddress: jibunAddress,
                    roadAddress: roadAddress,
                    buildingName: buildingName,
                    userSelectedType: userSelectedType,
                    viewAddrText: viewAddrText
                };
            },

            nothing:null
        };

    })();


    $(function() {
        DaumMgr.startup();
    });
</script>

<div id="___postLayer" style="display:none;border:5px solid;position:fixed;left:1%;margin-left:0;top:50px;margin-top:0;-webkit-overflow-scrolling:touch;z-index:19999;background-color:#FFFFFF;">
    <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" style="width:30px;height:30px;z-index:9999;cursor:pointer;position:absolute;right:-5px;top:-35px" alt="닫기 버튼">
</div>
<script src="https://static-cdn.meatbox.co.kr/js/tool/MemberTools.min.js?ver=20251001124312135"></script>
<script type="text/javascript">
    (function() {
        let me = window.MultiAddrPopMgr = {
            startup: function() {
                me.setVariables();
                me.setEvents();
                me.initialize();
            },
            setVariables: function() {
                me.changeTagStatusArea;
                me.impossibleJejuDelivery;
            },
            setEvents: function() {
                // 여러 배송지 입력의 x (닫기) 버튼을 누르면,
                $('.close_window').on('click', function () {
                    // 배송희망일 달력의 x(닫기) trigger을 걸어서, 닫히게 만든다.
                    //$('.close').trigger('click');
                    $(this).closest('.excel_upload_pop').find('.close').trigger('click');
                });

                $('.multi-excel-pop .b-close').click(function () {
                    me.hide();
                });

                // 2024-12-17 선물하기 주문
                //내용 입력하기 (카운트)
                $(function () {
                    var textCount = $('input.send').val().length;
                    $('input.send').siblings('.txt-length').find('em').html(textCount);
                    if (textCount > 30) {
                        var textareaCont = $(this).val();
                        $('input.send').val(textareaCont.substr(0, 30));
                        $('input.send').siblings('.txt-length').find('em').html('10');
                    }
                    $(document).on('keyup load', 'input.send', function () {
                        var textCount = $(this).val().length;
                        $(this).siblings('.txt-length').find('em').html(textCount);
                        if (textCount > 30) {
                            var textareaCont = $(this).val();
                            $(this).val(textareaCont.substr(0, 30));
                            $(this).siblings('.txt-length').find('em').html('10');
                        }
                        let td = $(this).closest('td');
                        if(textCount > 0) {
                            td.find('span').removeClass('error');
                            td.find('p').hide();
                        } else {
                            td.find('span').addClass('error');
                            td.find('p').show();
                        }
                    });

                    //예약배송일 이거 삭제해도 되나?
                    // $('.ui-datepicker').css('display', 'none');
                });
                //툴팁
                $('.multi-excel-pop .tooltip_btn').click(function () {
                    $(this).siblings().toggle();
                });
                $('.multi-excel-pop .tooltip_box .close').off('click').click(function () {
                    $(this).closest('.tooltip_box').toggle();
                });
            },

            initialize: function() {

            },

            //
            initMultiAddrPopup: function(info) {
                me.orderSeq     = info.orderSeq || 0;       // 주문 전, 후
                me.desiredYn    = info.desiredYn || 'N';    // 희망 배송 여부
                me.isComplete   = info.isComplete || false;
                me.rows         = info.rows;                // 작성해야 하는 row 수
                let dataList    = info.tableJsonList || []

                if(info.isComplete) {
                    $('.multi-excel-pop').removeClass('edit');
                    $('.multi-excel-pop').addClass('cmplt');
                } else {
                    $('.multi-excel-pop').removeClass('cmplt');
                    $('.multi-excel-pop').addClass('edit');
                }

                // 등록 정보 셋팅
                me.setInfo(info);

                // 화면에 addr 데이터 뿌려주기
                me.setAddressHeader();
                if(me.orderSeq > 0) {
                    me.getOrderItemAddrsList();        // 주문 후
                } else {
                    me.setAddressList(me.rows, dataList);    // 주문 전
                }
            },

            setInfo: function(info) {
                let isComplete = info.isComplete;
                if(info.orderSeq > 0) {
                    WebTool.post2({
                        url     : '/co/order/selectOrderInfo.json',
                        data    : {
                            orderSeq : me.orderSeq,
                            statusCd : 'AC00'
                        },
                        success : function(result) {
                            me.order = result.data.order;
                            me.orderSeq = me.order.orderSeq;
                            me.desiredYn = me.order.orderOptions.desired_yn || 'N';
                            if(me.order.orderOptions.sender_nm) {
                                me.setSenderName(isComplete, me.order.orderOptions.sender_nm);
                            } else {
                                me.selectMember(isComplete, me.order.memberSeq);
                            }
                            let productSeqList = [];
                            for(let product of me.order.productList) {  // 다중 배송지는 product 가 1개 밖에 없지만
                                productSeqList.push(product.productSeq);
                                let itemList = product.itemList;
                                let optionInfoList = [];
                                for(let item of itemList) {
                                    let proOptName = item.proOptName || '';
                                    let orderBoxCnt = item.orderBoxCnt;
                                    let price = item.pricePerKg * item.maxKg;
                                    let optionInfo = proOptName + ' / 수량 : ' + orderBoxCnt + ' / ' + price.toLocaleString() + '원'
                                    optionInfoList.push(optionInfo);
                                }
                                me.setProductInfo(product.productName, optionInfoList.join('<br>'));
                            }
                            me.productListJson = JSON.stringify(productSeqList);
                        }
                    })
                } else {
                    me.setSenderName(isComplete, info.senderName);
                    me.setProductInfo(info.productName, info.optionInfo);
                    let productSeqList = [];
                    for(let product of info.productList) {
                        productSeqList.push(product.productSeq);
                    }
                    me.productListJson = JSON.stringify(productSeqList);
                }
            },
            selectMember : function(isComplete, memberSeq) {
                WebTool.post({
                    url     : '/co/member/getMyInfo.json',
                    success : function(result) {
                        let member = result.data.myInfo;
                        me.setSenderName(isComplete, member.realName || member.ceoName);
                    }
                })
            },
            setSenderName: function(isComplete, senderName) {
                senderName = senderName || ''
                if(isComplete) {
                    $('.senderName').text(senderName);
                    $('.isEdit').hide();
                    $('.isComplete').show();
                } else {
                    $('.senderName').val(senderName);
                    $('.isComplete').hide();
                    $('.isEdit').show();
                    let textCount = senderName.length;
                    $('.senderName').siblings('.txt-length').find('em').html(textCount);
                    let td = $('.senderName').closest('td');
                    if(textCount > 0) {
                        td.find('span').removeClass('error');
                        td.find('p').hide();
                    } else {
                        td.find('span').addClass('error');
                        td.find('p').show();
                    }
                }
            },
            setProductInfo: function(productName, optionInfo) {
                $('.prdct-info b').html(productName || '');
                $('.prdct-info p').html(optionInfo || '');
            },
            setAddressHeader : function() {
                $('#excelDataTable colgroup').html(
                    '<col width="60px">' +
                    '<col width="100px">' +
                    '<col width="130px">' +
                    '<col width="326px">' +
                    '<col width="*px">' +
                    (('Y' === me.desiredYn) ? '<col width="120px">' : ''));
                $('#excelDataTable thead tr').html(
                    '<td key="num">번호</td>' +
                    '<td key="recvNm">받는 분</td>' +
                    '<td key="recvCellNo">받는 분 연락처</td>' +
                    '<td key="addr1" >주소</td>' +
                    '<td key="addr2">상세 주소</td>' +
                    (('Y' === me.desiredYn)
                        ? ( '<td key="expectDeliveryDate">예약 배송일</td>' +
                            '<td style="display: none;" key="expectInbdDate">출고 예정</td>')
                        : '') +
                    '<td style="display: none;" key="zipCd1">배송지 우편번호</td>' +
                    '<td style="display: none;" key="zipCd2">배송지 우편번호2</td>' +
                    '<td style="display: none;" key="zipCd">우편번호</td>' +
                    '<td style="display: none;" key="inputAddr1">원본 입력주소</td>' +
                    '<td style="display: none;" key="productSeq">상품번호</td>' +
                    '<td style="display: none;" key="roadAddr1">도로명 주소</td>' +
                    '<td style="display: none;" key="buildingName">건물 이름</td>' +
                    '<td style="display: none;" key="addrSelectedType">선택한 주소 타입</td>' +
                    '<td style="display: none;" key="orderItemBoxSeq">주문번호</td>')
            },
            setAddressList : function(rows, dataList) {
                let html = '';
                for(let i=0; i<(rows || 100); i++) {
                    let data = dataList[i];
                    html += '<tr class="jsonDataTrTag">' +
                        '<td>' + (1 + i) + '</td>' +
                        '<td>' +
                        '<span class="input-wrap">' +
                        '<input type="text" name="multi-adress-input" class="recvNm" placeholder="받는 분" data-recv-nm="" value="' + (data ? data.recvNm : '') + '" required />' +
                        '</span>' +
                        '<p class="required" style="display:none">받는 분 입력</p>' +
                        '</td>' +
                        '<td>' +
                        '<span class="input-wrap">' +
                        '<input type="text" name="multi-adress-input" class="ph-num" placeholder="휴대폰 번호" data-recv-cell-no="" value="' + (data ? data.recvCellNo : '010-') + '" required maxlength="13"/>' +
                        '</span>' +
                        '<p class="required" style="display:none">받는 분 연락처 입력</p>' +
                        '</td>' +
                        '<td class="adress">' +
                        '<span class="input-wrap">' +
                        '<input type="text" name="multi-adress-input" class="addr1" placeholder="주소검색" a-addr1="" id="setupAddr1_' + i + '" value="' + (data ? data.addr1 : '') + '" disabled readonly required />' +
                        '</span>' +
                        '<button type="button" class="adress"  id="daumPostBtn_' + i + '" onclick="MultiAddrPopMgr.searchPost(`setupZipCd_' + i + '`,`setupZipCd1_' + i + '`, `setupZipCd2_' + i + '`, `setupAddr1_' + i + '`, `setupRoadAddr1_' + i + '`, `setupAddrSelectedType_' + i + '`, `setupBuildingName_' + i + '`, `daumPostTr_' + i + '`, `daumPostBtn_' + i + '`, `' + i + '`)">주소검색</button>' +
                        '<p class="required need" style="display:none">‘주소검색’ 버튼 클릭후 주소를 검색해주세요.</p>' +
                        '<p class="required edit" style="display:none">정확한 주소 확인을 위해 ‘주소검색’을 통해 주소를 선택해 주세요.</p>' +
                        '</td>' +
                        '<td>' +
                        '<span class="input-wrap">' +
                        '<input type="text" name="multi-adress-input" class="addr2" data-addr2="" id="setupAddr2_' + i + '" placeholder="상세주소" value="' + (data ? data.addr2 : '') + '" disabled required />' +
                        '</span>' +
                        '<p class="required" style="display:none">상세주소 입력</p>' +
                        '</td>' +
                        (('Y' === me.desiredYn)
                            ? ('<td class="reservation">' +
                                '<span class="input-wrap">' +
                                '<input type="text" name="multi-adress-input" class="reservation-pick" placeholder="날짜 선택" value="' + (data ? data.expectDeliveryDate : ``) + '" readonly required />' +
                                '</span>' +
                                '<p class="required" style="display:none">예약 배송일 선택</p>' +
                                '</td>' +
                                '<td style="display: none;">' +
                                '<input type="text" data-expect-inbd-date="' + (data ? data.expectInbdDate : '') + '" value="' + (data ? data.expectInbdDate : '') + '" class="expectInbdDate">' +
                                '</td>')
                            : '') +
                        '<td style="display: none;">' +
                        '<input type="text" data-zip-cd1="' + (data ? data.zipCd1 : '') + '" value="' + (data ? data.zipCd1 : '') + '" id="setupZipCd1_' + i +'">' +
                        '</td>' +
                        '<td style="display: none;">' +
                        '<input type="text" data-zip-cd2="' + (data ? data.zipCd2 : '') + '" value="' + (data ? data.zipCd2 : '') + '" id="setupZipCd2_' + i +'">' +
                        '</td>' +
                        '<td style="display: none;">' +
                        '<input type="text" data-zip-cd="' + (data ? data.zipCd : '') + '" value="' + (data ? data.zipCd : '') + '" id="setupZipCd_' + i +'">' +
                        '</td>' +
                        '<td style="display: none;">' +
                        '<input type="text" data-input-addr1="' + (data ? data.inputAddr1 : '') + '" value="' + (data ? data.inputAddr1 : '') + '" id="setupInputAddr1_' + i + '">' +
                        '</td>' +
                        '<td style="display: none;">' +
                        '<input type="text" data-producct-seq="' + (data ? data.productSeq : '') + '" value="' + (data ? data.productSeq : '') + '" id="setupProductSeq_' + i + '">' +
                        '</td>' +
                        '<td style="display: none;">' +
                        '<input type="text" data-road-addr1="' + (data ? data.roadAddr1 : '') + '" value="' + (data ? data.roadAddr1 : '') + '" id="setupRoadAddr1_' + i + '">' +
                        '</td>' +
                        '<td style="display: none;">' +
                        '<input type="text" data-building-name="' + (data ? data.buildingName : '') + '" value="' + (data ? data.buildingName : '') + '" id="setupBuildingName_' + i + '">' +
                        '</td>' +
                        '<td style="display: none;">' +
                        '<input type="text" data-addr-selected-type="' + (data ? data.addrSelectedType : '') + '" value="' + (data ? data.addrSelectedType : '') + '" id="setupAddrSelectedType_' + i + '">' +
                        '</td>' +
                        '<td style="display: none;">' +
                        '<input type="text" data-order-item-box-seq="' + (data ? data.orderItemBoxSeq : '') + '" value="' + (data ? data.orderItemBoxSeq : '') + '" class="orderItemBoxSeq" id="setupOrderItemBoxSeq_' + i + '">' +
                        '</td>' +
                        '</tr>'
                }
                $('#tableBodyArea').html(html);
                me.show();
                me.setCheckData();
            },
            show: function() {
                if(!$('.multi-excel-pop').hasClass('on')) {
                    $('.multi-excel-pop').addClass('on').wrap('<div class="dim-layer"></div>');
                }
            },
            hide: function() {
                $('.multi-excel-pop').removeClass('on').unwrap('.dim-layer');
            },
            setCheckData: function() {
                $('tr.jsonDataTrTag').each(function() {
                    $(this).find('input').each(function() {
                        me.checkInput($(this))
                        me.checkRow($(this).closest('tr.jsonDataTrTag'));
                        if($(this).hasClass('ph-num')) {
                            $(this).on('keydown', function(e) {
                                me.setCellNo($(this), e);
                            })
                        }
                        $(this).on('change keyup', function(e) {
                            me.checkInput(this);
                            me.checkRow($(this).closest('tr.jsonDataTrTag'));
                        });
                    })
                })
                if('Y' === me.desiredYn) {
                    me.ableSetDate();
                }
            },
            checkCellNo: function(cellNo) {
                var length = cellNo.length;
                var regEx = /[^-0-9]/g;

                if(!cellNo.startsWith('010')) {
                    return false;
                }
                if(length <= 14){
                    if (regEx.test(cellNo)) {
                        return false;
                    }
                    regEx = /[^0-9]/g;
                    cellNo = cellNo.replace(regEx, '');

                    if (cellNo.length === 10 || cellNo.length === 11) {
                        return true;
                    } else if (cellNo.length === 0) {
                        return false;
                    } else if (cellNo.length < 10){
                        return false;
                    } else if (cellNo.length > 11){
                        return false;
                    } else {
                        return false;
                    }
                }else{
                    if(length === 12){
                        return false;
                    }else{
                        return false;
                    }
                }
            },
            checkInput : function(target, e) {
                let tr = $(target).closest('tr');
                let td = $(target).closest('td');
                let span = $(td).find('span.input-wrap');
                let p = $(td).find('p.required');
                let isOk = true;
                if($(target).hasClass('ph-num')) {
                    isOk = me.checkCellNo($(target).val());
                }
                if(isOk && $(target).val().length > 0) {
                    span.removeClass('error');
                    p.hide();
                    if(td.hasClass('adress')) {
                        let addr2 = tr.find('.addr2');
                        if($(target).hasClass('input')) {
                            span.addClass('error');
                            $(td).find('p.required.need').hide();
                            $(td).find('p.required.edit').show();
                            addr2.attr('disabled', true);
                        } else {
                            addr2.attr('disabled', false);
                        }
                    }
                } else {
                    span.addClass('error');
                    p.show();
                    if(td.hasClass('adress')) {
                        $(td).find('p.required.need').show();
                        $(td).find('p.required.edit').hide();
                        tr.find('.addr2').attr('disabled', true);
                    }
                }
            },
            checkRow : function(row) {
                let count = 0;
                $(row).find('input[name="multi-adress-input"]').each(function() {
                    let value = $(this).val();
                    if(value && !(value == '010-' || value == '010')) {
                        count++;
                    }
                })
                if(count > 0) {
                    $(row).addClass('use');
                    $(row).find('input').each(function() {
                        me.checkInput($(this));
                    })
                } else {
                    $(row).removeClass('use');
                    $(row).find('td').each(function() {
                        $(this).find('span.input-wrap').removeClass('error');
                        $(this).find('p.required').hide();
                    });
                }

                me.countRow();
            },
            countRow : function() {
                let count = 0;
                $('#excelDataTable tbody .jsonDataTrTag.use').each(function (index) {
                    let isError = false;
                    $(this).find('span.input-wrap').each(function() {
                        if($(this).hasClass('error')) {
                            isError = true;
                        }
                    })
                    if (!isError &&
                        $(this).find('input.recvNm').val() &&
                        $(this).find('input.ph-num').val() &&
                        $(this).find('input.addr1').val() &&
                        $(this).find('input.addr2').val() &&
                        ('Y' !== me.desiredYn || 'Y' === me.desiredYn && $(this).find('input.reservation-pick').val())) {
                        count++;
                    }
                })
                $('.sub-tit b').text(count);
            },
            setCellNo : function(target, e) {
                var key = e.charCode || e.keyCode || 0;
                $text = $(target);

                var textCount = $text.val().length;
                if(textCount <= 4) {
                    $(target).val('010-')
                }

                if (key !== 8 && key !== 9) {
                    /*
					if ($text.val().length === 3) {
						$text.val($text.val() + '-');
					}
*/
                    if ($text.val().length === 8) {
                        $text.val($text.val() + '-');
                    }
                }
                return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
            },
            ableSetDate: function() {
                $('.reservation input').off('click').click(function() {
                    let $input = $(this);

                    if ($input.hasClass('hasDatepicker')) {
                        $input.datepicker('destroy');
                        $input.closest('.datepicker-wrapper').remove(); // 래핑된 DOM 요소 제거
                    }

                    me.setDesignatedDayDeliveryInfo(this);
                })
            },

            //
            downloadMultiAddressExcel: function(){
                WebTool.submit ({
                    'action'	: WebTool.getUrl( '/fo/myMenu/downloadMultiAddressExcel.file' ),
                    'inputs'	: {
                        'orderSeq'	    : me.orderSeq,
                        'desiredYn'     : me.desiredYn,
                        'rows'          : me.rows
                    }
                });
            },

            // 엑셀 업로드
            uploadMultiAddrExcel: function(){
                if(!$('#multiAddrExcelInput').val()) {
                    return;
                }

                var formData = new FormData();
                formData.append('excelFile',    $('#multiAddrExcelInput')[0].files[0] );
                formData.append('orderSeq',     me.orderSeq);
                formData.append('desiredYn',    me.desiredYn);
                formData.append('rows',         me.rows);

                $.ajax ({
                    url: WebTool.getUrl( '/fo/multiAddress/uploadAddressFile.json' ),
                    dataType: 'json',
                    type: 'post',
                    data: formData,
                    processData: false,
                    contentType: false,
                    beforeSend: function(jqXHR, setting) {},
                    success: function(result, textStatus, jqXHR) {
                        if (!ResultTool.isSuccess(result) ) {
                            alert(result.message);
                            return;
                        }
                        let dataRows = result.data.data.dataRows;
                        let list = result.data.data.list;
                        if(dataRows > list.length) {
                            alert('업로드 가능한 인원(' + (me.rows || 100) + '명)을 초과 하였습니다.\n입력된 대상은 등록이 가능하며, 초과 인원은 상품 재 구매를 이용해 주세요.')
                        }
                        me.impossibleJejuDelivery = result.data.data.impossibleJejuDelivery;
                        me.makeTableRowData(result.data.data);
                    },
                });
            },

            // DB 데이터 읽어오기
            getOrderItemAddrsList: function() {
                WebTool.post2({
                    url     : '/co/order/item/addrs/selectList.json',
                    data    : { orderSeq : me.orderSeq },
                    success : function(result) {
                        if(!result.success) {
                            alert(result.message);
                            return;
                        }
                        me.rows = result.data.list.length;
                        me.makeTableRowData(result.data);
                    },
                })
            },

            // 데이터를 통한 리스트 그리기
            makeTableRowData: function(excelData){
                var params = {
                    excelData   : JSON.stringify (excelData),
                    orderSeq    : me.orderSeq,
                    desiredYn   : me.desiredYn,
                    isComplete  : me.isComplete,
                    rows        : me.rows
                };

                $.ajax ({
                    url: WebTool.getUrl('/fo/multiAddress/multiAddrExelDataPage.doAjax'),
                    dataType: 'html',
                    type: 'post',
                    data:params,
                    global: false,
                    cache: false,
                    success: function(result, textStatus, jqXHR) {
                        if( textStatus == 'success' ) {
                            $('#tableBodyArea').html(result)
                            me.show()
                            me.setCheckData();
                            if('Y' === me.desiredYn) {
                                $('tr.jsonDataTrTag.use').each(function(idx) {
                                    me.checkDeliveryDate(idx);
                                })
                            }
                        }
                    },
                    fail: function(jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                });
            },

            //
            searchPost: function(setupZipCd, setupZipCd1, setupZipCd2, setupAddr1, setupRoadAddr1, setupAddrSelectedType, setupBuildingName, daumPostTr, daumPostBtn, index) {
                //주소 변경후 클래스나 텍스트 변경이 있을 데이터 세팅
                //주소 변경후 호출될 콜백 함수에서 쓴다 changeAddrComplete()
                var chageTagArea = {
                    addr1:setupAddr1,
                    daumPostTr: daumPostTr,
                    daumPostBtn: daumPostBtn
                }

                //전역변수에 세팅해서 콜백에서 사용
                me.changeTagStatusArea = chageTagArea;

                //daumPostcode.include show() 함수 참고
                DaumMgr.show({'type':'open','postcode':setupZipCd,'postcode1':setupZipCd1, 'postcode2':setupZipCd2, 'address1':setupAddr1, 'roadAddress':setupRoadAddr1, 'userSelectedType':setupAddrSelectedType, 'buildingName':setupBuildingName}, function() {me.changeAddrComplete(index)});
            },


            setDesignatedDayDeliveryInfo: function (button) {
                let parentAddressDiv = button.closest('tr');
                let addr1 = parentAddressDiv.querySelector('.addr1');
                let addr2 = parentAddressDiv.querySelector('.addr2');

                if(addr1.value === '' || addr2.value === ''){
                    alert('받는분의 배송지를 기입해 주세요.');
                    return;
                }

                $(button).datepicker({
                    language: 'kr',
                    dateFormat: 'yy-mm-dd',
                    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // Names of months for drop-down and formatting
                    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // For formatting
                    dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'], // For formatting
                    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'], // For formatting
                    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], // Column headings for days starting at Sunday
                    weekHeader: '주',
                    yearSuffix: '년',
                    showMonthAfterYear: true,
                    closeText: "닫기",
                    beforeShowDay: function() { return [false] },
                    beforeShow: function (input, inst) {
                        if (!$(inst.dpDiv).parent('.datepicker-wrapper').length) {
                            $(inst.dpDiv).wrap('<div class="datepicker-wrapper"></div>');

                        }
                        $(inst.dpDiv).parent('.datepicker-wrapper').insertAfter($(input));
                        $(inst.dpDiv).parent('.datepicker-wrapper').append('<p class="datepick-notice">예약 배송일은 희망 배송일자를 선택하는 것이며, 판매자 사정에 의해 실제 배송 날짜가 변경될 수 있습니다.</p>')
                    },
                    onSelect: function (dateText, inst) {
                        var selectInput = inst.input;
                        selectInput.val(dateText).css('color', '#333');
                        selectInput.addClass('select'); // 선택된 입력 필드에 select 클래스 추가
                        let td = selectInput.closest('td');
                        td.find('span').removeClass('error');
                        td.find('p').hide();
                        for(let i=0; i<me.enableDays.length; i++) {
                            let day = me.enableDays[i];
                            if(day === dateText) {
                                selectInput.closest('tr').find('.expectInbdDate').val(me.enableInbdDays[i])
                            }
                        }
                        me.setCheckData()
                    },
                    onClose: function (input, inst) {
                        $(inst.dpDiv).closest('.datepicker-wrapper').remove();
                    },
                });

                // 세팅된 정보에 API 적용
                me.enableDays = [];
                me.enableInbdDays = [];


                if (StringTool.isNotEmpty(addr1.value) && StringTool.isNotEmpty(addr2.value)) {
                    var params = {
                        addr1 : addr1.value,
                        addr2 : addr2.value,
                        callDay : 7,
                        productListJson: me.productListJson
                    };

                    FoTool.showLoading();

                    $.ajax({
                        url: WebTool.getUrl('/co/payment/designatedDayDeliveryInfo.json'),
                        dataType: 'json',
                        type: 'POST',
                        data: params,
                        global: false,
                        cache: false,
                        success: function (resultData, textStatus, jqXHR) {
                            if (ResultTool.isSuccess(resultData)) {
                                var data = ResultTool.getData(resultData);

                                //
                                if (data.preorderDeliveryList) {
                                    for (var i = 0, iLen = data.preorderDeliveryList.length; i < iLen; i++) {
                                        var item = data.preorderDeliveryList[i];

                                        me.enableDays[i]=item.deliveryDay;
                                        me.enableInbdDays[i]=item.inbdDay;
                                    }

                                    //beforeShowDay를 초기 datepicker option에 셋팅하면 initialize()보다 우선 실행하게 되어 명시적으로 해당 이벤트 핸들러를 여기에 셋팅한다.
                                    $(button).datepicker("option", {beforeShowDay: me.selectableDaysFunc});
                                    $(button).datepicker("option", new Date(me.enableDays.sort()[0]));
                                    $(button).datepicker("option", new Date(me.enableDays.sort()[data.preorderDeliveryList.length - 1]));

                                    // 데이터 정렬처리가 안됨으로 별도 처리 필요
                                    me.enableInbdDays.sort();

                                    // 기본 보기를 첫 번째 날짜가 포함된 월로 설정
                                    const defaultDate = new Date(me.enableDays[0]);
                                    $(button).datepicker("option", "defaultDate", defaultDate);
                                    $(button).datepicker('show'); // 달력 표시
                                }
                            }
                            FoTool.hideLoading();
                        }
                    });
                }
            },

            checkDeliveryDate: function(index) {
                let tr = $('tr.jsonDataTrTag').eq(index);
                let addr1 = tr.find('.addr1').val();
                let addr2 = tr.find('.addr2').val();
                let expectDeliveryDate = tr.find('.reservation-pick');
                let expectInbdDate = tr.find('.expectInbdDate');

                if(addr1 === '' || addr2 === '') {
                    me.setDeliveryDateError(expectDeliveryDate);
                    return;
                }
                if(!expectDeliveryDate.val()) {
                    return;
                }
                var params = {
                    addr1 : addr1,
                    addr2 : addr2,
                    productListJson : me.productListJson
                }
                FoTool.showLoading()
                $.ajax({
                    url: WebTool.getUrl('/co/payment/designatedDayDeliveryInfo.json'),
                    dataType: 'json',
                    type: 'POST',
                    data: params,
                    global: false,
                    cache: false,
                    success: function (result, textStatus, jqXHR) {
                        if (ResultTool.isSuccess(result)) {
                            let data = ResultTool.getData(result);
                            let dateList = data.preorderDeliveryList;
                            let isOk = false;
                            for(let date of dateList) {
                                if(expectDeliveryDate.val() == date.deliveryDay) {
                                    expectInbdDate.val(date.inbdDay);
                                    isOk = true;
                                    break;
                                }
                            }
                            if(!isOk) {
                                me.setDeliveryDateError(expectDeliveryDate);
                            }
                        }
                        FoTool.hideLoading();
                        me.setCheckData()
                    }
                });
            },
            setDeliveryDateError: function(input) {
                let td = $(input).closest('td');
                $(td).find('span.input-wrap').addClass('error');
                $(td).find('p.required').show();
                $(input).val('');
            },

            selectableDaysFunc : function (date) {
                const dummy = date.getFullYear() + "-" + (("00" + (date.getMonth() + 1).toString()).slice(-2)) + "-" + (("00" + date.getDate().toString()).slice(-2));
                for (var i=0; i<me.enableDays.length; i++){

                    if ($.inArray(dummy, me.enableDays) > -1) {
                        return [true];
                    }else{
                        return [false];
                    }
                }

            },

            tableToJson: function(){
                var myRows = [];
                var headers = $('#excelDataTable thead tr td');

                $('#excelDataTable tbody .jsonDataTrTag.use').each(function(index){
                    var rowObj = { };
                    var cells = $(this).find("td");
                    if(cells.find('span.error').length == 0) {
                        cells.each(function (cellIndex) {

                            var key = $(headers[cellIndex]).attr('key');

                            //json key값 동적으로 세팅
                            // rowObj[key]= $(cells[cellIndex]).data(key);
                            rowObj[key] = $(cells[cellIndex]).find('input').val();
                        })

                        myRows.push(rowObj);
                    }
                })

                var tableJsonList = {tableJsonList:myRows};

                return tableJsonList;
            },

            //
            addMultiAddrExcelData: function(){
                if(me.isComplete) {
                    me.hide();
                    return;
                }
                var validObj = me.excelDataCheck();

                if (validObj.success == false){
                    alert(validObj.message);
                    return;
                }

                let senderName = $('.senderName').val();
                if(!senderName) {
                    alert('보내는 분을 입력해 주세요.')
                    return;
                }
                if(!CheckTool.validationName(senderName)) {
                    alert("보내는 분은 한글/영문만 입력 가능합니다.");
                    return;
                }
                var tableJsonList =	 me.tableToJson();
                let useRows = me.rows || $('tr.jsonDataTrTag.use').length;
                let ableRows = tableJsonList.tableJsonList.length;
                if(ableRows === 0) {
                    alert('1명 이상의 배송지 정보를 입력해주세요.')
                    return;
                }
                if(Number(useRows) !== Number(ableRows)) {
                    alert('완료되지 않은 배송지가 있습니다.')
                    return;
                }

                if(0 === me.orderSeq) {
                    tableJsonList.senderName = senderName;
                    MainMgr.setMultiAddrInfo(tableJsonList);
                    $('.close_window').trigger('click');
                    me.hide();
                    return;
                }

                var params = {
                    tableJsonList   : JSON.stringify (tableJsonList),
                    orderSeq        : me.orderSeq,
                    desiredYn       : me.desiredYn,
                    senderNm        : senderName
                };

                FoTool.showLoading();
                $.ajax ({
                    url: WebTool.getUrl('/fo/multiAddress/addMultiAddrExelData.json'),
                    dataType: 'json',
                    type: 'post',
                    data:params,
                    global: false,
                    cache: false,
                    success: function(result, textStatus, jqXHR) {
                        if ( ResultTool.isSuccess(result) ) {
                            alert('배송지 등록 완료.');
                            WebTool.refresh();
                        } else {
                            alert(result.message);
                        }
                        FoTool.hideLoading();
                    },
                    fail: function(jqXHR, textStatus, errorThrown) {
                        console.log(textStatus);
                    }
                });
            },

            //
            excelDataCheck: function(){
                var resultObj = {};
                resultObj.success = true;
                resultObj.message ="체크완료";

                var jsonData =	me.tableToJson();

                for (var i = 0; i < jsonData.tableJsonList.length; i++) {
                    var addr1 = jsonData.tableJsonList[i].addr1;
                    var addrCheckBtn = jsonData.tableJsonList[i].addrCheckBtn;
                    var orderItemBoxSeq = jsonData.tableJsonList[i].orderItemBoxSeq;
                    var dateCheckBtn = jsonData.tableJsonList[i].dateCheckBtn;

                    //제주도 배송불가 상품인데 제주도 주소가 포함되어 있을때
                    if (me.impossibleJejuDelivery == 'Y'){
                        if (addr1.indexOf('제주') === 0){
                            resultObj.success = false;
                            resultObj.message = '제주도 배송 불가 상품입니다.\n제주 주소지를 제외해 주세요.';
                            resultObj.orderItemBoxSeq = orderItemBoxSeq;

                            break;
                        }
                    }

                    //주소지 체크가 필요한 데이터인데 수정하지 않았을떄
                    if (addrCheckBtn == 'N'){
                        resultObj.success = false;
                        resultObj.message = '주문번호:'+orderItemBoxSeq+'\n주소 체크를 해주세요.';
                        resultObj.orderItemBoxSeq = orderItemBoxSeq;

                        break;
                    }

                    if(dateCheckBtn == 'N') {
                        resultObj.success = false;
                        resultObj.message = '주문번호:'+orderItemBoxSeq+'\n배송희망일 체크를 해주세요.';
                        resultObj.orderItemBoxSeq = orderItemBoxSeq;

                        break;
                    }
                }

                return resultObj;
            },

            changeAddrComplete: function(index){
                let tr = $('tr.jsonDataTrTag').eq(index);
                let address = tr.find('td.adress');
                $(address).find('input').removeClass('input');
                $(address).find('input').attr('disabled', false);
                $(address).find('span.input-wrap').removeClass('error');
                $(address).find('p.required').hide();
                $(tr).find('.addr2').attr('disabled', false);
                if('Y' === me.desiredYn) {
                    me.checkDeliveryDate(index);
                }
            },
            nothing:null
        };

    })();
    $(function() { MultiAddrPopMgr.startup() });
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

    (function() {

        var me = window.DaumMgr = {


            startup: function()
            {
                me.setVariables();
                me.setEvents();
                me.initialize();
            },


            setVariables: function()
            {
                me.$layerFld		= $('#___postLayer');
            },


            setEvents: function()
            {
                me.$layerFld.find('IMG').click (function() {
                    me.hide();
                });
            },


            initialize: function()
            {
            },


            show: function (json, callback)
            {
                me.$layerFld.css ({
                    'width'	: '98%'
                    , 'height'	: '90%'
                });

                me.type				= json['type'];
                me.$postcodeFld		= (typeof (json['postcode']) == 'string') ? $('#' +json['postcode']) : json['postcode'];
                me.$postcode1Fld	= (typeof (json['postcode1']) == 'string') ? $('#' +json['postcode1']) : json['postcode1'];
                me.$postcode2Fld	= (typeof (json['postcode2']) == 'string') ? $('#' +json['postcode2']) : json['postcode2'];
                me.$address1Fld		= (typeof (json['address1']) == 'string') ? $('#' +json['address1']) : json['address1'];
                me.$address2Fld		= (typeof (json['address2']) == 'string') ? $('#' +json['address2']) : json['address2'];
                me.$roadAddressFld	= (typeof (json['roadAddress']) == 'string') ? $('#' +json['roadAddress']) : json['roadAddress'];
                me.$userSelectedTypeFld = (typeof (json['userSelectedType']) == 'string') ? $('#' +json['userSelectedType']) : json['userSelectedType'];
                me.$buildingNameFld = (typeof (json['buildingName']) == 'string') ? $('#' +json['buildingName']) : json['buildingName'];
                me.$viewAddrFld 	= (typeof (json['viewAddr']) == 'string') ? $('#' +json['viewAddr']) : json['viewAddr'];

                var daumPostcode = new daum.Postcode ({
                    oncomplete: function (data) {
                        $('.hidden-area').show(); //회원가입 - 주소검색

                        if(typeof me.$postcodeFld !== "undefined"){

                            if ($(me.$postcodeFld).prop('tagName') == 'TD'){
                                me.$postcodeFld.html (data.zonecode);
                                me.$postcodeFld.data('zipCd',data.zonecode);
                            }else if($(me.$postcodeFld).prop('tagName') == 'SPAN' && $(me.$postcodeFld).attr('data-zip-cd') == 'zipCd'){ //회원가입 - 주소검색
                                me.$postcodeFld.html (data.zonecode);
                                me.$postcodeFld.val (data.zonecode);
                                me.$postcodeFld.prev('input[name="zipCd"]').val(data.zonecode);
                                me.$postcodeFld.prev('input[type="text"]').removeAttr('readonly');
                            }else {
                                me.$postcodeFld.val (data.zonecode);
                            }

                        }


                        if(typeof me.$postcode1Fld !== "undefined" && typeof me.$postcode2Fld !== "undefined") {
                            if (data.postcode1 == '')
                            {

                                if ($(me.$postcode1Fld).prop('tagName') == 'TD'){
                                    me.$postcode1Fld.html (data.zonecode.substring(0,3));
                                    me.$postcode1Fld.data('zipCd1',data.zonecode.substring(0,3));
                                }
                                else {
                                    me.$postcode1Fld.val (data.zonecode.substring(0,3));
                                }

                                if ($(me.$postcode2Fld).prop('tagName') == 'TD'){
                                    me.$postcode2Fld.html (data.zonecode.substring(3,5));
                                    me.$postcode2Fld.data('zipCd2',data.zonecode.substring(3,5));
                                }
                                else {
                                    me.$postcode2Fld.val (data.zonecode.substring(3,5));
                                }

                            }
                            else
                            {

                                if ($(me.$postcode1Fld).prop('tagName') == 'TD'){
                                    me.$postcode1Fld.html (data.postcode1);
                                    me.$postcode1Fld.data('zipCd1',data.postcode1);
                                }
                                else {
                                    me.$postcode1Fld.val (data.postcode1);
                                }

                                if ($(me.$postcode2Fld).prop('tagName') == 'TD'){
                                    me.$postcode2Fld.html (data.postcode1);
                                    me.$postcode2Fld.data('zipCd2',data.postcode2);
                                }
                                else {
                                    me.$postcode2Fld.val (data.postcode2);
                                }
                            }
                        }

                        if (data.jibunAddress == null || data.jibunAddress == '')
                        {
                            if ($(me.$address1Fld).prop('tagName') == 'TD'){
                                me.$address1Fld.html (data.autoJibunAddress);
                                me.$address1Fld.data('addr1',data.autoJibunAddress);
                            }
                            else {
                                me.$address1Fld.val (data.autoJibunAddress).change();
                            }
                        }
                        else
                        {
                            if ($(me.$address1Fld).prop('tagName') == 'TD'){
                                me.$address1Fld.html (data.jibunAddress);
                                me.$address1Fld.data('addr1',data.jibunAddress);
                            }
                            else {
                                me.$address1Fld.val (data.jibunAddress).change();
                            }

                        }

                        /*도로명*/
                        if (data.roadAddress == null || data.roadAddress =='') {
                            if (typeof me.$roadAddressFld !== "undefined") {
                                if ($(me.$address1Fld).prop('tagName') == 'TD') {
                                    me.$roadAddressFld.html(data.autoRoadAddress);
                                    me.$roadAddressFld.data('roadAddr1', data.autoRoadAddress);
                                } else {
                                    me.$roadAddressFld.val(data.autoRoadAddress).change();
                                }
                            }
                        }
                        else
                        {
                            if (typeof me.$roadAddressFld !== "undefined") {
                                if ($(me.$address1Fld).prop('tagName') == 'TD') {
                                    me.$roadAddressFld.html(data.roadAddress);
                                    me.$roadAddressFld.data('roadAddr1', data.roadAddress);
                                } else {
                                    me.$roadAddressFld.val(data.roadAddress).change();
                                }
                            }
                        }

                        /*건물명*/
                        if(typeof me.$buildingNameFld !== "undefined") {
                            if ($(me.$address1Fld).prop('tagName') == 'TD'){
                                me.$buildingNameFld.html (data.buildingName);
                                me.$buildingNameFld.data('buildingName',data.buildingName);
                            } else {
                                me.$buildingNameFld.val (data.buildingName).change();
                            }
                        }

                        /*선택한 주소 유형*/
                        if(typeof me.$userSelectedTypeFld !== "undefined") {
                            if ($(me.$address1Fld).prop('tagName') == 'TD'){
                                me.$userSelectedTypeFld.html (data.userSelectedType);
                                me.$userSelectedTypeFld.data('addrSelectedType',data.userSelectedType);
                            } else {
                                me.$userSelectedTypeFld.val (data.userSelectedType).change();
                            }
                        }

                        /*화면에 보여지는 주소*/
                        if(typeof me.$viewAddrFld !== "undefined"){
                            var viewAddrTxt = WebTool.getDisplayAddress(me.$roadAddressFld.val(), me.$address1Fld.val(), '', me.$buildingNameFld.val());
                            if ($(me.$address1Fld).prop('tagName') == 'TD'){
                                me.$viewAddrFld.html (viewAddrTxt);
                                me.$viewAddrFld.data('viewAddr',viewAddrTxt);
                            } else {
                                me.$viewAddrFld.val (viewAddrTxt).change();
                            }
                        }

                        if( me.$address2Fld )
                        {
                            me.$address2Fld.val('');
                            me.$address2Fld.focus();
                        }

                        if (typeof(callback) === 'function') {
                            callback();
                        }
                    },
                    width : '100%',
                    height : '100%',
                    onclose: function() {
                        me.hide();
                    }
                });

                if (me.type == 'open')
                {
                    daumPostcode.open();
                }
                else	// @TODO
                {
                    daumPostcode.embed (me.$layerFld[0], {
                        'autoClose': true
                    });
                    me.$layerFld.show();
                }
            },

            hide: function()
            {
                me.$layerFld.hide();
            },


            convertData: function(data) {
                /* 우편번호 */
                var zipCd = data.zonecode;

                var zipCd1;
                var zipCd2;
                if (data.postcode1 == '') {
                    zipCd1 = data.zonecode.substring(0,3)
                    zipCd2 = data.zonecode.substring(3,5)
                } else {
                    zipCd1 = data.postcode1;
                    zipCd2 = data.postcode2;
                }

                /* 지번주소 */
                var jibunAddress;
                if (data.jibunAddress == null || data.jibunAddress == '') {
                    jibunAddress = data.autoJibunAddress;
                } else {
                    jibunAddress = data.jibunAddress;
                }

                /* 도로명 */
                var roadAddress;
                if (data.roadAddress == null || data.roadAddress =='') {
                    roadAddress = data.autoRoadAddress
                } else {
                    roadAddress = data.roadAddress;
                }

                /*건물명*/
                var buildingName = data.buildingName;

                /*선택한 주소 유형*/
                var userSelectedType = data.userSelectedType;

                var viewAddrText = WebTool.getDisplayAddress(roadAddress, jibunAddress, '', buildingName);

                return {
                    zipCd: zipCd,
                    zipCd1: zipCd1,
                    zipCd2: zipCd2,
                    jibunAddress: jibunAddress,
                    roadAddress: roadAddress,
                    buildingName: buildingName,
                    userSelectedType: userSelectedType,
                    viewAddrText: viewAddrText
                };
            },

            nothing:null
        };

    })();


    $(function() {
        DaumMgr.startup();
    });
</script>

<div id="___postLayer" style="display:none;border:5px solid;position:fixed;left:1%;margin-left:0;top:50px;margin-top:0;-webkit-overflow-scrolling:touch;z-index:19999;background-color:#FFFFFF;">
    <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" style="width:30px;height:30px;z-index:9999;cursor:pointer;position:absolute;right:-5px;top:-35px" alt="닫기 버튼">
</div>
<!-- 다중배송지_엑셀업로드 s-->
<div class="pop_comm multi-excel-pop excel_upload_pop edit">
    <div class="pop-tit">
        <h5>다중 배송지 등록/수정
            <button type="button" class="tooltip_btn reverse"></button>
            <div class="tooltip_box" id="popupToolTip">
                <button type="button" class="close"></button>
                <div class="cont">
                    <ul>
                        <li>배송 정보는 직접 입력 또는 작성한 엑셀 업로드 두 가지의 방법을 선택하여 가능합니다.</li>
                        <li>배송지 등록 완료에 따라 순차 배송 될 예정이며, 각 상품들은 동일한 일정에 배송되지 않을 수 있습니다.</li>
                        <li>배송지 입력에 오류가 있는 경우 미트박스 고객센터(1644-6689)로 연락 주시면 안내해 드리겠습니다.</li>
                        <li>다중 배송지는 100명까지만 등록이 가능하며, 초과 등록은 상품 재 구매 또는 미트박스 고객센터(1644-6689)로 연락주시면 대신 등록해 드리겠습니다.</li>
                        <li><b>명절(설날/추석) 한정 판매 상품의 경우</b> 연휴 전 배송 마감 기한이 지나 배송지를 입력한 경우 휴무일 이전 배송이 불가할 수 있습니다.<br>(상품별 배송 마감 일정을 확인해 주세요.)</li>
                    </ul>
                </div>
            </div>
        </h5>
        <button type="button" class="btn-hide b-close" >닫기</button>
    </div>
    <div class="flat_content">
        <div class="multi-adress-area">
            <div class="multi-adress-info">
                <strong class="sub-tit">등록정보</strong>
                <table>
                    <colgroup>
                        <col width="192px">
                        <col width="*">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td>상품 정보</td>
                        <td class="prdct-info">
                            <b></b>
                            <p>
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>보내는 분 <em>(필수)</em></td>
                        <td>
							<span class="isEdit">
								<span class="input-wrap error">
									<input type="text" name="multi-send-input" class="send senderName" placeholder="보내는 분">
									<span class="txt-length"><em>0</em>/30</span>
								</span>
								<p class="required">보내는 분 입력</p>
							</span>
                            <span class="isComplete">
								<p class="senderName"></p>
							</span>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <ul>
					<span class="isEdit">
						<li>- ‘보내는 분’을 입력하고 배송 정보 직접 입력 또는 엑셀 양식을 다운로드 받고 받는 분을 업로드해 주세요.</li>
					</span>
                    <span class="isComplete">
						<li>- 배송이 시작되어 등록 정보만 확인 가능하며, 추가 등록 및 수정이 불가능합니다.</li>
					</span>
                    <li>- 다중 배송지 등록이 어려우신가요? <b>미트박스 고객센터(1644-6689)로 연락 주시면 대신 등록해 드리겠습니다.</b></li>
                </ul>
            </div>
            <div class="multi-adress-list">
                <div class="list-top">
                    <span class="sub-tit">총&nbsp;<b>0</b>&nbsp;건</span>
                    <div class="download-btn isEdit">
                        <button type="button" class="download" onclick="MultiAddrPopMgr.downloadMultiAddressExcel();">엑셀 양식 다운로드</button>

                        <div class="filebox">
                            <label for="multiAddrExcelInput" class="excel_btn up_load">작성한 양식 업로드</label>
                            <input type="file"  id="multiAddrExcelInput" onchange="MultiAddrPopMgr.uploadMultiAddrExcel(); this.value=null; return false;"/>
                        </div>
                    </div>
                </div>
                <table id="excelDataTable">
                    <colgroup>
                        <col width="60px">
                        <col width="100px">
                        <col width="130px">
                        <col width="326px">
                        <col width="*px">
                    </colgroup>
                    <thead>
                    <tr>
                        <td key="num">번호</td>
                        <td key="recvNm">받는분</td>
                        <td key="recvCellNo">연락처</td>
                        <td key="addr1" >주소</td>
                        <td key="addr2">상세 주소</td>
                    </tr>
                    </thead>
                    <!-- 항상 12개 셀 보이기 -->
                    <tbody id="tableBodyArea">
                    <tr class="jsonDataTrTag">
                        <td>1</td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="recvNm" placeholder="받는 분" data-recv-nm="" value="" required />
									</span>
                            <p class="required">받는 분 입력</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="ph-num" placeholder="휴대폰 번호" data-recv-cell-no="" value="" required />
									</span>
                            <p class="required">받는 분 연락처 입력</p>
                        </td>
                        <td class="adress">
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr1" data-addr1="" id="setupAddr1_1" value="" readonly required />
									</span>
                            <button type="button" class="adress"  id="daumPostBtn_1">주소검색</button>
                            <p class="required">주소 수정 필요</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr2" data-addr2="" id="setupAddr2_1" placeholder="상세주소" value="" required />
									</span>
                            <p class="required">상세주소 입력</p>
                        </td>
                    </tr>
                    <tr class="jsonDataTrTag">
                        <td>2</td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="recvNm" placeholder="받는 분" data-recv-nm="" value="" required />
									</span>
                            <p class="required">받는 분 입력</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="ph-num" placeholder="휴대폰 번호" data-recv-cell-no="" value="" required />
									</span>
                            <p class="required">받는 분 연락처 입력</p>
                        </td>
                        <td class="adress">
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr1" data-addr1="" id="setupAddr1_2" value="" readonly required />
									</span>
                            <button type="button" class="adress"  id="daumPostBtn_2">주소검색</button>
                            <p class="required">주소 수정 필요</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr2" data-addr2="" id="setupAddr2_2" placeholder="상세주소" value="" required />
									</span>
                            <p class="required">상세주소 입력</p>
                        </td>
                    </tr>
                    <tr class="jsonDataTrTag">
                        <td>3</td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="recvNm" placeholder="받는 분" data-recv-nm="" value="" required />
									</span>
                            <p class="required">받는 분 입력</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="ph-num" placeholder="휴대폰 번호" data-recv-cell-no="" value="" required />
									</span>
                            <p class="required">받는 분 연락처 입력</p>
                        </td>
                        <td class="adress">
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr1" data-addr1="" id="setupAddr1_3" value="" readonly required />
									</span>
                            <button type="button" class="adress"  id="daumPostBtn_3">주소검색</button>
                            <p class="required">주소 수정 필요</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr2" data-addr2="" id="setupAddr2_3" placeholder="상세주소" value="" required />
									</span>
                            <p class="required">상세주소 입력</p>
                        </td>
                    </tr>
                    <tr class="jsonDataTrTag">
                        <td>4</td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="recvNm" placeholder="받는 분" data-recv-nm="" value="" required />
									</span>
                            <p class="required">받는 분 입력</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="ph-num" placeholder="휴대폰 번호" data-recv-cell-no="" value="" required />
									</span>
                            <p class="required">받는 분 연락처 입력</p>
                        </td>
                        <td class="adress">
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr1" data-addr1="" id="setupAddr1_4" value="" readonly required />
									</span>
                            <button type="button" class="adress"  id="daumPostBtn_4">주소검색</button>
                            <p class="required">주소 수정 필요</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr2" data-addr2="" id="setupAddr2_4" placeholder="상세주소" value="" required />
									</span>
                            <p class="required">상세주소 입력</p>
                        </td>
                    </tr>
                    <tr class="jsonDataTrTag">
                        <td>5</td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="recvNm" placeholder="받는 분" data-recv-nm="" value="" required />
									</span>
                            <p class="required">받는 분 입력</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="ph-num" placeholder="휴대폰 번호" data-recv-cell-no="" value="" required />
									</span>
                            <p class="required">받는 분 연락처 입력</p>
                        </td>
                        <td class="adress">
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr1" data-addr1="" id="setupAddr1_5" value="" readonly required />
									</span>
                            <button type="button" class="adress"  id="daumPostBtn_5">주소검색</button>
                            <p class="required">주소 수정 필요</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr2" data-addr2="" id="setupAddr2_5" placeholder="상세주소" value="" required />
									</span>
                            <p class="required">상세주소 입력</p>
                        </td>
                    </tr>
                    <tr class="jsonDataTrTag">
                        <td>6</td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="recvNm" placeholder="받는 분" data-recv-nm="" value="" required />
									</span>
                            <p class="required">받는 분 입력</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="ph-num" placeholder="휴대폰 번호" data-recv-cell-no="" value="" required />
									</span>
                            <p class="required">받는 분 연락처 입력</p>
                        </td>
                        <td class="adress">
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr1" data-addr1="" id="setupAddr1_6" value="" readonly required />
									</span>
                            <button type="button" class="adress"  id="daumPostBtn_6">주소검색</button>
                            <p class="required">주소 수정 필요</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr2" data-addr2="" id="setupAddr2_6" placeholder="상세주소" value="" required />
									</span>
                            <p class="required">상세주소 입력</p>
                        </td>
                    </tr>
                    <tr class="jsonDataTrTag">
                        <td>7</td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="recvNm" placeholder="받는 분" data-recv-nm="" value="" required />
									</span>
                            <p class="required">받는 분 입력</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="ph-num" placeholder="휴대폰 번호" data-recv-cell-no="" value="" required />
									</span>
                            <p class="required">받는 분 연락처 입력</p>
                        </td>
                        <td class="adress">
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr1" data-addr1="" id="setupAddr1_7" value="" readonly required />
									</span>
                            <button type="button" class="adress"  id="daumPostBtn_7">주소검색</button>
                            <p class="required">주소 수정 필요</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr2" data-addr2="" id="setupAddr2_7" placeholder="상세주소" value="" required />
									</span>
                            <p class="required">상세주소 입력</p>
                        </td>
                    </tr>
                    <tr class="jsonDataTrTag">
                        <td>8</td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="recvNm" placeholder="받는 분" data-recv-nm="" value="" required />
									</span>
                            <p class="required">받는 분 입력</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="ph-num" placeholder="휴대폰 번호" data-recv-cell-no="" value="" required />
									</span>
                            <p class="required">받는 분 연락처 입력</p>
                        </td>
                        <td class="adress">
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr1" data-addr1="" id="setupAddr1_8" value="" readonly required />
									</span>
                            <button type="button" class="adress"  id="daumPostBtn_8">주소검색</button>
                            <p class="required">주소 수정 필요</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr2" data-addr2="" id="setupAddr2_8" placeholder="상세주소" value="" required />
									</span>
                            <p class="required">상세주소 입력</p>
                        </td>
                    </tr>
                    <tr class="jsonDataTrTag">
                        <td>9</td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="recvNm" placeholder="받는 분" data-recv-nm="" value="" required />
									</span>
                            <p class="required">받는 분 입력</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="ph-num" placeholder="휴대폰 번호" data-recv-cell-no="" value="" required />
									</span>
                            <p class="required">받는 분 연락처 입력</p>
                        </td>
                        <td class="adress">
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr1" data-addr1="" id="setupAddr1_9" value="" readonly required />
									</span>
                            <button type="button" class="adress"  id="daumPostBtn_9">주소검색</button>
                            <p class="required">주소 수정 필요</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr2" data-addr2="" id="setupAddr2_9" placeholder="상세주소" value="" required />
									</span>
                            <p class="required">상세주소 입력</p>
                        </td>
                    </tr>
                    <tr class="jsonDataTrTag">
                        <td>10</td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="recvNm" placeholder="받는 분" data-recv-nm="" value="" required />
									</span>
                            <p class="required">받는 분 입력</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="ph-num" placeholder="휴대폰 번호" data-recv-cell-no="" value="" required />
									</span>
                            <p class="required">받는 분 연락처 입력</p>
                        </td>
                        <td class="adress">
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr1" data-addr1="" id="setupAddr1_10" value="" readonly required />
									</span>
                            <button type="button" class="adress"  id="daumPostBtn_10">주소검색</button>
                            <p class="required">주소 수정 필요</p>
                        </td>
                        <td>
									<span class="input-wrap">
										<input type="text" name="multi-adress-input" class="addr2" data-addr2="" id="setupAddr2_10" placeholder="상세주소" value="" required />
									</span>
                            <p class="required">상세주소 입력</p>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="one_btn">
            <a href="javascript:;" id="one_btns" class="bg_red" onclick="MultiAddrPopMgr.addMultiAddrExcelData();">완료</a>
        </div>
    </div>
</div>
<!-- 다중배송지_엑셀업로드 e-->

<!-- 다중 배송지 내 datepick 팝업 s -->
<div class="pop_comm excel-datepick-pop">
    <div class="popup_content">
        <h5>배송희망일을 선택 해주세요.</h5>
        <button type="button" class="close">닫기</button>
        <div class="date_pick">
            <input type="text" id="deliveryDay" class="select_date" name="" value="------------" readonly>
            <div class="datepicker_area"></div><!-- **하단 22.12.07 스크립트 참조** -->
        </div>
        <button type="button" class="confirm">확인</button>
        <ul>
            <li>택배사 사정에 따라 배송완료일이 변경될 수 있습니다.</li>
            <li>상품 구매 개수와 상관없이 날짜 선택은 하루만 가능합니다.</li>
        </ul>
    </div>
</div>
<!-- 다중 배송지 내 datepick 팝업 e -->

<!-- 여러 배송지 입력 팝업 내 배송 불가 지역 케이스가 있는 경우 팝업  -->
<div class="pop_comm upload-disabled-pop">
    <h5><span>알림</span><button type="button" class="close">닫기</button></h5>
    <div class="popup_content">
        <img src="/img/fo/ico/ico_alert.png" alt="">
        <div class="txt-area">
            <p>고객님 죄송합니다.</p>
            <p>현재 프로모션 기간에 배송 진행이 불가능한 주문이 포함되어 있어<br><span>(빨간 음영표시 영역)</span><br>여러 배송지 입력 및 진행이 불가능합니다.</p>
            <p>번거로우시겠지만, 고객님께서는<br>아래 전체 취소하기 후 재주문 부탁드립니다.</p>
        </div>
        <div class="btn-wrap">
            <button type="button" class="close">전체 취소하기</button>
            <button type="button" class="close">확인</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    (function() {
        var me = window.BottomMgr = {
            startup: function() {
                me.setVariables();
                me.setEvents();
                me.initialize();
            },

            setVariables: function() {
                me.$btnCloseJoinBanner		= $('#btnCloseJoinBanner');
            },

            setEvents: function() {
                $(window).scroll(function() {
                    if ($.cookie(Const.COOKIE_FO_JOIN_BANNER) == undefined) {
                        if ( $( this ).scrollTop() > 0) {
                            $('.right_floating').fadeIn(400);
                        } else {
                            $('.right_floating').fadeOut(400);
                        }
                    }
                });

                me.$btnCloseJoinBanner.on('click', function() {
                    me.closeJoinBanner($(this));
                });
            },

            initialize: function() {
                console.log('%c    RELEASE', 'font-size: 100px; background: url(https://www.meatbox.co.kr/img/fo/main/footer_logo.png) no-repeat;');
                console.log('%c친절상담 1644-6689', 'font-size: 28px;');


                if ($.cookie(Const.COOKIE_FO_JOIN_BANNER) != undefined) {
                    $('.right_floating').css({'display': 'none'});
                }
                WebTool.channelTokBoot(457296,
                    "9282e174-2cb7-430c-ba62-c3c92c0100e0"
                );
                me.getBoardList();
            },

            closeJoinBanner: function() {
                var currentDate = new Date();
                var expirationDate = new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate() + 1, 0, 0, 0);


                $.cookie(Const.COOKIE_FO_JOIN_BANNER, 'N', {
                    'path': '/',
                    'domain': 'meatbox.co.kr',
                    'expires' : expirationDate
                });

                $('.right_floating').css({'display': 'none'});
            },
            //
            clickIdeaFloatingBox: function() {

                if('true' =='false'){
                    alert('로그인이 필요한 서비스 입니다.');
                    FoTool.goLoginPage('/fo/myMenu/vocPage.do');
                }
                else{
                    WebTool.go('/fo/myMenu/vocPage.do?isFromBundleProductListPage=Y');
                }

            },

            getBoardList: function() {

                const getboardSuccessCallback = (result) => {
                    if (result.resultCode !== '0000') {
                        $(".notice-news-area").hide();
                    }

                    const noticeList = result.data.notices;
                    if (noticeList !== undefined && noticeList.length > 0) {
                        const noticeDate = moment(noticeList[0].modDate ?? noticeList[0].regDate).format('YYYY-MM-DD');
                        $('#noticeList').text(noticeList[0].subject);
                        $('#noticeDate').text(noticeDate);
                        $('#noticeItem').on('click',function(){
                            FoTool.goNewBoardViewPage('O001', noticeList[0].boardSeq);
                        });

                        if(me.diffDate(noticeDate)){
                            $('#noticeClass').addClass('icon-dotted');
                        }
                    } else {
                        $("#noticeItem").hide();
                    }

                    const newsList = result.data.news;
                    if (newsList !== undefined && newsList.length > 0) {
                        const newsDate = moment(newsList[0].modDate ?? newsList[0].regDate).format('YYYY-MM-DD');
                        $('#newsList').text(newsList[0].subject);
                        $('#newsDate').text(newsDate);
                        $('#newsItem').attr('href',  newsList[0].linkUrl);
                        if(me.diffDate(newsDate)){
                            $('#newsClass').addClass('icon-dotted');
                        }
                    } else {
                        $("#newsItem").hide();
                    }
                };

                const errorCallback = (jqXHR, textStatus, errorThrown) => {
                    $(".notice-news-area").hide();
                };

                FoTool.fetchApiAjaxResult({
                    url: 'https://mb-api.meatbox.co.kr/platform/api/v1/boards',
                    method: 'GET',
                    successCallback: getboardSuccessCallback,
                    errorCallback: errorCallback
                });
            },
            /* 날짜 비교 */
            diffDate: function(date){
                const [year, month, day] = date.split('-').map(Number);
                const newDate = new Date(year, month - 1, day);

                const diff = Date.now() - newDate.getTime();
                const days = diff / (1000 * 60 * 60 * 24);
                const daysOnly = Math.floor(days);
                return daysOnly <= 14
            },

            nothing: null
        }
    })();

    $(function() {
        BottomMgr.startup();
    });
</script>

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
</body>
</html>
