<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>미트박스 :: 1등 고기 직거래</title>
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/common.min.css?20251015144311960" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/style.min.css?20251015144311960" type="text/css" media="all" charset="UTF-8" />
    <link rel="stylesheet" href="https://static-cdn.meatbox.co.kr/css/fo/renew.min.css?20251015144311960" type="text/css" media="all" charset="UTF-8" />
    <script type="text/javascript" src="https://static-cdn.meatbox.co.kr/js/jquery/jquery-1.12.4.min.js" charset="UTF-8"></script>
</head>
<body>

<%-- 헤더 인클루드 --%>
<jsp:include page="/include/header.jsp" />

<div class="container">
	<div id="contents" class="inner">
		<div id="myOrderPage" class="basketPage">
			<div class="cart_order">
				<div class="cart_top">
					<div class="cart_title top_title after">
						<strong class="cart_order_title">
							<img src="https://static-cdn.meatbox.co.kr/img/fo/cart_order/cart_top_title.png" alt="장바구니" />
						</strong>
						<ul class="after">
							<li class="on"><span><img src="https://static-cdn.meatbox.co.kr/img/fo/cart_order/order_step01.png" alt="01" /></span><em>장바구니</em></li>
							<li><span><img src="https://static-cdn.meatbox.co.kr/img/fo/cart_order/order_step02.png" alt="02" /></span><em>주문/결제</em></li>
							<li><span><img src="https://static-cdn.meatbox.co.kr/img/fo/cart_order/order_step03.png" alt="03" /></span><em>주문완료</em></li>
						</ul>
					</div>
				</div>

				<div class="delivery-area">
					<table class="delivery-td">
						<colgroup>
							<col width="180px" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th class="deliv_select">
									배송지 선택
								<button type="button" class="common-box-btn dist_edit" onclick="FoTool.openAddrSetupListPage(1, 'order');">설정</button>
								</th>
								<td>
									<ul class="radio_box after" id="addrList" style="display: none;"></ul>
									<p class="notice-txt" style="display: none;"></p>

									<button type="button" class="dist_edit txt_underline" id="addNewAddr" onclick="FoTool.openAddrSetupListPage(1, 'order');" style="display: none;">배송지를 등록해주세요.</button>
									<p class="delivery-noti" style="display: none;">정확한 배송 예정일을 확인할 수 있어요.</p>
									</td>
							</tr>
							<tr class="_deliveryAddr">
								<th>주소</th>
								<td>
									<div class="addr_info">
										<input type="hidden" value="" name="recv_zip_cd" id="recv_zip_cd"/>
										<input type="hidden" value="" name="recv_zip_cd1" id="recv_zip_cd1"/>
										<input type="hidden" value="" name="recv_zip_cd2" id="recv_zip_cd2"/>
										<input type="hidden" value="" name="recv_road_addr1" id="recv_road_addr1" style="display: none;"/>
										<input type="hidden" value="" name="recv_building_name" id="recv_building_name" style="display: none;"/>
										<input type="text" class="addr addr1" value="" name="recv_addr1" id="recv_addr1" style="display: none;"/>
										<input type="text" class="addr addr2" value="" name="recv_addr2" id="recv_addr2" style="display: none;"/>
										<i class="bollom address"></i><span class="my_addr" id="addr_text"></span>
									</div>

									<div class="delivery_kindof" id="deliveryServiceTr" onclick="FoTool.openCautionsDeliveryInfoPage()">
										<em class="delv_ico delv_tyN delv_marker" id="marker_impossIbleBundleRegion">해당 지역은 묶음신선 배송이 불가능한 지역입니다.</em>
										<em class="delv_ico delv_ty5 delv_marker" id="defaultAddr">기본배송지</em>
										<em class="delv_ico delv_ty8 delv_marker" id="marker_meatmart">육마트(냉동차량)</em>
										<em class="delv_ico delv_ty2 delv_marker" id="marker_sinsun" style="cursor: pointer;">신선배송(냉동차량)</em>
										<em class="delv_ico delv_ty7 delv_marker fridge_marker" id="marker_refridge_approved">냉장고 안 배송</em>
										<em class="delv_ico delv_ty7-1 delv_marker fridge_marker" id="marker_refridge_pending">냉장고 안 배송 - 승인대기</em>
										<em class="delv_ico delv_ty7-2 delv_marker fridge_marker" id="marker_refridge_rejected" onclick="">냉장고 안 배송 - 미승인                                            <button type="button" class="tooltip-i-small"></button>
                                            <div class="tooltip_box">                                                <button type="button" class="close">닫기</button>                                                <p>냉장고 안 배송 신청 정보가 정확하지 않습니다.<br>확인 후 다시 신청해 주세요.</p>                                            </div>
										</em>
										<em class="delv_ico delv_ty4 delv_marker" id="marker_parcel" style="cursor: pointer;">택배배송</em>
										<em class="delv_ico delv_ty6 delv_marker" id="marker_holiday">휴일 배송 가능</em>
									</div>
									</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="cart-tab"><ul>
						<li class="on" id="typeA"><button type="button" onclick="(() => FoTool.go('/fo/cart/cartPage.do?type=A'))()">일반 상품 (0)</button></li>
						<li id="typeB"><button type="button" onclick="(() => FoTool.go('/fo/cart/cartPage.do?type=B'))()">배송일 지정 상품 (0)</button></li>
					</ul>
				</div>

				<div class="common-pay-style">
					<div class="cart_info_wrap">
					
					
					
					
					<%-- ... (페이지의 다른 HTML 코드) ... --%>
					
					
					<div class="cart_info">
					
					    <%-- cartList가 비어있는지 아닌지 확인합니다. --%>
					    <c:choose>
					        <%-- 1. cartList가 비어있을 경우 --%>
					        <c:when test="${empty cartList}">
					            <div class="item_none date_none">
					                <p class="date_none_txt">장바구니에 상품이 없습니다.</p>
					            </div>
					        </c:when>
					
					        <%-- 2. cartList에 상품이 있을 경우 --%>
					        <c:otherwise>
					            <%-- forEach 반복문으로 cartList의 상품을 하나씩 꺼냅니다. --%>
					            <h4>[테스트] 장바구니 상품 ID 목록</h4>
					            <c:forEach var="item" items="${cartList}">
					            
					                <%-- 각 상품(item)의 productId 값만 화면에 출력합니다. --%>
					                <p>상품 ID: ${item.productId}</p>
					            </c:forEach>
					        </c:otherwise>
					    </c:choose>
					    
					</div>

						<div class="common-two-btn after">
								<button type="button" class="common-btn-style common-btn-gray" onclick="WebTool.goHome()">상품 담으러 가기</button>
									</div>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- 푸터 인클루드 --%>
<jsp:include page="/include/footer.jsp" />

</body>
</html>