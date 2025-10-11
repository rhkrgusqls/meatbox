package com;

public class ActionForward {

    private String path;       // 이동할 경로 (예: "/main.jsp")
    private boolean redirect;  // true면 sendRedirect, false면 forward

    // ✅ 이동할 경로 설정/조회
    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    // ✅ 이동 방식 설정/조회
    public boolean isRedirect() {
        return redirect;
    }

    public void setRedirect(boolean redirect) {
        this.redirect = redirect;
    }
}