package com.cart.action;
ackage com.cart.action;

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
            // 로그인이 안 된 경우, 로그인 페이지로 리다이렉트
            // 응답에 메시지를 담아 보내면 더 좋습니다.
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script>");
            response.getWriter().println("alert('로그인이 필요합니다.');");
            response.getWriter().println("location.href='./login.do';"); // 로그인 페이지 경로
            response.getWriter().println("</script>");
            return null; // 컨트롤러에서 더 이상 진행하지 않도록 null 반환
        }

        // 2. DAO 객체 생성 및 장바구니 목록 조회
        CartDAO cdao = new CartDAO();
        // userIndex를 인자로 전달합니다.
        List<CartItem> cartList = cdao.getCartList(userIndex);

        // 3. request 객체에 장바구니 목록 저장 (JSP에서 사용하기 위함)
        request.setAttribute("cartList", cartList);

        // 4. 페이지 이동 설정 (forward 방식)
        forward.setPath("./cart/cartPage.jsp"); // 장바구니를 보여줄 JSP 페이지
        forward.setRedirect(false); // request 정보를 가지고 가야 하므로 forward

        return forward;
    }
}