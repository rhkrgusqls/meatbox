package com.cart.action;

import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Action;
import com.ActionForward;
import com.cart.db.CartDAO;
import com.cart.db.CartItem; 
// import com.member.db.MemberDTO; // 만약 MemberDTO에 userIndex가 있다면 그걸 사용하는 것이 더 좋습니다.

public class CartPageAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("M: CartPageAction의 execute() 호출");

        // 1. 로그인 여부 확인 (세션에서 userIndex를 가져옵니다)
        HttpSession session = request.getSession();
        Integer userIndex = (Integer) session.getAttribute("userIndex"); // 세션에 "userIndex" 이름으로 저장했다고 가정
        System.out.println("M: UserIndex: " + userIndex);

        ActionForward forward = new ActionForward();
        if (userIndex == null) {
            // 로그인이 되어있지 않다면 로그인 페이지로 보냅니다.
            // (이전과 동일하게 alert 후 로그인 페이지로 이동)
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('로그인이 필요합니다.');");
            out.println("location.href='/login.do';"); // 로그인 페이지 경로
            out.println("</script>");
            out.close(); // out 객체를 닫아줍니다.
            return null; // 더 이상 Action을 진행하지 않음
        }

        // 2. DAO 객체 생성 및 장바구니 목록 조회
        CartDAO cdao = new CartDAO();
        // userIndex를 인자로 전달합니다.
        List<CartItem> cartList = cdao.getCartList(userIndex);

        // 3. request 객체에 장바구니 목록 저장 (JSP에서 사용하기 위함)
        request.setAttribute("cartList", cartList);

        // 4. 페이지 이동 설정 (forward 방식)
        forward.setPath("/cart/cartPage.jsp"); // 장바구니를 보여줄 JSP 페이지
        forward.setRedirect(false); // request 정보를 가지고 가야 하므로 forward

        return forward;
    }
}