package com.user.login.db;

public interface LoginInterface {
	/**
	 * @return -1(실패) 보통의 경우 RegisterException을 먼저 반환할것임으로 try catch 사용 권장, -1반환시 Exception조건에 걸러지지 않은 실패를 처리(알 수 없는 에러)
	 * @return user_id(성공)
	 * */
	int login(String id, String password);
}