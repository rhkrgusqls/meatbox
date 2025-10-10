package com;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
    // 요청을 처리하고, 이동 정보를 ActionForward로 반환
    ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}