package com.product.seller.db;

import com.product.bo.db.ProductRegisterApproveDAO;

public class TestProductApproveMain {

    public static void main(String[] args) {

        try {
            ProductRegisterApproveDAO approveDAO = new ProductRegisterApproveDAO();

            // 승인할 요청 ID 지정
            int requestIdToApprove = 4; // 예시: 1번 요청 승인

            // 요청 승인
            approveDAO.approveProductRequest(requestIdToApprove);
            System.out.println("✅ 요청 승인 완료, 상품 DB에 반영됨 (request_id=" + requestIdToApprove + ")");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("⚠️ 상품 요청 승인 중 오류 발생!");
        }
    }
}
