package com.user.register.db;

public class RegisterException extends Exception {
    public RegisterException(int errorCode) {
        super(getMessageFromCode(errorCode));
    }

    private static String getMessageFromCode(int code) {
        String message;
        switch (code) {
            case -1:
                message = "중복된 ID입니다.";
                break;
            case -2:
                message = "ID가 유효하지 않습니다.";
                break;
            case -3:
                message = "비밀번호가 유효하지 않습니다.";
                break;
            case -4:
                message = "이름이 유효하지 않습니다.";
                break;
            case -5:
                message = "사용자 역할이 올바르지 않습니다.";
                break;
            default:
                message = "알 수 없는 오류 코드: " + code;
                break;
        }
        return message;
    }
}
