<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                        <input type="hidden" id="recv_zip_cd"/>
                        <input type="hidden" id="recv_road_addr1"/>
                        <input type="text" class="addr addr1" id="recv_addr1" style="display: none;"/>
                        <input type="text" class="addr addr2" id="recv_addr2" style="display: none;"/>
                        <span class="my_addr" id="addr_text"></span>
                    </div>

                    <div class="delivery_kindof" id="deliveryServiceTr">
                        <em class="delv_ico delv_ty2 delv_marker">신선배송(냉동차량)</em>
                        <em class="delv_ico delv_ty4 delv_marker">택배배송</em>
                        <em class="delv_ico delv_ty6 delv_marker">휴일 배송 가능</em>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div> --%>