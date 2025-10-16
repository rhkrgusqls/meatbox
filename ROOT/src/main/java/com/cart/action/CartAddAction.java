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
            // 로그인이 되어있지 않다면 로그인 페이지로 보냅니다.
            // (이전과 동일하게 alert 후 로그인 페이지로 이동)
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('장바구니에 상품을 담으려면 로그인이 필요합니다.');");
            out.println("location.href='/login.do';"); // 로그인 페이지 경로
            out.println("</script>");
            out.close(); // out 객체를 닫아줍니다.
            return null; // 더 이상 Action을 진행하지 않음
        }

        // 2. 상품 페이지에서 전달된 파라미터(상품ID, 옵션ID, 수량)를 가져옵니다.
        int productId = Integer.parseInt(request.getParameter("productId"));
        int optionId = Integer.parseInt(request.getParameter("optionId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // 3. DAO 객체를 생성하고, addCart 메소드를 호출하여 DB에 저장합니다.
        CartDAO cdao = new CartDAO();
        cdao.addCart(userIndex, productId, optionId, quantity);

        // 4. JavaScript를 사용하여 alert를 띄우고 페이지를 이동시킵니다.
        //    ActionForward 객체를 사용하는 대신, response 객체에 직접 응답을 작성합니다.

        // 클라이언트에게 보낼 내용이 HTML 문서이고, UTF-8 인코딩을 사용함을 알립니다.
        response.setContentType("text/html; charset=UTF-8");
        
        // 응답 페이지에 텍스트를 쓸 수 있는 PrintWriter 객체를 얻습니다.
        PrintWriter out = response.getWriter();
        
        // JavaScript 코드를 작성합니다.
        out.println("<script>");
        out.println("alert('장바구니에 담았습니다.');"); // 메시지 띄우기
        out.println("</script>");
        
        // PrintWriter 작업을 마칩니다.
        out.close();

        // 이미 응답을 직접 처리했으므로, Controller에게 더 이상 페이지 이동 처리를 하지 말라고
        // null을 반환합니다.
        return null;
    }
}