package com.admin.action.order;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;

public class AdminOrderViewAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("C: AdminOrderViewAction.execute() 호출");
		
		// TODO: 전체 주문 목록을 조회하는 비즈니스 로직 구현
		
		ActionForward forward = new ActionForward();
		forward.setPath("./admin/adminOrders.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}
