package com.user.login.db;

public class LoginException extends Exception {
    public LoginException(int errorCode) {
        super(getMessageFromCode(errorCode));
    }

    private static String getMessageFromCode(int code) {
        switch (code) {
            case -1:
                return "존재하지 않는 ID입니다.";
            case -2:
                return "비밀번호가 올바르지 않습니다.";
            default:
                return "알 수 없는 오류 코드: " + code;
        }
    }
}
