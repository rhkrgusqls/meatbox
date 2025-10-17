package com.cart.action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;

import com.Action;
import com.ActionForward;
import com.cart.db.CartDAO;

public class CartDeleteAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M: CartDeleteAction의 execute() 호출");

        // 1. 로그인 여부 확인
        HttpSession session = request.getSession();
        Integer userIndex = (Integer) session.getAttribute("userIndex");

        if (userIndex == null) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인이 필요한 기능입니다.');");
            out.println("location.href='/login.do';");
            out.println("</script>");
            out.close();
            return null;
        }

        // 2. DAO 객체 생성
        CartDAO cdao = new CartDAO();
        int deleteCount = 0; // 삭제된 항목 수를 세기 위한 변수

        // 3. 다중 삭제(POST)와 단일 삭제(GET)를 모두 처리
        // 먼저 'productId'와 'optionId' 배열이 있는지 확인 (다중 삭제)
        String[] productIds = request.getParameterValues("productId");
        String[] optionIds = request.getParameterValues("optionId");
        
        if (productIds != null && optionIds != null && productIds.length == optionIds.length) {
            System.out.println("--- 다중 삭제 처리 ---");
            System.out.println("productId 배열: " + Arrays.toString(productIds));
            System.out.println("optionId 배열: " + Arrays.toString(optionIds));
            
            for (int i = 0; i < productIds.length; i++) {
                int productId = Integer.parseInt(productIds[i]);
                int optionId = Integer.parseInt(optionIds[i]);
                // DAO의 삭제 메소드는 userIndex, productId, optionId를 모두 받아야 합니다.
                cdao.deleteCartItem(userIndex, productId, optionId);
                deleteCount++;
            }
        } else {
            // 배열이 없다면 단일 파라미터가 있는지 확인 (단일 삭제)
            String productIdStr = request.getParameter("productId");
            String optionIdStr = request.getParameter("optionId");

            if (productIdStr != null && !productIdStr.isEmpty() && optionIdStr != null && !optionIdStr.isEmpty()) {
                System.out.println("--- 단일 삭제 처리 ---");
                System.out.println("productId: [" + productIdStr + "]");
                System.out.println("optionId: [" + optionIdStr + "]");
                
                int productId = Integer.parseInt(productIdStr);
                int optionId = Integer.parseInt(optionIdStr);
                cdao.deleteCartItem(userIndex, productId, optionId);
                deleteCount = 1;
            }
        }
        
        System.out.println("-------------------------");

        // 4. 삭제할 항목이 없는 경우
        if (deleteCount == 0) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('삭제할 상품을 선택해주세요.');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
            return null;
        }

        // 5. 처리 완료 후, 사용자에게 알리고 장바구니 페이지를 새로고침
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('선택한 " + deleteCount + "개의 상품을 삭제했습니다.');");
        out.println("location.href='/cart/cartPage.do';");
        out.println("</script>");
        out.close();

        return null;
    }
}

