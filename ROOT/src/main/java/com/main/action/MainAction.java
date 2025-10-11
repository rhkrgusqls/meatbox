package com.main.action;

import com.Action;
import com.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        System.out.println("A: MainAction.execute() 호출");

        // 메인 페이지(View)로 이동
        ActionForward forward = new ActionForward();
        forward.setPath("./index.html"); // 경로를 index.html로 변경
        forward.setRedirect(false); 
        return forward;

    }
}