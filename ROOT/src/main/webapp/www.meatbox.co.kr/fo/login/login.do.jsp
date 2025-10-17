<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="/include/header.jsp" %>

<script type="text/javascript">

    (function() {
        var me = window.MainMgr = {

            saveCookieName:	'savedId20190409',
            autoCookieName: Const.COOKIE_AUTO_LOGIN,

            startup: function()
            {
                me.setVariables();
                me.setEvents();
                me.initialize();
            },

            setVariables: function()
            {
                me.expireSeconds	= 86400 * 365 * 5;	//

                me.$memberIdFld		= $('#memberId');
                me.$passwdFld		= $('#passwd');
                me.$savingYnFld		= $('input[name="savingYn"]');
                me.$autoLoginYnFld	= $('input[name="autoLoginYn"]');

                me.$loginComment	= $('#loginComment');

                me.memberIdError	= '아이디를 입력해 주세요.';
                me.passwdError		= '비밀번호를 입력해 주세요.';

                me.siteCd			= '';
                me.siteId			= '';
                me.snsLinkYn		= '';
                me.memberId			= '';

                me.redirectUrl		= '/fo/myMenu/myMenuMainPage.do';
            },

            setEvents: function()
            {
                //비밀번호 show/hide 동작
                $('.pw-show').click(function() {
                    if($(this).siblings('input').attr('type') == 'password') {
                        $(this).addClass('show').siblings('input').attr('type', 'text');
                    } else {
                        $(this).removeClass('show').siblings('input').attr('type', 'password');
                    }
                });

                me.$memberIdFld.on('blur', function() {
                    me.memberIdError = me.checkIdFormat($(this));
                });

                me.$passwdFld.on('blur', function() {
                    me.passwdError = me.checkPasswdFormat($(this));
                });

                me.$savingYnFld.on('click', function() {
                    if($(this).is(':checked')) {
                        $(this).parent().addClass( 'selected');
                    } else {
                        $(this).parent().removeClass( 'selected');
                    }
                });

                me.$autoLoginYnFld.on('click', function() {
                    if($(this).is(':checked')) {
                        $(this).parent().addClass( 'selected');
                    } else {
                        $(this).parent().removeClass( 'selected');
                    }
                });

                me.$memberIdFld.keyup (function (evt) {
                    if (evt.keyCode == Const.ENTER && $.trim(me.$memberIdFld.val()).length > 0)
                    {
                        evt.preventDefault();
                        me.$passwdFld.focus();
                    }
                });

                me.$passwdFld.keyup (function (evt) {
                    if (evt.keyCode == Const.ENTER && $.trim(me.$passwdFld.val()).length > 0)
                    {
                        evt.preventDefault();
                        me.prepareLogin();
                    }
                });
                $(window).on('load', function() {
                    var observer = new MutationObserver(function (mutations) {
                        mutations.forEach(function (mutation) {
                            if (mutation.type === 'attributes' && mutation.attributeName === 'value') {
                                me.$passwdFld.focus();
                                me.$memberIdFld.focus();
                            }
                        });
                    });
                });
            },

            initialize: function()
            {


                //memberExistPage.jsp에서 이미 있는 아이디로 로그인 하려고 넘어 온 경우
                if(me.memberId.length > 0){
                    me.$memberIdFld.val(me.memberId);
                }else {
                    me.$memberIdFld.val('');
                }
                me.$passwdFld.val('');

                me.$loginComment.hide();

                var savedId	= $.cookie (me.saveCookieName);
                if (StringTool.isNotBlank (savedId) && me.memberId == '') // me.memberId == '' : memberExistPage.jsp에서 이미 있는 아이디로 로그인 하려고 넘어온게 아닌 경우
                {
                    me.$memberIdFld.val (savedId).change();
                    me.$savingYnFld.attr ('checked', true); //아이디 저장
                    me.$savingYnFld.parent().addClass('selected'); //아이디 저장
                    me.$passwdFld.focus();
                    me.memberIdError = null;
                }
                else
                {
                    me.$memberIdFld.focus();
                }
                //
                var autoLogin = $.cookie(me.autoCookieName);
                if(autoLogin == 'Y' || autoLogin === undefined) {
                    me.$autoLoginYnFld.click();
                }
            },

            /**
             * 아이디 체크
             */
            checkIdFormat: function ($input)
            {
                var memberIdError = null;
                var inputStr = $.trim($input.val());

                if (inputStr.length == 0)
                {
                    memberIdError = '아이디를 입력해 주세요.';
                }
                else
                {
                    memberIdError = null;
                }

                return memberIdError;
            },

            /*
             * 비밀번호 체크
             */
            checkPasswdFormat: function ($input)
            {
                var error;
                var passwdStr = $.trim($input.val());

                if (passwdStr.length == 0)
                {
                    error = '비밀번호를 입력해 주세요.';
                }
                else
                {
                    error = null;
                }
                return error;
            },

            //
            prepareLogin: function() {
			    var memberId = $.trim(me.$memberIdFld.val());
			    var passwd   = $.trim(me.$passwdFld.val());

			    // 입력값 검증
			    me.memberIdError = me.checkIdFormat(me.$memberIdFld);
			    me.passwdError   = me.checkPasswdFormat(me.$passwdFld);

			    if (me.memberIdError != null) {
			        alert(me.memberIdError);
			        me.$memberIdFld.focus();
			        return;
			    }

			    if (me.passwdError != null) {
			        alert(me.passwdError);
			        me.$passwdFld.focus();
			        return;
			    }

			    // 아이디와 비밀번호만 전송
			    var params = {
			        'memberId': memberId,
			        'passwd': passwd
			    };

			    // 서버 요청 (URL은 상황에 맞게 수정 가능)
			    me.login('/loginAction.do', params);
			},

            //
		        login: function(url, params) {
		    $.ajax({
		        url: WebTool.getUrl(url),   // 로그인 API 주소
		        type: 'POST',
		        dataType: 'json',
		        data: params,
		        success: function(result) {
		            // 로그인 성공 여부 확인
		            if (result && result.success === true) {
				    alert("✅ 로그인 성공!");
				    console.log("로그인 성공:", result);
				    location.href = result.redirectUrl; // 서버가 보내준 URL로 이동
				} else {
		                alert("❌ 로그인 실패. 아이디나 비밀번호를 확인하세요.");
		                console.log("로그인 실패:", result);
		            }
		        },
		        error: function(xhr, status, error) {
		            alert("⚠️ 서버 통신 오류가 발생했습니다.");
		            console.error("AJAX 오류:", status, error);
		        }
		    });
		},

            //
            popupSnsLogin: function(type) {
                SignUpTool.popupSnsLogin(type);
            },

            //
            resultSnsLogin: function(params) {
                var json = JSON.parse( params );

                //
                if( json.isLogined === 'true' ) {

                    try {
                        // 고객 프로필 추적
                        WebTool.setUserProperties( );
                        WebTool.removeChannelTokUpdateCookie();
                    }
                    catch(err) {
                        console.log(err);
                    }

                    if (StringTool.isNotBlank(me.redirectUrl)) {
                        if(me.redirectUrl.indexOf("/fo/member/memberAddPage.do") >= 0){
                            //회원가입 페이지
                            WebTool.goHome();
                        } else if(me.redirectUrl.indexOf("/fo/member/personalInfoPage.do") >= 0){
                            //개인 정보 입력 페이지
                            WebTool.goHome();
                        } else if(me.redirectUrl.indexOf("/fo/member/businessInfoPage.do") >= 0) {
                            //사업자 정보 입력 페이지
                            WebTool.goHome();
                        } else if(me.redirectUrl.indexOf("/fo/member/memberTermsPage.do") >= 0){
                            //이용 약관 페이지
                            WebTool.goHome();
                        } else {
                            WebTool.go(me.redirectUrl);
                        }
                    } else {
                        WebTool.goHome();
                    }
                }
                else {
                    var params = {
                        'type'	: 'sns',
                        'isDuplAccounts' : json.isDuplAccounts,
                        'isNonKorean' : json.isNonKorean,
                        'email'	: json.email,
                        'name'	: json.name,
                        'siteCd': json.siteCd,
                        'siteId': json.siteId,
                        'siteNm': json.siteNm,
                        'authCi': json.authCi,
                        'cellNo': json.cellNo,
                    };

                    SignUpTool.goMemberTypePage(params); //가입유형선택 페이지
                }
            },

            autoLogin: function(checkbox) {
                var isCheck = $(checkbox).is(':checked');
                if(isCheck) {
                    $.cookie (me.autoCookieName, 'Y', {'path':'/', 'domain':'meatbox.co.kr', 'expires':DateTool.addSeconds (me.expireSeconds)});
                }
                else {
                    $.cookie (me.autoCookieName, 'N', {'path':'/', 'domain':'meatbox.co.kr', 'expires':DateTool.addSeconds (me.expireSeconds)});
                }
                $.removeCookie (me.autoCookieName, {'path':'/', 'domain':'www.meatbox.co.kr'});
            },

            goJoin: function(type){
                var params = {
                    'type': type,
                };
                SignUpTool.goMemberTypePage(params);
            },
            nothing:null
        };

    })();

    //
    $(function() {
        MainMgr.startup();
    });
</script>

<!-- 로그인 -->
<div class="container white_box">
    <div class="content">
        <div id="join_login" class="login login_new">
            <h3>로그인</h3>
            <div class="form_box">
                <div class="form-wrap">
                    <form>
                        <ul class="input_form">
                            <li>
                                <div class="input-wrap">
                                    <input type="text" id="memberId" placeholder="아이디 입력" required>
                                </div>
                            </li>
                            <li>
                                <div class="input-wrap">
                                    <input type="password" id="passwd" placeholder="비밀번호 입력" required>
                                    <button type="button" class="pw-show"></button>
                                </div>
                            </li>
                        </ul><!-- //input_form -->
                        <div class="login_check">
                            <div class="chkeck_che">
                                <label class="check" for="chk_auto">자동 로그인
                                    <input type="checkbox" id="chk_auto" name="autoLoginYn" onclick="MainMgr.autoLogin(this)">
                                </label>
                            </div><!-- //chkeck_che -->
                            <div class="chkeck_che">
                                <label class="check" for="chk_id">아이디 저장
                                    <input type="checkbox" id="chk_id" name="savingYn">
                                </label>
                            </div><!-- //chkeck_che -->
                        </div>
                        <p class="join-noti type02"><em>개인정보보호</em>를 위해 <em>자동 로그인</em>이나 <em>아이디 저장</em>은<br><span class="ce853">개인 PC에서만 사용해 주세요.</span></p>
                        <div class="login_box flex">
                            <button type="button" class="comm_btn" onclick="MainMgr.prepareLogin();">로그인</button>
                            <em id="loginComment">죄송합니다. 로그인에 실패하였습니다. <br> 아이디(ID)와 비밀번호 확인후, 다시 로그인하여 주십시오.</em>
                            <button type="button" class="comm_btn white" onclick="MainMgr.goJoin('default');">회원가입</button>
                        </div><!-- //login_box -->
                        <ul class="find_box after">
                            <li><a href="/fo/member/findLoginInfoPage.do?findType=id">아이디찾기</a></li>
                            <li><a href="/fo/member/findLoginInfoPage.do?findType=passwd">비밀번호찾기</a></li>
                        </ul>
                        <div class="sns_login">
                            <p>SNS 간편 가입&nbsp;/&nbsp;로그인</p>
                            <ul>
                                <li><a href="#" onclick="MainMgr.popupSnsLogin('SN02');"><img src="https://static-cdn.meatbox.co.kr/img/mo/ico/icon-r-kakao.svg" alt="카카오로 로그인" /><span>카카오</span></a></li>
                                <li><a href="#" onclick="MainMgr.popupSnsLogin('SN01');"><img src="https://static-cdn.meatbox.co.kr/img/mo/ico/icon-r-naver.svg" alt="네이버로 로그인" /><span>네이버</span></a></li>
                                <li><a href="#" onclick="MainMgr.popupSnsLogin('SN03');"><img src="https://static-cdn.meatbox.co.kr/img/mo/ico/icon-r-apple.svg" alt="애플 로그인" /><span>애플</span></a></li>
                            </ul>
                        </div><!-- //sns_login -->
                    </form>
                </div>
            </div>
        </div><!-- //join_login -->
    </div><!-- //content -->
</div><!-- //container --><script type="text/javascript">
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
                WebTool.channelTokBoot(0,
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

                if('false' =='false'){
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

<%@ include file="/include/footer.jsp" %>
</body>
</html>