package com.main.action;

import com.Action;
import com.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        System.out.println("A: MainAction.execute() 호출");

        // TODO: 메인 페이지에 보여줄 데이터가 있다면 DB에서 조회하는 로직 추가
        // 예: List<ProductBean> popularItems = productDAO.getPopularItems();
        // request.setAttribute("popularItems", popularItems);

        // 메인 페이지(View)로 이동
        ActionForward forward = new ActionForward();
        forward.setPath("./login/loginForm.jsp");	
        forward.setRedirect(false); // true로 설정하면 Controller가 sendRedirect를 실행합니다.
        return forward;

    }
}