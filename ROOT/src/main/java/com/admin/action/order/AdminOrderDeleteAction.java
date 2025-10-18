package com.admin.action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;

public class AdminOrderDeleteAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("C: AdminOrderDeleteAction.execute() 호출");

        // TODO: 주문을 삭제하는 비즈니스 로직 구현
        // String orderId = request.getParameter("orderId");
        
        ActionForward forward = new ActionForward();
        forward.setPath("/AdminOrderView.ac"); // 삭제 후 목록으로 리다이렉트
        forward.setRedirect(true);
        
        return forward;
    }
}