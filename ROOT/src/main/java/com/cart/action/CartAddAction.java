package com.cart.action;

import java.io.PrintWriter; // PrintWriter import 추가
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Action;
import com.ActionForward; // ActionForward는 이제 사용하지 않으므로 import문은 필요 없습니다.
import com.cart.db.CartDAO;

public class CartAddAction implements Action {

	@Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M: CartAddAction의 execute() 호출");

        // 1. 로그인 여부 확인
        HttpSession session = request.getSession();
        Integer userIndex = (Integer) session.getAttribute("userIndex");

        if (userIndex == null) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('장바구니에 상품을 담으려면 로그인이 필요합니다.');");
            out.println("location.href='/login.do';");
            out.println("</script>");
            out.close();
            return null;
        }

        // 2. 파라미터를 String으로 먼저 받습니다.
        String productIdStr = request.getParameter("productId");
        String optionIdStr = request.getParameter("optionId");
        String quantityStr = request.getParameter("quantity");

        // =============================================================
        // ▼▼▼ (수정) 정확한 디버깅을 위해 각 파라미터를 따로 출력합니다. ▼▼▼
        // =============================================================
        System.out.println("--- CartAddAction 파라미터 값 확인 ---");
        System.out.println("productId 파라미터: [" + productIdStr + "]");
        System.out.println("optionId 파라미터: [" + optionIdStr + "]");
        System.out.println("quantity 파라미터: [" + quantityStr + "]");
        System.out.println("------------------------------------");
        // =============================================================
        
        // 3. 파라미터 유효성 검사 (Null 또는 빈 문자열인지 확인)
        if (productIdStr == null || productIdStr.isEmpty() || 
            optionIdStr == null || optionIdStr.isEmpty() ||
            quantityStr == null || quantityStr.isEmpty()) {
            
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('필수 정보가 누락되었습니다. 다시 시도해주세요.');");
            out.println("history.back();");
            out.println("</script>");
            out.close();
            return null;
        }

        // 4. 안전하게 숫자로 변환합니다.
        int productId = Integer.parseInt(productIdStr);
        int optionId = Integer.parseInt(optionIdStr);
        int quantity = Integer.parseInt(quantityStr);

        // 5. DAO를 이용해 DB에 장바구니 정보를 저장합니다.
        CartDAO cdao = new CartDAO();
        cdao.addCart(userIndex, productId, optionId, quantity);

        // 6. 처리 완료 후, 사용자에게 알림을 보여주고 장바구니 페이지로 이동 여부를 묻습니다.
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("if(confirm('장바구니에 상품을 담았습니다. 장바구니로 이동하시겠습니까?')){");
        out.println("    location.href='/cart/cartPage.do';");
        out.println("} else {");
        out.println("    history.back();");
        out.println("}");
        out.println("</script>");
        out.close();

        return null;
    }
}