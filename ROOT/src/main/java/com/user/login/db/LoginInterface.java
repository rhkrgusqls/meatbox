package com.user.login.db;

public interface LoginInterface {
	/** 일반 개인 사용자용 */
	boolean login_normaluser(String id, String password);
	/** 사업자용 (미구현) */
	boolean login_selleruser();
	/** 미트박스 관리자용 (미구현) */
	boolean login_adminuser();
}