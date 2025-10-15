<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>미트박스 :: 1등 고기 직거래</title>
<meta property="og:image"            content="https://www.meatbox.co.kr/img/co/meatboxOgImage.png"   />
   <meta http-equiv="Content-Type"      content="text/html; charset=UTF-8" />
<meta http-equiv="Cache-Control"   content="no-cache" />
<meta http-equiv="Pragma"         content="no-cache" />
<meta http-equiv="X-UA-Compatible"   content="IE=edge" />
<meta name="description"         content="육류 4,500 + 식재료 2,000개! 미트박스와 최대 30% 원가절감 해볼까요?" />
<meta name="facebook-domain-verification" content="p46h98ig4xxu7rwip506zt00a2kypb" />

<!--[if IE]><html class="comm_ie"><![endif]-->

<link rel="shortcut icon"   href="https://static-cdn.meatbox.co.kr/img/fo/favicon.ico?t=20240409" type="image/x-icon" />
<link rel="icon"         href="https://static-cdn.meatbox.co.kr/img/fo/favicon.ico?t=20240409" type="image/x-icon" />
<link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/font/spoqaHanSans.min.css" type="text/css" media="all" charset="UTF-8" />
<link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/font/notoSanskr.min.css" type="text/css" media="all" charset="UTF-8" />
<link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/font/pretendard.css" type="text/css" media="all" charset="UTF-8" />
<link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/common.min.css?20251015144311960" type="text/css" media="all" charset="UTF-8" />
<link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/style.min.css?20251015144311960" type="text/css" media="all" charset="UTF-8" />
<link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/renew.min.css?20251015144311960" type="text/css" media="all" charset="UTF-8" />
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
<script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/constant/Const.min.js?ver=20251015144311960"></script>
<script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/constant/Operation.min.js?ver=20251015144311960"></script>
<script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/tool/CommonTools.min.js?ver=20251015144311960"></script>
<script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/tool/ProductTool.min.js?ver=20251015144311960"></script>
<script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/tool/FoTool.min.js?ver=20251015144311960"></script>
<script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/swiper/5.2.1/swiper-7.4.1.min.js" charset="UTF-8"></script>
<script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script><!-- gnb 로띠 -->

<script type="text/javascript">
var _LOGINED_         = true;
var _LOCATION_         = 'RELEASE';
var _IS_PRODUCTION_      = 'true' === 'true';
var _SITE_TYPE_         = 'FO';

var _MEMBER_ROLE_      = 'B004';
var _MEMBER_DIVISION_ = 'HD10';

var memberKindListStr = '[MJ02]';

var memberKindList =[];

if (memberKindListStr ){
   var memberKindStr = memberKindListStr.replace('[','').replace(']','');
   memberKindStr = memberKindStr.replace(/ /gi,'');
   memberKindList =   memberKindStr.split(',');
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
<script src="https://static-cdn.meatbox.co.kr/js/tool/MemberTools.min.js?ver=20251015144311960"></script>

<script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/tool/ThumbnailTool.min.js?ver=1760516172410"></script>

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
            <li>- 이번 달 송지섭님의 구매금액 <strong id="popupMyPurchasedAmount"></