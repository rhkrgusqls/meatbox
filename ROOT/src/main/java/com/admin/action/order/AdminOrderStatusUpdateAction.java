package com.admin.action.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.admin.db.OrderDAO;

public class AdminOrderStatusUpdateAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        // 요청 파라미터에서 주문 ID와 새로운 상태 가져오기
        String orderIdStr = request.getParameter("orderId");
        String newStatus = request.getParameter("status");
        
        // 파라미터 검증
        if (orderIdStr == null || orderIdStr.trim().isEmpty() || 
            newStatus == null || newStatus.trim().isEmpty()) {
            
            request.setAttribute("error", "주문 ID와 상태를 모두 입력해주세요.");
            ActionForward forward = new ActionForward();
            forward.setPath("/admin/AdminOrders.ac");
            forward.setRedirect(false);
            return forward;
        }
        
        try {
            int orderId = Integer.parseInt(orderIdStr);
            
            // OrderDAO를 사용하여 상태 업데이트
            OrderDAO orderDAO = new OrderDAO();
            boolean success = orderDAO.updateOrderStatus(orderId, newStatus);
            
            if (success) {
                request.setAttribute("success", "주문 상태가 성공적으로 변경되었습니다.");
            } else {
                request.setAttribute("error", "주문 상태 변경에 실패했습니다. 주문을 찾을 수 없습니다.");
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "올바른 주문 ID를 입력해주세요.");
        } catch (Exception e) {
            request.setAttribute("error", "주문 상태 변경 중 오류가 발생했습니다: " + e.getMessage());
            e.printStackTrace();
        }
        
        // 주문 관리 페이지로 리다이렉트
        ActionForward forward = new ActionForward();
        forward.setPath("/admin/AdminOrders.ac");
        forward.setRedirect(false);
        
        return forward;
    }
}
