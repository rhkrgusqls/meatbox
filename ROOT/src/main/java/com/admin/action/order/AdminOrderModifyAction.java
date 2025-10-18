package com.admin.action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;

public class AdminOrderModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("C: AdminOrderModifyAction.execute() 호출");

        // TODO: 주문 정보를 수정하는 비즈니스 로직 구현
        // String orderId = request.getParameter("orderId");
        
        ActionForward forward = new ActionForward();
        forward.setPath("/AdminOrderDetail.ac?orderId=" + request.getParameter("orderId")); // 수정 후 상세 페이지로 리다이렉트
        forward.setRedirect(true);
        
        return forward;
    }
	

}
