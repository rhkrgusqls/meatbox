package com.order.db;

public class PurchaseDAOTest {
    public static void main(String[] args) {
        // ✅ DAO 인스턴스 생성
        PurchaseDAO dao = new PurchaseDAO();

        // ✅ 테스트용 파라미터
        int userIndex = 23;                    // users_normal에 존재하는 유저
        int[] productId = { 18 };       // 실제 존재하는 product_id
        int[] optionId = { 15 };      // 해당 상품의 옵션 id
        int paymentMethodId = 1;              // 결제수단 id
        int discountAmount = 0;            // 예치금 or 쿠폰 사용액
        int shippingFee = 0;               // 배송비
        int usedPoints = 0;                 // 포인트 사용량

        // ✅ 프로시저 호출
        int result = dao.purchase_product(
                userIndex,
                productId,
                optionId,
                paymentMethodId,
                discountAmount,
                shippingFee,
                usedPoints
        );

        // ✅ 결과 출력
        switch (result) {
            case 0:
                System.out.println("✅ 주문 성공");
                break;
            case -1:
                System.out.println("❌ 필수값 누락");
                break;
            case -2:
                System.out.println("❌ 상품 정보 없음");
                break;
            case -3:
                System.out.println("❌ 사용자 없음");
                break;
            case -4:
                System.out.println("❌ 예치금 부족");
                break;
            case -5:
                System.out.println("❌ 포인트 부족");
                break;
            case -6:
                System.out.println("❌ 옵션 없음");
                break;
            default:
                System.out.println("⚠️ 알 수 없는 오류 발생: " + result);
        }
    }
}
