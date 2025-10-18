package com.admin.action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;

public class AdminOrderAddAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("C: AdminOrderAddAction.execute() 호출");

        // TODO: 새로운 주문을 추가하는 비즈니스 로직 구현
        

        ActionForward forward = new ActionForward();
        forward.setPath("/AdminOrderView.ac"); // 주문 추가 후 목록으로 리다이렉트
        forward.setRedirect(true); 
        
        return forward;
    }
}