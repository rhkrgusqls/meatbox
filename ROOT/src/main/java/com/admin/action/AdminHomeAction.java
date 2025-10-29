// src/main/java/com/admin/action/AdminHomeAction.java

package com.admin.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.admin.db.OrderDAO;
import com.product.bo.db.CategoryDAO;
import com.product.bo.db.CategoryDTO;

public class AdminHomeAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        String page = request.getParameter("page");
        if (page == null) {
            String uri = request.getRequestURI();
            if (uri.endsWith("/AdminCategories.ac")) {
                page = "categories";
            } else if (uri.endsWith("/AdminRequests.ac")) {
                page = "request";
            } else {
                page = "dashboard";
            }
        }
        
        if ("categories".equals(page)) {
            CategoryDAO dao = new CategoryDAO();
            // 1. 전체 계층형 목록 가져오기
            List<CategoryDTO> categoryList = dao.getAllCategoriesHierarchical();
            request.setAttribute("categoryList", categoryList);
            
            // 2. 자식 추가 폼의 <select>를 채울 최상위 목록 가져오기
            List<CategoryDTO> topLevelCategories = dao.getTopLevelCategories();
            request.setAttribute("topLevelCategories", topLevelCategories);
        }
        
        // 레이아웃에 포함될 기본 컨텐츠 지정 (page에 따라 구성)
        if ("categories".equals(page)) {
            request.setAttribute("currentPage", "categories");
            request.setAttribute("contentPage", "/admin/adminCategories.jsp");
        } else if ("request".equals(page)) {
            request.setAttribute("currentPage", "request");
            request.setAttribute("contentPage", "/admin/adminRequest.jsp");
        } else {
            request.setAttribute("currentPage", "dashboard");
            request.setAttribute("contentPage", "/admin/adminDashboard.jsp");
        }

        OrderDAO orderDAO = new OrderDAO();

        // 총 매출액 조회 (배송 완료 기준)
        int totalSales = orderDAO.getTotalSales();

        // 상태별 주문 건수 조회
        int pendingCount = orderDAO.getOrderStatusCount("PENDING");
        int shippedCount = orderDAO.getOrderStatusCount("SHIPPED");
        int deliveredCount = orderDAO.getOrderStatusCount("DELIVERED");
        int cancelledCount = orderDAO.getOrderStatusCount("CANCELLED");


        // 조회된 데이터를 request 객체에 속성으로 설정
        request.setAttribute("totalSales", totalSales);
        request.setAttribute("pendingCount", pendingCount);
        request.setAttribute("shippedCount", shippedCount);
        request.setAttribute("deliveredCount", deliveredCount);
        request.setAttribute("cancelledCount", cancelledCount);

        ActionForward forward = new ActionForward();
        forward.setPath("/admin/adminHome.jsp");
        forward.setRedirect(false);
        
        return forward;
    }
}