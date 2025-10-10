package com.purchase.db;

public interface PurchaseInterface {
	/** 상품 구매 함수
	 * @int userIndex 세션에 담긴 userIndex
	 * @int product_id[] 장바구니에 담긴 상품 id를 배열로 보내기
	 * @int product_option_id[] 해당 상품들의 옵션 id(하단의 테이블 구성 참고)
	 * @int payment_method_id 계정당 저장되어있는 결제수단 id를 호출(인터페이스 클래스 하단의 테이블구성 참고)
	 * @int discount_amount 쿠폰, 상품권으로 할인된 전체 금액
	 * @int shipping_fee 배송비
	 * @int used_points 미트박스포인트 사용량
	 * 
	 * @return -1(실패) 보통의 경우 PurchaseException을 먼저 반환할것임으로 try catch 사용 권장, -1반환시 Exception조건에 걸러지지 않은 실패를 처리(알 수 없는 에러)
	 * @return orderid(성공)
	 * */
	int purchase_product(int userIndex, int product_id[], int product_option_id[], int payment_method_id, int discount_amount, int shipping_fee, int used_points);
}

/**
 * product_option_id
 * 
	CREATE TABLE product_option (
	    option_id        INT AUTO_INCREMENT PRIMARY KEY,  -- 옵션 고유 ID
	    product_id       INT NOT NULL,                     -- FK: 어떤 상품의 옵션인지
	    option_name      VARCHAR(100) NOT NULL,           -- 옵션 이름 (예: 주로 무게옵션)
	    option_detail    VARCHAR(100),                     -- 옵션 상세 (예: 레드, 라지)
	    price_of_option  INT DEFAULT 0,                    -- 옵션 추가 가격
	    FOREIGN KEY (product_id) REFERENCES product(product_id)
	);
*/

/**
 * payment_method_id
 * 
	CREATE TABLE payment_methods (
	    payment_method_id INT AUTO_INCREMENT PRIMARY KEY, -- 결제 수단 고유 ID
	    user_index        INT NOT NULL,                    -- FK: users_normal
	    provider          VARCHAR(50) NOT NULL,           -- 카드사/은행/PG사명
	    FOREIGN KEY (user_index) REFERENCES users_normal(user_index)
	); 
 */
