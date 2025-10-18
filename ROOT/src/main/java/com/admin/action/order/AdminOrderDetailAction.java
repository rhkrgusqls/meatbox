package com.admin.action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;

public class AdminOrderDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("C: AdminOrderDetailAction.execute() 호출");
		
		// TODO: 특정 주문의 상세 정보를 조회하는 비즈니스 로직 구현
		
		ActionForward forward = new ActionForward();
        forward.setPath("./admin/adminOrderDetail.jsp");
        forward.setRedirect(false);
        
        return forward;
	}
	

}
