package com.user.register.db;

public interface RegisterInterface {
	/** 일반 개인 사용자용 
	 * @return -1(실패) 보통의 경우 RegisterException을 먼저 반환할것임으로 try catch 사용 권장, -1반환시 Exception조건에 걸러지지 않은 실패를 처리(알 수 없는 에러)
	 * @return 1(성공)
	 * */
	int register_normaluser(String id, String password, String name);
	/** 사업자용 (미구현) */
	int register_selleruser();
	/** 미트박스 관리자용 (미구현) */
	int register_adminuser();
}