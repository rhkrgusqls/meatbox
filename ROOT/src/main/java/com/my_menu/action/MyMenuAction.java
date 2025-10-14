package com.my_menu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Action;
import com.ActionForward;

public class MyMenuAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        // ActionForward 객체를 생성하여 이동할 경로와 방식을 설정합니다.
        ActionForward forward = new ActionForward();
        
        // setRedirect(false)는 forward 방식으로 페이지를 이동시킵니다.
        // 이 방식은 브라우저의 URL 주소를 바꾸지 않고 서버 내부에서 페이지를 이동시켜
        // request와 response 객체를 유지할 수 있습니다.
        forward.setRedirect(false);
        
        // 실제로 보여줄 JSP 파일의 경로를 지정합니다.
        forward.setPath("/www.meatbox.co.kr/fo/myMenu/myMenuMainPage.do.jsp");
        
        return forward;
    }
}