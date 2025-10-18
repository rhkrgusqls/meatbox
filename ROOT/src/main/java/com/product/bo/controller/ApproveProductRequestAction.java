package com.product.bo.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Action;
import com.ActionForward;
import com.product.bo.db.ProductRegisterApproveDAO;

public class ApproveProductRequestAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        ActionForward forward = new ActionForward();

        try {
            // 안전하게 requestId 파싱
            String reqIdStr = request.getParameter("requestId");
            System.out.print("reqIdStr"+reqIdStr);
            if (reqIdStr == null || reqIdStr.isEmpty()) {
                throw new IllegalArgumentException("requestId 파라미터가 없습니다.");
            }

            int requestId;
            try {
                requestId = Integer.parseInt(reqIdStr);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("requestId가 숫자가 아닙니다: " + reqIdStr);
            }

            System.out.println("Approving requestId=" + requestId);

            ProductRegisterApproveDAO dao = new ProductRegisterApproveDAO();
            int productId = dao.approveProductRequest(requestId);

            System.out.println("생성된 product_id=" + productId);

            forward.setPath("/bo_request_list.jsp?success=1");
            forward.setRedirect(true);

        } catch (Exception e) {
            e.printStackTrace();
            forward.setPath("/bo_request_list.jsp?error=" + e.getMessage());
            forward.setRedirect(true);
        }

        return forward;
    }
}

